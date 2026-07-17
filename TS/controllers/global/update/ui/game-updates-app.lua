-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DarkBackground = v1.DarkBackground;
local SlideIn = v1.SlideIn;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local GameUpdatesCore = RuntimeLib.import(script, script.Parent, "game-updates-core").GameUpdatesCore;
local v4 = u2.PureComponent:extend("GameUpdatesAppBase");

function v4.init(p5) -- Line: 12
end;

function v4.render(p6) -- Line: 14
    -- upvalues: u2 (copy), SlideIn (copy), DarkBackground (copy), GameUpdatesCore (copy)
    return u2.createElement("ScreenGui", {
        DisplayOrder = 20
    }, { u2.createElement(SlideIn, {}, { u2.createElement(DarkBackground, {
                AppId = p6.props.AppId
            }), u2.createElement(GameUpdatesCore, {
                store = p6.props.store,
                AppId = p6.props.AppId
            }) }) });
end;

return {
    GameUpdatesApp = v3.connect(function(p7, p8) -- Line: 30
        local v9 = {
            store = p7
        };

        for i, v in p8 do
            v9[i] = v;
        end;

        return v9;
    end)(v4)
};