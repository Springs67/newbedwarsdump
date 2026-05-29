local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bedwars-melees").BedWarsGauntlets
local v11 = {}
local v12 = setmetatable({}, {
    ["__index"] = v11
})
v12.JAB = 0
v11[0] = "JAB"
v12.CROSS = 1
v11[1] = "CROSS"
v12.HOOK = 2
v11[2] = "HOOK"
v12.UPPERCUT = 3
v11[3] = "UPPERCUT"
local u13 = {
    v12.JAB,
    v12.CROSS,
    v12.HOOK,
    v12.UPPERCUT
}
local u14 = {
    [v12.JAB] = {
        ["fpAnimation"] = v5.GAUNTLETS_JAB_1ST,
        ["animation"] = v5.GAUNTLETS_JAB,
        ["impactSound"] = {
            v9.GAUNTLETS_JAB_IMPACT_1,
            v9.GAUNTLETS_JAB_IMPACT_2,
            v9.GAUNTLETS_JAB_IMPACT_3,
            v9.GAUNTLETS_JAB_IMPACT_4
        },
        ["swingSound"] = {
            v9.GAUNTLETS_JAB_SWING_1,
            v9.GAUNTLETS_JAB_SWING_2,
            v9.GAUNTLETS_JAB_SWING_3,
            v9.GAUNTLETS_JAB_SWING_4
        }
    },
    [v12.CROSS] = {
        ["fpAnimation"] = v5.GAUNTLETS_CROSS_1ST,
        ["animation"] = v5.GAUNTLETS_CROSS,
        ["impactSound"] = {
            v9.GAUNTLETS_CROSS_IMPACT_1,
            v9.GAUNTLETS_CROSS_IMPACT_2,
            v9.GAUNTLETS_CROSS_IMPACT_3,
            v9.GAUNTLETS_CROSS_IMPACT_4
        },
        ["swingSound"] = {
            v9.GAUNTLETS_CROSS_SWING_1,
            v9.GAUNTLETS_CROSS_SWING_2,
            v9.GAUNTLETS_CROSS_SWING_3,
            v9.GAUNTLETS_CROSS_SWING_4
        }
    },
    [v12.HOOK] = {
        ["fpAnimation"] = v5.GAUNTLETS_HOOK_1ST,
        ["animation"] = v5.GAUNTLETS_HOOK,
        ["impactSound"] = {
            v9.GAUNTLETS_HOOK_IMPACT_1,
            v9.GAUNTLETS_HOOK_IMPACT_2,
            v9.GAUNTLETS_HOOK_IMPACT_3,
            v9.GAUNTLETS_HOOK_IMPACT_4
        },
        ["swingSound"] = {
            v9.GAUNTLETS_HOOK_SWING_1,
            v9.GAUNTLETS_HOOK_SWING_2,
            v9.GAUNTLETS_HOOK_SWING_3,
            v9.GAUNTLETS_HOOK_SWING_4
        }
    },
    [v12.UPPERCUT] = {
        ["fpAnimation"] = v5.GAUNTLETS_UPPERCUT_1ST,
        ["animation"] = v5.GAUNTLETS_UPPERCUT,
        ["impactSound"] = {
            v9.GAUNTLETS_UPPERCUT_IMPACT_1,
            v9.GAUNTLETS_UPPERCUT_IMPACT_2,
            v9.GAUNTLETS_UPPERCUT_IMPACT_3,
            v9.GAUNTLETS_UPPERCUT_IMPACT_4
        },
        ["swingSound"] = {
            v9.GAUNTLETS_UPPERCUT_SWING_1,
            v9.GAUNTLETS_UPPERCUT_SWING_2,
            v9.GAUNTLETS_UPPERCUT_SWING_3,
            v9.GAUNTLETS_UPPERCUT_SWING_4
        }
    }
}
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 80 ]]
        return "GauntletsUtil"
    end
})
u15.__index = u15
function u15.new(...) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(_) --[[ Line: 89 ]] end
function u15.isGauntlets(_, p18) --[[ Line: 91 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return table.find(u10, p18) ~= nil
end
function u15.hasGauntletsEquipped(_, p19, p20) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u10
    --]]
    local v21 = u7:getEntity(p19)
    if not v21 then
        return false
    end
    local v22 = v21:getItemInHand()
    if not v22 then
        return false
    end
    if p20 then
        return v22.Name == u8.MYTHIC_GAUNTLETS
    end
    local v23 = v22.Name
    return table.find(u10, v23) ~= nil
end
function u15.getAnimation(_, p24) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    return u14[u13[((p24 < 0 or #u13 <= p24) and 0 or p24) + 1]]
end
function u15.getGauntletsAttackSequence(_) --[[ Line: 122 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    return u13
end
function u15.getAttack(_, p25) --[[ Line: 125 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    if #u13 <= p25 or p25 < 0 then
        return u13[1]
    else
        return u13[p25 + 1]
    end
end
function u15.getRegionInFrontOfPlayer(_, p26, p27, p28) --[[ Line: 131 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u3
        [4] = u4
    --]]
    if not p26.PrimaryPart then
        return nil
    end
    local v29 = 3.8 * u6
    local v30 = p26:FindFirstChild("Humanoid")
    local v31 = not v30 and 1.5 or v30.HipHeight
    local v32 = p27 + p28.Unit * (v29 / 2)
    local v33 = CFrame.new(v32, v32 + p28)
    local v34 = u2
    local v35 = v29 / 1.5
    local v36 = math.max(3, v31) * 2
    local v37 = v29 / 1.5
    local v38 = v34:getBlockPosition(v32 - Vector3.new(v35, v36, v37))
    local v39 = u2
    local v40 = v29 / 1.5
    local v41 = math.max(3, v31) * 2
    local v42 = v29 / 1.5
    local v43 = Vector3.new(v40, v41, v42)
    local v44 = Region3.new(v38, v39:getBlockPosition(v32 + v43))
    local u45 = u3("Part", {
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Parent"] = u4,
        ["Size"] = v44.Size,
        ["CFrame"] = v33,
        ["Color"] = Color3.fromRGB(250, 99, 158)
    })
    task.delay(1, function() --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:Destroy()
    end)
    return v44
end
return {
    ["GAUNTLETS_CHARGE_TIME"] = 0.75,
    ["GAUNTLETS_ATTACK_COOLDOWN"] = 0.21,
    ["GAUNTLETS_COMBO_RESET_DELAY"] = 2,
    ["GAUNTLETS_MAX_COMBO"] = 20,
    ["GAUNTLETS_DAMAGE_RAMP_PERCENT"] = 2,
    ["MYTHIC_GAUNTLETS_BLOCK_DAMAGE"] = 15,
    ["LAST_GAUNTLETS_ATTACK"] = "LastGauntletsAttack",
    ["GAUNTLETS_ATTACK_INDEX"] = "GauntletsAttackIndex",
    ["GAUNTLETS_COMBO_TOTAL"] = "GauntletsComboTotal",
    ["LAST_CHARGED_GAUNTLETS_ATTACK"] = "LastChargedGauntletsAttack",
    ["GauntletsAttacks"] = v12,
    ["GauntletsAttackSequence"] = u13,
    ["GauntletsAttackMeta"] = u14,
    ["GauntletsUtil"] = u15
}