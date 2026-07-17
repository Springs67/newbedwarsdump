-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local Empty = v1.Empty;
local UIUtil = v1.UIUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local PlayerViewport = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "player-viewport").PlayerViewport;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EngineerFilmEffect = RuntimeLib.import(script, script.Parent.Parent.Parent, "kit", "kits", "watcher", "ui", "engineer-film-effect").EngineerFilmEffect;
local u3 = u2.Component:extend("Distraction");

function u3.init(p4, p5) -- Line: 13
    -- upvalues: u2 (copy)
    local v6, v7 = u2.createBinding(0.9);
    p4.transparency = v6;
    p4.setTransparency = v7;
end;

function u3.render(p8) -- Line: 16
    -- upvalues: UIUtil (copy), u2 (copy), Theme (copy), PlayerViewport (copy), Empty (copy), EngineerFilmEffect (copy)
    local v9 = math.random(1, 100) <= 2 and "http://www.roblox.com/asset/?id=5917459365" or "http://www.roblox.com/asset/?id=4841405708";
    local v10 = {};
    local v11 = #v10;
    local v12 = {
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(1, 0, 1, 0)
    };
    local v13 = {};
    local v14 = #v13;
    local v15 = {
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UIUtil:getActionBarPosition() - UDim2.new(0, 0, 0.1, 0),
        Size = UDim2.new(0.8, 0, 0.1, 0),
        Text = "Hacked by Vulcan!!!!",
        Font = "Ubuntu",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextScaled = true
    };
    v13[v14 + 1] = u2.createElement("TextLabel", v15, { u2.createElement("UIStroke", {
            Thickness = 5,
            Color = Theme.backgroundSecondary
        }) });
    v13[v14 + 2] = u2.createElement(PlayerViewport, {
        Animation = v9,
        Size = UDim2.new(1, 0, 1, 0)
    });
    v10[v11 + 1] = u2.createElement(Empty, v12, v13);
    v10[v11 + 2] = u2.createElement(EngineerFilmEffect, {
        transparency = p8.transparency
    });

    return u2.createFragment(v10);
end;

return {
    DistractionWrapper = function() -- Line: 59, Name: DistractionWrapper
        -- upvalues: u2 (copy), u3 (ref)
        return u2.createElement("ScreenGui", {}, { u2.createElement(u3) });
    end,

    Distraction = u3
};