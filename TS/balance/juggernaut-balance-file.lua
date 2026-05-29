local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "JuggernautUtil"
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
function u4.getSwordAnimationImpactTime(_, p7) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.SWORD_ANIMATION_IMPACT_TIMES[p7 % #u4.SWORD_ANIMATION_IMPACT_TIMES + 1]
end
function u4.updateSwingCount(p8, p9) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v10 = p9:getInstance():GetAttribute("LastSwingTime")
    if (v10 == nil and 0 or v10) + p8.BASIC_ATTACK_RESET_TIME < u2:GetServerTimeNow() then
        p9:getInstance():SetAttribute("RageBladeCount", 0)
    end
    p9:getInstance():SetAttribute("LastSwingTime", u2:GetServerTimeNow())
    local v11 = p9:getInstance():GetAttribute("RageBladeCount")
    return v11 == nil and 0 or v11
end
function u4.isSwinging(p12, p13) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v14 = p13:getInstance():GetAttribute("LastSwingTime")
    local v15 = v14 == nil and 0 or v14
    return u2:GetServerTimeNow() <= v15 + p12.BASIC_ATTACK_RESET_TIME
end
u4.Items = {
    {
        ["amount"] = 24,
        ["itemType"] = v3.ARROW
    },
    {
        ["amount"] = 1,
        ["itemType"] = v3.STONE_SWORD
    },
    {
        ["amount"] = 3,
        ["itemType"] = v3.FIREBALL
    },
    {
        ["amount"] = 1,
        ["itemType"] = v3.LEATHER_BOOTS
    },
    {
        ["amount"] = 1,
        ["itemType"] = v3.LEATHER_HELMET
    },
    {
        ["amount"] = 1,
        ["itemType"] = v3.LEATHER_CHESTPLATE
    },
    {
        ["amount"] = 1,
        ["itemType"] = v3.WOOD_BOW
    }
}
u4.JUGG_HP = 400
u4.JUGG_HP_IN_LB = 500
u4.EXPLOSION_ABILITY_KILL_REQ = 5
u4.EXPLOSION_RADIUS = 30
u4.EXPLOSION_DAMAGE = 30
u4.WIN_KILL_COUNT = 20
u4.SPIN_DAMAGE = 15
u4.SPIN_RADIUS = 15
u4.SPIN_DURATION = 5
u4.SPIN_COUNT = 10
u4.SPIN_COOLDOWN = 10
u4.DASH_LANDING_DAMAGE = 30
u4.DASH_COOLDOWN = 5
u4.ULT_DURATION_PER_TARGET = 0.2
u4.ULT_COOLDOWN = 25
u4.JUGGERNAUT_SWORD_COOLDOWN = 0.55
u4.BASIC_ATTACK_RESET_TIME = 1
u4.SWORD_ANIMATION_IMPACT_TIMES = { 0.21666666666666667, 0.26666666666666666, 0.4666666666666667 }
return {
    ["JuggernautUtil"] = u4
}