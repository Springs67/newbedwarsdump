local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v19 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event")
local u20 = v19.InputActionType
local u21 = v19.MoveMountDirection
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u33 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 41 ]]
        return "TrainWinEffectController"
    end,
    ["__index"] = u33
})
u34.__index = u34
function u34.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u29
        [3] = u10
    --]]
    u33.constructor(p37, u29.TRAIN)
    p37.Name = "TrainWinEffectController"
    p37.upHeld = false
    p37.downHeld = false
    p37.maid = u10.new()
end
function u34.KnitStart(u38) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u18
        [3] = u24
        [4] = u11
        [5] = u31
        [6] = u21
        [7] = u20
        [8] = u30
        [9] = u14
        [10] = u9
        [11] = u27
        [12] = u15
        [13] = u25
        [14] = u17
        [15] = u16
    --]]
    u33.KnitStart(u38)
    u18.AbilityUsed:connect(function(p39) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
            [3] = u31
        --]]
        if p39:isCancelled() then
            return nil
        end
        if p39.ability ~= u24.TRAIN_WHISTLE then
            return nil
        end
        local u40 = u11("Sound", {
            ["Name"] = "WhistleSound",
            ["Volume"] = 1,
            ["RollOffMaxDistance"] = 150,
            ["RollOffMinDistance"] = 25,
            ["SoundId"] = u31.TRAIN_WHISTLE,
            ["Parent"] = p39.userCharacter.PrimaryPart
        })
        u40:Play()
        u40.Ended:Connect(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            return u40:Destroy()
        end)
    end)
    u38.maid:GiveTask(u18.MoveMountButtonChange:connect(function(p41) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u38
            [3] = u20
        --]]
        local v42 = p41.direction
        if v42 == u21.UP then
            u38.upHeld = p41.inputActionType == u20.PRESS
        elseif v42 == u21.DOWN then
            u38.downHeld = p41.inputActionType == u20.PRESS
        end
    end))
    u30.Client:OnEvent("TrainWinEffectSetupComplete", function(p43) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u18
            [3] = u24
            [4] = u9
            [5] = u27
            [6] = u15
            [7] = u38
            [8] = u25
            [9] = u11
            [10] = u31
            [11] = u17
            [12] = u16
        --]]
        local u44 = p43.winningPlayer
        if u44 == u14.LocalPlayer then
            u18.CanUseLocalAbility:connect(function(p45) --[[ Line: 96 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                if p45:isCancelled() then
                    return nil
                end
                if p45.ability ~= u24.TRAIN_WHISTLE then
                    p45:setCancelled(true)
                    return nil
                end
            end)
        end
        local u46 = u9.SingleMotor.new(0)
        local u47 = u44.Character
        local v48
        if u47 == nil then
            v48 = u47
        else
            v48 = u47.PrimaryPart
        end
        if not v48 then
            return nil
        end
        local u49 = u47:FindFirstChild("Humanoid")
        if not u49 then
            return nil
        end
        local v50 = u27:getEntity(u44)
        if not v50 then
            return nil
        end
        local u51 = u15.Assets.Misc.TrainEngine:Clone()
        if not u51.PrimaryPart then
            return nil
        end
        u38:setUpTrainCabin(u51, u47.HumanoidRootPart.CFrame, {
            ["type"] = u25.TRAIN_ENGINE_LOOP,
            ["animator"] = u51.AnimationController.Animator
        })
        local u52 = u15.Assets.Misc.TrainCoalCabin:Clone()
        if not u52.PrimaryPart then
            return nil
        end
        u38:setUpTrainCabin(u52, u47.HumanoidRootPart.CFrame * CFrame.new(0, 0, 20), {
            ["type"] = u25.TRAIN_COAL_CABIN_LOOP,
            ["animator"] = u52.AnimationController.Animator
        })
        local u53 = u15.Assets.Misc.TrainPassengerCabin:Clone()
        if not u53.PrimaryPart then
            return nil
        end
        u38:setUpTrainCabin(u53, u47.HumanoidRootPart.CFrame * CFrame.new(0, 0, 40), {
            ["type"] = u25.TRAIN_PASSANGER_CABIN_LOOP,
            ["animator"] = u53.AnimationController.Animator
        })
        local u54 = u15.Assets.Misc.TrainPassengerCabin:Clone()
        if not u54.PrimaryPart then
            return nil
        end
        u38:setUpTrainCabin(u54, u47.HumanoidRootPart.CFrame * CFrame.new(0, 0, 60), {
            ["type"] = u25.TRAIN_PASSANGER_CABIN_LOOP,
            ["animator"] = u54.AnimationController.Animator
        })
        u11("Sound", {
            ["Name"] = "ChuggaSound",
            ["Looped"] = true,
            ["Volume"] = 0.2,
            ["RollOffMaxDistance"] = 150,
            ["RollOffMinDistance"] = 25,
            ["SoundId"] = u31.TRAIN_MOVEMENT_LOOP,
            ["Parent"] = u47.PrimaryPart
        }):Play()
        if u14.LocalPlayer == u44 then
            u38:mountTrainUi(u44)
            u38:bindTrainControls()
            u38:orientCamera(u51.PrimaryPart)
            u38:setUpWhistleAbility()
        end
        local u55 = u47:Clone()
        if u55 then
            u55.Parent = u17
            u55.Name = "Conductor"
        end
        v50:getInstance():SetAttribute("Transparency", 1)
        v50:hideNametag()
        local v56 = u47.PrimaryPart
        local v57 = v56.AssemblyMass
        local v58 = u11
        local v59 = {
            ["Name"] = "AntiGrav"
        }
        local v60 = u17.Gravity * v57
        v59.Force = Vector3.new(0, v60, 0)
        v59.Parent = v56
        v58("BodyForce", v59)
        local v61 = u11("Attachment", {
            ["Parent"] = u47.PrimaryPart
        })
        u11("AngularVelocity", {
            ["MaxTorque"] = 5000,
            ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
            ["Attachment0"] = v61,
            ["Parent"] = u47.PrimaryPart
        })
        local u62 = u17:GetServerTimeNow()
        local u63 = u47.PrimaryPart.CFrame
        local u64 = u51.PrimaryPart.CFrame
        local u65 = u52.PrimaryPart.CFrame
        local u66 = u53.PrimaryPart.CFrame
        local u67 = u54.PrimaryPart.CFrame
        u16.Heartbeat:Connect(function(p68) --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u47
                [2] = u17
                [3] = u62
                [4] = u51
                [5] = u64
                [6] = u65
                [7] = u52
                [8] = u66
                [9] = u53
                [10] = u67
                [11] = u54
                [12] = u63
                [13] = u55
                [14] = u14
                [15] = u44
                [16] = u38
                [17] = u46
                [18] = u9
                [19] = u49
            --]]
            local v69 = u47
            if v69 ~= nil then
                v69 = v69.PrimaryPart
            end
            if not v69 then
                return nil
            end
            local v70 = u17:GetServerTimeNow()
            local v71 = (v70 - u62) / 0.6
            u51:PivotTo(u47.PrimaryPart.CFrame)
            if u64 and u65 then
                u52:PivotTo(u65:Lerp(u64 + Vector3.new(0, -0.5, 0), v71))
            end
            if u65 and u66 then
                u53:PivotTo(u66:Lerp(u65 + Vector3.new(0, -1, 0), v71))
            end
            if u66 and u67 then
                u54:PivotTo(u67:Lerp(u66, v71))
            end
            if u62 + 0.6 <= v70 then
                u62 = v70
                u63 = u47.PrimaryPart.CFrame
                if not u51.PrimaryPart then
                    return nil
                end
                if not u52.PrimaryPart then
                    return nil
                end
                if not u53.PrimaryPart then
                    return nil
                end
                if not u54.PrimaryPart then
                    return nil
                end
                u64 = u51.PrimaryPart.CFrame
                u65 = u52.PrimaryPart.CFrame
                u66 = u53.PrimaryPart.CFrame
                u67 = u54.PrimaryPart.CFrame
            end
            local v72 = u55
            if v72 ~= nil then
                v72 = v72.PrimaryPart
            end
            if v72 then
                local v73 = u51:FindFirstChild("CharacterPosition")
                local v74 = u55:GetExtentsSize().Y / 2
                local v75 = v73.CFrame
                local v76 = v74 - 0.3
                local v77 = Vector3.new(0, v76, 0)
                u55.PrimaryPart.CFrame = v75 + v77
            end
            if u14.LocalPlayer == u44 then
                local v78 = u47.PrimaryPart.CFrame
                local v79 = CFrame.new(0, 0, -35 * p68)
                u47.PrimaryPart.CFrame = v78 * v79
                if u38.upHeld and not u38.downHeld then
                    u46:setGoal(u9.Spring.new(10))
                elseif u38.downHeld and not u38.upHeld then
                    u46:setGoal(u9.Spring.new(-10))
                else
                    u46:setGoal(u9.Spring.new(0, {
                        ["frequency"] = 1
                    }))
                end
                local v80 = u47.PrimaryPart
                local v81 = u46:getValue()
                v80.AssemblyLinearVelocity = Vector3.new(0, v81, 0)
                u49:Move(Vector3.new(0, 0, 0))
            end
        end)
    end)
end
function u34.onWin(_, _) --[[ Line: 336 ]] end
function u34.seatPassenger(_, p82, p83, p84) --[[ Line: 338 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u32
    --]]
    p82.Parent = u17
    if p83 then
        p82:PivotTo(p83.CFrame + p84)
        local v85 = 0
        local v86 = {}
        for v87, v88 in p82:GetDescendants() do
            local _ = v87 - 1
            if v88:IsA("BasePart") == true then
                v85 = v85 + 1
                v86[v85] = v88
            end
        end
        for _, v89 in v86 do
            v89.CanCollide = false
            v89.CanTouch = false
            u32:weldParts(p83, v89)
        end
    end
end
function u34.setUpWhistleAbility(_) --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u24
        [3] = u28
    --]]
    local v90 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v91 = u24.TRAIN_WHISTLE
    local v92 = {
        ["abilityType"] = "MiscPrimary",
        ["abilityButton"] = {
            ["icon"] = u28.TRAIN_WHISTLE
        }
    }
    v90:enableAbility(v91, v92)
end
function u34.setUpTrainCabin(_, p93, p94, p95) --[[ Line: 375 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u11
        [3] = u4
        [4] = u26
    --]]
    if not p93.PrimaryPart then
        return nil
    end
    p93.Parent = u17
    p93.PrimaryPart.CFrame = p94
    for v96, v97 in p93:GetDescendants() do
        local _ = v96 - 1
        if v97:IsA("BasePart") then
            v97.CanCollide = false
            v97.CanTouch = false
        end
    end
    local v98 = u11
    local v99 = {
        ["Name"] = "CabinAntiGrav"
    }
    local v100 = 10 * p93.PrimaryPart.AssemblyMass
    v99.Force = Vector3.new(0, v100, 0)
    v99.Parent = p93
    v98("VectorForce", v99)
    if p95 then
        u4:playAnimation(p95.animator, u26:getAssetId(p95.type), {
            ["looped"] = true
        })
    end
end
function u34.mountTrainUi(p101, p102) --[[ Line: 403 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u12
        [4] = u22
    --]]
    if u5.isMobileControls() then
        u8.Controllers.MobileUiController:toggleMountMovementControls(true)
        p101.maid:GiveTask(function() --[[ Line: 406 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u103 = u12.mount(u12.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u12.createElement(u22) }), p102:WaitForChild("PlayerGui"))
        p101.maid:GiveTask(function() --[[ Line: 415 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u103
            --]]
            u12.unmount(u103)
        end)
    end
end
function u34.orientCamera(_, p104) --[[ Line: 420 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
    --]]
    if u17.CurrentCamera then
        u17.CurrentCamera.CameraSubject = p104
        u14.LocalPlayer.CameraMaxZoomDistance = 100
        u14.LocalPlayer.CameraMinZoomDistance = 60
    end
end
function u34.bindTrainControls(u105) --[[ Line: 427 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v106 = u23.bindUpDownControls()
    u105.maid:GiveTask(v106.bindActionMaid)
    u105.maid:GiveTask(v106.shouldFlyUpRef.Changed:Connect(function(p107) --[[ Line: 430 ]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105.upHeld = p107
        return u105.upHeld
    end))
    u105.maid:GiveTask(v106.shouldFlyDownRef.Changed:Connect(function(p108) --[[ Line: 434 ]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105.downHeld = p108
        return u105.downHeld
    end))
end
v7.CreateController(u34.new())
return nil