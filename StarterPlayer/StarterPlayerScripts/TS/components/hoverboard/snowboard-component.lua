local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ActionButton
local u5 = v3.AnimationUtil
local u6 = v3.GamepadAction
local u7 = v3.MathExtras
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "promise-character").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.SoundService
local u18 = v14.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent, "controllers", "global", "effect", "vignette", "vignette-meta").VignetteType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw")
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPlayerKitSkin
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-follow-util").PartFollowUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u31 = v29.isLobbyServer() and 60 or 340
local u32 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) }
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 60 ]]
        return "SnowboardComponent"
    end
})
u33.__index = u33
function u33.new(...) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(u36, p37) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u25
        [3] = u32
        [4] = u10
        [5] = u9
        [6] = u15
        [7] = u26
        [8] = u12
        [9] = u18
        [10] = u22
        [11] = u27
        [12] = u8
        [13] = u16
        [14] = u30
        [15] = u5
        [16] = u21
        [17] = u20
        [18] = u11
        [19] = u24
        [20] = u17
        [21] = u2
        [22] = u13
        [23] = u4
        [24] = u6
    --]]
    u36.hoverboard = p37
    u36.pitchPid = u28.new(-5, 5, 0.075, 0, 0)
    u36.yawPid = u28.new(-15, 15, 0.04, 0, 0)
    u36.rollPid = u28.new(-10, 10, 0.1, 0, 0)
    u36.counterDriftPid = u28.new(-10000, 10000, 2500, 1, 1)
    u36.levitationPid = u28.new(-300000, 300000, 16000, 750, 0)
    u36.movePid = u28.new(-4500, 4500, 100, 10, 0)
    u36.lastJumpTimestamp = 0
    local v38 = table.create(#u32)
    for v39, _ in u32 do
        local _ = v39 - 1
        v38[v39] = u25.ray(Ray.new())
    end
    u36.debugRays = v38
    u36.moving = false
    u36.isGoingFast = false
    u36.maid = u10.new()
    u9.Debug("Got new hoverboard at {@Location}", p37)
    u36.player = u15:GetPlayerByUserId(p37:GetAttribute("OwnerUserId"))
    if not u36.player then
        u9.Warn("Snowboard has no valid owner, not running snowboard component")
        return nil
    end
    local v40
    if u26(u36.player) ~= nil then
        v40 = u36.player.Character
    else
        v40 = u12(u36.player.Character):expect()
    end
    u36.character = v40
    if not p37:IsDescendantOf(u18) then
        return nil
    end
    if not u36.character then
        u9.Warn("Player {@Player} has no valid R15 character, not running snowboard component", u36.player)
        return nil
    end
    u36.humanoid = u36.character.Humanoid
    if not u36.humanoid then
        u9.Warn("Player {@Player} has no valid Humanoid, not running snowboard component", u36.player)
        return nil
    end
    u36.character.Archivable = true
    u36.characterClone = u36.character:Clone()
    u36.character.Archivable = false
    u36.characterClone:AddTag("SnowboardClone")
    u36.characterClone.HumanoidRootPart.Anchored = true
    local v41 = u36.characterClone:FindFirstChild(p37.Name)
    if v41 then
        v41:Destroy()
    end
    local v42 = u36.characterClone:FindFirstChild("_DamageHighlight_")
    if v42 then
        v42:Destroy()
    end
    local u43 = u22:getEntity(u36.character)
    if u43 and u43 ~= nil then
        u43:hideNametag()
    end
    u36.maid:GiveTask(function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        if u43 then
            u43:showNametag()
        end
    end)
    u36.characterClone.Parent = u18
    u36.maid:GiveTask(u27.startFollowing(u36.characterClone.HumanoidRootPart, u36.character.HumanoidRootPart, Vector3.new(0, -3.3, 0), true, false, Vector3.new(0, 180, 0)))
    local u44 = {
        ["transparency"] = 1
    }
    u8.Controllers.CharacterTransparencyController:getTransparencyModifier(u36.character):addModifier(u44)
    u36.maid:GiveTask(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u36
            [3] = u44
        --]]
        u8.Controllers.CharacterTransparencyController:getTransparencyModifier(u36.character):removeModifier(u44)
    end)
    local v45 = p37:GetAttribute("SnowboardName")
    local v46 = u16.Assets.Misc.Snowboards:FindFirstChild(v45):Clone()
    v46.Name = "VisibleSnowboard"
    for v47, v48 in v46:GetDescendants() do
        local _ = v47 - 1
        if v48:IsA("BasePart") then
            v48.CanCollide = false
        end
    end
    v46:PivotTo(p37.CFrame * (CFrame.new(0, -3, 0) * CFrame.Angles(0, 1.5707963267948966, 0)))
    v46.Parent = u18
    u30:weldParts(v46.PrimaryPart, p37)
    local u49 = u16.Assets.Effects.SnowboardParticle:Clone()
    u49:PivotTo(v46:GetPivot() * CFrame.new(0, 0, 3))
    u49.Parent = u18
    u30:weldParts(u49, v46.PrimaryPart)
    u36.maid:GiveTask(function() --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u49
        --]]
        u49:Destroy()
    end)
    u36.snowParticleEmitter = u49.Pivot.ParticleEmitter
    u36.movementTrack = u5:playAnimation(u36.characterClone, u21:getAssetId(u20.HOVER_BOARD_IDLE), {
        ["looped"] = true
    })
    if not u36:isOwner() then
        return nil
    end
    u9.Debug("Hoverboard belongs to local player")
    u8.Controllers.CameraController:registerCameraSubject("snowboard-component", 1, u36.characterClone:FindFirstChild("Humanoid"))
    u36.maid:GiveTask(function() --[[ Line: 200 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u8
        --]]
        if u36:isOwner() then
            u8.Controllers.CameraController:deregisterCameraSubject("snowboard-component")
        end
    end)
    u36.character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    local v50 = u11("Attachment", {
        ["Parent"] = p37
    })
    u36.angularVelocity = u11("AngularVelocity", {
        ["MaxTorque"] = (1 / 0),
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v50,
        ["Parent"] = p37
    })
    u36.worldSpaceForce = u11("VectorForce", {
        ["Name"] = "WorldSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = v50,
        ["Parent"] = p37
    })
    u36.localSpaceForce = u11("VectorForce", {
        ["Name"] = "LocalSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v50,
        ["Parent"] = p37
    })
    u36.levitationPid:Debug("LevitationPID", u18)
    u36.counterDriftPid:Debug("CounterDriftPID", u18)
    u36.pitchPid:Debug("PitchPID", u18)
    u36.rollPid:Debug("RollPID", u18)
    u36.movePid:Debug("MovePID", u18)
    u36.yawPid:Debug("YawPID", u18)
    local v51 = RaycastParams.new()
    v51.FilterDescendantsInstances = { u18:FindFirstChild("Map"), u18:FindFirstChild("Lobby"), u18.Terrain }
    v51.FilterType = Enum.RaycastFilterType.Whitelist
    u36.raycastParams = v51
    u36.hoverSound = u11("Sound", {
        ["Name"] = "SnowboardSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 0.5,
        ["SoundId"] = u24.SNOWBOARD_LOOP,
        ["Parent"] = u17
    })
    local v52 = p37:GetAttribute("DisableDismount")
    if v52 == nil then
        v52 = false
    end
    if not v52 then
        u36.actionButtonMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u13.createElement(u4, {
            ["actionName"] = "SnowboardDismount",
            ["text"] = "Dismount Snowboard",
            ["interactionKey"] = Enum.KeyCode.X,
            ["gamepadInteractionKey"] = u6.CloseMenu,
            ["onActivated"] = function() --[[ Name: onActivated, Line 272 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36:dismountSnowboard()
            end
        }))
    end
end
function u33.SteppedUpdate(p53, p54) --[[ Line: 316 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u18
        [3] = u32
        [4] = u31
        [5] = u8
        [6] = u19
    --]]
    if p53.snowParticleEmitter then
        if p53.hoverboard.AssemblyAngularVelocity.Magnitude < 1 then
            p53.snowParticleEmitter.Rate = 0
        else
            local v55 = u7:rangeMap(p53.hoverboard.AssemblyLinearVelocity.Magnitude, { 0, 50 }, { 50, 200 })
            local v56 = math.clamp(v55, 50, 200)
            p53.snowParticleEmitter.Rate = v56
        end
    end
    if p53:isOwner() and p53.humanoid then
        local v57 = p53.hoverboard.CFrame
        local v58 = v57.Position
        local v59 = v57:VectorToObjectSpace(p53.hoverboard.AssemblyLinearVelocity)
        local v60, _, v61 = v57:ToOrientation()
        local v62 = p53.humanoid.MoveDirection
        local v63 = -v57:VectorToObjectSpace(v62).X
        local v64 = v57.LookVector
        local v65 = v64.Z
        local v66 = v64.X
        local v67 = math.atan2(v65, v66) + 1.5707963267948966
        local v68 = p53.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
        local v69 = v57:VectorToObjectSpace(v68).X
        local v70 = -math.sign(v69)
        local v71 = v68.Magnitude * v70
        local v72 = (os.clock() - 0) / 0.5
        local v73 = math.sin(v72) * 0.1 + 0 + 5
        local v74 = -v73
        local v75 = Vector3.new(0, v74, 0)
        local v76 = 0
        local v77 = {}
        local v78 = true
        local v79 = 0
        for v80, v81 in u32 do
            local _ = v80 - 1
            local v82 = u18:Raycast((v57 * v81).Position, v75, p53.raycastParams)
            local v83
            if v82 then
                v83 = v82.Position.Y
            else
                v83 = nil
            end
            if v83 ~= nil then
                v76 = v76 + 1
                v77[v76] = v83
            end
        end
        if #v77 > 0 then
            if #v77 == 0 then
                error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
            end
            local v84 = v77[1]
            for v85 = 2, #v77 do
                local v86 = v77[v85]
                local _ = v85 - 1
                if v86 >= v84 then
                    v84 = v86
                end
            end
            v79 = p53.levitationPid:Calculate(p54, v84 + v73, v58.Y)
            local v87 = u31
            local v88 = 1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((v58.Y - v84 - 0) / (v73 - 0)) + (1 - (0.25 + 0.55 * ((v71 - 0) / (v87 - 0)))) - 0.65) / 0.9500000000000001)))
            local v89 = 1 - math.pow(v88, 3)
            if p53.hoverSound then
                p53.hoverSound.PlaybackSpeed = v89
            end
        else
            v78 = false
        end
        local v90 = v59.Z
        local v91 = p53.counterDriftPid:Calculate(p54, 0, v90)
        local v92 = 15 * v63
        local v93 = p53.pitchPid:Calculate(p54, v92, (math.deg(v61)))
        local v94 = v57:VectorToObjectSpace(v62) * Vector3.new(1, 0, 1)
        local v95 = v94.Z
        local v96 = -v94.X
        local v97 = math.atan2(v95, v96)
        local v98 = v62.Magnitude > 0.05
        local v99
        if v98 then
            local v100 = (v67 + v97 - v67 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + v67
            local v101 = math.deg(v100)
            v99 = p53.yawPid:Calculate(p54, v101, (math.deg(v67)))
        else
            v99 = 0
        end
        local v102 = 25 * (not v98 and 0 or -1 + 2 * ((v97 - -3.141592653589793) / 6.283185307179586))
        p53.rollPid:Calculate(p54, v102, (math.deg(v60)))
        local v103 = -u31 * 0.9
        local v104 = v103 + (u31 - v103) * ((v63 - -0.9) / 1.9)
        local v105 = p53.movePid:Calculate(p54, v104, v71)
        local v106 = u31
        local v107 = 0 + 0.5 * ((math.abs(v71) - 0) / (v106 - 0))
        if p53.windSound then
            p53.windSound.Volume = v107
        end
        local v108 = p53.humanoid.Jump
        local v109
        if os.clock() - p53.lastJumpTimestamp >= 0.5 then
            v109 = v108 and v78
        else
            v109 = false
        end
        if v109 then
            p53.hoverboard:ApplyImpulse(Vector3.new(0, 3250, 0))
            p53.lastJumpTimestamp = os.clock()
        end
        p53.worldSpaceForce.Force = Vector3.new(0, v79, 0)
        local v110 = p53.localSpaceForce
        local v111 = -v105
        v110.Force = Vector3.new(v111, 0, v91)
        p53.angularVelocity.AngularVelocity = Vector3.new(0, v99, v93)
        if p53.hoverboard.AssemblyLinearVelocity.Magnitude > 50 and not p53.isGoingFast then
            p53.isGoingFast = true
            u8.Controllers.VignetteController:createVignette(u19.SPEED)
        elseif p53.hoverboard.AssemblyLinearVelocity.Magnitude <= 50 and p53.isGoingFast then
            p53.isGoingFast = false
            u8.Controllers.VignetteController:destroyVignette(u19.SPEED)
        end
    else
        return nil
    end
end
function u33.dismountSnowboard(_) --[[ Line: 473 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.Client:Get("DismountSnowboard"):SendToServer()
end
function u33.Destroy(p112) --[[ Line: 476 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u19
        [3] = u9
    --]]
    local v113 = p112.maid
    if v113 ~= nil then
        v113:DoCleaning()
    end
    if p112.characterClone then
        p112.characterClone:Destroy()
    end
    if p112.hoverSound then
        p112.hoverSound:Destroy()
    end
    if p112.windSound then
        p112.windSound:Destroy()
    end
    local v114 = p112.actionButtonMaid
    if v114 ~= nil then
        v114:DoCleaning()
    end
    if not p112:isOwner() then
        return nil
    end
    u8.Controllers.VignetteController:destroyVignette(u19.SPEED)
    u9.Debug("Local hoverboard destroyed")
    local v115 = p112.character
    if v115 ~= nil then
        v115 = v115.HumanoidRootPart
    end
    if v115 then
        p112.character.HumanoidRootPart.Anchored = false
    end
    local v116 = p112.humanoid
    if v116 ~= nil then
        v116:ChangeState(Enum.HumanoidStateType.Running)
    end
end
function u33.isOwner(p117) --[[ Line: 512 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    return p117.player == u15.LocalPlayer
end
u33.Tag = "Snowboard"
return u33