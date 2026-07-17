-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local TaxTheme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-tax-util").TaxTheme;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local VoidWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "world", "void", "void-world-util").VoidWorldUtil;
local v3 = u2.Component:extend("ShopToolbar");

function v3.init(p4) -- Line: 15
end;

function v3.render(p5) -- Line: 17
    -- upvalues: ItemType (copy), VoidWorldUtil (copy), ColorUtil (copy), Theme (copy), u2 (copy), DeviceUtil (copy), KnitClient (copy), TaxTheme (copy)
    local ObservedInventory = p5.props.ObservedInventory;

    if ObservedInventory ~= nil then
        ObservedInventory = ObservedInventory.inventory;
    end;

    local u6 = 0;
    local u7 = 0;
    local u8 = 0;
    local u9 = 0;
    local u10 = 0;

    if ObservedInventory ~= nil then
        local items = ObservedInventory.items;

        local function v12(p11) -- Line: 31
            -- upvalues: ItemType (ref), u6 (ref), u7 (ref), u8 (ref), u9 (ref), u10 (ref)
            if p11.itemType == ItemType.IRON then
                u6 = u6 + p11.amount;

                return;
            end;

            if p11.itemType == ItemType.DIAMOND then
                u7 = u7 + p11.amount;

                return;
            end;

            if p11.itemType == ItemType.EMERALD then
                u8 = u8 + p11.amount;

                return;
            end;

            if p11.itemType == ItemType.VOID_CRYSTAL then
                u9 = u9 + p11.amount;

                return;
            end;

            if p11.itemType == ItemType.GOLD then
                u10 = u10 + p11.amount;
            end;
        end;

        for i, v in items do
            v12(v, i - 1, items);
        end;
    end;

    if p5.props.IsHomeBase then
        local ObservedInventory2 = p5.props.ObservedInventory;

        if ObservedInventory2 ~= nil then
            ObservedInventory2 = ObservedInventory2.observedChest;

            if ObservedInventory2 ~= nil then
                ObservedInventory2 = ObservedInventory2.items;

                if ObservedInventory2 ~= nil then
                    local function _(p13) -- Line: 56
                        -- upvalues: ItemType (ref)
                        if p13 == "empty" then
                            return false;
                        end;

                        return p13.itemType == ItemType.DIAMOND;
                    end;

                    ObservedInventory2 = nil;

                    for i, v in ObservedInventory2 do
                        local _ = i - 1;
                        local v14;

                        if v == "empty" then
                            v14 = false;
                        else
                            v14 = v.itemType == ItemType.DIAMOND;
                        end;

                        if v14 == true then
                            ObservedInventory2 = v;
                            break;
                        end;
                    end;
                end;
            end;
        end;

        if ObservedInventory2 ~= nil then
            ObservedInventory2 = ObservedInventory2.amount;
        end;

        u7 = u7 + (ObservedInventory2 == nil and 0 or ObservedInventory2);
    end;

    local v15 = "    <font color=\"#FF55FF\">" .. tostring(u9) .. " Void Crystal</font>";
    local v16 = not VoidWorldUtil.VOID_ENABLED and "" or v15;
    local v17 = "    <font color=\"" .. ColorUtil.richTextColor(Theme.mcGold) .. "\">" .. tostring(u10) .. " Gold</font>";
    local v18 = "<b>" .. tostring(u6) .. " Iron    <font color=\"#55FFFF\">" .. tostring(u7) .. " Diamond</font>    <font color=\"#55FF99\">" .. tostring(u8) .. " Emerald</font>" .. (u10 < 1 and "" or v17) .. v16 .. "</b>";
    local v19 = u2.createRef();
    local v20;

    if DeviceUtil.isHoarceKat() then
        v20 = false;
    else
        v20 = KnitClient.Controllers.ShopTaxController:isTaxed();
    end;

    local v21 = {
        BorderSizePixel = 0,
        Size = p5.props.Size,
        BackgroundColor3 = ColorUtil.hexColor(3092550)
    };
    local v22 = { u2.createElement("TextLabel", {
            Text = "Item Shop",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextXAlignment = "Left",
            Size = UDim2.fromScale(0.3, 0.5),
            Position = UDim2.fromScale(0.03, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            FontFace = Font.new("Roboto", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255)
        }) };
    local v23 = #v22;

    if v20 then
        v20 = u2.createFragment({
            TaxWarningIcon = u2.createElement("ImageLabel", {
                [u2.Ref] = v19,
                Image = TaxTheme.WarningImage,
                Size = UDim2.fromScale(0.05, 0.8),
                Position = UDim2.fromScale(0.5, 0.45),
                AnchorPoint = Vector2.new(0.5, 0.45),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ScaleType = Enum.ScaleType.Fit,
                ImageTransparency = 0,

                [u2.Event.MouseEnter] = function(p24) -- Line: 144
                    local TaxWarningMsg = p24:FindFirstChild("TaxWarningMsg");

                    if TaxWarningMsg then
                        TaxWarningMsg.Visible = true;
                    end;
                end,

                [u2.Event.MouseLeave] = function(p25) -- Line: 150
                    local TaxWarningMsg = p25:FindFirstChild("TaxWarningMsg");

                    if TaxWarningMsg then
                        TaxWarningMsg.Visible = false;
                    end;
                end
            }, {
                TaxWarningMsg = u2.createElement("Frame", {
                    BackgroundTransparency = 0,
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    BackgroundColor3 = Theme.backgroundSecondary,
                    Size = UDim2.fromScale(4, 1.6),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 1.8)
                }, { u2.createElement("UIStroke", {
                        Thickness = 2,
                        Color = ColorUtil.hexColor(3092550)
                    }), u2.createElement("TextLabel", {
                        Text = "<b>Early Game Tax:</b> You were given too much iron.",
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        Font = "Roboto",
                        TextScaled = true,
                        TextWrapped = true,
                        RichText = true,
                        TextXAlignment = "Center",
                        TextYAlignment = "Center",
                        ZIndex = 3,
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        Size = UDim2.fromScale(1, 1)
                    }) })
            })
        });
    end;

    if v20 then
        v22[v23 + 1] = v20;
    end;

    v22[#v22 + 1] = u2.createElement("TextLabel", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Font = "Roboto",
        TextScaled = true,
        RichText = true,
        TextXAlignment = "Right",
        Text = v18,
        Size = UDim2.fromScale(0.97, 0.45),
        Position = UDim2.fromScale(0.98, 0.5),
        AnchorPoint = Vector2.new(1, 0.5),
        TextColor3 = Color3.fromRGB(255, 255, 255)
    });

    return u2.createElement("Frame", v21, v22);
end;

return {
    ShopToolbar = v3
};