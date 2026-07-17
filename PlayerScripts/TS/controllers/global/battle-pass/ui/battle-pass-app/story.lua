-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BattlePassApp = RuntimeLib.import(script, script.Parent, "battle-pass-app").BattlePassApp;

return function(p2) -- Line: 8
    -- upvalues: ClientStore (copy), CreateRoduxApp (copy), BattlePassApp (copy), BattlePassUtils (copy), u1 (copy)
    ClientStore:dispatch({
        type = "BattlePassUpdateAll",
        battlePass = {
            paid = false,
            timePaid = 0,
            experience = 3100
        }
    });
    local u3 = CreateRoduxApp("BattlePassApp", BattlePassApp, {
        battlepass = BattlePassUtils.BATTLE_PASS_SEASON
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 22
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;