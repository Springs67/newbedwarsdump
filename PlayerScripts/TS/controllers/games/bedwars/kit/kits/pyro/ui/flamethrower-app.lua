-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local FlamethrowerComponent = RuntimeLib.import(script, script.Parent, "flamethrower-component").FlamethrowerComponent;
local v4 = u2.Component:extend("FlamethrowerUpgradeAppBase");

function v4.init(p5) -- Line: 16
end;

function v4.render(p6) -- Line: 18
    -- upvalues: InventoryUtil (copy), Players (copy), ItemType (copy), u2 (copy), DarkBackground (copy), SlideIn (copy), DeviceUtil (copy), FlamethrowerComponent (copy)
    local v7 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, ItemType.FLAMETHROWER);

    if v7 ~= nil then
        v7 = v7.tool;
    end;

    local createElement = u2.createElement;
    local v8 = {
        DisplayOrder = 20
    };
    local v9 = {};
    local v10 = u2.createElement(DarkBackground, {
        AppId = p6.props.AppId
    });
    local createElement2 = u2.createElement;
    local v11 = {};
    local v12 = {};
    local createElement3 = u2.createElement;
    local v13 = {
        BackgroundTransparency = 1,
        AutoButtonColor = false,
        Active = true,
        Modal = true,
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
    v12[1] = createElement3("ImageButton", v13, { u2.createElement("UIAspectRatioConstraint", {
        AspectRatio = 1.7735849056603774
    }), u2.createElement(FlamethrowerComponent, {
        tool = v7
    }) });
    v9[1], v9[2] = v10, createElement2(SlideIn, v11, v12);

    return createElement("ScreenGui", v8, v9);
end;

return {
    FlamethrowerUpgradeApp = v3.connect(function(p15, p16) -- Line: 51
        return p16;
    end)(v4)
};