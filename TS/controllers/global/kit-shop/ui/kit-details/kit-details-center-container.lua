-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local PlayerViewport = v1.PlayerViewport;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local KitViewport = RuntimeLib.import(script, script.Parent.Parent, "misc", "kit-viewport").KitViewport;

return {
    KitDetailsCenterContainer = v3.new(u2)(function(p4, p5) -- Line: 9
        -- upvalues: u2 (copy), Empty (copy), KitViewport (copy), PlayerViewport (copy)
        local _ = p5.useState;
        local v6 = {};

        for i, v in p4 do
            v6[i] = v;
        end;

        v6.SelectedKit = nil;
        v6.SelectedKitSkin = nil;
        v6.ItemImage = nil;
        local v7 = {};

        for i, v in v6 do
            v7[i] = v;
        end;

        local createElement = u2.createElement;
        local v8 = {};
        local v9;

        if p4.SelectedKit == nil then
            if p4.ItemImage == nil then
                v9 = u2.createElement(PlayerViewport, {
                    Rotate = true,
                    Size = UDim2.fromScale(1.1, 1.1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5)
                });
            else
                v9 = u2.createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1.1, 1.1),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Image = p4.ItemImage,
                    ScaleType = Enum.ScaleType.Fit
                });
            end;
        else
            v9 = u2.createElement(KitViewport, {
                Kit = p4.SelectedKit,
                Skin = p4.SelectedKitSkin,
                Size = UDim2.fromScale(1.1, 1.1),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            });
        end;

        v8[1] = v9;

        return createElement(Empty, v7, v8);
    end)
};