-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local ContractSelectComponent = RuntimeLib.import(script, script.Parent, "contract-select-component").ContractSelectComponent;
local v15 = v3.new(u2)(function(p5, p6) -- Line: 11
    -- upvalues: u2 (copy), DarkBackground (copy), SlideIn (copy), DeviceUtil (copy), ContractSelectComponent (copy)
    local _ = p6.useState;
    local createFragment = u2.createFragment;
    local v7 = {};
    local createElement = u2.createElement;
    local v8 = {};
    local v9 = {};
    local v10 = u2.createElement(DarkBackground, {
        AppId = p5.AppId
    });
    local createElement2 = u2.createElement;
    local v11 = {};
    local v12 = {};
    local createElement3 = u2.createElement;
    local v13 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v14;

    if DeviceUtil.isSmallScreen() then
        v14 = UDim2.fromScale(0.9, 0.9);
    else
        v14 = UDim2.fromScale(0.7, 0.7);
    end;

    v13.Size = v14;
    v12[1] = createElement3("Frame", v13, { u2.createElement("UIAspectRatioConstraint", {
        AspectRatio = 1.9878640776699028
    }), u2.createElement(ContractSelectComponent, {
        bloodUpgrades = p5.bloodUpgrades,
        activeContract = p5.activeContract,
        availableContracts = p5.availableContracts
    }) });
    v9[1], v9[2] = v10, createElement2(SlideIn, v11, v12);
    v7.ContractSelect = createElement("ScreenGui", v8, v9);

    return createFragment(v7);
end);

return {
    ContractSelectApp = v4.connect(function(p16, p17) -- Line: 39
        local v18 = {};

        for i, v in p17 do
            v18[i] = v;
        end;

        v18.bloodUpgrades = p16.Kit.bloodUpgrades;
        v18.activeContract = p16.Kit.activeContract;
        v18.availableContracts = p16.Kit.availableContracts;

        return v18;
    end)(v15)
};