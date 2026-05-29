local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-type").MountType
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "TinkerBalance"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(_) --[[ Line: 17 ]] end
function u4.getMaxShield(p7, p8) --[[ Line: 19 ]]
    local v9 = p8:GetAttribute("TinkerMachineLevel")
    local v10 = v9 == nil and 1 or v9
    local v11 = math.clamp(v10, 1, 5)
    return p7.EXTRA_SHIELD_FROM_LEVEL[v11 - 1 + 1] + p7.BASE_SHIELD
end
function u4.getTinkerModel(p12, p13, p14) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    if p14 then
        local v15 = u2[p14]
        local v16 = v15.tinker
        if v16 ~= nil then
            v16 = v16.models
        end
        if v16 then
            v16 = p13 < #v15.tinker.models
        end
        if v16 then
            return v15.tinker.models[p13 + 1]
        else
            return p12.tiers[p13 + 1]
        end
    else
        return p12.tiers[p13 + 1]
    end
end
u4.BASE_SHIELD = 100
u4.EXTRA_SHIELD_FROM_LEVEL = {
    10,
    80,
    170,
    310,
    500
}
u4.DAMAGE_FOR_LEVEL = {
    25,
    33,
    42,
    54,
    65
}
u4.BASE_EXPLOSION_DAMAGE = 50
u4.MECH_PROJECTILE_REDUCTION = {
    1,
    0.85,
    0.75,
    0.7,
    0.6
}
u4.tiers = {
    v3.TINKER,
    v3.IRON_TINKER,
    v3.DIAMOND_TINKER,
    v3.EMERALD_TINKER,
    v3.VOID_TINKER
}
u4.TIME_TO_SELF_DESTRUCT = 2
u4.SUMMON_DURATION = 2
u4.SUMMON_COOLDOWN = 10
return {
    ["TinkerBalance"] = u4
}