-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Button = v1.Button;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local UserInputService = v4.UserInputService;
local ItemViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "inventory", "ui", "item-viewport").ItemViewport;
local BedwarsShop = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local TaxTheme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-tax-util").TaxTheme;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local shopPurchaseItem = RuntimeLib.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local ShopDisruptionPrice = RuntimeLib.import(script, script.Parent, "shop-disruption-price").ShopDisruptionPrice;
local v5 = u3.Component:extend("BedwarsItemShopLeft");

function v5.init(p6, p7) -- Line: 24
    -- upvalues: u2 (copy)
    p6.maid = u2.new();
    local v8 = {};
    local v9;

    if p7.SelectedItem == nil then
        v9 = false;
    else
        v9 = p6:hasAlreadyPurchased(p7.SelectedItem.itemType);
    end;

    v8.alreadyPurchased = v9;
    p6:setState(v8);
end;

function v5.didUpdate(p10, p11, p12) -- Line: 30
    if p11.SelectedItem ~= p10.props.SelectedItem then
        local v13 = {};
        local v14;

        if p10.props.SelectedItem == nil then
            v14 = false;
        else
            v14 = p10:hasAlreadyPurchased(p10.props.SelectedItem.itemType);
        end;

        v13.alreadyPurchased = v14;
        p10:setState(v13);
    end;
end;

function v5.didMount(u15) -- Line: 37
    -- upvalues: UserInputService (copy)
    if UserInputService.GamepadEnabled and not UserInputService.MouseEnabled then
        u15.maid:GiveTask(UserInputService.InputBegan:Connect(function(p16, p17) -- Line: 39
            -- upvalues: u15 (copy)
            if p16.KeyCode == Enum.KeyCode.ButtonA then
                u15:purchase();
            end;
        end));
    end;
end;

function v5.willUnmount(p18) -- Line: 46
    p18.maid:DoCleaning();
end;

function v5.hasAlreadyPurchased(p19, p20) -- Line: 49
    -- upvalues: DeviceUtil (copy), KnitClient (copy)
    if DeviceUtil.isHoarceKat() then
        return false;
    end;

    return KnitClient.Controllers.BedwarsShopController.alreadyPurchasedMap[p20] ~= nil;
end;

function v5.purchase(u21) -- Line: 57
    -- upvalues: shopPurchaseItem (copy), BedwarsShop (copy), Players (copy), DeviceUtil (copy), KnitClient (copy)
    local SelectedItem = u21.props.SelectedItem;
    shopPurchaseItem(SelectedItem, u21.props.ShopID):andThen(function(p22) -- Line: 60
        -- upvalues: SelectedItem (copy), u21 (copy), BedwarsShop (ref), Players (ref), DeviceUtil (ref), KnitClient (ref)
        if p22 then
            if SelectedItem.nextTier then
                u21.props.SetSelectedShopItem(BedwarsShop.getShopItem(SelectedItem.nextTier, Players.LocalPlayer, {
                    shopId = u21.props.ShopID
                }));

                return;
            end;

            if SelectedItem.tiered then
                u21:setState({
                    alreadyPurchased = true
                });

                if not DeviceUtil.isHoarceKat() then
                    KnitClient.Controllers.BedwarsShopController.alreadyPurchasedMap[SelectedItem.itemType] = true;
                end;
            end;
        end;
    end);
end;

function v5.render(u23) -- Line: 80
    -- upvalues: getItemMeta (copy), DeviceUtil (copy), KnitClient (copy), Players (copy), u3 (copy), ItemViewport (copy), ItemUtil (copy), ShopDisruptionPrice (copy), BedwarsShop (copy), TaxTheme (copy), UserInputService (copy), ColorUtil (copy), Theme (copy), Button (copy)
    local v24;

    if u23.props.SelectedItem then
        local description = getItemMeta(u23.props.SelectedItem.itemType).description;
        v24 = (description == nil or #description == 0) and " " or description;
    else
        v24 = nil;
    end;

    local SelectedItem = u23.props.SelectedItem;

    if SelectedItem ~= nil then
        SelectedItem = SelectedItem.price;
    end;

    local SelectedItem2 = u23.props.SelectedItem;

    if SelectedItem2 ~= nil then
        SelectedItem2 = SelectedItem2.sell;
    end;

    local v25 = SelectedItem2 and "Sell" or (SelectedItem == 0 and "Free" or "Purchase");
    local v26 = Color3.fromRGB(255, 255, 255);
    local v27;

    if u23.props.SelectedItem then
        v26 = getItemMeta(u23.props.SelectedItem.currency).displayNameColor or v26;

        if DeviceUtil.isHoarceKat() then
            v27 = false;
        else
            local v28 = KnitClient.Controllers.ShopTaxController:getTaxedItems();
            v27 = table.find(v28, u23.props.SelectedItem.itemType) ~= nil;
        end;
    else
        v27 = false;
    end;

    local SelectedItem3 = u23.props.SelectedItem;

    if SelectedItem3 ~= nil then
        SelectedItem3 = SelectedItem3.priceMultiplier;
    end;

    local v29 = SelectedItem3 == nil and 1 or SelectedItem3;

    if not v27 then
        if DeviceUtil.isHoarceKat() then
            v27 = false;
        else
            v27 = Players.LocalPlayer:GetAttribute("DisruptionPriceIncrease");
        end;

        if v27 == 0 or (v27 ~= v27 or (v27 == "" or not v27)) then
            v27 = v29 < 1 and true or v29 > 1;
        end;
    end;

    local v30;

    if u23.props.SelectedItem and not DeviceUtil.isHoarceKat() then
        v30 = KnitClient.Controllers.BedwarsShopController:getDisabledStatus(u23.props.SelectedItem, u23.state.alreadyPurchased);
    else
        v30 = nil;
    end;

    local v31;

    if v30 == nil then
        v31 = v30;
    else
        v31 = v30.reason;
    end;

    local v32 = u23.props.SelectedItem ~= nil;

    if v32 then
        local v33 = { u3.createElement(ItemViewport, {
                SizeConstraint = "RelativeYY",
                ShowCooldownBar = false,
                ItemType = u23.props.SelectedItem.itemType,
                Size = UDim2.fromScale(0.32, 0.32),
                Position = UDim2.fromScale(0.5, 0.073),
                AnchorPoint = Vector2.new(0.5, 0)
            }) };
        local v34 = #v33;
        local v35 = {};
        local customDisplayName = u23.props.SelectedItem.customDisplayName;

        if customDisplayName == nil then
            customDisplayName = ItemUtil.getDisplayName(u23.props.SelectedItem.itemType);
        end;

        v35.Text = customDisplayName;
        v35.Size = UDim2.fromScale(0.9, 0.063);
        v35.Position = UDim2.fromScale(0.5, 0.42);
        v35.AnchorPoint = Vector2.new(0.5, 0);
        v35.BackgroundTransparency = 1;
        v35.BorderSizePixel = 0;
        v35.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
        v35.TextScaled = true;
        v35.TextColor3 = Color3.fromRGB(255, 255, 255);
        v33[v34 + 1] = u3.createElement("TextLabel", v35);
        local v36;

        if u23.props.SelectedItem.amount > 1 then
            v36 = u3.createElement("TextLabel", {
                BackgroundTransparency = 0.4,
                BorderSizePixel = 0,
                TextScaled = true,
                Text = "x" .. tostring(u23.props.SelectedItem.amount),
                Size = UDim2.fromScale(0.392, 0.063),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0.1, 0)
                }), u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0.2),
                    PaddingBottom = UDim.new(0.2, 0)
                }) });
        else
            v36 = false;
        end;

        if v36 then
            v33[v34 + 2] = v36;
        end;

        local v37 = #v33;

        if v24 ~= "" and v24 then
            if v24 == " " then
                v24 = false;
            else
                v24 = u3.createElement("TextLabel", {
                    BackgroundTransparency = 0.9,
                    BorderSizePixel = 0,
                    TextScaled = true,
                    Text = v24,
                    Size = UDim2.fromScale(0.85, 0.16),
                    Position = UDim2.fromScale(0.5, 0.59),
                    AnchorPoint = Vector2.new(0.5, 0),
                    BackgroundColor3 = Color3.fromRGB(191, 192, 217),
                    FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, { u3.createElement("UICorner", {
                        CornerRadius = UDim.new(0.1, 0)
                    }), u3.createElement("UIPadding", {
                        PaddingTop = UDim.new(0.1),
                        PaddingBottom = UDim.new(0.1, 0),
                        PaddingLeft = UDim.new(0.1, 0),
                        PaddingRight = UDim.new(0.1, 0)
                    }) });
            end;
        end;

        if v24 then
            v33[v37 + 1] = v24;
        end;

        local v38 = #v33;
        local SelectedItem4 = u23.props.SelectedItem;

        if SelectedItem4 ~= nil then
            SelectedItem4 = SelectedItem4.price;
        end;

        local v39 = SelectedItem4 ~= 0;

        if v39 then
            local v40;

            if v27 == 0 or (v27 ~= v27 or (v27 == "" or not v27)) then
                local v41 = {
                    Size = UDim2.fromScale(0.9, 0.06),
                    Position = UDim2.fromScale(0.5, 0.895),
                    AnchorPoint = Vector2.new(0.5, 1)
                };
                local v42 = BedwarsShop.getShopItem(u23.props.SelectedItem.itemType, Players.LocalPlayer, {
                    shopId = u23.props.ShopID
                });

                if v42 ~= nil then
                    v42 = v42.price;
                end;

                if v42 == nil then
                    v42 = u23.props.SelectedItem.price;
                end;

                local v43 = BedwarsShop.getShopItem(u23.props.SelectedItem.itemType, Players.LocalPlayer, {
                    shopId = u23.props.ShopID
                });

                if v43 ~= nil then
                    v43 = v43.currency;
                end;

                if v43 == nil then
                    v43 = u23.props.SelectedItem.currency;
                end;

                v41.Text = tostring(v42) .. " " .. ItemUtil.getDisplayName(v43);
                v41.BackgroundTransparency = 1;
                v41.BorderSizePixel = 0;
                v41.FontFace = Font.new("Roboto", Enum.FontWeight.Bold);
                v41.TextScaled = true;
                v41.TextColor3 = v26;
                v40 = u3.createElement("TextLabel", v41);
            else
                v40 = u3.createElement(ShopDisruptionPrice, {
                    SelectedItem = u23.props.SelectedItem,
                    ShopID = u23.props.ShopID
                });
            end;

            local v44 = {
                [#v44 + 1] = v40
            };
            local v45 = #v44;

            if v27 ~= 0 and (v27 == v27 and (v27 ~= "" and v27)) then
                v27 = u3.createFragment({
                    TaxWarningIconLeft = u3.createElement("ImageLabel", {
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        ImageTransparency = 0,
                        Image = TaxTheme.WarningImage,
                        Size = UDim2.fromScale(0.2, 0.055),
                        Position = UDim2.fromScale(0.75, 0.867),
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        ScaleType = Enum.ScaleType.Fit
                    })
                });
            end;

            if v27 then
                v44[v45 + 1] = v27;
            end;

            v39 = u3.createFragment(v44);
        end;

        if v39 then
            v33[v38 + 1] = v39;
        end;

        local v46;

        if v30 then
            v46 = u3.createElement(Button, {
                Selectable = false,
                Text = "<b>" .. tostring(v31) .. "</b>",
                Size = UDim2.fromScale(0.9, 0.08),
                Position = UDim2.fromScale(0.5, 0.98),
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = v30.buttonColor or Theme.backgroundError,

                OnClick = function() -- Line: 325, Name: OnClick
                end
            });
        else
            local v47 = {
                Text = "<b>" .. v25 .. (UserInputService.GamepadEnabled and not UserInputService.MouseEnabled and " (A)" or "") .. "</b>",
                Size = UDim2.fromScale(0.9, 0.08),
                Position = UDim2.fromScale(0.5, 0.98),
                AnchorPoint = Vector2.new(0.5, 1)
            };
            local SelectedItem5 = u23.props.SelectedItem;

            if SelectedItem5 ~= nil then
                SelectedItem5 = SelectedItem5.price;
            end;

            local v48;

            if SelectedItem5 == 0 then
                v48 = ColorUtil.hexColor(15374848);
            else
                v48 = Theme.backgroundSuccess;
            end;

            v47.BackgroundColor3 = v48;
            v47.Selectable = false;

            function v47.OnClick() -- Line: 313
                -- upvalues: u23 (copy)
                u23:purchase();
            end;

            v46 = u3.createElement(Button, v47);
        end;

        v33[#v33 + 1] = v46;
        v32 = u3.createFragment(v33);
    end;

    local v49 = {
        BorderSizePixel = 0,
        Size = u23.props.Size,
        Position = u23.props.Position,
        BackgroundColor3 = Theme.backgroundSecondary
    };
    local v50 = {};
    local v51 = #v50;

    if v32 then
        v50[v51 + 1] = v32;
    end;

    return u3.createElement("Frame", v49, v50);
end;

return {
    BedwarsItemShopLeft = v5
};