local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.WatchCharacter
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Players
local u13 = v11.ReplicatedStorage
local u14 = v11.RunService
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u32 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u33 = u1.import(script, script.Parent, "momentum-bar-ui").momentumChanged
local u34 = {
    ["blockSprint"] = true
}
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "GlacialSkaterController"
    end,
    ["__index"] = u32
})
u35.__index = u35
function u35.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u21
        [3] = u26
        [4] = u23
        [5] = u19
        [6] = u22
        [7] = u10
    --]]
    u32.constructor(p38, u21.GLACIAL_SKATER, {
        ["sounds"] = {
            u26.ICE_SKATING_FOOTSTEP_1,
            u26.ICE_SKATING_FOOTSTEP_2,
            u26.ICE_SKATING_FOOTSTEP_3,
            u26.ICE_SKATING_FOOTSTEP_4,
            u26.ICE_SKATING_FOOTSTEP_5,
            u26.ICE_SKATING_FOOTSTEP_6,
            u26.ICE_SKATING_DODGE
        },
        ["imageIds"] = { u23.SKATING_ON_ICE, u23.SKATING_MAX_SPEED, u23.SKATING_JUMP },
        ["animations"] = {
            u19.SKATING_BUNNY_HOP,
            u19.SKATING_WALK,
            u19.SKATING_SLOW,
            u19.SKATING_MEDIUIM,
            u19.SKATING_FAST,
            u19.SKATING_SPIN_JUMP
        }
    })
    p38.Name = "GlacialSkaterController"
    p38.momentum = 0
    p38.momentumDrop = u22.INITIAL_MOMENTUM_DROP
    p38.lastMomentumReport = 0
    p38.isLanded = false
    p38.momentumTickElapsedTime = 0
    p38.momentumIncreasingElapsedTime = 0
    p38.serverMomentumUpdateElapsedTime = 0
    p38.lastDodgeTime = 0
    p38.momentumMaid = u10.new()
end
function u35.KnitStart(p39) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    u32.KnitStart(p39)
end
function u35.onKitLocalActivated(u40, u41) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u12
        [3] = u9
        [4] = u25
        [5] = u30
        [6] = u21
        [7] = u7
        [8] = u24
        [9] = u17
        [10] = u34
        [11] = u22
        [12] = u14
        [13] = u20
        [14] = u28
        [15] = u27
    --]]
    u40:updateMomentum(0, "newValue")
    u1.Promise.new(function(p42, p43) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        local v44 = u12.LocalPlayer.Character
        if v44 ~= nil then
            v44 = v44:WaitForChild("Humanoid")
        end
        if v44 then
            return p42(v44)
        else
            return p43("Could not get local player humanoid")
        end
    end):timeout(10):andThen(function(p45) --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        u40.isLanded = true
        u40:setupHumanoidStateChanges(p45)
    end):catch(function(p46) --[[ Line: 92 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u9
        --]]
        return u40.logger:Error("Failed to setup local Krystal player on match start with reason: " .. u9(p46))
    end)
    u41:GiveTask(u25.Client:Get("ServerMomentumUpdate"):Connect(function(p47) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        if p47.momentumIncrement < 0 then
            u40.momentumIncreasingElapsedTime = 0
        end
        u40:updateMomentum(p47.momentumIncrement, "increment")
    end))
    u41:GiveTask(u12.LocalPlayer.CharacterAdded:Connect(function(u48) --[[ Line: 102 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u12
            [3] = u21
            [4] = u40
            [5] = u1
            [6] = u7
            [7] = u24
            [8] = u41
            [9] = u17
            [10] = u34
            [11] = u9
        --]]
        if not u30(u12.LocalPlayer, u21.GLACIAL_SKATER) then
            return nil
        end
        u40:updateMomentum(0, "newValue")
        u40.isLanded = true
        u40.momentumIncreasingElapsedTime = 0
        u1.Promise.new(function(p49) --[[ Line: 109 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            p49((u48:WaitForChild("Humanoid")))
        end):timeout(10):andThen(function(u50) --[[ Line: 113 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u24
                [3] = u40
                [4] = u41
                [5] = u17
                [6] = u34
            --]]
            if u7.Controllers.MatchController:getMatchState() == u24.RUNNING then
                u40:setupHumanoidStateChanges(u50)
            else
                u41:GiveTask(u17.MatchStateChange:connect(function(p51) --[[ Line: 117 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u40
                        [3] = u50
                    --]]
                    if p51.matchState == u24.RUNNING then
                        u40:setupHumanoidStateChanges(u50)
                    end
                end))
            end
            u7.Controllers.SprintController:getMovementStatusModifier():addModifier(u34)
            u41:GiveTask(function() --[[ Line: 125 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u34
                --]]
                return u7.Controllers.SprintController:getMovementStatusModifier():removeModifier(u34)
            end)
        end):catch(function(p52) --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u9
            --]]
            return u40.logger:Error("Failed to setup local Krystal player momentum with reason: " .. u9(p52))
        end)
    end))
    u41:GiveTask(u12.LocalPlayer.CharacterAdded:Connect(function(u53) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u1
            [3] = u7
            [4] = u24
            [5] = u41
            [6] = u17
            [7] = u34
            [8] = u9
        --]]
        u40:updateMomentum(0, "newValue")
        u40.isLanded = true
        u40.momentumIncreasingElapsedTime = 0
        u1.Promise.new(function(p54) --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            p54((u53:WaitForChild("Humanoid")))
        end):timeout(10):andThen(function(u55) --[[ Line: 141 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u24
                [3] = u40
                [4] = u41
                [5] = u17
                [6] = u34
            --]]
            if u7.Controllers.MatchController:getMatchState() == u24.RUNNING then
                u40:setupHumanoidStateChanges(u55)
            else
                u41:GiveTask(u17.MatchStateChange:connect(function(p56) --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u24
                        [2] = u40
                        [3] = u55
                    --]]
                    if p56.matchState == u24.RUNNING then
                        u40:setupHumanoidStateChanges(u55)
                    end
                end))
            end
            u7.Controllers.SprintController:getMovementStatusModifier():addModifier(u34)
            u41:GiveTask(function() --[[ Line: 153 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u34
                --]]
                return u7.Controllers.SprintController:getMovementStatusModifier():removeModifier(u34)
            end)
        end):catch(function(p57) --[[ Line: 157 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u9
            --]]
            return u40.logger:Error("Failed to setup local Krystal player momentum with reason: " .. u9(p57))
        end)
    end))
    u41:GiveTask(u17.BeforeSwordSwing:connect(function(p58) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u22
        --]]
        if u40.lastDodgeTime + u22.DODGE_BUFFER_TIME > os.clock() then
            p58:setCancelled(true)
        end
    end))
    local v59 = u12.LocalPlayer.Character
    if v59 ~= nil then
        v59 = v59:GetPivot().Position
    end
    local u60 = v59 == nil and Vector3.new(0, 0, 0) or v59
    u41:GiveTask(u14.Heartbeat:Connect(function(p61) --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u17
            [3] = u22
            [4] = u12
            [5] = u60
            [6] = u20
            [7] = u28
            [8] = u27
        --]]
        local v62 = u40
        v62.momentumTickElapsedTime = v62.momentumTickElapsedTime + p61
        local v63 = u40
        v63.serverMomentumUpdateElapsedTime = v63.serverMomentumUpdateElapsedTime + p61
        if u17.KitProgressModifierCheck:fire(u22.MOMENTUM_TICK_RATE_SECONDS).amount <= u40.momentumTickElapsedTime and u40.isLanded then
            local v64 = u12.LocalPlayer.Character
            if v64 ~= nil then
                v64 = (v64:GetPivot().Position - u60).Magnitude
            end
            local v65 = (v64 == nil and 0 or v64) * (1 / u40.momentumTickElapsedTime)
            local v66 = u12.LocalPlayer.Character
            if v66 ~= nil then
                v66 = v66:GetPivot().Position
            end
            u60 = v66 == nil and Vector3.new(0, 0, 0) or v66
            u40.momentumTickElapsedTime = 0
            if v65 > 100 then
                return nil
            end
            if u22.MOVEMENT_SPEED_MIN <= v65 then
                local v67 = u40
                v67.momentumIncreasingElapsedTime = v67.momentumIncreasingElapsedTime + p61
                u40.momentumDrop = u22.INITIAL_MOMENTUM_DROP
                local v68 = u22.getMomentumDeltaForElapsedTime(u40.momentumIncreasingElapsedTime)
                local v69 = u20:getLocalPlayerEntity()
                if v69 ~= nil then
                    v69 = v69:getInstance()
                end
                if v69 and u28:isActive(v69, u27.ON_ICE) then
                    v68 = v68 * u22.ON_ICE_MOMENTUM_MULTIPLIER
                end
                u40:updateMomentum(v68, "increment")
                return
            end
            u40.momentumIncreasingElapsedTime = 0
            if u40.momentum > 0 then
                local v70 = u40
                v70.momentumDrop = v70.momentumDrop * u22.MOMENTUM_DROP_MULTIPLIER_ON_TICK
                u40:updateMomentum(u40.momentumDrop, "increment")
            end
        end
    end))
    u7.Controllers.MomentumBarUiController:mountMomentumBarUi()
    u41:GiveTask(u40.momentumMaid)
end
function u35.onKitLocalDeactivated(_) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.Controllers.MomentumBarUiController:unmountMomentumBarUi()
end
function u35.onKitReplicationActivated(u71, p72) --[[ Line: 233 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u13
        [4] = u29
        [5] = u31
    --]]
    p72:GiveTask((u5(function(u73, u74, _) --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u71
            [3] = u13
            [4] = u29
            [5] = u31
        --]]
        task.spawn(function() --[[ Line: 236 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u73
                [3] = u71
                [4] = u74
                [5] = u13
                [6] = u29
                [7] = u31
            --]]
            if u8.Controllers.KitController:getPrimaryActiveKit(u73) == u71.kit and not u8.Controllers.KitController:isUsingKitModel(u73) then
                u74:WaitForChild("Humanoid")
                for v75, v76 in u13.Assets.Misc.IceSkates:GetChildren() do
                    local _ = v75 - 1
                    if v76:IsA("Accessory") then
                        u29:addAccessory(u74, (v76:Clone()))
                    end
                end
                u31:weldCharacterAccessories(u74)
            end
        end)
    end)))
end
function u35.onKitReplicationDeactivated(_) --[[ Line: 257 ]] end
function u35.onInnateAbilityEnabled(_, p77, _) --[[ Line: 259 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u2
        [3] = u4
    --]]
    local v78 = p77.abilityId == u18.SKATING_JUMP and u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u18.SKATING_JUMP)
    if v78 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v78, u4.DISABLED)
    end
end
function u35.onAbilityUsed(p79, p80, p81) --[[ Line: 267 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u7
    --]]
    if p81.ability == u18.SKATING_JUMP and not p81:isCancelled() then
        p79.lastDodgeTime = os.clock()
        local v82 = p80:FindFirstChildWhichIsA("Humanoid")
        if v82 ~= nil then
            v82:ChangeState(Enum.HumanoidStateType.Jumping)
        end
        u7.Controllers.GlacialSkaterAnimationController:playJumpAnimation(p80)
    end
end
function u35.updateMomentum(p83, p84, p85) --[[ Line: 278 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u33
        [3] = u20
        [4] = u28
        [5] = u27
        [6] = u25
        [7] = u2
        [8] = u18
        [9] = u4
        [10] = u7
    --]]
    if p85 == "increment" then
        local v86 = p83.momentum + p84
        local v87 = u22.MAX_MOMENTUM
        p83.momentum = math.clamp(v86, 0, v87)
    else
        local v88 = u22.MAX_MOMENTUM
        p83.momentum = math.clamp(p84, 0, v88)
    end
    u33:Fire(p83.momentum)
    local v89 = u20:getLocalPlayerEntity()
    if v89 ~= nil then
        v89 = v89:getInstance()
    end
    if not v89 then
        return nil
    end
    if (not u28:isActive(v89, u27.HIGH_SPEED_SKATING) or p83.momentum >= u22.HIGH_SPEED_THRESHOLD) and ((u28:isActive(v89, u27.HIGH_SPEED_SKATING) or p83.momentum < u22.HIGH_SPEED_THRESHOLD) and ((p83.momentum < u22.DODGE_THRESHOLD or p83.lastMomentumReport >= u22.DODGE_THRESHOLD) and (p83.momentum >= u22.DODGE_THRESHOLD or p83.lastMomentumReport < u22.DODGE_THRESHOLD))) then
        local v90 = p83.lastMomentumReport - p83.momentum
        if math.abs(v90) < u22.MOMENTUM_REPORT_DELTA and p83.serverMomentumUpdateElapsedTime < 1.5 then
            ::l18::
            local v91 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u18.SKATING_JUMP)
            if v91 then
                if p83.momentum >= u22.DODGE_THRESHOLD then
                    if v91.abilityState ~= u4.READY and v91.abilityState ~= u4.ON_COOLDOWN then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v91, u4.READY)
                    end
                elseif v91.abilityState ~= u4.DISABLED then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(v91, u4.DISABLED)
                end
            end
            p83:handleFovBreakpoints()
            u7.Controllers.SprintController:setSpeed(u22.getMomentumSpeed(p83.momentum))
            return
        end
    end
    p83.serverMomentumUpdateElapsedTime = 0
    p83.lastMomentumReport = p83.momentum
    u25.Client:Get("MomentumUpdate"):SendToServer({
        ["momentumValue"] = p83.momentum
    })
    goto l18
end
function u35.handleFovBreakpoints(p92) --[[ Line: 319 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u7
        [3] = u15
        [4] = u16
    --]]
    local v93 = u22.getFovMultiplier(p92.momentum)
    local v94 = u7.Controllers.FovController:getBaseFOV() * v93
    if p92.targetFov ~= v94 then
        local v95 = p92.fovTween
        if v95 ~= nil then
            v95:Cancel()
        end
        p92.targetFov = v94
        p92.fovTween = u15:Create(u16.CurrentCamera, TweenInfo.new(0.2, Enum.EasingStyle.Linear), {
            ["FieldOfView"] = v94
        })
        p92.fovTween:Play()
    end
end
function u35.setupHumanoidStateChanges(u96, p97) --[[ Line: 334 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u25
    --]]
    u96.momentumMaid:DoCleaning()
    u96.momentumMaid:GiveTask(p97.StateChanged:Connect(function(_, p98) --[[ Line: 336 ]]
        --[[
        Upvalues:
            [1] = u96
            [2] = u22
            [3] = u25
        --]]
        u96.isLanded = p98 == Enum.HumanoidStateType.Landed and true or p98 == Enum.HumanoidStateType.Running
        if p98 == Enum.HumanoidStateType.Jumping then
            if u96.momentum >= u22.DODGE_THRESHOLD then
                u25.Client:Get("MomentumUpdate"):SendToServer({
                    ["momentumValue"] = u96.momentum
                })
            end
            u96:updateMomentum(-u22.JUMPING_MOMENTUM_COST, "increment")
            u96.momentumIncreasingElapsedTime = 0
        end
    end))
end
u7.CreateController(u35.new())
return nil