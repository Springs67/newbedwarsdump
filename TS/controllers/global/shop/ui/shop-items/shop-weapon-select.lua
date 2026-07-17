-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local shopPurchaseItem = RuntimeLib.import(script, script.Parent.Parent.Parent, "api", "purchase-item").shopPurchaseItem;
local BedwarsShopItemCard = RuntimeLib.import(script, script.Parent, "shop-item-card").BedwarsShopItemCard;

return {
    ShopWeaponSelect = v3.new(u2)(function(u4, p5) -- Line: 15
        -- upvalues: DeviceUtil (copy), u2 (copy), ColorUtil (copy), shopPurchaseItem (copy), KnitClient (copy), Players (copy), BedwarsShopItemCard (copy), Empty (copy)
        local _ = p5.useEffect;
        local v6, u7 = p5.useState(Vector2.new(694, 523));
        local v8 = (DeviceUtil.isSmallScreen() and 8 or 14) + 2;
        local v9 = DeviceUtil.isSmallScreen() and 79 or 69;
        local v10 = math.floor(v6.X * (v9 / 694));
        local v11 = math.floor(v6.X * 0.01488095238095238);
        local SelectedItem = u4.SelectedItem;
        local v13 = {
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = "Y",

            [u2.Change.AbsoluteSize] = function(p12) -- Line: 28
                -- upvalues: u7 (copy)
                u7(p12.AbsoluteSize);
            end
        };
        local v14 = {
            TitleLayout = u2.createElement("UIListLayout", {
                VerticalAlignment = "Top",
                HorizontalAlignment = "Left",
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, DeviceUtil.isSmallScreen() and 4 or 8)
            }),
            ["Weapon Select Section"] = u2.createElement("TextLabel", {
                TextXAlignment = "Left",
                Text = "<b>Base Weapons</b>",
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, v8),
                TextColor3 = ColorUtil.WHITE,
                TextSize = v8 - 2
            })
        };
        local WeaponChoices = u4.WeaponChoices;

        local function v21(u15, p16) -- Line: 53
            -- upvalues: u4 (copy), SelectedItem (ref), shopPurchaseItem (ref), KnitClient (ref), Players (ref), u2 (ref), BedwarsShopItemCard (ref)
            local v17 = {
                ShopItem = u15,
                LayoutOrder = p16
            };
            local SelectedItem2 = u4.SelectedItem;

            if SelectedItem2 ~= nil then
                SelectedItem2 = SelectedItem2.itemType;
            end;

            v17.Selected = SelectedItem2 == u15.itemType;

            function v17.OnClick() -- Line: 63
                -- upvalues: u4 (ref), u15 (copy), SelectedItem (ref)
                u4.SetSelectedShopItem(u15);
                SelectedItem = u15;
            end;

            function v17.OnRightClick() -- Line: 67
                -- upvalues: shopPurchaseItem (ref), u15 (copy), u4 (ref), KnitClient (ref), SelectedItem (ref), Players (ref)
                shopPurchaseItem(u15, u4.ShopID):andThen(function(p18) -- Line: 69
                    -- upvalues: u15 (ref), KnitClient (ref), u4 (ref), SelectedItem (ref), Players (ref)
                    if p18 then
                        if u15.tiered then
                            KnitClient.Controllers.BedwarsShopController.alreadyPurchasedMap[u15.itemType] = true;
                        end;

                        local v19;

                        if u15.nextTier then
                            local function _(p20) -- Line: 79
                                -- upvalues: u15 (ref)
                                return p20.itemType == u15.nextTier;
                            end;

                            v19 = nil;

                            for i, v in u4.WeaponChoices do
                                local _ = i - 1;

                                if v.itemType == u15.nextTier == true then
                                    v19 = v;
                                    break;
                                end;
                            end;
                        else
                            v19 = u15;
                        end;

                        u4.SetSelectedShopItem(v19);
                    else
                        u4.SetSelectedShopItem(u15);
                    end;

                    SelectedItem = u15;
                    Players.LocalPlayer:SetAttribute("HasWeaponChosen", true);
                end);
            end;

            return u2.createElement(BedwarsShopItemCard, v17);
        end;

        local v22 = table.create(#WeaponChoices);

        for i, v in WeaponChoices do
            v22[i] = v21(v, i - 1, WeaponChoices);
        end;

        local v23 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        };
        local v24 = { u2.createElement("UIGridLayout", {
                HorizontalAlignment = "Left",
                VerticalAlignment = "Top",
                SortOrder = "LayoutOrder",
                FillDirectionMaxCells = 8,
                CellSize = UDim2.new(0, v10, 0, v10),
                CellPadding = UDim2.fromOffset(v11, v11)
            }) };
        local v25 = #v24;

        for i, v in v22 do
            v24[v25 + i] = v;
        end;

        v14[#v14 + 1] = u2.createElement(Empty, v23, v24);

        return u2.createElement(Empty, v13, v14);
    end)
};