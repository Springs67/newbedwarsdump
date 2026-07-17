-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;

return {
    IlluminatorTableUi = v2.new(u1)(function(p3, p4) -- Line: 8
        -- upvalues: DeviceUtil (copy), UserInputService (copy), u1 (copy), BedwarsImageId (copy)
        local v5, _ = p4.useState(true);
        local v6 = UDim2.fromScale(0.15, 0.15);

        if not DeviceUtil.isSmallScreen() then
            v6 = UDim2.fromScale(0.11, 0.11);
        end;

        if UserInputService.KeyboardEnabled then
            return u1.createFragment();
        end;

        local createElement = u1.createElement;
        local v7 = {
            ResetOnSpawn = false,
            IgnoreGuiInset = true
        };
        local v8 = {};
        local createElement2 = u1.createElement;
        local v9 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0
        };
        local v10;

        if v5 then
            v10 = BedwarsImageId.FLASHLIGHT_ON_MOBILE;
        else
            v10 = BedwarsImageId.FLASHLIGHT_OFF_MOBILE;
        end;

        v9.Image = v10;
        v9.Size = v6;
        v9.AnchorPoint = Vector2.new(0.5, 0.5);
        local v11;

        if DeviceUtil.isSmallScreen() then
            v11 = UDim2.fromScale(0.85, 0.4);
        else
            v11 = UDim2.fromScale(0.85, 0.52);
        end;

        v9.Position = v11;
        v8[1] = createElement2("ImageButton", v9, { u1.createElement("UIAspectRatioConstraint", {
        AspectRatio = 1,
        DominantAxis = "Height"
    }) });

        return createElement("ScreenGui", v7, v8);
    end)
};