local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.CollectionService
local u13 = v11.Players
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = u1.import(script, script.Parent.Parent.Parent.Parent, "game", "items", "snowball-launcher", "snowball-launcher-progress-bar").SnowballLauncherProgressBar
local u16 = u1.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "snowball-launcher", "snowball-launcher-util")
local u19 = v18.SNOWBALL_LAUNCHER_CYCLE
local u20 = v18.SnowballLauncherMode
local u21 = v18.SnowballLauncherUtil
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "SnowballLauncherGadgetProjectileController"
    end,
    ["__index"] = u16
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28, ...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u9
    --]]
    u16.constructor(p28, ...)
    p28.Name = "SnowballLauncherGadgetProjectileController"
    p28.Client = {}
    p28.chargeMaid = u9.new()
    p28.overchargeStartTime = 0
    p28.snowballNum = {}
end
function u25.KnitStart(u29) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
        [3] = u21
    --]]
    u16.KnitStart(u29)
    u14.ProjectileLaunched:connect(function(p30) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u21
        --]]
        if p30:isCancelled() then
            return nil
        end
        if p30.projectileType ~= "spread_frozen_snowball" then
            return nil
        end
        if not p30.shooter then
            return nil
        end
        if u29.snowballNum[p30.shooter] == nil then
            u29.snowballNum[p30.shooter] = 0
        end
        local v31 = u29.snowballNum[p30.shooter]
        local v32 = v31 == nil and 0 or v31
        local v33 = u21.getForce(p30.projectile, v32)
        if v33 then
            local v34 = p30.projectile.PrimaryPart
            if v34 ~= nil then
                v34:ApplyImpulse(v33)
            end
        end
        u29.snowballNum[p30.shooter] = u21.getNextNum(v32)
    end)
end
function u25.isRelevantItem(_, p35) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return p35.itemType == u23.SNOWBALL_LAUNCHER
end
function u25.getProjectileSource(p36, _) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u20
    --]]
    local v37 = p36:getCurrentMode()
    if p36:isDoneCharging() then
        return u21.SnowballLauncherProjectile[v37]
    else
        return u21.SnowballLauncherProjectile[u20.BASE]
    end
end
function u25.getAmmoType(_, _) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    return u21.ammoType
end
function u25.onStartCharging(p38) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u4
    --]]
    p38:setAbilityState(u17.SNOWBALL_LAUNCHER_CYCLE, u4.DISABLED)
    p38.overchargeStartTime = 0
end
function u25.onStopCharging(p39) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u4
    --]]
    p39:setAbilityState(u17.SNOWBALL_LAUNCHER_CYCLE, u4.READY)
    p39.chargeMaid:DoCleaning()
end
function u25.onLaunch(p40, u41) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u13
        [3] = u19
        [4] = u21
        [5] = u22
        [6] = u9
        [7] = u7
        [8] = u5
        [9] = u24
        [10] = u1
        [11] = u8
    --]]
    local v42 = p40:getCurrentMode()
    if v42 ~= u20.BASE then
        u13.LocalPlayer:SetAttribute(u19, u21.getNextMode(v42))
    end
    if v42 ~= u20.RAPID and v42 ~= u20.SPREAD then
        return nil
    end
    if p40:isDoneCharging() then
        local u43 = p40:getHandItem()
        local u44 = p40:getAmmoType(u43.itemType)
        local u45
        if u44 then
            local v46 = u22.getToolFromInventory(u13.LocalPlayer, u44)
            if v46 ~= nil then
                v46 = v46.amount
            end
            u45 = (v46 == nil and 0 or v46) - 1
        else
            u45 = 0
        end
        local u47 = p40.projectileHandler
        local u48 = u21.SnowballLauncherProjectile[v42]
        local u49 = u9.new()
        u49:GiveTask(u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["blockSprint"] = true,
            ["moveSpeedMultiplier"] = u48.walkSpeedMultiplier
        }))
        if u48.projectileType(u44) == "spread_frozen_snowball" then
            u5:playSound(u24.SNOWBALL_LAUNCHER_SPREAD_SHOT)
        elseif u48.projectileType(u44) == "rapid_frozen_snowball" then
            u5:playSound(u24.SNOWBALL_LAUNCHER_RAPID_SHOT)
        end
        u1.Promise.defer(function() --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u41
                [3] = u44
                [4] = u45
                [5] = u8
                [6] = u43
                [7] = u47
                [8] = u49
            --]]
            local v50 = u48.multiShotCount
            local v51 = v50 == nil and 3 or v50
            local v52 = u48.multiShotDelay
            local v53 = v52 == nil and 0.1 or v52
            local v54 = false
            local v55 = 0
            while true do
                if v54 then
                    v55 = v55 + 1
                else
                    v54 = true
                end
                if v55 >= v51 - 1 then
                    break
                end
                if v53 ~= 0 then
                    task.wait(v53)
                end
                if u41() then
                    if u44 and u45 <= 0 then
                        break
                    end
                    u45 = u45 - 1
                    u8.Controllers.ProjectileController:launchProjectile(u43.itemType, u44, u47, u43.tool, u48)
                end
            end
            u49:DoCleaning()
        end)
    end
end
function u25.onStartReload(_) --[[ Line: 187 ]] end
function u25.getChargeTime(p56) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v57 = p56:getCurrentMode()
    local v58 = u21.SnowballLauncherProjectile[v57].multiShotChargeTime
    return v58 == nil and 0 or v58
end
function u25.isDoneCharging(p59) --[[ Line: 197 ]]
    local v60 = p59:getChargeTime()
    local v61
    if v60 == 0 then
        v61 = true
    elseif p59.overchargeStartTime == 0 then
        v61 = false
    else
        v61 = v60 <= tick() - p59.overchargeStartTime
    end
    return v61
end
function u25.onMaxCharge(p62) --[[ Line: 201 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u24
        [3] = u12
        [4] = u10
        [5] = u15
        [6] = u21
        [7] = u13
    --]]
    local v63 = p62:getChargeTime()
    if v63 == 0 then
        return nil
    end
    p62.overchargeStartTime = tick()
    u5:playSound(u24.SNOWBALL_LAUNCHER_CHARGE_UP)
    local u64 = true
    p62.chargeMaid:GiveTask(function() --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        u64 = false
    end)
    task.delay(v63, function() --[[ Line: 212 ]]
        --[[
        Upvalues:
            [1] = u64
            [2] = u12
        --]]
        if u64 then
            for v65, v66 in u12:GetTagged("projectile-preview-beam") do
                local _ = v65 - 1
                v66.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255))
            end
        end
    end)
    local u67 = u10.mount(u10.createElement("ScreenGui", {}, { u10.createElement(u15, {
            ["chargeTime"] = v63,
            ["title"] = u21.getTitle(p62:getCurrentMode())
        }) }), u13.LocalPlayer:WaitForChild("PlayerGui"), "ChargeSnowballLauncher")
    p62.chargeMaid:GiveTask(function() --[[ Line: 229 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u67
        --]]
        u10.unmount(u67)
    end)
end
function u25.getCurrentMode(_) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u19
        [3] = u20
    --]]
    local v68 = u13.LocalPlayer:GetAttribute(u19)
    if v68 == nil then
        v68 = u20.POWER
    end
    return v68
end
function u25.setAbilityState(_, p69, p70) --[[ Line: 240 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v71 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(p69)
    if not v71 then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v71, p70)
end
u7.CreateController(u25.new())
return nil