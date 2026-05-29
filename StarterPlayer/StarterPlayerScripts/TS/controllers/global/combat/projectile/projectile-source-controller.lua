local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v3.MobileTouchType
local u7 = v3.PressMode
local u8 = v3.RandomUtil
local u9 = v3.SoundManager
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.ContextActionService
local u16 = v14.HttpService
local u17 = v14.Players
local u18 = v14.RunService
local u19 = v14.UserInputService
local u20 = v14.Workspace
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u23 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyStaffUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "grappling-hook", "grappling-hook-util").GrapplingHookFunctions
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u35 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u36 = u1.import(script, script.Parent, "projectile-controller").ProjectileController
local v37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "ProjectileSourceController"
    end,
    ["__index"] = u22
})
v37.__index = v37
function v37.constructor(p38, ...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u12
    --]]
    u22.constructor(p38, ...)
    p38.maid = u12.new()
    p38.uiMaid = u12.new()
    p38.aimingMaid = u12.new()
    p38.reloadingWeaponSet = {}
end
function v37.KnitStart(p39) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u21
        [3] = u11
        [4] = u25
        [5] = u34
        [6] = u9
        [7] = u35
    --]]
    u22.KnitStart(p39)
    u21.StartLaunchProjectile:setPriority(u11.HIGH):connect(function(p40) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u34
            [3] = u9
            [4] = u35
        --]]
        if p40:isCancelled() then
            return nil
        end
        local v41 = u25:getLocalPlayerEntity()
        if not v41 then
            return nil
        end
        if not p40.projectileSource.blockingStatusEffects then
            return nil
        end
        if u34:hasAnyActive(v41:getInstance(), p40.projectileSource.blockingStatusEffects) then
            u9:playSound(u35.sound.uiDisabled)
            p40:setCancelled(true)
        end
    end)
end
function v37.onEnable(u42, u43, u44) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u24
        [3] = u17
        [4] = u21
        [5] = u32
        [6] = u2
        [7] = u16
        [8] = u33
        [9] = u18
        [10] = u6
        [11] = u19
        [12] = u15
        [13] = u10
    --]]
    u42.maid:DoCleaning()
    local u45 = u30(u43.itemType).projectileSource
    if u45 ~= nil then
        u45 = u45.thirdPerson
        if u45 ~= nil then
            u45 = u45.idleAnimation
        end
    end
    if u45 ~= 0 and (u45 == u45 and u45) then
        u42:setupYield(function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u17
                [3] = u45
                [4] = u42
            --]]
            local u46 = u24:playAnimation(u17.LocalPlayer, u45)
            u42.maid:GiveTask(function() --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                local v47 = u46
                if v47 ~= nil then
                    v47:Stop()
                end
            end)
            return function() --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u46
                --]]
                if u46 then
                    u46:Stop()
                end
            end
        end)
    end
    u42.maid:GiveTask(u21.SettingChanged:connect(function(p48) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u42
            [3] = u44
        --]]
        if p48.setting == u32.MOBILE_PROJECTILE_BUTTON then
            if u42:isEnabled() then
                if p48.value == true then
                    u42:displayMobileButton(u44)
                else
                    u42.uiMaid:DoCleaning()
                end
            else
                return nil
            end
        else
            return nil
        end
    end))
    local v49 = u42:getProjectileSource(u43)
    local u50 = u42:getCooldownId(v49, u43.itemType)
    if u42.reloadingWeaponSet[u43.itemType] ~= nil then
        local v51 = v49.fireDelaySec
        local v52 = u21.ItemCooldownModifierCheck:fire(v51).cooldown
        local v53 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
        local v54 = {}
        local v55
        if v49.cooldownBar then
            v55 = {}
            local v56 = v49.cooldownBar
            if v56 ~= nil then
                v56 = v56.colorGradient
            end
            v55.colorGradient = v56
            local v57 = v49.cooldownBar
            if v57 ~= nil then
                v57 = v57.title
            end
            v55.title = v57
        else
            v55 = nil
        end
        v54.cooldownBar = v55
        v53:setOnCooldown(u50, v52, v54)
        task.spawn(function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u44
            --]]
            u42:onStartReload(u44)
        end)
    end
    local u58 = "projectile-source-" .. u16:GenerateGUID(false)
    u42.maid:GiveTask(u42.aimingMaid)
    local u59 = nil
    u33.HookFunctionSwapEvent:connect(function(p60) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        u42.hookStatus = p60.hookFunction
    end)
    u42:displayMobileButton(u44)
    local v66 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = u58,
        ["boundFunction"] = function(_, p61, u62) --[[ Name: boundFunction, Line 163 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u59
                [3] = u44
                [4] = u18
                [5] = u43
                [6] = u2
                [7] = u50
            --]]
            if p61 == Enum.UserInputState.Begin then
                if u42.projectileHandler then
                    return nil
                end
                if not u42:canLaunch() then
                    return nil
                end
                if u62.UserInputType == Enum.UserInputType.Touch then
                    u59 = u62
                end
                local function u65() --[[ Line: 174 ]]
                    --[[
                    Upvalues:
                        [1] = u42
                        [2] = u44
                        [3] = u62
                        [4] = u18
                        [5] = u43
                    --]]
                    if u42.projectileHandler then
                        return nil
                    end
                    if not u44() then
                        return nil
                    end
                    if not u42:canLaunch() then
                        return nil
                    end
                    if u62.UserInputState == Enum.UserInputState.End or u62.UserInputState == Enum.UserInputState.Cancel then
                        return nil
                    end
                    if u62.UserInputType == Enum.UserInputType.Touch then
                        local u63 = 0
                        u18:BindToRenderStep("projectile-mobile-confirm", 250, function(p64) --[[ Line: 190 ]]
                            --[[
                            Upvalues:
                                [1] = u63
                                [2] = u42
                                [3] = u18
                                [4] = u43
                                [5] = u62
                            --]]
                            u63 = u63 + p64
                            if u63 >= 0.3 then
                                if u42.projectileHandler then
                                    return nil
                                end
                                u18:UnbindFromRenderStep("projectile-mobile-confirm")
                                u42:beginHolding(u43, u62, u42.aimingMaid, false)
                            end
                        end)
                        return nil
                    end
                    u42:beginHolding(u43, nil, u42.aimingMaid, false)
                end
                if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u50) then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u50, "callback", function() --[[ Line: 205 ]]
                        --[[
                        Upvalues:
                            [1] = u65
                        --]]
                        u65()
                    end)
                    return nil
                end
                u65()
            elseif p61 == Enum.UserInputState.End then
                if u59 and u62 ~= u59 then
                    return nil
                end
                u59 = nil
                u42:releaseChargeInput(u42.aimingMaid, u44, u62)
            end
            return Enum.ContextActionResult.Pass
        end,
        ["mobile"] = {
            ["touchType"] = u6.TouchBeginEnd
        },
        ["priority"] = Enum.ContextActionPriority.Medium.Value
    })
    u42.maid:GiveTask(v66)
    u42.maid:GiveTask(u19.TouchMoved:Connect(function(p67, _) --[[ Line: 226 ]]
        --[[
        Upvalues:
            [1] = u59
            [2] = u17
            [3] = u18
        --]]
        if p67 ~= u59 then
            return nil
        end
        local v68 = u17.LocalPlayer.Character
        if v68 ~= nil then
            v68 = v68:FindFirstChildWhichIsA("Humanoid")
            if v68 ~= nil then
                v68 = v68.MoveDirection
            end
        end
        if v68 ~= nil and v68 ~= Vector3.new() then
            pcall(function() --[[ Line: 239 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                return u18:UnbindFromRenderStep("projectile-mobile-confirm")
            end)
        end
    end))
    u42.maid:GiveTask(function() --[[ Line: 244 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u58
            [3] = u10
            [4] = u42
            [5] = u18
            [6] = u59
        --]]
        u15:UnbindAction(u58)
        u10.Controllers.ProjectileController:disableTargeting()
        u42.projectileHandler = nil
        pcall(function() --[[ Line: 248 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            return u18:UnbindFromRenderStep("projectile-mobile-confirm")
        end)
        u59 = nil
    end)
end
function v37.beginHolding(u69, u70, p71, p72, p73) --[[ Line: 254 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u21
        [3] = u27
        [4] = u29
        [5] = u17
        [6] = u25
        [7] = u31
        [8] = u10
        [9] = u9
        [10] = u8
        [11] = u36
        [12] = u20
        [13] = u4
        [14] = u1
        [15] = u18
    --]]
    local v74 = u30(u70.itemType)
    local v75 = v74.projectileSource
    if v75 ~= nil then
        v75 = v75.ammoItemTypes
    end
    if v75 then
        v75 = not u69:getAmmoType(u70.itemType)
    end
    if v75 then
        return false
    end
    if u21.BeginProjectileTargeting:fire(u70, p71):isCancelled() then
        return false
    end
    local u76 = u69:getProjectileSource(u70)
    local v77 = u69:getAmmoType(u70.itemType)
    if u76.waitForHit and u69.hookStatus ~= u27.HOOK_CHAMBERED then
        return false
    end
    local v78 = v74.projectileSource
    if v78 ~= nil then
        v78 = v78.ammoItemTypes
    end
    if v78 ~= nil or v77 ~= nil then
        if v77 == nil then
            return false
        end
        if not u29.hasEnough(u17.LocalPlayer, v77, 1) then
            return false
        end
    end
    local v79 = u17.LocalPlayer.Character
    if v79 ~= nil then
        v79 = v79.PrimaryPart
    end
    if v79 then
        if not u25:getEntity(u17.LocalPlayer) then
            return false
        end
        u69:onStartCharging()
        p72:GiveTask(function() --[[ Line: 304 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            return u69:onStopCharging()
        end)
        local v80 = u76.walkSpeedMultiplier
        if v80 ~= 0 and (v80 == v80 and v80) then
            local v81 = u31[u76.projectileType(v77)]
            local v82
            if v81 == nil then
                v82 = v81
            else
                v82 = v81.getProjectileOverridesFunction
            end
            local v83
            if v82 then
                v83 = v81.getProjectileOverridesFunction(u17.LocalPlayer)
            else
                v83 = nil
            end
            local v84
            if v83 then
                v84 = v83.walkSpeedMultiplierOverride
            else
                v84 = v83
            end
            if v84 == 0 or (v84 ~= v84 or not v84) then
                p72:GiveTask(u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = true,
                    ["moveSpeedMultiplier"] = u76.walkSpeedMultiplier
                }))
            else
                local v85 = v83.walkSpeedMultiplierOverride ~= 1
                p72:GiveTask(u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["moveSpeedMultiplier"] = v83.walkSpeedMultiplierOverride,
                    ["blockSprint"] = v85
                }))
            end
        end
        if u76.chargeBeginSound then
            local v86 = u9
            local v87 = u8.fromList
            local v88 = u76.chargeBeginSound
            local v89 = v86:playSound(v87(unpack(v88)))
            if v89 then
                p72:GiveTask(v89)
            end
        end
        local v90 = u36
        local v91 = u70.itemType
        local v92 = u76.projectileType(v77)
        local v93 = {}
        local v94 = u76.minStrengthScalar
        v93.initialVelocityMultiplier = v94 == nil and 1 or v94
        local v95
        if p73 then
            v95 = u20.CurrentCamera
            if v95 ~= nil then
                v95 = v95.ViewportSize / 2 - Vector2.new(0, game:GetService("GuiService"):GetGuiInset().Y / 2)
            end
        else
            v95 = nil
        end
        v93.lockedAimPoint = v95
        local v96 = v74.sword
        if v96 ~= nil then
            v96 = v96.chargedAttack
        end
        v93.displayBeamDelay = v96 and 0.25 or nil
        local u97 = v90:enableTargeting(v91, v92, u76, p71, v93)
        u69.projectileHandler = u97
        u69.projectileHandler.projectileSourceController = u69
        u69.projectileHandler.player = u17.LocalPlayer
        local v98 = v74.sword
        if v98 ~= nil then
            v98 = v98.chargedAttack
        end
        if v98 then
            if u4.isMobileControls() then
                u10.Controllers.SwordChargeController:startCharging(u70.itemType)
            end
            task.delay(0.25, function() --[[ Line: 382 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u70
                --]]
                if not u10.Controllers.SwordChargeController:isWeaponCharging(u70.itemType) then
                    u10.Controllers.ProjectileController:disableTargeting()
                end
            end)
        end
        local v99 = u76.maxStrengthChargeSec
        if v99 == 0 or (v99 ~= v99 or not v99) then
            u69:onMaxCharge()
        else
            local v100 = u76.maxStrengthChargeSec
            local u101 = u21.ProjectileMaxChargeTimeModifierCheck:fire(v100).maxChargeTime
            local u102 = true
            u69.maid:GiveTask(function() --[[ Line: 393 ]]
                --[[
                Upvalues:
                    [1] = u102
                --]]
                u102 = false
            end)
            u1.Promise.defer(function() --[[ Line: 396 ]]
                --[[
                Upvalues:
                    [1] = u97
                    [2] = u102
                    [3] = u69
                    [4] = u18
                    [5] = u101
                    [6] = u76
                    [7] = u21
                    [8] = u70
                --]]
                u97.drawDurationSeconds = 0
                local v103 = false
                while u102 and u97 == u69.projectileHandler do
                    local v104 = u97
                    v104.drawDurationSeconds = v104.drawDurationSeconds + u18.RenderStepped:Wait()
                    local v105 = u97.drawDurationSeconds / u101
                    local v106 = math.min(1, v105)
                    local v107 = 1 - v106
                    local v108 = u76.minStrengthScalar
                    u97.velocityMultiplier = v106 + v107 * (v108 == nil and 0.5 or v108)
                    if not v103 and v106 >= 1 then
                        u21.ProjectileMaxCharged:fire(u70.itemType)
                        u69:onMaxCharge()
                        v103 = true
                    end
                end
            end)
        end
    end
    return true
end
function v37.releaseChargeInput(u109, p110, u111, p112) --[[ Line: 421 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u21
        [3] = u30
        [4] = u4
        [5] = u10
        [6] = u2
        [7] = u9
        [8] = u8
    --]]
    if not u109:canLaunch() then
        return nil
    end
    if u109.bufferPromise then
        u109.bufferPromise:cancel()
        u109.bufferPromise = nil
    end
    pcall(function() --[[ Line: 429 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        return u18:UnbindFromRenderStep("projectile-mobile-confirm")
    end)
    p110:DoCleaning()
    if u109.projectileHandler then
        local u113 = u109:getHandItem()
        local v114 = u109:getProjectileSource(u113)
        local v115 = u109:getAmmoType(u113.itemType)
        if u109:onLaunch(u111) == false then
            return nil
        end
        if not u111() then
            return nil
        end
        if u21.ProjectileTargetingEnded:fire(u113, p112):isCancelled() then
            return false
        end
        local v116 = u30(u113.itemType)
        local v117 = v116.sword
        if v117 ~= nil then
            v117 = v117.chargedAttack
        end
        if v117 and u4.isMobileControls() then
            u10.Controllers.SwordChargeController:stopCharging(u113.itemType)
        end
        local v118 = v116.sword
        if v118 ~= nil then
            v118 = v118.chargedAttack
        end
        if v118 then
            v118 = v116.projectileSource
        end
        if v118 then
            u10.Controllers.ProjectileController:disableTargeting()
            return nil
        end
        u10.Controllers.ProjectileController:launchProjectile(u113.itemType, v115, u109.projectileHandler, u113.tool, v114)
        local v119 = v114.fireDelaySec
        local v120 = u21.ProjectileCooldownModifierCheck:fire(v119).cooldown
        local v121 = u109:getProjectileOverrides()
        if v121 then
            local v122 = v121.cooldownOverride
            if v122 ~= 0 and (v122 == v122 and v122) then
                v120 = v121.cooldownOverride
            end
        end
        local v123 = u109:getCooldownId(v114, u113.itemType)
        local v124 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
        local v125 = {}
        local v126
        if v114.cooldownBar then
            v126 = {}
            local v127 = v114.cooldownBar
            if v127 ~= nil then
                v127 = v127.colorGradient
            end
            v126.colorGradient = v127
            local v128 = v114.cooldownBar
            if v128 ~= nil then
                v128 = v128.title
            end
            v126.title = v128
        else
            v126 = nil
        end
        v125.cooldownBar = v126
        v124:setOnCooldown(v123, v120, v125)
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(v123, "reloading_clear", function() --[[ Line: 507 ]]
            --[[
            Upvalues:
                [1] = u109
                [2] = u113
            --]]
            u109.reloadingWeaponSet[u113.itemType] = nil
        end)
        if v114.activeReload == true then
            u109.reloadingWeaponSet[u113.itemType] = true
        end
        task.spawn(function() --[[ Line: 517 ]]
            --[[
            Upvalues:
                [1] = u109
                [2] = u111
            --]]
            u109:onStartReload(u111)
        end)
        local v129 = v114.reload
        if v129 ~= nil then
            v129 = v129.reloadSound
        end
        local v130 = v129 and u9:playSound(u8.fromList(unpack(v129)))
        if v130 then
            u109.maid:GiveTask(v130)
        end
    end
    u10.Controllers.ProjectileController:disableTargeting()
    u109.projectileHandler = nil
end
function v37.onDisable(p131) --[[ Line: 535 ]]
    p131.maid:DoCleaning()
    p131.uiMaid:DoCleaning()
end
function v37.onMaxCharge(_) --[[ Line: 539 ]] end
function v37.canLaunch(_) --[[ Line: 541 ]]
    return true
end
function v37.getProjectileSource(_, p132) --[[ Line: 544 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    return u30(p132.itemType).projectileSource
end
function v37.getAmmoType(_, p133) --[[ Line: 547 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u23
    --]]
    local v134 = u30(p133).projectileSource
    if v134 ~= nil then
        v134 = v134.ammoItemTypes
    end
    if v134 then
        local v135 = u23:getState().Inventory.observedInventory.hotbar
        for _, v136 in v134 do
            local v137 = nil
            for v138, v139 in v135 do
                local _ = v138 - 1
                local v140 = v139.item
                if v140 ~= nil then
                    v140 = v140.itemType
                end
                if v140 == v136 == true then
                    v137 = v139
                    break
                end
            end
            if v137 then
                return v136
            end
        end
        local v141 = u23:getState().Inventory.observedInventory.inventory
        for _, v142 in v134 do
            local v143 = nil
            for v144, v145 in v141.items do
                local _ = v144 - 1
                if v145.itemType == v142 == true then
                    v143 = v145
                    break
                end
            end
            if v143 then
                return v142
            end
        end
    end
    return nil
end
function v37.displayMobileButton(u146, u147) --[[ Line: 604 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u32
        [3] = u4
        [4] = u12
        [5] = u13
        [6] = u5
        [7] = u28
        [8] = u2
        [9] = u7
        [10] = u26
        [11] = u18
        [12] = u17
    --]]
    local u148 = u146:getHandItem()
    if not u148 then
        return nil
    end
    local u149 = u146:getCooldownId(u146:getProjectileSource(u148), u148.itemType)
    if u10.Controllers.SettingsController:getSetting(u32.MOBILE_PROJECTILE_BUTTON) and u4.isMobileControls() then
        u146:setupYield(function() --[[ Line: 613 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u12
                [3] = u13
                [4] = u5
                [5] = u28
                [6] = u2
                [7] = u7
                [8] = u146
                [9] = u147
                [10] = u26
                [11] = u148
                [12] = u18
                [13] = u17
                [14] = u149
            --]]
            u10.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await()
            local u150 = u12.new()
            local u164 = u13.mount(u13.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false
            }, { u13.createElement(u5, {
                    ["Image"] = u28.BOW_MOBILE,
                    ["Position"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("FireProjectile"),
                    ["Size"] = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("FireProjectile"),
                    ["PressMode"] = u7.FREE_MOVING_HOLD,
                    ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 624 ]]
                        --[[
                        Upvalues:
                            [1] = u146
                            [2] = u147
                            [3] = u26
                            [4] = u148
                            [5] = u10
                            [6] = u150
                            [7] = u18
                            [8] = u17
                            [9] = u2
                            [10] = u149
                        --]]
                        if u146.projectileHandler then
                            return nil
                        end
                        local function u159() --[[ Line: 628 ]]
                            --[[
                            Upvalues:
                                [1] = u146
                                [2] = u147
                                [3] = u26
                                [4] = u148
                                [5] = u10
                                [6] = u150
                                [7] = u18
                                [8] = u17
                            --]]
                            if u146.projectileHandler then
                                return nil
                            end
                            if not u147() then
                                return nil
                            end
                            if not u146:canLaunch() then
                                return nil
                            end
                            if u26:isFrostyStaff(u148.itemType) and u10.Controllers.FrostyGunController:canSpray() then
                                u10.Controllers.FrostyGunController:beginSprayHolding(true)
                            end
                            if not u146:beginHolding(u148, nil, u146.aimingMaid, true) then
                                return nil
                            end
                            u150:DoCleaning()
                            local u151 = 0
                            u150:GiveTask(u18.RenderStepped:Connect(function(p152) --[[ Line: 648 ]]
                                --[[
                                Upvalues:
                                    [1] = u151
                                    [2] = u17
                                --]]
                                u151 = u151 + p152
                                local v153 = u151 * 3
                                local v154 = math.clamp(v153, 0, 0.8)
                                local v155 = u17.LocalPlayer.Character
                                if v155 ~= nil then
                                    for v156, v157 in v155:GetDescendants() do
                                        local _ = v156 - 1
                                        if v157:IsA("BasePart") then
                                            local v158 = v157.LocalTransparencyModifier
                                            v157.LocalTransparencyModifier = math.max(v158, v154)
                                        end
                                    end
                                end
                            end))
                        end
                        if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u149) then
                            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u149, "callback", function() --[[ Line: 666 ]]
                                --[[
                                Upvalues:
                                    [1] = u159
                                --]]
                                u159()
                            end)
                            return nil
                        end
                        u159()
                    end,
                    ["OnPressUp"] = function(p160) --[[ Name: OnPressUp, Line 673 ]]
                        --[[
                        Upvalues:
                            [1] = u150
                            [2] = u17
                            [3] = u146
                            [4] = u147
                        --]]
                        u150:DoCleaning()
                        local v161 = u17.LocalPlayer.Character
                        if v161 ~= nil then
                            for v162, v163 in v161:GetDescendants() do
                                local _ = v162 - 1
                                if v163:IsA("BasePart") then
                                    v163.LocalTransparencyModifier = 0
                                end
                            end
                        end
                        u146:releaseChargeInput(u146.aimingMaid, u147, p160)
                    end
                }) }), u17.LocalPlayer:WaitForChild("PlayerGui"))
            u146.uiMaid:GiveTask(function() --[[ Line: 691 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u164
                --]]
                u13.unmount(u164)
            end)
            return function() --[[ Line: 694 ]]
                --[[
                Upvalues:
                    [1] = u150
                    [2] = u146
                --]]
                u150:DoCleaning()
                u146.uiMaid:DoCleaning()
            end
        end)
    end
end
function v37.getProjectileHandler(p165) --[[ Line: 701 ]]
    return p165.projectileHandler
end
function v37.clearProjectileHandler(p166) --[[ Line: 704 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.Controllers.ProjectileController:disableTargeting()
    p166.projectileHandler = nil
end
function v37.getCooldownId(_, p167, p168) --[[ Line: 708 ]]
    return p167.cooldownId or p168 .. "-proj-source"
end
function v37.getProjectileOverrides(_) --[[ Line: 711 ]]
    return {}
end
return {
    ["ProjectileSourceController"] = v37
}