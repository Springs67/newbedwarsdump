local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").ProjectileImpactZap
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-types").LassoUpgradeType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-util").LassoWarsUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "lasso", "lasso-util").LassoUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "LassoController"
    end,
    ["__index"] = u8
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24, ...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.constructor(p24, ...)
    p24.Name = "LassoController"
    p24.stopChargingMaid = u5.new()
end
function u21.KnitStart(p25) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u20
        [4] = u13
        [5] = u6
        [6] = u4
        [7] = u14
        [8] = u3
        [9] = u17
        [10] = u18
        [11] = u16
        [12] = u15
        [13] = u2
        [14] = u12
        [15] = u9
    --]]
    u8.KnitStart(p25)
    u7.ProjectileLaunched:connect(function(p26) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u13
            [3] = u6
            [4] = u4
            [5] = u14
            [6] = u3
            [7] = u17
            [8] = u18
            [9] = u16
            [10] = u15
            [11] = u7
            [12] = u2
            [13] = u12
        --]]
        if p26:isLocalShooter() and p26.projectileType == "lasso" then
            local v27 = u20.LASSO_THROW
            local v28 = u13:getEntity(u6.LocalPlayer)
            if v28 ~= nil then
                v28 = v28:getInstance()
            end
            if v28 then
                local v29 = u14[u4.Controllers.KitSkinController:getKitSkin(v28)]
                if v29.lassy then
                    v27 = v29.lassy.lassoThrowSound
                end
            end
            u3:playSound(v27)
            local v30 = u17(u18.LASSO).projectileSource.fireDelaySec
            if u16.isInLassoWarsMode() then
                v30 = u16.getModifiedLassoCooldown(0)
                local v31 = u4.Controllers.LassoWarsController:getLassoModifierMapForPlayer(u6.LocalPlayer)
                if v31 ~= nil then
                    v31 = v31[u15.COOLDOWN]
                end
                if v31 then
                    v30 = u16.getModifiedLassoCooldown(v31.level)
                end
            end
            local v32 = u7.ItemCooldownModifierCheck:fire(v30).cooldown
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u12.LASSO_THROW, v32)
        end
    end)
    u9.On(function(_, p33, p34, _, _, p35, _, _) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u20
            [3] = u13
            [4] = u4
            [5] = u14
            [6] = u3
        --]]
        if p34.Name ~= "lasso" then
            return nil
        end
        if p35 == u6.LocalPlayer and p33 == 1 then
            local v36 = u20.LASSO_HIT
            local v37 = u13:getEntity(u6.LocalPlayer)
            if v37 ~= nil then
                v37 = v37:getInstance()
            end
            if v37 then
                local v38 = u14[u4.Controllers.KitSkinController:getKitSkin(v37)]
                if v38.lassy then
                    v36 = v38.lassy.lassoHitSound
                end
            end
            u3:playSound(v36)
        end
    end)
end
function u21.isRelevantItem(_, p39) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    return p39.itemType == u18.LASSO
end
function u21.onEnable(p40, p41, p42) --[[ Line: 105 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u2
        [4] = u12
    --]]
    u8.onEnable(p40, p41, p42)
    p40:setupYield(function() --[[ Line: 107 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u12
        --]]
        local u43 = u5.new()
        u43:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u12.LASSO_THROW))
        return function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u43
            --]]
            u43:DoCleaning()
        end
    end)
end
function u21.onStartCharging(p44) --[[ Line: 115 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u6
        [3] = u10
        [4] = u20
        [5] = u13
        [6] = u4
        [7] = u14
        [8] = u3
    --]]
    local u45 = u11:playAnimation(u6.LocalPlayer, u10.LASSO_CHARGE, {
        ["looped"] = true
    })
    local v46 = u20.LASSO_SWING
    local v47 = u13:getEntity(u6.LocalPlayer)
    if v47 ~= nil then
        v47 = v47:getInstance()
    end
    if v47 then
        local v48 = u14[u4.Controllers.KitSkinController:getKitSkin(v47)]
        if v48.lassy then
            v46 = v48.lassy.lassoSwingSound
        end
    end
    if u45 then
        local u49 = u3:playSound(v46, {
            ["looped"] = true
        })
        p44.stopChargingMaid:GiveTask(function() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u49
            --]]
            return u49:Stop()
        end)
        p44.stopChargingMaid:GiveTask(function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u45
            --]]
            u45:Stop()
        end)
    end
end
function u21.onStopCharging(p50) --[[ Line: 144 ]]
    p50.stopChargingMaid:DoCleaning()
end
function u21.onLaunch(_) --[[ Line: 147 ]]
    return true
end
function u21.onStartReload(_) --[[ Line: 150 ]] end
function u21.getProjectileOverrides(_) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u6
    --]]
    return u19.getProjectileOverrides(u6.LocalPlayer)
end
u4.CreateController(u21.new())
return nil