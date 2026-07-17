-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local SlideIn = v1.SlideIn;
local WidgetComponent = v1.WidgetComponent;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local AchievementsCore = RuntimeLib.import(script, script.Parent, "achievements-core").AchievementsCore;
local v19 = v3.new(u2)(function(u5, p6) -- Line: 13
    -- upvalues: Flamework (copy), u2 (copy), DeviceUtil (copy), DarkBackground (copy), SlideIn (copy), WidgetComponent (copy), AchievementsCore (copy)
    local _ = p6.useState;
    UDim.new(0, 10);

    local function u7() -- Line: 16
        -- upvalues: Flamework (ref), u5 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u5.AppId);
    end;

    local createElement = u2.createElement;
    local v8 = {
        DisplayOrder = 20,
        ResetOnSpawn = false,
        IgnoreGuiInset = DeviceUtil.isSmallScreen()
    };
    local v9 = {};
    local v10 = u2.createElement(DarkBackground, {
        AppId = u5.AppId
    });
    local createElement2 = u2.createElement;
    local v11 = {};
    local v12 = {};
    local createElement3 = u2.createElement;
    local v13 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1)
    };
    local v14 = {};
    local v15 = u2.createElement("UISizeConstraint", {
        MaxSize = Vector2.new(1600, 1000)
    });
    local createElement4 = u2.createElement;
    local v16 = {
        PaddingBottom = UDim.new(0, 20),
        PaddingTop = UDim.new(0, 10)
    };
    local v17;

    if DeviceUtil.isSmallScreen() then
        v17 = UDim.new(0, 10);
    else
        v17 = UDim.new(0.1, 0);
    end;

    v16.PaddingLeft = v17;
    local v18;

    if DeviceUtil.isSmallScreen() then
        v18 = UDim.new(0, 10);
    else
        v18 = UDim.new(0.1, 0);
    end;

    v16.PaddingRight = v18;
    v14[1], v14[2], v14[3] = v15, createElement4("UIPadding", v16), u2.createElement(WidgetComponent, {
    Title = "Achievements",
    AppId = u5.AppId,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromScale(1, 1),

    OnClose = function() -- Line: 49, Name: OnClose
        -- upvalues: u7 (copy)
        return u7();
    end
}, { u2.createElement(AchievementsCore, {
        ViewingAsLocalPlayer = true
    }) });
    v12[1] = createElement3("Frame", v13, v14);
    v9[1], v9[2] = v10, createElement2(SlideIn, v11, v12);

    return createElement("ScreenGui", v8, v9);
end);

return {
    AchievementsApp = v4.connect(function(p20, p21) -- Line: 62
        local v22 = {};

        for i, v in p21 do
            v22[i] = v;
        end;

        v22.store = p20;

        return v22;
    end)(v19)
};