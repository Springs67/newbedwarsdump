-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitDetailsBundleActionButtons = RuntimeLib.import(script, script.Parent, "kit-details-bundle-action-buttons").KitDetailsBundleActionButtons;
local KitDetailsKitActionButtons = RuntimeLib.import(script, script.Parent, "kit-details-kit-action-buttons").KitDetailsKitActionButtons;
local KitDetailsKitLoadoutInfoCard = RuntimeLib.import(script, script.Parent, "kit-details-kit-loadout-info-card").KitDetailsKitLoadoutInfoCard;

return {
    KitDetailsRightContainer = v3.new(u2)(function(p4, p5) -- Line: 11
        -- upvalues: u2 (copy), KitDetailsKitLoadoutInfoCard (copy), ColorUtil (copy), Empty (copy), KitDetailsKitActionButtons (copy), KitDetailsBundleActionButtons (copy)
        local _ = p5.useState;
        local _ = p5.useEffect;
        local _ = p5.useMemo;
        local v6 = {};

        for i, v in p4 do
            v6[i] = v;
        end;

        v6.SelectedKit = nil;
        v6.SelectedKitSkin = nil;
        v6.SelectedKitBundle = nil;
        v6.store = nil;
        local v7 = {};

        for i, v in v6 do
            v7[i] = v;
        end;

        local v8 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v9 = #v8;
        local v10 = p4.SelectedKit and u2.createFragment({ u2.createElement(KitDetailsKitLoadoutInfoCard, {
                BackgroundTransparency = 0.5,
                BackgroundColor3 = ColorUtil.BLACK,
                Size = UDim2.fromScale(1, 0.725),
                SelectedKit = p4.SelectedKit
            }), u2.createElement(Empty, {
                Size = UDim2.fromScale(1, 0.025)
            }) });

        if v10 then
            v8[v9 + 1] = v10;
        end;

        local v11 = #v8;
        local v12;

        if p4.SelectedKit then
            v12 = u2.createElement(KitDetailsKitActionButtons, {
                SelectedKit = p4.SelectedKit,
                SelectedKitSkin = p4.SelectedKitSkin,
                store = p4.store,
                Size = UDim2.new(1, 0, 0.25, -10)
            });
        elseif p4.SelectedKitBundle then
            v12 = u2.createElement(KitDetailsBundleActionButtons, {
                SelectedKitBundle = p4.SelectedKitBundle,
                store = p4.store,
                Size = UDim2.new(1, 0, 0.25, -10)
            });
        else
            v12 = nil;
        end;

        if v12 then
            v8[v11 + 1] = v12;
        end;

        return u2.createElement(Empty, v7, v8);
    end)
};