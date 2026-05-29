local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local v3 = v2.RunService
local u4 = v2.Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-util").getConfig
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "taliyah", "combat-chicken-tier").CombatChickenTier
local u9 = {
    [v8.LEATHER] = {
        ["chickenDamage"] = 8,
        ["twinsChance"] = 0.02
    },
    [v8.IRON] = {
        ["chickenDamage"] = 9,
        ["twinsChance"] = 0.05
    },
    [v8.DIAMOND] = {
        ["chickenDamage"] = 11,
        ["twinsChance"] = 0.2
    },
    [v8.EMERALD] = {
        ["chickenDamage"] = 13,
        ["twinsChance"] = 0.35
    },
    [v8.VOID] = {
        ["chickenDamage"] = 16,
        ["twinsChance"] = 0.5
    }
}
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "TaliyahUtil"
    end
})
u10.__index = u10
function u10.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(_) --[[ Line: 44 ]] end
function u10.getPrice(_) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
    --]]
    local v13 = {}
    local v14 = u4:GetAttribute("ChickenPrice")
    v13.price = v14 == nil and 35 or v14
    v13.currency = u4:GetAttribute("ChickenCurrency") or u7.IRON
    return v13
end
function u10.updatePrice(p15) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    local v16 = math.random(-p15.basePriceIndex / 2, p15.maxIndex)
    local v17 = p15.basePriceIndex + v16
    local v18 = u7.IRON
    local v19 = math.random()
    if v17 >= 100 and v19 > 0.1 then
        v18 = u7.EMERALD
        local v20 = v17 / 100
        v17 = math.floor(v20)
    end
    p15.currentPrice = v17
    u4:SetAttribute("ChickenCurrency", v18)
    u4:SetAttribute("ChickenPrice", v17)
    return v17
end
function u10.updateIndex(p21) --[[ Line: 72 ]]
    p21.basePriceIndex = p21.basePriceIndex + 10
    p21.maxIndex = p21.maxIndex + 43
    local v22 = p21.maxIndex
    p21.maxIndex = math.min(v22, 1200)
end
function u10.getChickenDamage(_, p23) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9[p23].chickenDamage
end
function u10.getChickenHp(p24) --[[ Line: 80 ]]
    return p24.CHICKEN_BASE_HP
end
function u10.getMaxChickenCount(p25) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    return u6(u5.DisablePlacementLimits) and 99999 or p25.DEFAULT_MAX_CHICKEN
end
function u10.getChickenLifeTime(p26) --[[ Line: 86 ]]
    return p26.CHICKEN_BASE_LIFETIME
end
function u10.getTwinChance(_, p27) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return u9[p27].twinsChance
end
u10.currentPrice = 1
u10.basePriceIndex = 20
u10.maxIndex = 30
u10.CHICKEN_BASE_LIFETIME = 75
u10.CHICKEN_BASE_HP = 70
u10.CHICKEN_MIN_DAMAGE = u9[v8.LEATHER].chickenDamage
u10.CHICKEN_MAX_DAMAGE = u9[v8.VOID].chickenDamage
u10.DEFAULT_MAX_CHICKEN = 3
u10.EGG_HARVEST_TIME = v3:IsStudio() and 10 or math.random() * 15 + 52.5
return {
    ["CHICKEN_RANK"] = u9,
    ["TaliyahUtil"] = u10
}