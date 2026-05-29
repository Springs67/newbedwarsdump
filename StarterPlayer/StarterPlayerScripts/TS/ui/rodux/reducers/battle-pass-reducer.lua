local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u2 = {
    ["experience"] = 0,
    ["paid"] = false,
    ["level"] = 1
}
return {
    ["BattlePassReducer"] = function(p3, p4) --[[ Name: BattlePassReducer, Line 9 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u1
        --]]
        if p3 == nil then
            p3 = u2
        end
        if p4.type == "BattlePassUpdateAll" then
            local v5 = u1.getLevelFromExperience(p4.battlePass.experience)
            local v6 = {}
            for v7, v8 in p3 do
                v6[v7] = v8
            end
            for v9, v10 in p4.battlePass do
                v6[v9] = v10
            end
            v6.level = v5
            return v6
        end
        if p4.type ~= "BattlePassSetXP" then
            if p4.type ~= "BattlePassSetPaid" then
                return p3
            end
            local v11 = {}
            for v12, v13 in p3 do
                v11[v12] = v13
            end
            v11.paid = p4.paid
            return v11
        end
        local v14 = u1.getLevelFromExperience(p4.experience)
        local v15 = {}
        for v16, v17 in p3 do
            v15[v16] = v17
        end
        v15.experience = p4.experience
        v15.level = v14
        return v15
    end
}