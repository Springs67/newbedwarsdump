local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "pogo-stick-balance").PogoStickBalance
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u19 = v15.POGO_BOUNCE
local u20 = v15.POGO_STOMP
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "PogoStickController"
    end,
    ["__index"] = u10
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
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u5
    --]]
    u10.constructor(p24)
    p24.Name = "PogoStickController"
    p24.enableMaid = u5.new()
    p24.pogoMaid = u5.new()
    p24.blocked = false
end
function u21.isRelevantItem(_, p25) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return p25.itemType == u14.POGO_STICK
end
function u21.onEnable(u26) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u2
        [4] = u9
        [5] = u3
        [6] = u19
        [7] = u13
        [8] = u17
        [9] = u16
        [10] = u18
    --]]
    local v27 = true
    local v28 = v27
    for v29, _ in u4.Controllers.MountController:getActiveMounts() do
        if v29 == u7.LocalPlayer then
            v27 = false
            v28 = v27
        end
    end
    if not v28 then
        u26.blocked = true
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "Pogo Stick blocked while mounted on another object"
        })
    end
    u26.enableMaid:GiveTask(u9.GenericMountMounted:connect(function(p30) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u26
            [3] = u2
        --]]
        if p30.player ~= u7.LocalPlayer then
            return nil
        end
        u26.blocked = true
        u26.pogoMaid:DoCleaning()
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "Pogo Stick blocked while mounted on another object"
        })
    end))
    local u31 = nil
    u26.enableMaid:GiveTask(u9.GenericMountDismounted:connect(function(p32) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u26
            [3] = u31
        --]]
        if p32.player ~= u7.LocalPlayer then
            return nil
        end
        u26.blocked = false
        u31()
    end))
    u31 = function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u9
            [3] = u7
            [4] = u3
            [5] = u19
            [6] = u13
            [7] = u17
            [8] = u16
            [9] = u18
        --]]
        u26.pogoMaid:GiveTask(u9.GroundTouch:connect(function(p33) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u3
                [3] = u19
                [4] = u13
                [5] = u17
                [6] = u16
            --]]
            local v34 = u7.LocalPlayer.Character
            local v35 = u3
            local v36 = u19
            local v37 = {}
            local v38 = p33.velocity.Y / 113
            v37.volumeMultiplier = math.clamp(v38, 0, 1) * 0.8 + 0.2
            v35:playSound(v36, v37)
            local v39 = p33.velocity.Y * v34.PrimaryPart.AssemblyMass * -u13.ELASTICITY
            local v40 = u13.MAX_IMPULSE
            local v41 = math.min(v39, v40)
            if v41 > 0 then
                if u17:isActive(v34, u16.GROUNDED) then
                    v41 = v41 * 0.1
                end
                local u42 = Vector3.new(0, v41, 0)
                task.delay(0.1, function() --[[ Line: 97 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u42
                    --]]
                    local v43 = u7.LocalPlayer.Character
                    if v43 ~= nil then
                        local v44 = v43.PrimaryPart
                        if v44 ~= nil then
                            v44:ApplyImpulse(u42)
                        end
                    end
                end)
            end
        end))
        if u18.isLobbyServer() then
            local v45 = u7.LocalPlayer.Character
            if v45 ~= nil then
                v45 = v45:WaitForChild("Humanoid", 3)
            end
            if v45 then
                u26.pogoMaid:GiveTask(v45.StateChanged:Connect(function(p46, p47) --[[ Line: 115 ]]
                    --[[
                    Upvalues:
                        [1] = u7
                        [2] = u3
                        [3] = u19
                        [4] = u13
                    --]]
                    if p46 == Enum.HumanoidStateType.Freefall and p47 == Enum.HumanoidStateType.Landed then
                        local v48 = u7.LocalPlayer.Character
                        u3:playSound(u19, {
                            ["volumeMultiplier"] = 0.2
                        })
                        local v49 = -30 * v48.PrimaryPart.AssemblyMass * -u13.ELASTICITY
                        local v50 = u13.MAX_IMPULSE
                        local v51 = math.min(v49, v50)
                        if v51 > 0 then
                            local u52 = Vector3.new(0, v51, 0)
                            task.delay(0.1, function() --[[ Line: 124 ]]
                                --[[
                                Upvalues:
                                    [1] = u7
                                    [2] = u52
                                --]]
                                local v53 = u7.LocalPlayer.Character
                                if v53 ~= nil then
                                    local v54 = v53.PrimaryPart
                                    if v54 ~= nil then
                                        v54:ApplyImpulse(u52)
                                    end
                                end
                            end)
                        end
                    end
                end))
            end
        end
        u26:setupPogoAnimation()
        u26:setupMovementRestrictions()
    end
    if not u26.blocked then
        u31()
    end
end
function u21.onDisable(p55) --[[ Line: 145 ]]
    p55.enableMaid:DoCleaning()
    p55.pogoMaid:DoCleaning()
    p55.blocked = false
end
function u21.KnitStart(p56) --[[ Line: 150 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u14
        [4] = u19
        [5] = u20
    --]]
    u10.KnitStart(p56)
    local v57 = {
        ["sounds"] = { u19, u20 }
    }
    u4.Controllers.PreloadController:preloadForItemType(u14.POGO_STICK, v57)
end
function u21.setupPogoAnimation(p58) --[[ Line: 157 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u7
        [3] = u11
    --]]
    local u59 = u12:playAnimation(u7.LocalPlayer, u11.POGO_STICK_MOUNT, {
        ["looped"] = true
    })
    if u59 then
        u59.Priority = Enum.AnimationPriority.Action4
    end
    if u59 ~= nil then
        u59:GetMarkerReachedSignal("Pause"):Once(function() --[[ Line: 167 ]]
            --[[
            Upvalues:
                [1] = u59
            --]]
            u59:AdjustSpeed(0)
        end)
    end
    p58.pogoMaid:GiveTask(function() --[[ Line: 171 ]]
        --[[
        Upvalues:
            [1] = u59
        --]]
        local v60 = u59
        if v60 ~= nil then
            v60:Stop()
        end
        local v61 = u59
        if v61 ~= nil then
            v61:Destroy()
        end
    end)
    local u62 = u7.LocalPlayer.Character
    if u62 ~= nil then
        u62 = u62:FindFirstChildWhichIsA("Humanoid")
    end
    if u62 then
        p58.pogoMaid:GiveTask(function() --[[ Line: 190 ]]
            --[[
            Upvalues:
                [1] = u62
            --]]
            local v63 = u62
            v63.HipHeight = v63.HipHeight - 1.3
        end)
        u62.HipHeight = u62.HipHeight + 1.3
    end
end
function u21.setupMovementRestrictions(p64) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u8
        [4] = u7
    --]]
    local u65 = {
        Enum.HumanoidStateType.FallingDown,
        Enum.HumanoidStateType.Freefall,
        Enum.HumanoidStateType.Jumping,
        Enum.HumanoidStateType.Landed,
        Enum.HumanoidStateType.Running
    }
    local u66 = u5.new()
    local u67 = false
    local function u68() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u66
            [2] = u67
            [3] = u4
        --]]
        u66:DoCleaning()
        u67 = false
        u66:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["constantSpeedMultiplier"] = 1
        }))
    end
    local function u69() --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u66
            [2] = u67
            [3] = u4
        --]]
        u66:DoCleaning()
        u67 = false
        u66:GiveTask(u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
            ["constantSpeedMultiplier"] = 0
        }))
    end
    u69()
    local u70 = 0
    local u71 = 0
    p64.pogoMaid:GiveTask(u8.Heartbeat:Connect(function(p72) --[[ Line: 220 ]]
        --[[
        Upvalues:
            [1] = u70
            [2] = u7
            [3] = u65
            [4] = u71
            [5] = u69
            [6] = u68
        --]]
        u70 = u70 + p72
        if u70 < 0.1 then
            return nil
        end
        u70 = 0
        local v73 = u7.LocalPlayer.Character
        if v73 ~= nil then
            v73 = v73:FindFirstChildWhichIsA("Humanoid")
        end
        if v73 then
            local v74 = v73:GetState()
            if table.find(u65, v74) ~= nil then
                if v74 == Enum.HumanoidStateType.Running then
                    local v75 = v73.MoveDirection.Y
                    if math.abs(v75) <= 0 then
                        u71 = u71 + p72
                        if u71 >= 0.05 then
                            u69()
                        end
                        return Enum.ContextActionResult.Pass
                    else
                        u71 = 0
                        u68()
                        return Enum.ContextActionResult.Pass
                    end
                else
                    u71 = 0
                    u68()
                    return
                end
            end
            u69()
        end
    end))
    p64.pogoMaid:GiveTask(u66)
end
u4.CreateController(u21.new())
return nil