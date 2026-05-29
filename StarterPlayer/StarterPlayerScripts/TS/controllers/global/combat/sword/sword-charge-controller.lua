local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ClickHold
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.HttpService
local u13 = v11.Players
local u14 = v11.UserInputService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "combat", "charge-state").ChargeState
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shared-sync-events").SharedSyncEvents
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "SwordChargeController"
    end,
    ["__index"] = u16
})
u24.__index = u24
function u24.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u18
    --]]
    u16.constructor(p27)
    p27.Name = "SwordChargeController"
    p27.maid = u10.new()
    p27.chargingMaid = u10.new()
    p27.chargeStartTime = 0
    p27.chargeTime = 0
    p27.chargeState = u18.Idle
    p27.chargingWeapons = {}
end
function u24.KnitStart(p28) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u9
        [4] = u22
    --]]
    u16.KnitStart(p28)
    u15.SwordCharge:setPriority(u9.LOWEST):connect(function(u29) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        if u29:isCancelled() then
            return nil
        end
        task.spawn(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u29
            --]]
            u22.Client:Get("SwordChargeState"):SendToServer({
                ["itemType"] = u29.itemType,
                ["chargeState"] = u29.chargeState
            })
        end)
    end)
end
function u24.onEnable(u30, u31) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u15
        [3] = u18
        [4] = u4
        [5] = u8
        [6] = u7
        [7] = u23
        [8] = u13
        [9] = u14
        [10] = u12
        [11] = u2
    --]]
    local v32 = u21(u31.itemType)
    local v33 = v32.sword
    if v33 ~= nil then
        v33 = v33.chargedAttack
    end
    if not v33 then
        return nil
    end
    local u34 = u15.SwordChargeTimeModifierCheck:fire(v33.maxChargeTimeSec, v33.minChargeTimeSec).minChargeTime
    local u35 = u15.SwordChargeTimeModifierCheck:fire(v33.maxChargeTimeSec, v33.minChargeTimeSec).maxChargeTime
    local v36 = v32.sword
    if v36 ~= nil then
        v36 = v36.chargedAttack
        if v36 ~= nil then
            v36 = v36.fireAtFullCharge
        end
    end
    local u37 = v36 and true or false
    u30.chargeStartTime = 0
    u30:updateChargeState(u18.Idle, u31.itemType)
    local v38 = v33.showHoldProgressAfterSec
    local v39 = v38 == nil and 0.1 or v38
    u30.clickHold = u4.new(u35, false, v39)
    local function u53(u40) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u18
            [3] = u8
            [4] = u31
            [5] = u34
            [6] = u35
            [7] = u37
            [8] = u7
        --]]
        if u30:getChargeState() == u18.Idle then
            if u8.Controllers.SwordController:getSwordSwingDisabled() then
                return nil
            else
                local function u47() --[[ Line: 106 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u31
                        [3] = u34
                        [4] = u35
                        [5] = u18
                        [6] = u37
                        [7] = u8
                    --]]
                    u30:startCharging(u31.itemType)
                    local u41 = u30.chargeStartTime
                    local v42 = task
                    local v43 = u34
                    if v43 == nil then
                        local v44 = u35
                        v43 = v44 == nil and 0 or v44
                    end
                    v42.delay(v43, function() --[[ Line: 119 ]]
                        --[[
                        Upvalues:
                            [1] = u30
                            [2] = u31
                            [3] = u41
                            [4] = u18
                            [5] = u37
                            [6] = u8
                        --]]
                        if not u30:isWeaponCharging(u31.itemType) then
                            u30:stopCharging(u31.itemType)
                            u30.chargingMaid:DoCleaning()
                            return nil
                        end
                        local v45
                        if u30.chargeStartTime == u41 then
                            v45 = u30:getChargeState() == u18.Charging
                        else
                            v45 = false
                        end
                        if v45 then
                            u30:updateChargeState(u18.Charged, u31.itemType)
                            if u37 then
                                local v46 = u30:stopCharging(u31.itemType)
                                u8.Controllers.SwordController:swingSwordAtMouse(v46)
                            end
                        end
                    end)
                end
                if u7.Controllers.SwordController:isOnChargeAttackCooldown(u31.itemType) then
                    local u48 = u30.chargeStartTime
                    local v49 = task.delay
                    local v50 = u7.Controllers.SwordController:getRemainingChargeCooldown(u31.itemType)
                    local v51 = u7.Controllers.SwordController:getRemainingSwingCooldown(u31.itemType)
                    local v52 = u7.Controllers.SwordController
                    v49(math.max(v50, v51, v52:getRemainingCastingTime()), function() --[[ Line: 139 ]]
                        --[[
                        Upvalues:
                            [1] = u40
                            [2] = u30
                            [3] = u48
                            [4] = u47
                        --]]
                        if u40.UserInputState == Enum.UserInputState.End then
                            return nil
                        end
                        if u30.chargeStartTime ~= u48 then
                            return nil
                        end
                        u47()
                    end)
                else
                    u47()
                end
            end
        else
            return nil
        end
    end
    local function u58(_) --[[ Line: 152 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u31
            [3] = u18
            [4] = u8
            [5] = u21
            [6] = u34
            [7] = u23
            [8] = u13
        --]]
        local v54 = u30:stopCharging(u31.itemType)
        if u30:getChargeState() ~= u18.Idle then
            u30.chargingMaid:DoCleaning()
            return nil
        end
        if u8.Controllers.SwordController:getSwordSwingDisabled() then
            return nil
        end
        local v55 = u30:getHandItem()
        if v55 ~= nil then
            v55 = v55.tool
        end
        local v56
        if v55 then
            v56 = u21(v55.Name).sword
            if v56 ~= nil then
                v56 = v56.chargedAttack
            end
        else
            v56 = v55
        end
        if v56 then
            v56 = v56.skipSwingDamage
        end
        if v56 then
            local v57 = u34
            v56 = (v57 == nil and 0 or v57) < v54
        end
        if not (v55 and v56) then
            u8.Controllers.SwordController:swingSwordAtMouse(v54)
        end
        u23.SwordChargedSwing:fire(u13.LocalPlayer, v55, {
            ["chargeTime"] = v54
        })
    end
    if u14.TouchEnabled then
        u30.maid:GiveTask(u15.MobileSwordButtonPressed:connect(function(p59) --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u58
            --]]
            if p59.state == "down" then
                p59:setCancelled(true)
                u53(p59.input)
            elseif p59.state == "up" then
                u58(p59.input)
            end
        end))
        u30.maid:GiveTask(u15.BeginProjectileTargeting:connect(function(p60) --[[ Line: 206 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u53
            --]]
            local v61 = u21(p60.handItem.itemType).sword
            if v61 ~= nil then
                v61 = v61.chargedAttack
            end
            if not v61 then
                return nil
            end
            if p60.inputObject then
                u53(p60.inputObject)
            end
        end))
        u30.maid:GiveTask(u15.ProjectileTargetingEnded:connect(function(p62) --[[ Line: 219 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u58
            --]]
            local v63 = u21(p62.handItem.itemType).sword
            if v63 ~= nil then
                v63 = v63.chargedAttack
            end
            if not v63 then
                return nil
            end
            if p62.inputObject then
                u58(p62.inputObject)
            end
        end))
    end
    local v64 = "charge-sword:" .. u12:GenerateGUID(false)
    local v67 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = v64,
        ["boundFunction"] = function(_, p65, p66) --[[ Name: boundFunction, Line 238 ]]
            --[[
            Upvalues:
                [1] = u53
                [2] = u58
            --]]
            if p66.UserInputType == Enum.UserInputType.Touch then
                return print("Early cancel")
            end
            if p65 == Enum.UserInputState.Begin then
                u53(p66)
                return Enum.ContextActionResult.Sink
            end
            if p65 == Enum.UserInputState.End then
                u58(p66)
                return Enum.ContextActionResult.Pass
            end
        end,
        ["priority"] = Enum.ContextActionPriority.High.Value
    })
    u30.maid:GiveTask(v67)
    u30.maid:GiveTask(u30.chargingMaid)
    u30.maid:GiveTask(function() --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u18
            [3] = u31
        --]]
        local v68 = u30.clickHold
        if v68 ~= nil then
            v68:cancelClick()
        end
        local v69 = u30.clickHold
        if v69 ~= nil then
            v69:disable()
        end
        u30.clickHold = nil
        u30:updateChargeState(u18.Idle, u31.itemType)
    end)
end
function u24.getChargeStartTime(p70) --[[ Line: 270 ]]
    return p70.chargeStartTime
end
function u24.getChargeState(p71) --[[ Line: 273 ]]
    return p71.chargeState
end
function u24.isWeaponCharging(p72, p73) --[[ Line: 276 ]]
    local v74 = p72.chargingWeapons[p73]
    if v74 == nil then
        v74 = false
    end
    return v74
end
function u24.startCharging(u75, u76) --[[ Line: 285 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u21
        [3] = u20
        [4] = u13
        [5] = u15
        [6] = u19
        [7] = u7
        [8] = u5
        [9] = u8
    --]]
    if u75.chargeState ~= u18.Idle then
        return nil
    end
    local v77 = u21(u76)
    local u78 = v77.sword
    if u78 ~= nil then
        u78 = u78.chargedAttack
    end
    if not u78 then
        return nil
    end
    local v79 = v77.sword
    if v79 ~= nil then
        v79 = v79.chargedAttack
        if v79 ~= nil then
            v79 = v79.enableCondition
        end
    end
    if v79 then
        local v80 = u20.getToolFromInventory(u13.LocalPlayer, u76)
        if v80 and not v77.sword.chargedAttack.enableCondition(v80) then
            return nil
        end
    end
    local u81 = u15.SwordChargeTimeModifierCheck:fire(u78.maxChargeTimeSec, u78.minChargeTimeSec).maxChargeTime
    local v82 = u19:getEntity(u13.LocalPlayer)
    if v82 ~= nil then
        v82 = v82:getHandItemInstanceFromCharacter()
    end
    if not v82 or v82.Name ~= u76 then
        return nil
    end
    if u7.Controllers.SwordController:isOnChargeAttackCooldown(u76) then
        return nil
    end
    u75.chargeStartTime = tick()
    local v83 = u75:updateChargeState(u18.Charging, u76)
    if not v83 or v83:isCancelled() then
        return nil
    end
    u13.LocalPlayer:SetAttribute("IsCharging", true)
    u75.chargingWeapons[u76] = true
    local u84 = u78.chargingEffects
    local v85 = u78.showHoldProgressAfterSec
    local v86 = v85 == nil and 0.1 or v85
    task.delay(v86, function() --[[ Line: 342 ]]
        --[[
        Upvalues:
            [1] = u75
            [2] = u76
            [3] = u84
            [4] = u81
            [5] = u5
        --]]
        if not u75:isWeaponCharging(u76) then
            return nil
        end
        local v87 = u84
        if v87 ~= nil then
            v87 = v87.thirdPersonAnim
        end
        if v87 == 0 or (v87 ~= v87 or not v87) then
            v87 = u84
            if v87 ~= nil then
                v87 = v87.firstPersonAnim
            end
        end
        if v87 ~= 0 and (v87 == v87 and v87) then
            local v88 = u75:playAnimation(u84.thirdPersonAnim, u84.firstPersonAnim, {
                ["dynamicUpdateOnPerspectiveChange"] = true
            })
            local v89 = v88[1]
            local v90 = v88[2]
            if v89 then
                v89:AdjustSpeed(v89.Length / u81)
            end
            if v90 then
                u75.chargingMaid:GiveTask(v90)
            end
        end
        local v91 = u84
        if v91 ~= nil then
            v91 = v91.sound
        end
        local u92 = v91 ~= "" and (v91 and u5:playSound(u84.sound))
        if u92 then
            u75.chargingMaid:GiveTask(function() --[[ Line: 382 ]]
                --[[
                Upvalues:
                    [1] = u92
                --]]
                u92:Destroy()
            end)
        end
    end)
    local v93 = task
    local v94 = u78.walkSpeedModifier
    if v94 ~= nil then
        v94 = v94.delay
    end
    local v95 = v94 == nil and 0 or v94
    v93.delay(v95, function() --[[ Line: 398 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u75
            [3] = u8
            [4] = u78
        --]]
        local v96 = u13.LocalPlayer:GetAttribute("IsCharging")
        if v96 == 0 or (v96 ~= v96 or (v96 == "" or not v96)) then
            return nil
        end
        local v97 = u75.chargingMaid
        local v98 = u8.Controllers.SprintController:getMovementStatusModifier()
        local v99 = {}
        local v100 = u78.walkSpeedModifier
        if v100 ~= nil then
            v100 = v100.multiplier
        end
        v99.moveSpeedMultiplier = v100
        v97:GiveTask(v98:addModifier(v99))
    end)
    local v101 = u75.clickHold
    if v101 ~= nil then
        v101:startClick()
    end
end
function u24.stopCharging(p102, p103) --[[ Line: 419 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u13
        [3] = u18
    --]]
    local v104 = p102.chargeStartTime
    local v105 = (v104 == 0 or (v104 ~= v104 or not v104)) and 0 or tick() - p102.chargeStartTime
    local v106 = u19:getEntity(u13.LocalPlayer)
    if v106 ~= nil then
        v106 = v106:getHandItemInstanceFromCharacter()
    end
    if not v106 or v106.Name ~= p103 then
        return v105
    end
    local v107 = p102.clickHold
    if v107 ~= nil then
        v107:endClick()
    end
    p102.chargingMaid:DoCleaning()
    p102.chargingWeapons[p103] = nil
    u13.LocalPlayer:SetAttribute("IsCharging", false)
    p102.chargeStartTime = 0
    p102:updateChargeState(u18.Idle, p103)
    return v105
end
function u24.updateChargeState(p108, p109, p110) --[[ Line: 444 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    if p108.chargeState == p109 then
        return nil
    end
    local v111 = u15.SwordCharge:fire(p109, p110)
    if v111:isCancelled() then
        return v111
    end
    p108.chargeState = v111.chargeState
    return v111
end
function u24.playAnimation(u112, u113, u114, u115) --[[ Line: 455 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u10
        [3] = u13
        [4] = u17
    --]]
    local v116 = u7.Controllers.CameraPerspectiveController:getCameraPerspective() == 0
    local v117
    if v116 then
        v117 = u114
    else
        v117 = u113
    end
    if v117 == nil then
        return { nil, nil }
    end
    local u118 = u10.new()
    local u119
    if v116 then
        u119 = u7.Controllers.ViewmodelController:playAnimation(v117)
    else
        local v120 = u13.LocalPlayer.Character
        if v120 ~= nil then
            v120 = v120:FindFirstChild("Humanoid")
            if v120 ~= nil then
                v120 = v120:FindFirstChild("Animator")
            end
        end
        if not v120 then
            return { nil, nil }
        end
        u119 = v120:LoadAnimation(u17:getAnimation(v117))
        u119:Play()
    end
    if u119 then
        if u119 ~= nil then
            local v122 = u119:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 487 ]]
                --[[
                Upvalues:
                    [1] = u119
                --]]
                local v121 = u119
                if v121 ~= nil then
                    v121:AdjustSpeed(0)
                end
            end)
        end
        u118:GiveTask(v122)
        u118:GiveTask(function() --[[ Line: 495 ]]
            --[[
            Upvalues:
                [1] = u119
            --]]
            local v123 = u119
            if v123 ~= nil then
                v123:Stop(0.2)
            end
            local v124 = u119
            if v124 ~= nil then
                v124:Destroy()
            end
        end)
    end
    local v125
    if u115 == nil then
        v125 = u115
    else
        v125 = u115.dynamicUpdateOnPerspectiveChange
    end
    if v125 then
        u118:GiveTask(u7.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(_) --[[ Line: 512 ]]
            --[[
            Upvalues:
                [1] = u118
                [2] = u112
                [3] = u113
                [4] = u114
                [5] = u115
            --]]
            u118:DoCleaning()
            local v126 = u112:playAnimation(u113, u114, u115)[2]
            if v126 then
                u118:GiveTask(v126)
            end
        end))
    end
    return { u119, u118 }
end
function u24.isRelevantItem(_, p127) --[[ Line: 524 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v128 = u21(p127.itemType).sword
    if v128 ~= nil then
        v128 = v128.chargedAttack
    end
    return v128 ~= nil
end
function u24.onDisable(p129) --[[ Line: 532 ]]
    p129.maid:DoCleaning()
end
u7.CreateController(u24.new())
return nil