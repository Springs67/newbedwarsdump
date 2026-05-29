local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedWarsScythes
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.SWING = 0
v5[0] = "SWING"
v6.SLASH = 1
v5[1] = "SLASH"
v6.PULL = 2
v5[2] = "PULL"
v6.SPIN = 3
v5[3] = "SPIN"
local u7 = { v6.SWING, v6.SLASH, v6.PULL }
local u8 = {
    [v6.SWING] = {
        ["fpAnimation"] = v2.SCYTHE_SLASH_1_FP,
        ["animation"] = v2.SCYTHE_SLASH_1,
        ["sound"] = { v3.SCYTHE_SWING_1 }
    },
    [v6.SLASH] = {
        ["fpAnimation"] = v2.SCYTHE_SLASH_2_FP,
        ["animation"] = v2.SCYTHE_SLASH_2,
        ["sound"] = { v3.SCYTHE_SWING_2 }
    },
    [v6.PULL] = {
        ["fpAnimation"] = v2.SCYTHE_PULL_1_FP,
        ["animation"] = v2.SCYTHE_PULL_1,
        ["sound"] = { v3.SCYTHE_PULL_2, v3.SCYTHE_PULL_1 }
    },
    [v6.SPIN] = {
        ["fpAnimation"] = v2.SCYTHE_SPIN_FP,
        ["animation"] = v2.SCYTHE_SPIN,
        ["sound"] = { v3.SCYTHE_SPIN_1, v3.SCYTHE_SPIN_1, v3.SCYTHE_SPIN_3 }
    }
}
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 57 ]]
        return "ScytheUtil"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(_) --[[ Line: 66 ]] end
function u9.isScythe(_, p12) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p12 then
        return table.find(u4, p12) ~= nil
    else
        return false
    end
end
function u9.getAnimation(_, p13) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
    --]]
    return u8[u7[((p13 < 0 or #u7 <= p13) and 0 or p13) + 1]]
end
function u9.getScytheAttackSequence(_) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7
end
function u9.getAttack(_, p14) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if #u7 <= p14 or p14 < 0 then
        return u7[1]
    else
        return u7[p14 + 1]
    end
end
return {
    ["SCYTHE_ATTACKS"] = v6,
    ["SCYTHE_ATTACK_SEQUENCE"] = u7,
    ["SCYTHE_ATTACK_TABLE"] = u8,
    ["SCYTHE_BALANCE"] = {
        ["SCYTHE_SPIN_RANGE"] = 15,
        ["SCYTHE_SPIN_DAMAGE"] = 15,
        ["SCYTHE_SLASH_DAMAGE"] = 15
    },
    ["ScytheUtil"] = u9
}