local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.CollectionService
local u16 = v14.Players
local u17 = v14.ReplicatedStorage
local u18 = v14.RunService
local u19 = v14.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v21 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event")
local u22 = v21.InputActionType
local u23 = v21.MoveMountDirection
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "snowball-win-effect-util").SnowballWinEffectUtil
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u37 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "SnowballWinEffectController"
    end,
    ["__index"] = u37
})
u38.__index = u38
function u38.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u34
        [3] = u10
    --]]
    u37.constructor(p41, u34.SNOW_BALL_RIDER)
    p41.Name = "SnowballWinEffectController"
    p41.upHeld = false
    p41.downHeld = false
    p41.maid = u10.new()
end
function u38.KnitStart(u42) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u20
        [3] = u23
        [4] = u22
        [5] = u35
        [6] = u9
        [7] = u31
        [8] = u7
        [9] = u16
        [10] = u11
        [11] = u19
        [12] = u5
        [13] = u36
        [14] = u33
        [15] = u18
        [16] = u30
        [17] = u26
    --]]
    u37.KnitStart(u42)
    u42.maid:GiveTask(u20.MoveMountButtonChange:connect(function(p43) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u42
            [3] = u22
        --]]
        local v44 = p43.direction
        if v44 == u23.UP then
            u42.upHeld = p43.inputActionType == u22.PRESS
        elseif v44 == u23.DOWN then
            u42.downHeld = p43.inputActionType == u22.PRESS
        end
    end))
    u35.Client:OnEvent("SnowballRiderWinEffectSetupComplete", function(p45) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u31
            [3] = u42
            [4] = u7
            [5] = u16
            [6] = u11
            [7] = u19
            [8] = u5
            [9] = u36
            [10] = u33
            [11] = u18
            [12] = u30
            [13] = u20
            [14] = u26
        --]]
        local u46 = p45.winningPlayer
        local u47 = u9.SingleMotor.new(0)
        local u48 = u46.Character
        local v49
        if u48 == nil then
            v49 = u48
        else
            v49 = u48.PrimaryPart
        end
        if not v49 then
            return nil
        end
        local u50 = u48:FindFirstChild("Humanoid")
        if not u50 then
            return nil
        end
        local u51 = u31:getEntity(u46)
        if not u51 then
            return nil
        end
        if not u48.PrimaryPart then
            return nil
        end
        local u52 = u42:createSnowball(u46)
        if not u52 then
            return nil
        end
        u42:rideSnowball(u48, u52)
        u51:getInstance():SetAttribute("Transparency", 1)
        u51:hideNametag()
        u42.maid:GiveTask(function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u51
            --]]
            u51:getInstance():SetAttribute("Transparency", 0)
            u51:showNametag()
        end)
        u7.Controllers.FootstepsController:muteFootsteps(u46)
        if u16.LocalPlayer == u46 then
            u42:mountVehicleUI(u46)
            u42:bindControls()
            u42:orientCamera(u48.PrimaryPart)
            u7.Controllers.SnowWeatherParticleController:enable(2)
            u42:enableAbility()
        end
        u42:playEffect(u46)
        local v53 = u48.PrimaryPart
        local v54 = v53.AssemblyMass
        local v55 = u11
        local v56 = {
            ["Name"] = "AntiGrav"
        }
        local v57 = u19.Gravity * v54
        v56.Force = Vector3.new(0, v57, 0)
        v56.Parent = v53
        v55("BodyForce", v56)
        local v58 = u11("Attachment", {
            ["Parent"] = u48.PrimaryPart
        })
        u11("AngularVelocity", {
            ["MaxTorque"] = 5000,
            ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
            ["Attachment0"] = v58,
            ["Parent"] = u48.PrimaryPart
        })
        u42.maid:GiveTask(u5:playSound(u36.SNOWBOARD_AVALANCHE_LOOP, {
            ["looped"] = true,
            ["playbackSpeedMultiplier"] = 0.4,
            ["volumeMultiplier"] = 2,
            ["parent"] = u52
        }))
        local u59 = u52:GetScale()
        local u60 = nil
        u60 = u46.AttributeChanged:Connect(function(p61) --[[ Line: 152 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u46
                [3] = u59
                [4] = u52
                [5] = u60
            --]]
            if p61 ~= u33.BLOCK_COUNT_ATTRIBUTE then
                return nil
            end
            local v62 = u46:GetAttribute(u33.BLOCK_COUNT_ATTRIBUTE)
            local v63 = v62 / u33.BLOCKS_TO_REACH_MAX_SCALE
            local v64 = math.clamp(v63, 0, 1)
            u52:ScaleTo((u33.getScale(u59, v62)))
            if v64 >= 1 then
                u60:Disconnect()
            end
        end)
        u18.Heartbeat:Connect(function(p65) --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u16
                [3] = u46
                [4] = u33
                [5] = u42
                [6] = u47
                [7] = u9
                [8] = u50
                [9] = u30
                [10] = u52
            --]]
            local v66 = u48
            if v66 ~= nil then
                v66 = v66.PrimaryPart
            end
            if not v66 then
                return nil
            end
            if u16.LocalPlayer == u46 then
                local v67 = u48.PrimaryPart.CFrame
                local v68 = CFrame.new(0, 0, -u33.SPEED * p65)
                u48.PrimaryPart.CFrame = v67 * v68
                if u42.upHeld and not u42.downHeld then
                    u47:setGoal(u9.Spring.new(10))
                elseif u42.downHeld and not u42.upHeld then
                    u47:setGoal(u9.Spring.new(-10))
                else
                    u47:setGoal(u9.Spring.new(0, {
                        ["frequency"] = 1
                    }))
                end
                local v69 = u48.PrimaryPart
                local v70 = u47:getValue()
                v69.AssemblyLinearVelocity = Vector3.new(0, v70, 0)
                u50:Move(Vector3.new(0, 0, 0))
            end
            u30.setPosition(u52, u48.PrimaryPart.Position)
            local v71 = u30.rotateLocalDegrees
            local v72 = u52
            local v73 = 60 * p65
            local v74 = 40 * p65
            local v75 = 10 * p65
            v71(v72, (Vector3.new(v73, v74, v75)))
        end)
        u20.AbilityUsed:connect(function(p76) --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u5
                [3] = u36
            --]]
            if p76.ability ~= u26.SNOWBAL_RIDER_WIN_EFFECT then
                return nil
            end
            u5:playSound(u36.SNOWBALL_LAUNCHER_POWER_SHOT, {
                ["volumeMultiplier"] = 1.2,
                ["rollOffMinDistance"] = 150,
                ["rollOffMaxDistance"] = 450,
                ["position"] = p76.userCharacter:GetPivot().Position
            })
        end)
        u20.ProjectileHit:connect(function(p77) --[[ Line: 205 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u7
                [3] = u19
            --]]
            if p77.projectileType ~= u33.ABILITY_PROJECTILE_TYPE then
                return nil
            end
            u7.Controllers.ScreenShakeController:shake(p77.hitData.hitCFrame.Position, u19.CurrentCamera.CFrame.Position - p77.hitData.hitCFrame.Position, {
                ["magnitude"] = 1.8,
                ["duration"] = 0.4
            })
        end)
    end)
end
function u38.onWin(_, _) --[[ Line: 220 ]] end
function u38.mountVehicleUI(p78, p79) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u12
        [4] = u24
    --]]
    if u4.isMobileControls() then
        u8.Controllers.MobileUiController:toggleMountMovementControls(true)
        p78.maid:GiveTask(function() --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u80 = u12.mount(u12.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u12.createElement(u24) }), p79:WaitForChild("PlayerGui"))
        p78.maid:GiveTask(function() --[[ Line: 234 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u80
            --]]
            u12.unmount(u80)
        end)
    end
end
function u38.orientCamera(_, p81) --[[ Line: 239 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u16
    --]]
    if u19.CurrentCamera then
        u19.CurrentCamera.CameraSubject = p81
        u16.LocalPlayer.CameraMaxZoomDistance = 100
        u16.LocalPlayer.CameraMinZoomDistance = 60
    end
end
function u38.bindControls(u82) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v83 = u25.bindUpDownControls()
    u82.maid:GiveTask(v83.bindActionMaid)
    u82.maid:GiveTask(v83.shouldFlyUpRef.Changed:Connect(function(p84) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82.upHeld = p84
        return u82.upHeld
    end))
    u82.maid:GiveTask(v83.shouldFlyDownRef.Changed:Connect(function(p85) --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u82
        --]]
        u82.downHeld = p85
        return u82.downHeld
    end))
end
function u38.createSnowball(_, p86) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u32
        [3] = u19
        [4] = u15
        [5] = u13
        [6] = u29
    --]]
    local v87 = u17.Assets.Effects.snowball_rider
    local v88 = u32.cloneItemIntoModel(v87)
    local v89 = v88:FindFirstChildWhichIsA("BasePart")
    local v90 = p86.Character
    local v91
    if v90 == nil then
        v91 = v90
    else
        v91 = v90:FindFirstChildWhichIsA("Humanoid")
    end
    local v92
    if v90 == nil then
        v92 = v90
    else
        v92 = v90.PrimaryPart
    end
    if not (v89 and (v90 and (v91 and v92))) then
        v88:Destroy()
        return nil
    end
    v88.Parent = u19
    local v93 = p86.UserId
    v88.Name = "DisguisedPlayerBlock_" .. tostring(v93)
    for v94, v95 in v88:GetDescendants() do
        local _ = v94 - 1
        if v95:IsA("BasePart") then
            v95.CanCollide = false
            v95.CanQuery = false
            v95.CanQuery = false
            v95.Anchored = true
        end
    end
    u15:AddTag(v88, "DontBlockSwordRaycast")
    u13(v88, u29 / 2.8 * 2)
    local v96 = v92.Size.Y / 2 + v91.HipHeight - u29 / 2
    v88:PivotTo(v92.CFrame - Vector3.new(0, v96, 0))
    return v88
end
function u38.rideSnowball(p97, p98, p99) --[[ Line: 300 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u28
        [3] = u27
    --]]
    p98.Archivable = true
    local v100 = p98:Clone()
    v100.Parent = p99
    v100.Name = "Conductor"
    for v101, v102 in v100:GetDescendants() do
        local _ = v101 - 1
        if v102:IsA("Part") then
            v102.CanCollide = false
            v102.CanQuery = false
            v102.CanTouch = false
        end
    end
    p97.maid:GiveTask(v100)
    v100:PivotTo(p99.Handle.Seat:GetPivot() + Vector3.new(0, 2.5, 0))
    local v103 = v100.PrimaryPart
    local v104 = u11("WeldConstraint", {
        ["Parent"] = p99.Handle.Seat,
        ["Part0"] = p99.Handle.Seat,
        ["Part1"] = v103
    })
    p97.maid:GiveTask(v104)
    local u105 = v100:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation((u11("Animation", {
        ["AnimationId"] = u28:getAssetId(u27.R15_SIT)
    })))
    u105:Play()
    p97.maid:GiveTask(function() --[[ Line: 337 ]]
        --[[
        Upvalues:
            [1] = u105
        --]]
        u105:Stop()
        u105:Destroy()
    end)
end
function u38.playEffect(_, p106) --[[ Line: 342 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u5
    --]]
    local v107 = p106.Character
    if v107 ~= nil then
        v107 = v107.PrimaryPart
        if v107 ~= nil then
            v107 = v107.Position
        end
    end
    if not v107 then
        return nil
    end
    u5:playSound(u36.MIMIC_HIDE, {
        ["volumeMultiplier"] = 0.25,
        ["position"] = v107
    })
end
function u38.enableAbility(_) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u26
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u26.SNOWBAL_RIDER_WIN_EFFECT, {
        ["abilityType"] = "MiscPrimary",
        ["clickToTrigger"] = true,
        ["abilityButton"] = {
            ["icon"] = "rbxassetid://7911163294"
        }
    }):expect()
end
u7.CreateController(u38.new())
return nil