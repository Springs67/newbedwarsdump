local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = u1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").ItemUpgradeTierAttr
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "magical-girl-scepter", "magical-girl-scepter-util").MagicalGirlScepterUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u20 = u1.import(script, script.Parent, "magical-girl-scepter-progress-bar").MagicalGirlScepterProgressBar
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "MagicalGirlScepterProjectileController"
    end,
    ["__index"] = u11
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
        [1] = u11
        [2] = u6
    --]]
    u11.constructor(p24, ...)
    p24.Name = "MagicalGirlScepterProjectileController"
    p24.Client = {}
    p24.chargeMaid = u6.new()
    p24.overchargeStartTime = 0
end
function u21.KnitStart(p25) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u17
        [4] = u18
    --]]
    u11.KnitStart(p25)
    u4.Controllers.PreloadController:preloadForItemType(u17.HERO_MAGICAL_GIRL_SCEPTER, {
        ["sounds"] = {
            u18.HERO_SCEPTER_SHOT_1,
            u18.HERO_SCEPTER_SHOT_2,
            u18.HERO_SCEPTER_SHOT_3,
            u18.HERO_SCEPTER_SHOT_4,
            u18.HERO_SCEPTER_CHARGE,
            u18.SOLAR_FLARE_AFTERSHOCK_1,
            u18.SOLAR_FLARE_AFTERSHOCK_2,
            u18.SOLAR_FLARE_AFTERSHOCK_3,
            u18.SOLAR_FLARE_AFTERSHOCK_4,
            u18.SOLAR_FLARE_EXPLOSION
        }
    })
    u4.Controllers.PreloadController:preloadForItemType(u17.VILLAIN_MAGICAL_GIRL_SCEPTER, {
        ["sounds"] = {
            u18.VILLAIN_SCEPTER_SHOT_1,
            u18.VILLAIN_SCEPTER_SHOT_2,
            u18.VILLAIN_SCEPTER_SHOT_3,
            u18.VILLAIN_SCEPTER_SHOT_4,
            u18.VILLAIN_SCEPTER_CHARGE,
            u18.LUNAR_VENOM_TICK_1,
            u18.LUNAR_VENOM_TICK_2,
            u18.LUNAR_VENOM_TICK_3,
            u18.LUNAR_VENOM_TICK_4,
            u18.LUNAR_VENOM_INFECTION
        }
    })
end
function u21.getProjectileSource(p26, p27) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v28 = p27.itemType
    if p26:isDoneCharging() then
        local v29 = u16(v28).multiProjectileSource
        if v29 ~= nil then
            v29 = v29.hero_magical_girl_scepter_multi_projectile
        end
        if not v29 then
            v29 = u16(v28).multiProjectileSource
            if v29 ~= nil then
                v29 = v29.villain_magical_girl_scepter_multi_projectile
            end
        end
        return v29
    else
        local v30 = u16(v28).multiProjectileSource
        if v30 ~= nil then
            v30 = v30.hero_magical_girl_scepter_projectile
        end
        if not v30 then
            v30 = u16(v28).multiProjectileSource
            if v30 ~= nil then
                v30 = v30.villain_magical_girl_scepter_projectile
            end
        end
        return v30
    end
end
function u21.isRelevantItem(_, p31) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    return p31.itemType == u17.HERO_MAGICAL_GIRL_SCEPTER and true or p31.itemType == u17.VILLAIN_MAGICAL_GIRL_SCEPTER
end
function u21.onStartCharging(p32) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u2
        [3] = u18
        [4] = u10
    --]]
    local v33
    if p32:getHandItem().itemType == u17.HERO_MAGICAL_GIRL_SCEPTER then
        v33 = u2:playSound(u18.HERO_SCEPTER_CHARGE, {
            ["looped"] = true,
            ["parent"] = u10.LocalPlayer
        })
    else
        v33 = u2:playSound(u18.VILLAIN_SCEPTER_CHARGE, {
            ["looped"] = true,
            ["parent"] = u10.LocalPlayer
        })
    end
    p32.chargeMaid:GiveTask(v33)
    p32.overchargeStartTime = 0
end
function u21.onStopCharging(p34) --[[ Line: 105 ]]
    p34.chargeMaid:DoCleaning()
end
function u21.isDoneCharging(p35) --[[ Line: 108 ]]
    local v36 = p35:getChargeTime()
    local v37
    if v36 == 0 then
        v37 = true
    elseif p35.overchargeStartTime == 0 then
        v37 = false
    else
        v37 = v36 <= tick() - p35.overchargeStartTime
    end
    return v37
end
function u21.onLaunch(p38, u39) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u19
        [3] = u14
        [4] = u6
        [5] = u5
        [6] = u15
        [7] = u1
        [8] = u4
        [9] = u12
        [10] = u13
    --]]
    local v40 = p38:getChargeTime()
    local v41
    if v40 == 0 then
        v41 = true
    elseif p38.overchargeStartTime == 0 then
        v41 = false
    else
        v41 = v40 <= tick() - p38.overchargeStartTime
    end
    local _ = u10.LocalPlayer.Character
    if v41 then
        local u42 = p38:getHandItem()
        local u43 = p38:getProjectileSource(u42)
        local u44 = p38.projectileHandler
        local v45 = u19(u42.tool, u14)
        local v46 = (v45 == 0 or (v45 ~= v45 or not v45)) and 0 or v45
        local u47 = u6.new()
        u47:GiveTask(u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["blockSprint"] = true,
            ["moveSpeedMultiplier"] = u43.walkSpeedMultiplier
        }))
        local v48 = u43.multiShotDelay
        local u49 = (v48 == 0 or (v48 ~= v48 or not v48)) and 0.1 or v48
        local u50
        if v46 == u15.TIERS.EXTRA_PROJECTILES_1 or v46 == u15.TIERS.STACKING_EFFECTS then
            u50 = u15.NUM_BASE_PROJECTILES + u15.NUM_EXTRA_PROJECTILES_1
        elseif v46 == u15.TIERS.EXTRA_PROJECTILES_2 then
            u50 = u15.NUM_BASE_PROJECTILES + u15.NUM_EXTRA_PROJECTILES_2
        else
            u50 = u15.NUM_BASE_PROJECTILES
        end
        u1.Promise.defer(function() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u50
                [2] = u49
                [3] = u39
                [4] = u5
                [5] = u42
                [6] = u44
                [7] = u43
                [8] = u47
            --]]
            local v51 = false
            local v52 = 0
            while true do
                if v51 then
                    v52 = v52 + 1
                else
                    v51 = true
                end
                if v52 >= u50 - 1 then
                    u47:DoCleaning()
                    return
                end
                task.wait(u49)
                if u39() then
                    u5.Controllers.ProjectileController:launchProjectile(u42.itemType, nil, u44, u42.tool, u43)
                end
            end
        end)
    end
    local v53 = u4.Controllers.ViewmodelController:playAnimation(u12.GREAT_HAMMER_SWING_1_FP)
    if v53 ~= nil then
        v53:AdjustSpeed(1.5)
    end
    local v54 = u13:playAnimation(u10.LocalPlayer, u12.GREAT_HAMMER_SWING_1)
    if v54 ~= nil then
        v54:AdjustSpeed(1.5)
    end
end
function u21.onStartReload(_) --[[ Line: 184 ]] end
function u21.getChargeTime(p55) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return not p55:getHandItem() and 0 or u15.MULTI_SHOT_CHARGE_TIME
end
function u21.onMaxCharge(p56) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u20
        [4] = u10
    --]]
    local v57 = p56:getChargeTime()
    if v57 == 0 then
        return nil
    end
    p56.overchargeStartTime = tick()
    local u58 = true
    p56.chargeMaid:GiveTask(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u58
        --]]
        u58 = false
    end)
    task.delay(v57, function() --[[ Line: 203 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u9
        --]]
        if u58 then
            for v59, v60 in u9:GetTagged("projectile-preview-beam") do
                local _ = v59 - 1
                v60.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255))
            end
        end
    end)
    local u61 = u7.mount(u7.createElement("ScreenGui", {}, { u7.createElement(u20, {
            ["title"] = "Solar Flare",
            ["chargeTime"] = v57
        }) }), u10.LocalPlayer:WaitForChild("PlayerGui"), "ChargeMagicalGirlScepter")
    p56.chargeMaid:GiveTask(function() --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u61
        --]]
        u7.unmount(u61)
    end)
end
u4.CreateController(u21.new())
return nil