-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BasicCountdownCard = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").BasicCountdownCard;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = u1.Component:extend("PregameCountdown");

function u2.init(p3) -- Line: 9
end;

function u2.render(p4) -- Line: 11
    -- upvalues: u1 (copy), BasicCountdownCard (copy), Theme (copy)
    return u1.createElement(BasicCountdownCard, {
        Text = "Match starting in {0}",
        EndOSTime = p4.props.store.Game.startTime,
        Size = Theme.centerTopAnnouncementCardSize,
        Position = UDim2.new(0.5, 0, 0, 1),
        AnchorPoint = Vector2.new(0.5, 0)
    });
end;

return {
    PregameCountdownWrapper = function(p5) -- Line: 21, Name: PregameCountdownWrapper
        -- upvalues: u1 (copy), u2 (ref)
        return u1.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u1.createElement(u2, {
                store = p5.store
            }) });
    end,

    PregameCountdown = u2
};