-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitShopItemList = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-item-list").KitShopItemList;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlayerProfileEmpty = RuntimeLib.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty;

return {
    PlayerProfileKits = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: Theme (copy), u2 (copy), PlayerProfileEmpty (copy), KitShopItemList (copy), DeviceUtil (copy), u1 (copy), BedwarsKit (copy)
        local _ = p5.useState;
        local v6 = {
            BackgroundTransparency = 0,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = Theme.backgroundPrimary
        };
        local FrameProps = p4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v6[i] = v;
            end;
        end;

        local kits = p4.ProfileData.kits;

        if kits ~= nil then
            kits = #kits == 0;
        end;

        local v7 = {};
        local v8;

        if kits then
            v8 = u2.createElement(PlayerProfileEmpty, {
                Text = "No kits owned.",
                Size = UDim2.fromScale(1, 1)
            });
        else
            local createElement = u2.createElement;
            local v9 = {
                SelectionMode = "VIEW_ONLY",
                ExcludeNonShopKits = true,
                Size = UDim2.fromScale(1, 1),
                store = p4.store
            };
            local v10;

            if DeviceUtil.isHoarceKat() then
                v10 = u1.values(BedwarsKit);
            else
                v10 = p4.ProfileData.kits;
            end;

            v9.CustomKitView = v10;
            v9.ScrollingFrameProps = {
                Size = UDim2.fromScale(1, DeviceUtil.isSmallScreen() and 0.92 or 0.94)
            };
            v8 = createElement(KitShopItemList, v9);
        end;

        v7[#v7 + 1] = v8;

        return u2.createElement("Frame", v6, v7);
    end)
};