local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.GameQueryUtil
local u7 = v3.MobileTouchType
local u8 = v3.SoundManager
local u9 = v3.WatchCharacter
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u11 = v10.KnitClient
local u12 = v10.KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.Players
local u18 = v16.ReplicatedStorage
local u19 = v16.RunService
local u20 = v16.TweenService
local u21 = v16.UserInputService
local u22 = v16.Workspace
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = v1.import(script, script.Parent.Parent.Parent, "effect", "vignette", "vignette-meta").VignetteType
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u26 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util")
local u33 = v32.FrostyGunMode
local u34 = v32.FrostyStaffUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u42 = v1.import(script, script.Parent, "ui", "circle-progress-bar").FrostedCircleProgressBar
local u43 = v1.import(script, script.Parent, "ui", "frosty-gun-bar-base").FrostyGunUiBase
local u44 = nil
local u45 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 50 ]]
        return "FrostyGunController"
    end,
    ["__index"] = u25
})
u45.__index = u45
function u45.new(...) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u45
    --]]
    local v46 = u45
    local v47 = setmetatable({}, v46)
    return v47:constructor(...) or v47
end
function u45.constructor(p48) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u33
        [3] = u13
        [4] = u5
        [5] = u36
    --]]
    u25.constructor(p48)
    p48.Name = "FrostyGunController"
    p48.projectileMode = u33.MIST
    p48.sprayingSpeedMaid = u13.new()
    p48.sprayerModeMaid = u13.new()
    p48.YTargetOffset = u5.isMobileControls() and 0.25 or 0.05
    p48.userVisualEffectMap = {}
    p48.actionRequest = u36.Client:Get("FrostyGunFireActionRequest")
    p48.abilityUiMaid = u13.new()
    p48.victimMap = {}
    p48.maid = u13.new()
    p48.tickCount = 0
    p48.originalWaistPositions = {}
    p48.spraying = false
end
function u45.isRelevantItem(_, p49) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    return (p49.itemType == u35.FROST_STAFF_3 or p49.itemType == u35.FROST_STAFF_2) and true or p49.itemType == u35.FROST_STAFF_1
end
function u45.KnitStart(u50) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u9
        [3] = u17
        [4] = u23
        [5] = u34
        [6] = u38
        [7] = u11
        [8] = u24
        [9] = u39
        [10] = u41
        [11] = u31
        [12] = u8
        [13] = u37
        [14] = u18
        [15] = u6
        [16] = u22
        [17] = u40
        [18] = u12
        [19] = u28
        [20] = u35
        [21] = u27
        [22] = u33
        [23] = u26
        [24] = u36
        [25] = u44
        [26] = u20
        [27] = u13
        [28] = u14
    --]]
    u25.KnitStart(u50)
    u9(function(p51, p52) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u50
        --]]
        if u17.LocalPlayer == p51 then
            local v53 = p52:WaitForChild("UpperTorso", 3)
            if v53 ~= nil then
                v53 = v53:WaitForChild("Waist", 3)
            end
            if v53 and not u50.originalWaistC0 then
                if v53 ~= nil then
                    v53 = v53.C0
                end
                u50.originalWaistC0 = v53
                return
            end
        else
            local v54 = p52:WaitForChild("UpperTorso", 3)
            if v54 ~= nil then
                v54 = v54:WaitForChild("Waist", 3)
            end
            local v55
            if v54 then
                local v56 = u50.originalWaistPositions[p51] ~= nil
                v55 = not v56
            else
                v55 = v54
            end
            if v55 then
                u50.originalWaistPositions[p51] = v54.C0
            end
        end
    end)
    u23.ProjectileMaxCharged:connect(function(p57) --[[ Line: 117 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u50
        --]]
        if u34:isFrostyStaff(p57.itemType) then
            u50:maxChargeEffect()
        end
    end)
    u23.ProjectileRender:connect(function(p58) --[[ Line: 122 ]]
        if p58.projectile.Name == "frosty_snowball_1" or (p58.projectile.Name == "frosty_snowball_2" or p58.projectile.Name == "frosty_snowball_3") then
            p58.cframe = p58.cframe * CFrame.Angles(0, p58.totalTime * 5 * 3.141592653589793, 0)
        end
    end)
    u23.StatusEffectAdded:connect(function(u59) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u17
            [3] = u11
            [4] = u24
            [5] = u39
            [6] = u41
            [7] = u34
            [8] = u31
            [9] = u50
        --]]
        if u59.statusEffect ~= u38.COLD then
            return nil
        end
        if u59.entityInstance == u17.LocalPlayer.Character then
            local v61 = {
                ["transparencyMultiplier"] = function() --[[ Name: transparencyMultiplier, Line 136 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                        [2] = u59
                        [3] = u38
                        [4] = u41
                        [5] = u34
                    --]]
                    local v60 = u39:getStacks(u59.entityInstance, u38.COLD)
                    return u41.convertRange(v60, { 0, u34.MAX_COLD_STACK }, { 1.5, 1 })
                end
            }
            u11.Controllers.VignetteController:createVignette(u24.COLD, v61)
            return nil
        end
        local v62 = u31:getEntity(u59.entityInstance)
        local v63 = u31:getLocalPlayerEntity()
        if not (v63 and (v62 and v63:canAttack(v62))) then
            return nil
        end
        u50.victimMap[u59.entityInstance] = true
        u50:createSign(u59.entityInstance)
    end)
    u23.StatusEffectRemoved:connect(function(p64) --[[ Line: 154 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u50
            [3] = u17
            [4] = u11
            [5] = u24
        --]]
        if p64.statusEffect ~= u38.COLD then
            return nil
        end
        u50.victimMap[p64.entityInstance] = nil
        u50:removeSign(p64.entityInstance)
        if p64.entityInstance == u17.LocalPlayer.Character then
            u11.Controllers.VignetteController:destroyVignette(u24.COLD)
            if u50.slowedSpeedMaid then
                u50.slowedSpeedMaid:Destroy()
                u50.slowedSpeedMaid = nil
            end
            return nil
        end
    end)
    u23.StatusEffectChanged:connect(function(p65) --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u31
            [3] = u39
            [4] = u34
            [5] = u17
            [6] = u50
            [7] = u11
        --]]
        if p65.statusEffect ~= u38.COLD then
            return nil
        end
        local v66 = u31:getPlayerFromEntityInstance(p65.entityInstance)
        local v67 = u39:getStacks(p65.entityInstance, u38.COLD) / u34.MAX_COLD_STACK * u34.MAX_SLOW
        if u17.LocalPlayer == v66 then
            local v68 = u50.slowedSpeedMaid
            if v68 ~= nil then
                v68:Destroy()
            end
            u50.slowedSpeedMaid = u11.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = false,
                ["moveSpeedMultiplier"] = 1 - v67
            })
        end
    end)
    u23.StatusEffectAdded:connect(function(p69) --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u8
            [3] = u37
        --]]
        if p69.statusEffect ~= u38.FROZEN then
            return nil
        end
        local v70 = p69.entityInstance.PrimaryPart
        if v70 ~= nil then
            v70 = v70.Position
        end
        if v70 then
            u8:playSound(u37.FROST_STAFF_FREEZE, {
                ["position"] = v70
            })
        end
    end)
    u23.StatusEffectRemoved:connect(function(p71) --[[ Line: 209 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u18
            [3] = u6
            [4] = u22
            [5] = u40
            [6] = u8
            [7] = u37
        --]]
        if p71.statusEffect ~= u38.FROZEN then
            return nil
        end
        local v72 = p71.entityInstance.PrimaryPart
        if v72 ~= nil then
            v72 = v72.Position
        end
        if v72 then
            local u73 = u18.Assets.Effects.SmallIceBreakEffect:Clone()
            u73.Position = v72
            u73.Transparency = 1
            u73.CanCollide = false
            u6:setQueryIgnored(u73, true)
            u73.Parent = u22
            u40:playEffects({ u73 }, nil, {
                ["destroyAfterSec"] = 0.75
            })
            task.delay(1, function() --[[ Line: 228 ]]
                --[[
                Upvalues:
                    [1] = u73
                --]]
                u73:Destroy()
            end)
            u8:playSound(u37.WINTER_MINER_ICE_BREAK, {
                ["position"] = v72
            })
        end
    end)
    u12.Controllers.PreloadController:runPreload({
        ["animations"] = { u28.TORNADO_LAUNCHER_HOLD, u28.SPEAR_STAB_1, u28.ICE_MAGE_CHARGE },
        ["sounds"] = {
            u37.FROST_STAFF_FREEZE,
            u37.FROST_STAFF_CHARGE,
            u37.FROST_STAFF_SHOOT,
            u37.FROST_STAFF_LOOP,
            u37.WINTER_MINER_ICE_BREAK
        }
    })
    u23.BeginProjectileTargeting:connect(function(p74) --[[ Line: 267 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u50
        --]]
        if p74.handItem.itemType ~= u35.FROST_STAFF_3 and (p74.handItem.itemType ~= u35.FROST_STAFF_2 and p74.handItem.itemType ~= u35.FROST_STAFF_1) then
            return nil
        end
        local v75 = u50.projectileMode
        if v75 == 0 or (v75 ~= v75 or not v75) then
            p74:setCancelled(true)
        end
    end)
    u23.ProjectileLaunched:connect(function(p76) --[[ Line: 277 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        if p76.projectileType ~= "frosty_snowball_1" and (p76.projectileType ~= "frosty_snowball_2" and p76.projectileType ~= "frosty_snowball_3") then
            return nil
        end
        local v77 = u50.projectileMode
        if v77 == 0 or (v77 ~= v77 or not v77) then
            p76:setCancelled(true)
        end
    end)
    u23.AbilityUsed:connect(function(p78) --[[ Line: 286 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u17
            [3] = u50
            [4] = u33
            [5] = u26
        --]]
        if p78.ability == u27.FROSTY_GUN_SWAP and p78.userCharacter == u17.LocalPlayer.Character then
            if u50.projectileMode == u33.MIST then
                u50.projectileMode = u33.PROJECTILE
                u26:dispatch({
                    ["type"] = "FrostyGunSetMode",
                    ["frostyGunMode"] = u50.projectileMode
                })
                u50:disableSprayerMode()
                return
            end
            u50.projectileMode = u33.MIST
            u50:enableSprayerMode()
            u26:dispatch({
                ["type"] = "FrostyGunSetMode",
                ["frostyGunMode"] = u50.projectileMode
            })
        end
    end)
    u36.Client:Get("FrostyGunFireEffect"):Connect(function(p79) --[[ Line: 306 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u50
            [3] = u31
            [4] = u44
            [5] = u20
        --]]
        if p79.user == u17.LocalPlayer then
            return nil
        end
        local v80 = u50.userVisualEffectMap[p79.user]
        local v81
        if v80 == nil then
            v81 = v80
        else
            v81 = v80.maid
        end
        if not (v81 and v80) then
            return nil
        end
        local v82 = u31:getEntity(p79.user)
        if v82 ~= nil then
            v82 = v82:getHandItemInstanceFromCharacter()
        end
        if v82 ~= nil then
            v82 = v82:WaitForChild("Handle", 1)
            if v82 ~= nil then
                v82 = v82:WaitForChild("EffectParticle", 1)
            end
        end
        if v82 then
            local v83 = p79.user.Character
            local v84
            if v83 == nil then
                v84 = v83
            else
                v84 = v83:FindFirstChild("UpperTorso")
            end
            local v85
            if v84 == nil then
                v85 = v84
            else
                v85 = v84:FindFirstChild("Waist")
            end
            if v84 and v85 then
                local v86, v87 = u44(v83.PrimaryPart.CFrame, p79.targetPoint)
                local v88 = CFrame.new(0, 0, 0) * CFrame.Angles(v86, -3.141592653589793 + v87, 0)
                local v89 = { v85.C0:ToEulerAnglesXYZ() }
                if #v89 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                local v90 = v89[1]
                for v91 = 2, #v89 do
                    local v92 = v89[v91]
                    local _ = v91 - 1
                    v90 = v90 + v92
                end
                local v93 = { v88:ToEulerAnglesXYZ() }
                if #v93 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                local v94 = v93[1]
                for v95 = 2, #v93 do
                    local v96 = v93[v95]
                    local _ = v95 - 1
                    v94 = v94 + v96
                end
                local v97 = v90 - v94
                if math.abs(v97) > 1e-6 and v80.originalWaist then
                    u20:Create(v85, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
                        ["C0"] = v80.originalWaist * v88
                    }):Play()
                end
            end
            v82.WorldCFrame = CFrame.new(v82.WorldPosition, p79.targetPoint)
        end
    end)
    u36.Client:Get("FrostyGunFireAction"):Connect(function(p98) --[[ Line: 391 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u50
            [3] = u13
            [4] = u20
            [5] = u31
            [6] = u14
            [7] = u37
        --]]
        if p98.user == u17.LocalPlayer then
            return nil
        end
        if p98.keyHold then
            local v99 = u50.userVisualEffectMap[p98.user]
            if v99 ~= nil then
                local v100 = v99.maid
                if v100 ~= nil then
                    v100:DoCleaning()
                end
            end
            local v101 = u13.new()
            local u102 = p98.user
            if u102 ~= nil then
                u102 = u102.Character
                if u102 ~= nil then
                    u102 = u102:FindFirstChild("UpperTorso")
                end
            end
            if u102 ~= nil then
                u102 = u102:FindFirstChild("Waist")
            end
            if u102 then
                local u103 = u50.originalWaistPositions[p98.user]
                if u103 == nil then
                    u103 = u102.C0
                end
                v101:GiveTask(function() --[[ Line: 428 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u102
                        [3] = u103
                    --]]
                    local v104 = {
                        ["C0"] = u103
                    }
                    u20:Create(u102, TweenInfo.new(0.085, Enum.EasingStyle.Linear), v104):Play()
                end)
                u50.userVisualEffectMap[p98.user] = {
                    ["maid"] = v101,
                    ["originalWaist"] = u103
                }
            end
            local u105 = u31:getEntity(p98.user)
            if u105 ~= nil then
                u105 = u105:getHandItemInstanceFromCharacter()
            end
            local v106
            if u105 == nil then
                v106 = u105
            else
                v106 = u105:FindFirstChild("Handle")
            end
            if v106 then
                v101:GiveTask((u14("Sound", {
                    ["RollOffMinDistance"] = 20,
                    ["RollOffMaxDistance"] = 40,
                    ["Volume"] = 0.5,
                    ["Playing"] = true,
                    ["Looped"] = true,
                    ["SoundId"] = u37.FROST_STAFF_LOOP,
                    ["Parent"] = v106
                })))
            end
            if u105 ~= nil then
                u105 = u105:WaitForChild("Handle", 1)
                if u105 ~= nil then
                    u105 = u105:WaitForChild("EffectParticle", 1)
                end
            end
            if u105 then
                for v107, v108 in u105:GetChildren() do
                    local _ = v107 - 1
                    if v108:IsA("ParticleEmitter") then
                        v108.Enabled = true
                    end
                end
                v101:GiveTask(function() --[[ Line: 482 ]]
                    --[[
                    Upvalues:
                        [1] = u105
                    --]]
                    for v109, v110 in u105:GetChildren() do
                        local _ = v109 - 1
                        if v110:IsA("ParticleEmitter") then
                            v110.Enabled = false
                        end
                    end
                end)
                return
            end
        else
            local v111 = u50.userVisualEffectMap[p98.user]
            if v111 ~= nil then
                v111.maid:DoCleaning()
            end
            u50.userVisualEffectMap[p98.user] = nil
        end
    end)
end
function u45.onStartCharging(_) --[[ Line: 507 ]] end
function u45.onStopCharging(_) --[[ Line: 509 ]] end
function u45.onLaunch(_, _) --[[ Line: 511 ]] end
function u45.onStartReload(_, _) --[[ Line: 513 ]] end
function u45.onEnable(u112, _, p113) --[[ Line: 515 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u2
        [3] = u30
        [4] = u43
        [5] = u33
    --]]
    u112.stillEnable = p113
    u112:setupYield(function() --[[ Line: 518 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u2
            [3] = u30
            [4] = u112
        --]]
        local u114 = u13.new()
        u114:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u30.TORNADO_LAUNCHER))
        local v116 = {
            ["action"] = "ItemPrimary",
            ["actionId"] = "frosty-gun-swap",
            ["boundFunction"] = function(_, p115, _) --[[ Name: boundFunction, Line 524 ]]
                --[[
                Upvalues:
                    [1] = u112
                --]]
                if p115 == Enum.UserInputState.Begin then
                    u112:swap()
                end
            end
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction(v116)
        return function() --[[ Line: 530 ]]
            --[[
            Upvalues:
                [1] = u114
            --]]
            u114:DoCleaning()
        end
    end)
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        ["appId"] = "FrostyGunBar",
        ["app"] = u43
    }, {
        ["ChangeAbility"] = function(_) --[[ Name: ChangeAbility, Line 538 ]]
            --[[
            Upvalues:
                [1] = u112
            --]]
            return u112:swap()
        end,
        ["Modes"] = { u33.MIST, u33.PROJECTILE }
    })
    u112.abilityUiMaid:GiveTask(function() --[[ Line: 543 ]]
        --[[
        Upvalues:
            [1] = u2
        --]]
        return u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("FrostyGunBar")
    end)
    if u112.projectileMode == u33.MIST then
        u112:enableSprayerMode()
    else
        u112:disableSprayerMode()
    end
    u112:enableStacksIndicator()
    u112.maid:GiveTask(u112.sprayerModeMaid)
    u112.maid:GiveTask(u112.sprayingSpeedMaid)
end
function u45.onDisable(u117) --[[ Line: 555 ]]
    u117:setupYield(function() --[[ Line: 556 ]]
        --[[
        Upvalues:
            [1] = u117
        --]]
        u117:cleanUp()
        return function() --[[ Line: 558 ]] end
    end)
    u117.stillEnable = nil
    u117:clearIndicators()
    u117.abilityUiMaid:DoCleaning()
end
function u45.beginSprayHolding(u118, p119) --[[ Line: 571 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u17
        [3] = u12
        [4] = u4
        [5] = u29
        [6] = u28
        [7] = u31
        [8] = u14
        [9] = u37
        [10] = u34
        [11] = u23
        [12] = u11
        [13] = u22
    --]]
    if u118.spraying then
        return nil
    end
    u118.spraying = true
    u36.Client:Get("FrostyGunFireActionRequest"):SendToServer({
        ["keyHold"] = true
    })
    local v120 = u17.LocalPlayer.Character
    if v120 ~= nil then
        v120 = v120:FindFirstChild("UpperTorso")
    end
    if v120 ~= nil then
        v120 = v120:FindFirstChild("Waist")
    end
    u118.sprayingSpeedMaid:GiveTask(u12.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 0.5,
        ["blockSprint"] = true
    }))
    local u121 = u4:playAnimation(u17.LocalPlayer, u29:getAssetId(u28.TORNADO_LAUNCHER_HOLD))
    local v122 = u31:getEntity(u17.LocalPlayer)
    if v122 ~= nil then
        v122 = v122:getHandItemInstanceFromCharacter()
    end
    local v123
    if v122 == nil then
        v123 = v122
    else
        v123 = v122:FindFirstChild("Handle")
    end
    if v123 then
        local v124 = u14("Sound", {
            ["RollOffMinDistance"] = 20,
            ["RollOffMaxDistance"] = 40,
            ["Volume"] = 0.5,
            ["Playing"] = true,
            ["Looped"] = true,
            ["SoundId"] = u37.FROST_STAFF_LOOP,
            ["Parent"] = v123
        })
        u118.sprayingSpeedMaid:GiveTask(v124)
    end
    local u125
    if v122 == nil then
        u125 = v122
    else
        u125 = v122:WaitForChild("Handle", 1)
        if u125 ~= nil then
            u125 = u125:WaitForChild("EffectParticle", 1)
        end
    end
    if u125 then
        for v126, v127 in u125:GetChildren() do
            local _ = v126 - 1
            if v127:IsA("ParticleEmitter") then
                v127.Enabled = true
            end
        end
        u118.sprayingSpeedMaid:GiveTask(function() --[[ Line: 640 ]]
            --[[
            Upvalues:
                [1] = u125
            --]]
            for v128, v129 in u125:GetChildren() do
                local _ = v128 - 1
                if v129:IsA("ParticleEmitter") then
                    v129.Enabled = false
                end
            end
        end)
    end
    u118:hookAimDirection(p119)
    local v130 = not v122 and 0.25 or u34:getWeaponMistDamageCooldown(v122.Name)
    local u131 = u23.AbilityTickDelayModifierCheck:fire(v130).tickDelay
    u118.sprayingSpeedMaid:GiveTask(task.spawn(function() --[[ Line: 657 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u118
            [3] = u36
            [4] = u131
        --]]
        while true do
            local v132 = u17.LocalPlayer.Character
            if v132 ~= nil then
                v132 = v132.PrimaryPart
                if v132 ~= nil then
                    v132 = v132.Position
                end
            end
            local v133 = u118:getDirection()
            if v132 then
                u36.Client:Get("FrostyGunFire"):SendToServer({
                    ["userPosition"] = v132,
                    ["direction"] = v133
                })
                local v134 = u118
                v134.tickCount = v134.tickCount + 1
            end
            local v135 = task.wait(u131 + 0.02)
            if v135 == 0 or (v135 ~= v135 or not v135) then
                return
            end
        end
    end))
    u118.sprayingSpeedMaid:GiveTask(function() --[[ Line: 680 ]]
        --[[
        Upvalues:
            [1] = u121
        --]]
        local v136 = u121
        if v136 ~= nil then
            v136:Stop()
        end
        local v137 = u121
        if v137 ~= nil then
            v137:Destroy()
        end
    end)
    local u138 = u11.Controllers.ViewmodelController:getFirstPersonHandItem()
    if u138 ~= nil then
        u138 = u138:WaitForChild("Handle", 1)
        if u138 ~= nil then
            u138 = u138:WaitForChild("EffectParticle", 1)
        end
    end
    if u138 then
        local v139 = u22.CurrentCamera
        if v139 ~= nil then
            v139 = v139.CFrame.LookVector
        end
        if v139 then
            local _ = (u17.LocalPlayer.Character:GetPrimaryPartCFrame().Position + v139) * 15
        end
        for v140, v141 in u138:GetChildren() do
            local _ = v140 - 1
            if v141:IsA("ParticleEmitter") then
                v141.Enabled = true
            end
        end
        u118.sprayingSpeedMaid:GiveTask(function() --[[ Line: 722 ]]
            --[[
            Upvalues:
                [1] = u138
            --]]
            for v142, v143 in u138:GetChildren() do
                local _ = v142 - 1
                if v143:IsA("ParticleEmitter") then
                    v143.Enabled = false
                end
            end
        end)
    end
end
function u45.cleanUp(p144) --[[ Line: 735 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u30
        [4] = u17
        [5] = u20
    --]]
    p144.spraying = false
    p144.sprayingSpeedMaid:DoCleaning()
    pcall(function() --[[ Line: 738 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        return u19:UnbindFromRenderStep("frost-staff-mobile-confirm")
    end)
    if p144.tickCount > 0 then
        local v145 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
        local v146 = u30.FROSTY_GUN
        local v147 = {
            ["cooldownBar"] = {
                ["color"] = Color3.new(0.92, 0.22, 0.18)
            }
        }
        v145:setOnCooldown(v146, 0.5, v147)
    end
    p144.tickCount = 0
    local v148 = u17.LocalPlayer.Character
    if not v148 then
        return nil
    end
    local v149 = v148:FindFirstChild("UpperTorso")
    if not v149 then
        return nil
    end
    local v150 = v149:FindFirstChild("Waist")
    p144.actionRequest:SendToServer({
        ["keyHold"] = false
    })
    if v150 and p144.originalWaistC0 then
        u20:Create(v150, TweenInfo.new(0.085, Enum.EasingStyle.Linear), {
            ["C0"] = p144.originalWaistC0
        }):Play()
    end
end
function u45.getDirection(p151, p152) --[[ Line: 768 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u17
        [3] = u11
    --]]
    local v153 = u22.CurrentCamera.CFrame.LookVector
    local v154 = u17.LocalPlayer.Character
    if v154 ~= nil then
        v154 = v154.PrimaryPart
        if v154 ~= nil then
            v154 = v154.Position
        end
    end
    if v154 then
        if u11.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and v153 then
            return v153
        else
            local v155 = u17.LocalPlayer:GetMouse()
            local v156 = Vector2.new(v155.X, v155.Y)
            if p152 and u22.CurrentCamera then
                v156 = u22.CurrentCamera.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2)
            end
            local v157 = u22.CurrentCamera.CFrame
            local v158 = u22.CurrentCamera:ScreenPointToRay(v156.X, v156.Y).Unit.Direction
            local v159 = p151.YTargetOffset
            local v160 = (v158 + Vector3.new(0, v159, 0)).Unit
            local v161 = v157.Position + v160 * ((v157.Position - v154).Magnitude * 10)
            local v162 = (v161 - v154).Unit
            local v163 = u17.LocalPlayer.Character
            if v163 ~= nil then
                v163 = v163.PrimaryPart
                if v163 ~= nil then
                    v163 = v163.CFrame.LookVector
                end
            end
            if v163 and not p151:isInFront(v161, v163, v154) then
                return v163
            else
                return v162
            end
        end
    else
        return v153
    end
end
function u45.hookAimDirection(u164, u165) --[[ Line: 818 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u17
        [3] = u19
        [4] = u22
        [5] = u44
        [6] = u20
    --]]
    local u166 = u31:getEntity(u17.LocalPlayer)
    if u166 ~= nil then
        u166 = u166:getHandItemInstanceFromCharacter()
    end
    local v167
    if u166 == nil then
        v167 = u166
    else
        v167 = u166:WaitForChild("Handle", 1)
        if v167 ~= nil then
            v167 = v167:WaitForChild("EffectParticle", 1)
        end
    end
    u164.sprayingSpeedMaid:GiveTask(u19.Heartbeat:Connect(function(_) --[[ Line: 832 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u22
            [3] = u164
            [4] = u165
            [5] = u166
            [6] = u44
            [7] = u20
        --]]
        local v168 = not u17.LocalPlayer.Character
        if not v168 then
            local v169 = u17.LocalPlayer.Character
            if v169 ~= nil then
                v169 = v169.Parent
            end
            v168 = v169 ~= u22
        end
        if v168 then
            return nil
        end
        local v170 = u17.LocalPlayer:GetMouse()
        local v171 = Vector2.new(v170.X, v170.Y)
        local v172 = u17.LocalPlayer.Character:GetPrimaryPartCFrame().Position
        local _ = u22.CurrentCamera.CFrame
        local v173 = u22.CurrentCamera:ScreenPointToRay(v171.X, v171.Y).Unit.Direction
        local v174 = u164.YTargetOffset
        local _ = (v173 + Vector3.new(0, v174, 0)).Unit
        local v175 = v172 + u164:getDirection(u165).Unit * 20
        local v176 = u166
        if v176 ~= nil then
            v176 = v176:WaitForChild("Handle", 1)
            if v176 ~= nil then
                v176 = v176:WaitForChild("EffectParticle", 1)
            end
        end
        if v176 then
            local v177 = u17.LocalPlayer.Character
            local v178
            if v177 == nil then
                v178 = v177
            else
                v178 = v177:FindFirstChild("UpperTorso")
            end
            local v179
            if v178 == nil then
                v179 = v178
            else
                v179 = v178:FindFirstChild("Waist")
            end
            if v178 and v179 then
                local v180, v181 = u44(v177.PrimaryPart.CFrame, v175)
                local v182 = CFrame.new(0, 0, 0) * CFrame.Angles(v180, -3.141592653589793 + v181, 0)
                local v183 = { v179.C0:ToEulerAnglesXYZ() }
                if #v183 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                local v184 = v183[1]
                for v185 = 2, #v183 do
                    local v186 = v183[v185]
                    local _ = v185 - 1
                    v184 = v184 + v186
                end
                local v187 = { v182:ToEulerAnglesXYZ() }
                if #v187 == 0 then
                    error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
                end
                local v188 = v187[1]
                for v189 = 2, #v187 do
                    local v190 = v187[v189]
                    local _ = v189 - 1
                    v188 = v188 + v190
                end
                local v191 = v184 - v188
                if math.abs(v191) > 1e-6 and u164.originalWaistC0 then
                    u20:Create(v179, TweenInfo.new(0.085, Enum.EasingStyle.Linear), {
                        ["C0"] = u164.originalWaistC0 * v182
                    }):Play()
                end
            end
            v176.WorldCFrame = CFrame.new(v176.WorldPosition, v175)
        end
    end))
end
function u45.enableSprayerMode(u192) --[[ Line: 926 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u2
        [3] = u33
        [4] = u19
        [5] = u30
        [6] = u7
        [7] = u21
        [8] = u17
    --]]
    u12.Controllers.ProjectileController:disableTargeting()
    local u193 = nil
    local v194 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v200 = {
        ["action"] = "Attack",
        ["actionId"] = "Frosty-Gun",
        ["boundFunction"] = function(_, p195, u196) --[[ Name: boundFunction, Line 934 ]]
            --[[
            Upvalues:
                [1] = u192
                [2] = u33
                [3] = u193
                [4] = u19
                [5] = u2
                [6] = u30
            --]]
            if u192.projectileMode == u33.PROJECTILE then
                return nil
            end
            if p195 == Enum.UserInputState.Begin then
                if u196.UserInputType == Enum.UserInputType.Touch then
                    u193 = u196
                end
                local function u199() --[[ Line: 950 ]]
                    --[[
                    Upvalues:
                        [1] = u192
                        [2] = u33
                        [3] = u196
                        [4] = u19
                    --]]
                    if not (u192.stillEnable and u192.stillEnable()) then
                        return nil
                    end
                    if u192.projectileMode == u33.PROJECTILE then
                        return nil
                    end
                    if u196.UserInputState == Enum.UserInputState.End or u196.UserInputState == Enum.UserInputState.Cancel then
                        return nil
                    end
                    if u196.UserInputType == Enum.UserInputType.Touch then
                        local u197 = 0
                        u19:BindToRenderStep("frost-staff-mobile-confirm", 250, function(p198) --[[ Line: 963 ]]
                            --[[
                            Upvalues:
                                [1] = u197
                                [2] = u192
                                [3] = u19
                            --]]
                            u197 = u197 + p198
                            if u197 >= 0.3 then
                                if u192.spraying then
                                    return nil
                                end
                                u19:UnbindFromRenderStep("frost-staff-mobile-confirm")
                                u192:beginSprayHolding()
                            end
                        end)
                        return nil
                    end
                    u192:beginSprayHolding()
                end
                if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u30.FROSTY_GUN) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u30.FROSTY_GUN, "callback", function() --[[ Line: 978 ]]
                        --[[
                        Upvalues:
                            [1] = u199
                        --]]
                        u199()
                    end)
                    return nil
                end
                u199()
            elseif p195 == Enum.UserInputState.End then
                if u193 and u196 ~= u193 then
                    return nil
                end
                u193 = nil
                u192:cleanUp()
            end
            return Enum.ContextActionResult.Pass
        end,
        ["mobile"] = {
            ["touchType"] = u7.TouchBeginEnd
        },
        ["priority"] = Enum.ContextActionPriority.Medium.Value
    }
    u192.sprayerModeMaid = v194:bindAction(v200)
    u192.sprayerModeMaid:GiveTask(u21.TouchMoved:Connect(function(p201, _) --[[ Line: 999 ]]
        --[[
        Upvalues:
            [1] = u193
            [2] = u17
            [3] = u19
        --]]
        if p201 ~= u193 then
            return nil
        end
        local v202 = u17.LocalPlayer.Character
        if v202 ~= nil then
            v202 = v202:FindFirstChildWhichIsA("Humanoid")
            if v202 ~= nil then
                v202 = v202.MoveDirection
            end
        end
        if v202 ~= nil and v202 ~= Vector3.new() then
            pcall(function() --[[ Line: 1012 ]]
                --[[
                Upvalues:
                    [1] = u19
                --]]
                return u19:UnbindFromRenderStep("frost-staff-mobile-confirm")
            end)
        end
    end))
end
function u45.disableSprayerMode(p203) --[[ Line: 1018 ]]
    p203.sprayerModeMaid:DoCleaning()
    p203:cleanUp()
end
function u45.swap(p204) --[[ Line: 1022 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u27
    --]]
    if not p204:isEnabled() then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u27.FROSTY_GUN_SWAP)
end
function u45.isInFront(_, p205, p206, p207, p208) --[[ Line: 1028 ]]
    local _ = p208 == nil
    return p206:Dot((p205 - p207).Unit) > 0
end
function u45.enableStacksIndicator(p209) --[[ Line: 1041 ]]
    for v210 in p209.victimMap do
        p209:createSign(v210)
    end
end
function u45.clearIndicators(p211) --[[ Line: 1051 ]]
    for v212 in p211.victimMap do
        p211:removeSign(v212)
    end
end
function u45.maxChargeEffect(_) --[[ Line: 1060 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u8
        [3] = u37
        [4] = u18
        [5] = u11
        [6] = u40
    --]]
    local v213 = u31:getLocalPlayerEntity()
    if v213 ~= nil then
        v213 = v213:getHandItemInstanceFromCharacter()
        if v213 ~= nil then
            v213 = v213:WaitForChild("Handle")
        end
    end
    if not v213 then
        return nil
    end
    local v214 = v213:WaitForChild("EffectParticle", 1)
    if not v214 then
        return nil
    end
    u8:playSound(u37.JUGG_BARB_COOLDOWN_COMPLETE, {
        ["volumeMultiplier"] = 1.3,
        ["playbackSpeedMultiplier"] = 1.25
    })
    local v215 = u18.Assets.Effects.PulseEffect:Clone()
    v215.Pulse.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) })
    v215.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera
    v215.Position = v214.WorldCFrame.Position
    v215.CanQuery = false
    if u11.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        local v216 = u11.Controllers.ViewmodelController:getFirstPersonHandItem()
        if v216 ~= nil then
            v216 = v216:FindFirstChild("Handle")
        end
        v215.Parent = v216
        local v217 = v215.Pulse.Size.Keypoints
        local v218 = table.create(#v217)
        for v219, v220 in v217 do
            local _ = v219 - 1
            v218[v219] = NumberSequenceKeypoint.new(v220.Time, v220.Value / 4)
        end
        v215.Pulse.Size = NumberSequence.new(v218)
    else
        v215.Parent = v213
    end
    u40:playEffects({ v215 }, nil, {
        ["destroyAfterSec"] = 1
    })
end
function u45.createSign(p221, p222) --[[ Line: 1116 ]]
    --[[
    Upvalues:
        [1] = u39
        [2] = u38
        [3] = u34
        [4] = u15
        [5] = u42
    --]]
    p221:removeSign(p222)
    if not p222:FindFirstChild("Head") then
        return nil
    end
    local v223 = u39:getActive(p222, u38.COLD)
    if not v223 then
        return nil
    end
    local v224 = v223.stacks * 100 / u34.MAX_COLD_STACK
    local v225 = u15.mount
    local v226 = u15.createFragment
    local v227 = {
        ["FrostStackSign"] = u15.createElement("BillboardGui", {
            ["StudsOffsetWorldSpace"] = Vector3.new(0, -2, 0),
            ["ResetOnSpawn"] = false,
            ["MaxDistance"] = 300,
            ["AlwaysOnTop"] = true,
            ["Adornee"] = p222.Head,
            ["Size"] = UDim2.fromScale(2, 2)
        }, { u15.createElement(u42, {
                ["progress"] = v224,
                ["color"] = Color3.fromRGB(3, 255, 255),
                ["entityInstance"] = p222
            }) })
    }
    return v225(v226(v227), p222)
end
function u45.removeSign(_, p228) --[[ Line: 1144 ]]
    local v229 = p228:FindFirstChild("FrostStackSign")
    if v229 ~= nil then
        v229:Destroy()
    end
end
function u45.canSpray(p230) --[[ Line: 1150 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    if p230.projectileMode == u33.PROJECTILE then
        return false
    elseif p230:isEnabled() then
        return not p230.spraying
    else
        return false
    end
end
u44 = function(p231, p232) --[[ Name: calculateLookAtAngles, Line 1165 ]]
    local v233 = p232 - p231.Position
    local v234 = v233.Z / v233.X
    local v235 = -(math.atan(v234) + (v233.X > 0 and 3.141592653589793 or 0)) + 1.5707963267948966
    local v236 = p231.Position
    local v237 = (v235 - select(2, (p231 - v236):ToEulerAnglesYXZ()) + 1.5707963267948966) % 6.283185307179586 - 1.5707963267948966
    if math.abs(v237) > 1.7278759594743864 then
        return 0, 3.141592653589793
    end
    local v238 = math.clamp(v237, -1.288052987971815, 1.288052987971815) + 3.141592653589793
    local v239 = v233.X
    local v240 = math.pow(v239, 2)
    local v241 = v233.Z
    local v242 = v240 + math.pow(v241, 2)
    local v243 = math.sqrt(v242)
    local v244 = v233.Y / v243
    local v245 = math.atan(v244) - (p231 - p231.Position):ToEulerAnglesYXZ()
    return math.clamp(v245, -0.3141592653589793, 0.3141592653589793), v238
end
u11.CreateController(u45.new())
return nil