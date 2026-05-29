local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u6 = v1.import(script, script.Parent, "battle-pass-app").BattlePassApp
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u6
        [4] = u5
        [5] = u2
    --]]
    u4:dispatch({
        ["type"] = "BattlePassUpdateAll",
        ["battlePass"] = {
            ["paid"] = false,
            ["timePaid"] = 0,
            ["experience"] = 3100
        }
    })
    local u8 = u3("BattlePassApp", u6, {
        ["battlepass"] = u5.BATTLE_PASS_SEASON
    }, {}, {
        ["Parent"] = p7
    })
    return function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end