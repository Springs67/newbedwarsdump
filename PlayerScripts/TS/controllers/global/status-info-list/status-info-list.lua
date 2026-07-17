-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");

return {
    StatusInfoList = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u1)(function(u2, p3) -- Line: 6
        -- upvalues: u1 (copy), DeviceUtil (copy)
        local _ = p3.useState;
        local useEffect = p3.useEffect;
        local u4 = u1.createRef();
        useEffect(function() -- Line: 10
            -- upvalues: u4 (copy), u2 (copy)
            local v5 = u4:getValue();

            if v5 then
                u2.SetupRef(v5);
            end;
        end, {});
        local createFragment = u1.createFragment;
        local v6 = {};
        local createElement = u1.createElement;
        local v7 = {
            ResetOnSpawn = false
        };
        local v8 = {};
        local createElement2 = u1.createElement;
        local v9 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, DeviceUtil.isSmallScreen() and 0.13 or 0.08),
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, DeviceUtil.isSmallScreen() and 0.95 or 0.99)
        };
        local v10 = { (u1.createElement("UIAspectRatioConstraint", {
                AspectRatio = 9
            })) };
        local createElement3 = u1.createElement;
        local v11 = {
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.fromScale(0.08, -0.45),
            Size = UDim2.fromScale(1, 0.45),
            BackgroundTransparency = 1,
            [u1.Ref] = u4
        };
        local v12 = {};
        local createElement4 = u1.createElement;
        local v13 = {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            SortOrder = "LayoutOrder"
        };
        local v14;

        if DeviceUtil.isSmallScreen() then
            v14 = Enum.HorizontalAlignment.Left;
        else
            v14 = Enum.HorizontalAlignment.Right;
        end;

        v13.HorizontalAlignment = v14;
        v13.Padding = UDim.new(0, 2);
        v12[1] = createElement4("UIListLayout", v13);
        v10.StatusInfoList = createElement3("Frame", v11, v12);
        v8.FakeHotbar = createElement2("Frame", v9, v10);
        v6.StatusInfoListGui = createElement("ScreenGui", v7, v8);

        return createFragment(v6);
    end)
};