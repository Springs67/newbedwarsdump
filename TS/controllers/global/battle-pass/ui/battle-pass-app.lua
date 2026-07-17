-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DarkBackground = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DarkBackground;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BattlePassCore = RuntimeLib.import(script, script.Parent, "battle-pass-core").BattlePassCore;
local v3 = u1.PureComponent:extend("BattlePassAppBase");

function v3.init(p4) -- Line: 11
end;

function v3.render(p5) -- Line: 13
    -- upvalues: u1 (copy), DarkBackground (copy), BattlePassCore (copy), BattlePassUtils (copy)
    return u1.createElement("ScreenGui", {
        DisplayOrder = 20,
        IgnoreGuiInset = true,
        ResetOnSpawn = false
    }, { u1.createElement(DarkBackground, {
            AppId = p5.props.AppId
        }), u1.createElement(BattlePassCore, {
            store = p5.props.store,
            battlepass = p5.props.battlepass or BattlePassUtils.BATTLE_PASS_SEASON,
            AppId = p5.props.AppId
        }) });
end;

return {
    BattlePassApp = v2.connect(function(p6, p7) -- Line: 30
        local v8 = {
            store = p6
        };

        for i, v in p7 do
            v8[i] = v;
        end;

        return v8;
    end)(v3)
};