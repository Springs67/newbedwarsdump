-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local KitSkinCard = RuntimeLib.import(script, script.Parent, "kit-skin-card").KitSkinCard;

return {
    KitSkinList = v3.new(u2)(function(u4, p5) -- Line: 13
        -- upvalues: BedwarsKitSkinMeta (copy), u2 (copy), ColorUtil (copy), KitSkinCard (copy), DeviceUtil (copy), BedwarsKitSkin (copy), AutoCanvasScrollingFrame (copy), Empty (copy)
        local _ = p5.useState;

        local function _(p6) -- Line: 17
            -- upvalues: BedwarsKitSkinMeta (ref)
            local variantOfSkin = BedwarsKitSkinMeta[p6].variantOfSkin;

            if variantOfSkin ~= nil then
                variantOfSkin = variantOfSkin.parentSkin;
            end;

            return not variantOfSkin and true or variantOfSkin == p6;
        end;

        local v7 = 0;
        local v8 = {};

        for i, v in u4.Skins do
            local _ = i - 1;
            local variantOfSkin = BedwarsKitSkinMeta[v].variantOfSkin;

            if variantOfSkin ~= nil then
                variantOfSkin = variantOfSkin.parentSkin;
            end;

            if (not variantOfSkin and true or variantOfSkin == v) == true then
                v7 = v7 + 1;
                v8[v7] = v;
            end;
        end;

        local v9 = {
            LayoutOrder = 0,
            Size = u4.Size
        };
        local v10 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                VerticalAlignment = "Bottom",
                Padding = UDim.new(0.03, 0)
            }), u2.createElement("TextLabel", {
                Text = "Skins:",
                TextScaled = true,
                TextXAlignment = "Left",
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.17),
                TextColor3 = ColorUtil.WHITE,
                FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
            }) };

        local function _(p11) -- Line: 60
            -- upvalues: BedwarsKitSkinMeta (ref), u2 (ref), KitSkinCard (ref), u4 (copy)
            if BedwarsKitSkinMeta[p11].hideInShop then
                return nil;
            end;

            return u2.createElement(KitSkinCard, {
                Kit = u4.Kit,
                Skin = p11,
                SelectedSkin = u4.SelectedSkin,
                SetSelectedSkin = u4.SetSelectedSkin,
                store = u4.store
            });
        end;

        local v12 = 0;
        local v13 = {};

        for i, v in v8 do
            local _ = i - 1;
            local v14;

            if BedwarsKitSkinMeta[v].hideInShop then
                v14 = nil;
            else
                v14 = u2.createElement(KitSkinCard, {
                    Kit = u4.Kit,
                    Skin = v,
                    SelectedSkin = u4.SelectedSkin,
                    SetSelectedSkin = u4.SetSelectedSkin,
                    store = u4.store
                });
            end;

            if v14 ~= nil then
                v12 = v12 + 1;
                v13[v12] = v14;
            end;
        end;

        local v15 = {
            AdditionalSpace = 10,
            ScrollingFrameProps = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.7999999999999999),
                CanvasSize = UDim2.fromScale(0, 0.7999999999999999),
                ScrollingDirection = Enum.ScrollingDirection.X,
                AutomaticCanvasSize = Enum.AutomaticSize.X
            }
        };
        local v16 = { u2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0.01, 0),
                PaddingTop = UDim.new(DeviceUtil.isSmallScreen() and 0.02 or 0.01, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Left",
                VerticalAlignment = "Top",
                Padding = UDim.new(0.03, 0)
            }), u2.createElement(KitSkinCard, {
                Kit = u4.Kit,
                Skin = BedwarsKitSkin.DEFAULT,
                SelectedSkin = u4.SelectedSkin,
                SetSelectedSkin = u4.SetSelectedSkin,
                store = u4.store
            }) };
        local v17 = #v16;

        for i, v in v13 do
            v16[v17 + i] = v;
        end;

        v10[#v10 + 1] = u2.createElement(AutoCanvasScrollingFrame, v15, v16);

        return u2.createElement(Empty, v9, v10);
    end)
};