local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.HttpService
local u5 = v3.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-types").CustomKitTypes
local u10 = {
    ["SUPPORTED_PROJECTILE_MODEL"] = {
        v7.ARROW,
        v7.IRON_ARROW,
        v7.FIREWORK_ARROW,
        v7.VOLLEY_ARROW,
        v7.ROCKET_LAUNCHER_MISSILE,
        v7.IMPULSE_GRENADE,
        v7.STUN_GRENADE,
        v7.HOT_POTATO,
        v7.BANANA_PEEL,
        v7.SPEAR,
        v7.SNOWBALL,
        v7.BLACKHOLE_BOMB,
        v7.THROWING_KNIFE,
        v7.CARROT_ROCKET,
        v7.BOBA_PEARL,
        v7.DETONATED_BOMB,
        v7.DIZZY_TOAD,
        v7.TENNIS_BALL,
        v7.SAND_SPEAR,
        v7.GHOST_ORB,
        v7.NINJA_CHAKRAM_1,
        v7.NINJA_CHAKRAM_2,
        v7.NINJA_CHAKRAM_3,
        v7.NINJA_CHAKRAM_4,
        v7.BANANARANG,
        v7.DISCO_GRENADE
    }
}
local u11 = nil
local u12 = nil
function u10.getTotalKitCost(p13) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
    --]]
    local v14 = 0 + u11(p13)
    local v15 = v14
    for v16, v17 in p13.abilities do
        local _ = v16 - 1
        v14 = v15 + u12(v17)
        v15 = v14
    end
    return v15
end
u11 = function(p18) --[[ Name: getTotalKitStatCost, Line 33 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local u19 = 0
    local v20 = p18.stats
    local function v27(p21, p22) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u19
        --]]
        local v23 = u8.StatCostsAndValues[p22]
        if v23 then
            local v24 = nil
            for v25, v26 in v23 do
                local _ = v25 - 1
                if v26.level == p21 == true then
                    v24 = v26
                    break
                end
            end
            if v24 then
                u19 = u19 + v24.cost
            end
        end
    end
    local v28 = u19
    for v29, v30 in v20 do
        v27(v30, v29, v20)
    end
    return v28
end
u10.getTotalKitStatCost = u11
function u10.getRemainingKitPoints(p31) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
    --]]
    return u8.MaxKitPoints - u10.getTotalKitCost(p31)
end
function u10.isMaxStatLevel(p32, p33) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10.getStatCost(p32, p33 + 1) == nil
end
function u10.isMinStatLevel(p34, p35) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10.getStatCost(p34, p35 - 1) == nil
end
function u10.canDecreaseStat(_, p36, p37) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10.getStatCost(p36, p37 - 1) ~= nil
end
function u10.canIncreaseStat(p38, p39, p40) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v41 = u10.getStatCost(p39, p40 + 1)
    if v41 == nil then
        return false
    end
    local v42 = u10.getRemainingKitPoints(p38)
    local v43 = u10.getStatCost(p39, p40)
    return v42 + (v43 == nil and 0 or v43) >= v41
end
function u10.isMaxAbilityPropertyLevel(p44, p45) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v46 = u10.getAbilityPropertyLevel(p44, p45)
    local v47 = v46 == nil and 0 or v46
    return u10.getAbilityPropertyCost(p44, p45, v47 + 1) == nil
end
function u10.isMinAbilityPropertyLevel(p48, p49) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v50 = u10.getAbilityPropertyLevel(p48, p49)
    local v51 = v50 == nil and 0 or v50
    return u10.getAbilityPropertyCost(p48, p49, v51 - 1) == nil
end
function u10.canIncreaseAbilityProperty(p52, p53, p54) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v55 = u10.getAbilityPropertyLevel(p53, p54)
    local v56 = v55 == nil and 0 or v55
    local v57 = u10.getAbilityPropertyCost(p53, p54, v56)
    local v58 = u10.getAbilityPropertyCost(p53, p54, v56 + 1)
    if v58 == nil then
        return false
    else
        return u10.getRemainingKitPoints(p52) + (v57 == nil and 0 or v57) >= v58
    end
end
function u10.canDecreaseAbilityProperty(_, p59, p60) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v61 = u10.getAbilityPropertyLevel(p59, p60)
    local v62 = v61 == nil and 0 or v61
    return u10.getAbilityPropertyCost(p59, p60, v62 - 1) ~= nil
end
function u10.isKitValid(p63) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u8
    --]]
    local v64 = u10.getTotalKitCost(p63) <= u8.MaxKitPoints
    local v65 = true
    for v66, v67 in p63.abilities do
        local _ = v66 - 1
        if not u10.isAbilityValid(v67) then
            v65 = false
            break
        end
    end
    return v64 and v65
end
local u68 = nil
u12 = function(p69) --[[ Name: getTotalAbilityCost, Line 181 ]]
    --[[
    Upvalues:
        [1] = u68
        [2] = u9
    --]]
    local v70 = u68(p69, u9.AbilityPropertyKey.COOLDOWN)
    local v71 = 0 + (v70 == nil and 0 or v70)
    local v72
    if p69.targetTeam == u9.TargetTeam.ALLY then
        v72 = u9.AbilityPropertyKey.HEAL_POTENCY
    else
        v72 = u9.AbilityPropertyKey.DAMAGE_POTENCY
    end
    local v73 = u68(p69, v72)
    local v74 = v71 + (v73 == nil and 0 or v73)
    local v75 = u68(p69, u9.AbilityPropertyKey.TARGET_TYPE)
    local v76 = v74 + (v75 == nil and 0 or v75)
    local v77 = u68(p69, u9.AbilityPropertyKey.TARGET_TEAM)
    local v78 = v76 + (v77 == nil and 0 or v77)
    if p69.targetType == u9.TargetType.PROJECTILE then
        local v79 = u68(p69, u9.AbilityPropertyKey.PROJECTILE_SPEED)
        local v80 = v78 + (v79 == nil and 0 or v79)
        local v81 = u68(p69, u9.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS)
        v78 = v80 + (v81 == nil and 0 or v81)
    elseif p69.targetType == u9.TargetType.AOE then
        local v82 = u68(p69, u9.AbilityPropertyKey.AOE_RADIUS)
        v78 = v78 + (v82 == nil and 0 or v82)
    elseif p69.targetType == u9.TargetType.AURA then
        local v83 = u68(p69, u9.AbilityPropertyKey.AURA_RADIUS)
        local v84 = v78 + (v83 == nil and 0 or v83)
        local v85 = u68(p69, u9.AbilityPropertyKey.AURA_DURATION)
        v78 = v84 + (v85 == nil and 0 or v85)
    elseif p69.targetType == u9.TargetType.MELEE then
        local v86 = u68(p69, u9.AbilityPropertyKey.AURA_RADIUS)
        v78 = v78 + (v86 == nil and 0 or v86)
    end
    if p69.statusEffect then
        local v87 = u68(p69, u9.AbilityPropertyKey.STATUS_EFFECT)
        local v88 = v78 + (v87 == nil and 0 or v87)
        local v89 = u68(p69, u9.AbilityPropertyKey.STATUS_EFFECT_DURATION)
        v78 = v88 + (v89 == nil and 0 or v89)
    end
    return v78
end
u10.getTotalAbilityCost = u12
function u10.getAbilityPropertyCostsAndValuesArray(p90, p91) --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v92 = u8.AbilityPropertyCostsAndValuesTargetTypeOverrides[p90.targetType]
    if v92 ~= nil then
        v92 = v92[p91]
    end
    if v92 == nil then
        v92 = u8.DefaultAbilityPropertyCostsAndValues[p91]
    end
    return v92
end
local u93 = nil
local function u105(p94, p95, p96) --[[ Line: 287 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u93
        [3] = u9
    --]]
    local v97 = u8.AbilityPropertyCostsAndValuesTargetTypeOverrides[p94.targetType]
    if v97 ~= nil then
        v97 = v97[p95]
    end
    if v97 == nil then
        v97 = u8.DefaultAbilityPropertyCostsAndValues[p95]
    end
    if v97 == nil then
        return nil
    end
    if p96 == nil then
        p96 = u93(p94, p95)
    end
    local v98 = nil
    for v99, v100 in v97 do
        local _ = v99 - 1
        if v100.level == p96 == true then
            v98 = v100
            break
        end
    end
    if not v98 then
        return nil
    end
    if p95 == u9.AbilityPropertyKey.STATUS_EFFECT_DURATION then
        local v101 = p94.statusEffect
        if v101 then
            local v102 = u8.StatusEffectDurationOverrides[v101]
            if v102 ~= nil then
                v102 = nil
                for v103, v104 in v102 do
                    local _ = v103 - 1
                    if v104.level == p94.propertyLevels[p95] == true then
                        v102 = v104
                        break
                    end
                end
                if v102 ~= nil then
                    v102 = v102.value
                end
            end
            if v102 ~= nil then
                v98.value = v102
            end
        end
    end
    return v98
end
u10.getAbilityPropertyCostAndValue = u105
u93 = function(p106, p107) --[[ Name: getAbilityPropertyLevel, Line 346 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v108 = p106.propertyLevels[p107]
    if v108 ~= nil then
        return v108
    end
    local v109 = u8.AbilityPropertyCostsAndValuesTargetTypeOverrides[p106.targetType]
    if v109 ~= nil then
        v109 = v109[p107]
    end
    if v109 == nil then
        v109 = u8.DefaultAbilityPropertyCostsAndValues[p107]
    end
    if v109 == nil then
        return nil
    end
    local v110 = v109[1].level
    p106.propertyLevels[p107] = v110
    return v110
end
u10.getAbilityPropertyLevel = u93
u68 = function(p111, p112, p113) --[[ Name: getAbilityPropertyCost, Line 368 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u93
        [4] = u105
    --]]
    if p112 == u9.AbilityPropertyKey.TARGET_TYPE then
        return u8.TargetTypeCosts[p111.targetType]
    else
        if p113 == nil then
            p113 = u93(p111, p112)
        end
        if p113 == nil then
            return nil
        else
            local v114 = u105(p111, p112, p113)
            if v114 == nil then
                return nil
            else
                return v114.cost
            end
        end
    end
end
u10.getAbilityPropertyCost = u68
local function u122(p115, p116) --[[ Line: 388 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u105
    --]]
    if p116 == u9.AbilityPropertyKey.STATUS_EFFECT_DURATION then
        local v117 = p115.statusEffect
        if v117 then
            local v118 = u8.StatusEffectDurationOverrides[v117]
            if v118 ~= nil then
                v118 = nil
                for v119, v120 in v118 do
                    local _ = v119 - 1
                    if v120.level == p115.propertyLevels[p116] == true then
                        v118 = v120
                        break
                    end
                end
                if v118 ~= nil then
                    v118 = v118.value
                end
            end
            if v118 ~= nil then
                return v118
            end
        end
    end
    local v121 = u105(p115, p116)
    if v121 == nil then
        return nil
    else
        return v121.value
    end
end
u10.getAbilityPropertyValue = u122
function u10.getPotencyType(p123) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p123.targetTeam == u9.TargetTeam.ALLY then
        return u9.AbilityPropertyKey.HEAL_POTENCY
    elseif p123.targetTeam == u9.TargetTeam.ENEMY then
        return u9.AbilityPropertyKey.DAMAGE_POTENCY
    else
        return u9.AbilityPropertyKey.DAMAGE_POTENCY
    end
end
function u10.setAbilityPropertyLevel(p124, p125, p126) --[[ Line: 437 ]]
    p124.propertyLevels[p125] = p126
end
function u10.createAbilityMetaFromCustomAbility(u127) --[[ Line: 444 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u6
        [4] = u5
        [5] = u2
    --]]
    local v128 = {
        ["actionBarName"] = u127.name
    }
    local v129 = {
        ["id"] = u127.id
    }
    local v130 = u10.getAbilityPropertyValue(u127, u9.AbilityPropertyKey.COOLDOWN)
    v129.duration = v130 == nil and 5 or v130
    v128.cooldown = v129
    v128.actionBarDescription = u127.description
    v128.triggerConfig = {
        ["abilityButton"] = {
            ["icon"] = u6.STAR_SOLID
        },
        ["abilityType"] = u127.triggerType,
        ["getExtraData"] = function() --[[ Name: getExtraData, Line 465 ]]
            --[[
            Upvalues:
                [1] = u127
                [2] = u9
                [3] = u5
                [4] = u2
            --]]
            if u127.targetType ~= u9.TargetType.PROJECTILE then
                return nil
            end
            local v131 = u5.CurrentCamera.CFrame.LookVector
            if u2.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
                local v132 = v131.X
                local v133 = v131.Y + 0.3
                local v134 = v131.Z
                v131 = Vector3.new(v132, v133, v134)
            end
            return {
                ["direction"] = v131
            }
        end
    }
    v128.isCustom = true
    return v128
end
function u10.isAbilityValid(p135) --[[ Line: 482 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if p135.color == nil then
        p135.color = {
            ["r"] = 201,
            ["g"] = 74,
            ["b"] = 74
        }
    end
    local v136 = p135.statusEffect
    if v136 then
        if p135.targetTeam == u9.TargetTeam.ALLY then
            local v137 = u9.AllyStatusEffects
            local _ = (table.find(v137, v136) or 0) - 1 == -1
        else
            local v138 = u9.EnemyStatusEffects
            local _ = (table.find(v138, v136) or 0) - 1 == -1
        end
    end
    return true
end
local function u140() --[[ Line: 516 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
    --]]
    local v139 = {
        ["name"] = "New Kit",
        ["id"] = u4:GenerateGUID(),
        ["stats"] = {
            [u9.Stat.HEALTH] = 1,
            [u9.Stat.MELEE_DAMAGE] = 1,
            [u9.Stat.RANGED_DAMAGE] = 1,
            [u9.Stat.DEFENSE] = 1
        },
        ["abilities"] = {}
    }
    return v139
end
u10.getNewKit = u140
function u10.getAbilityInSlot(p141, p142) --[[ Line: 530 ]]
    if p142 < 0 or #p141.abilities <= p142 then
        return nil
    else
        return p141.abilities[p142 + 1]
    end
end
function u10.getStatName(p143) --[[ Line: 537 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return p143 == u9.Stat.HEALTH and "Health" or (p143 == u9.Stat.MELEE_DAMAGE and "Melee Damage" or (p143 == u9.Stat.RANGED_DAMAGE and "Ranged Damage" or (p143 == u9.Stat.DEFENSE and "Defense" or (p143 == u9.Stat.SPEED and "Speed" or (p143 == u9.Stat.KNOCKBACK_RESISTANCE and "Knockback Resistance" or "Unknown Stat")))))
end
local u144 = nil
function u10.getStatEffectDescription(p145, p146) --[[ Line: 562 ]]
    --[[
    Upvalues:
        [1] = u144
        [2] = u9
        [3] = u8
    --]]
    local v147 = u144(p145, p146)
    if p145 == u9.Stat.HEALTH then
        local v148 = u8.DefaultMaxHealth + (v147 == nil and 0 or v147)
        return tostring(v148) .. " Max Health"
    end
    if p145 == u9.Stat.MELEE_DAMAGE then
        local v149 = string
        local v150 = v147 == nil and 0 or v147
        return v149.format("%.2f", v150) .. "x Multiplier"
    end
    if p145 == u9.Stat.RANGED_DAMAGE then
        local v151 = string
        local v152 = v147 == nil and 0 or v147
        return v151.format("%.2f", v152) .. "x Multiplier"
    end
    if p145 == u9.Stat.DEFENSE then
        local v153 = string
        local v154 = v147 == nil and 0 or v147
        return v153.format("%.2f", 1 + v154) .. "x Multiplier"
    end
    if p145 == u9.Stat.SPEED then
        local v155 = string
        local v156 = v147 == nil and 0 or v147
        return v155.format("%.2f", v156) .. "x Multiplier"
    end
    if p145 ~= u9.Stat.KNOCKBACK_RESISTANCE then
        return tostring(v147)
    end
    local v157 = string
    local v158 = v147 == nil and 0 or v147
    return v157.format("%.2f", v158) .. "x Multiplier"
end
function u10.getKitStatValue(p159, p160) --[[ Line: 617 ]]
    --[[
    Upvalues:
        [1] = u144
    --]]
    local v161 = p159.stats[p160]
    if v161 == nil then
        return nil
    else
        return u144(p160, v161)
    end
end
u144 = function(p162, p163) --[[ Name: getStatValue, Line 627 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v164 = u8.StatCostsAndValues[p162]
    if v164 ~= nil then
        v164 = nil
        for v165, v166 in v164 do
            local _ = v165 - 1
            if v166.level == p163 == true then
                v164 = v166
                break
            end
        end
    end
    if v164 then
        return v164.value
    else
        return nil
    end
end
u10.getStatValue = u144
function u10.getStatCost(p167, p168) --[[ Line: 650 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v169 = u8.StatCostsAndValues[p167]
    if v169 ~= nil then
        v169 = nil
        for v170, v171 in v169 do
            local _ = v170 - 1
            if v171.level == p168 == true then
                v169 = v171
                break
            end
        end
    end
    if v169 then
        return v169.cost
    else
        return nil
    end
end
local function u173() --[[ Line: 673 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
    --]]
    local v172 = {
        ["name"] = "New Ability",
        ["description"] = "",
        ["triggerType"] = "KitPrimary",
        ["id"] = u4:GenerateGUID(),
        ["targetType"] = u9.TargetType.SELF,
        ["targetTeam"] = u9.TargetTeam.ALLY,
        ["color"] = {
            ["r"] = 201,
            ["g"] = 74,
            ["b"] = 74
        },
        ["propertyLevels"] = {
            [u9.AbilityPropertyKey.COOLDOWN] = 1
        }
    }
    return v172
end
u10.getNewAbility = u173
function u10.getProjectileOverrides(_) --[[ Line: 692 ]]
    return nil
end
function u10.getNameForAbilityProperty(p174) --[[ Line: 696 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    return p174 == u9.AbilityPropertyKey.COOLDOWN and "Cooldown" or (p174 == u9.AbilityPropertyKey.DAMAGE_POTENCY and "Damage Potency" or (p174 == u9.AbilityPropertyKey.HEAL_POTENCY and "Heal Potency" or (p174 == u9.AbilityPropertyKey.PROJECTILE_SPEED and "Projectile Speed" or (p174 == u9.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS and "Projectile Hit Radius" or (p174 == u9.AbilityPropertyKey.AOE_RADIUS and "AOE Radius" or (p174 == u9.AbilityPropertyKey.AURA_RADIUS and "Aura Radius" or (p174 == u9.AbilityPropertyKey.AURA_DURATION and "Aura Duration" or (p174 == u9.AbilityPropertyKey.STATUS_EFFECT_DURATION and "Status Effect Duration" or "Unknown Property"))))))))
end
function u10.getAbilityPropertyEffectDescription(p175, p176) --[[ Line: 729 ]]
    --[[
    Upvalues:
        [1] = u122
        [2] = u9
    --]]
    local v177 = u122(p175, p176)
    if p176 == u9.AbilityPropertyKey.COOLDOWN then
        return tostring(v177) .. "s"
    elseif p176 == u9.AbilityPropertyKey.DAMAGE_POTENCY then
        return tostring(v177) .. " damage"
    elseif p176 == u9.AbilityPropertyKey.HEAL_POTENCY then
        return "Heal " .. tostring(v177) .. " HP"
    elseif p176 == u9.AbilityPropertyKey.PROJECTILE_SPEED then
        return tostring(v177) .. " studs per second"
    elseif p176 == u9.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS then
        return tostring(v177) .. " studs"
    elseif p176 == u9.AbilityPropertyKey.AOE_RADIUS then
        return tostring(v177) .. " studs"
    elseif p176 == u9.AbilityPropertyKey.AURA_RADIUS then
        return tostring(v177) .. " studs"
    elseif p176 == u9.AbilityPropertyKey.AURA_DURATION then
        return tostring(v177) .. "s"
    elseif p176 == u9.AbilityPropertyKey.STATUS_EFFECT_DURATION then
        return tostring(v177) .. "s"
    else
        return tostring(v177)
    end
end
function u10.getAbilityPropertyDropdownItems(p178, p179) --[[ Line: 763 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
    --]]
    if p179 ~= u9.AbilityPropertyKey.TARGET_TYPE then
        if p179 == u9.AbilityPropertyKey.TARGET_TEAM then
            return {
                {
                    ["text"] = "Enemy",
                    ["value"] = u9.TargetTeam.ENEMY
                },
                {
                    ["text"] = "Ally",
                    ["value"] = u9.TargetTeam.ALLY
                }
            }
        end
        if p179 == u9.AbilityPropertyKey.STATUS_EFFECT then
            if p178.targetTeam == u9.TargetTeam.ALLY then
                local v180 = u9.AllyStatusEffects
                local v181 = table.create(#v180)
                for v182, v183 in v180 do
                    local _ = v182 - 1
                    local v184 = {}
                    local v185 = u8.StatusEffectNames[v183]
                    if v185 == nil then
                        local v186 = u8.StatusEffectCost
                        v185 = v183 .. " (" .. tostring(v186) .. " points)"
                    end
                    v184.text = v185
                    v184.value = v183
                    v181[v182] = v184
                end
                return v181
            end
            if p178.targetTeam == u9.TargetTeam.ENEMY then
                local v187 = u9.EnemyStatusEffects
                local v188 = table.create(#v187)
                for v189, v190 in v187 do
                    local _ = v189 - 1
                    local v191 = {}
                    local v192 = u8.StatusEffectNames[v190]
                    if v192 == nil then
                        local v193 = u8.StatusEffectCost
                        v192 = v190 .. " (" .. tostring(v193) .. " points)"
                    end
                    v191.text = v192
                    v191.value = v190
                    v188[v189] = v191
                end
                return v188
            end
        end
        return {}
    end
    local v194 = {}
    local v195 = u8.TargetTypeCosts[u9.TargetType.SELF]
    v194.text = "Self (" .. tostring(v195) .. " points)"
    v194.value = u9.TargetType.SELF
    local v196 = {}
    local v197 = u8.TargetTypeCosts[u9.TargetType.PROJECTILE]
    v196.text = "Projectile (" .. tostring(v197) .. " points)"
    v196.value = u9.TargetType.PROJECTILE
    local v198 = {}
    local v199 = u8.TargetTypeCosts[u9.TargetType.AOE]
    v198.text = "Burst AOE (" .. tostring(v199) .. " points)"
    v198.value = u9.TargetType.AOE
    local v200 = {}
    local v201 = u8.TargetTypeCosts[u9.TargetType.AURA]
    v200.text = "Aura (" .. tostring(v201) .. " points)"
    v200.value = u9.TargetType.AURA
    return {
        v194,
        v196,
        v198,
        v200
    }
end
function u10.getStatusEffectFromCustomStatusEffectType(p202) --[[ Line: 849 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8.CustomStatusEffectToActualStatusEffectMap[p202]
end
function u10.getAbilityColor(p203) --[[ Line: 855 ]]
    return Color3.fromRGB(p203.color.r, p203.color.g, p203.color.b)
end
function u10.getDebugKit() --[[ Line: 859 ]]
    --[[
    Upvalues:
        [1] = u140
        [2] = u173
        [3] = u9
    --]]
    local v204 = u140()
    local v205 = u173()
    local v206 = v204.abilities
    table.insert(v206, v205)
    v205.statusEffect = u9.StatusEffectType.SHIELD
    local v207 = u9.AbilityPropertyKey.COOLDOWN
    v205.propertyLevels[v207] = 5
    v204.stats[u9.Stat.HEALTH] = 5
    return v204
end
return {
    ["CustomKitUtil"] = u10
}