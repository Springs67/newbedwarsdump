-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local MatchEventCountdown = RuntimeLib.import(script, script.Parent, "match-event-countdown").MatchEventCountdown;
local v15 = v3.new(u2)(function(p5, p6) -- Line: 9
    -- upvalues: u1 (copy), u2 (copy), MatchEventCountdown (copy), Empty (copy)
    local _ = p6.useState;
    local v7 = u1.values(p5.MatchEvents);

    local function _(p8) -- Line: 12
        -- upvalues: u2 (ref), MatchEventCountdown (ref)
        local v9 = {
            AppId = "MatchEventCountdown"
        };

        for i, v in p8 do
            v9[i] = v;
        end;

        return u2.createElement(MatchEventCountdown, v9);
    end;

    local v10 = table.create(#v7);

    for i, v in v7 do
        local _ = i - 1;
        local v11 = {
            AppId = "MatchEventCountdown"
        };

        for i2, v2 in v do
            v11[i2] = v2;
        end;

        v10[i] = u2.createElement(MatchEventCountdown, v11);
    end;

    local v12 = {
        Size = p5.Size or UDim2.fromScale(1, 0.125)
    };
    local v13 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0.05, 0)
        }) };
    local v14 = #v13;

    for i, v in v10 do
        v13[v14 + i] = v;
    end;

    return u2.createElement(Empty, v12, v13);
end);

return {
    MatchEventList = v4.connect(function(p16, p17) -- Line: 44
        local v18 = {};

        for i, v in p17 do
            v18[i] = v;
        end;

        v18.MatchEvents = p16.Game.matchEvents;

        return v18;
    end)(v15)
};