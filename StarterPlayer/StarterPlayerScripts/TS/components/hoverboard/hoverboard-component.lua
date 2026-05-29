local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ActionButton
local u5 = v3.GamepadAction
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "promise-character").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local v11 = v10.Players
local u12 = v10.SoundService
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid")
local u17 = v11.LocalPlayer
local u18 = { CFrame.new(-2, 0, 0), CFrame.new(0, 0, 0), CFrame.new(2, 0, 0) }
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "HoverboardComponent"
    end
})
u19.__index = u19
function u19.new(...) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(u22, p23) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u18
        [4] = u6
        [5] = u8
        [6] = u17
        [7] = u7
        [8] = u13
        [9] = u12
        [10] = u2
        [11] = u9
        [12] = u4
        [13] = u5
    --]]
    u22.hoverboard = p23
    u22.pitchPid = u16.new(-5, 5, 0.075, 0, 0)
    u22.yawPid = u16.new(-15, 15, 0.04, 0, 0)
    u22.rollPid = u16.new(-10, 10, 0.1, 0, 0)
    u22.counterDriftPid = u16.new(-10000, 10000, 2500, 1, 1)
    u22.levitationPid = u16.new(-300000, 300000, 16000, 750, 0)
    u22.movePid = u16.new(-4500, 4500, 100, 10, 0)
    u22.lastJumpTimestamp = 0
    local v24 = table.create(#u18)
    for v25, _ in u18 do
        local _ = v25 - 1
        v24[v25] = u15.ray(Ray.new())
    end
    u22.debugRays = v24
    u6.Debug("Got new hoverboard at {@Location}", p23)
    u22.character = u8(u17.Character):expect()
    if not u22:isOwn() then
        return nil
    end
    u6.Debug("Hoverboard belongs to local player")
    u22.character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    local v26 = u7("Attachment", {
        ["Parent"] = p23
    })
    u22.angularVelocity = u7("AngularVelocity", {
        ["MaxTorque"] = (1 / 0),
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v26,
        ["Parent"] = p23
    })
    u22.worldSpaceForce = u7("VectorForce", {
        ["Name"] = "WorldSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.World,
        ["Attachment0"] = v26,
        ["Parent"] = p23
    })
    u22.localSpaceForce = u7("VectorForce", {
        ["Name"] = "LocalSpaceForce",
        ["ApplyAtCenterOfMass"] = true,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v26,
        ["Parent"] = p23
    })
    u22.levitationPid:Debug("LevitationPID", u13)
    u22.counterDriftPid:Debug("CounterDriftPID", u13)
    u22.pitchPid:Debug("PitchPID", u13)
    u22.rollPid:Debug("RollPID", u13)
    u22.movePid:Debug("MovePID", u13)
    u22.yawPid:Debug("YawPID", u13)
    local v27 = RaycastParams.new()
    v27.FilterDescendantsInstances = { u13:FindFirstChild("Map"), u13:FindFirstChild("Lobby"), u13.Terrain }
    v27.FilterType = Enum.RaycastFilterType.Whitelist
    u22.raycastParams = v27
    u22.hoverSound = u7("Sound", {
        ["Name"] = "HoverSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 1,
        ["SoundId"] = "rbxassetid://" .. tostring(7910584261),
        ["Parent"] = u12
    })
    u22.windSound = u7("Sound", {
        ["Name"] = "WindSound",
        ["Looped"] = true,
        ["Playing"] = true,
        ["Volume"] = 0.25,
        ["SoundId"] = "rbxassetid://" .. tostring(7910583431),
        ["Parent"] = u12
    })
    u22.actionButtonMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u4, {
        ["actionName"] = "HoverboardDismount",
        ["text"] = "Dismount Hoverboard",
        ["interactionKey"] = Enum.KeyCode.X,
        ["gamepadInteractionKey"] = u5.CloseMenu,
        ["onActivated"] = function() --[[ Name: onActivated, Line 138 ]]
            --[[
            Upvalues:
                [1] = u22
            --]]
            u22:dismountHoverboard()
        end
    }))
end
function u19.SteppedUpdate(p28, p29) --[[ Line: 144 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u18
    --]]
    if not p28:isOwn() then
        return nil
    end
    local v30 = p28.hoverboard.CFrame
    local v31 = v30.Position
    local v32 = v30:VectorToObjectSpace(p28.hoverboard.AssemblyLinearVelocity)
    local v33, _, v34 = v30:ToOrientation()
    local v35 = p28.character.Humanoid
    local v36 = v35.MoveDirection
    local v37 = -v30:VectorToObjectSpace(v36).X
    local v38 = v30.LookVector
    local v39 = v38.Z
    local v40 = v38.X
    local v41 = math.atan2(v39, v40) + 1.5707963267948966
    local v42 = p28.hoverboard.AssemblyLinearVelocity * Vector3.new(1, 0, 1)
    local v43 = v30:VectorToObjectSpace(v42).X
    local v44 = -math.sign(v43)
    local v45 = v42.Magnitude * v44
    local v46 = (os.clock() - 0) / 0.5
    local v47 = math.sin(v46) * 0.1 + 0 + 5
    local v48 = -v47
    local v49 = Vector3.new(0, v48, 0)
    local v50 = 0
    local v51 = {}
    local v52 = true
    local v53 = 0
    for v54, v55 in u18 do
        local _ = v54 - 1
        local v56 = u13:Raycast((v30 * v55).Position, v49, p28.raycastParams)
        local v57
        if v56 then
            v57 = v56.Position.Y
        else
            v57 = nil
        end
        if v57 ~= nil then
            v50 = v50 + 1
            v51[v50] = v57
        end
    end
    if #v51 > 0 then
        if #v51 == 0 then
            error("Attempted to call `ReadonlyArray.reduce()` on an empty array without an initialValue.")
        end
        local v58 = v51[1]
        for v59 = 2, #v51 do
            local v60 = v51[v59]
            local _ = v59 - 1
            if v60 >= v58 then
                v58 = v60
            end
        end
        v53 = p28.levitationPid:Calculate(p29, v58 + v47, v31.Y)
        local v61 = 1 - (1 - (0 + 1 * ((0.4 + 0.4 * ((v31.Y - v58 - 0) / (v47 - 0)) + (1 - (0.25 + 0.55 * ((v45 - 0) / 40))) - 0.65) / 0.9500000000000001)))
        local v62 = 1 - math.pow(v61, 3)
        p28.hoverSound.PlaybackSpeed = v62
    else
        v52 = false
    end
    local v63 = v32.Z
    local v64 = p28.counterDriftPid:Calculate(p29, 0, v63)
    local v65 = 15 * v37
    local v66 = p28.pitchPid:Calculate(p29, v65, (math.deg(v34)))
    local v67 = v30:VectorToObjectSpace(v36) * Vector3.new(1, 0, 1)
    local v68 = v67.Z
    local v69 = -v67.X
    local v70 = math.atan2(v68, v69)
    local v71 = v36.Magnitude > 0.05
    local v72
    if v71 then
        local v73 = (v41 + v70 - v41 + 3.141592653589793) % 6.283185307179586 - 3.141592653589793 + v41
        local v74 = math.deg(v73)
        v72 = p28.yawPid:Calculate(p29, v74, (math.deg(v41)))
    else
        v72 = 0
    end
    local v75 = 25 * (not v71 and 0 or -1 + 2 * ((v70 - -3.141592653589793) / 6.283185307179586))
    local v76 = p28.rollPid:Calculate(p29, v75, (math.deg(v33)))
    local v77 = -36 + 76 * ((v37 - -0.9) / 1.9)
    local v78 = p28.movePid:Calculate(p29, v77, v45)
    local v79 = 0 + 0.5 * ((math.abs(v45) - 0) / 40)
    p28.windSound.Volume = v79
    local v80 = v35.Jump
    local v81
    if os.clock() - p28.lastJumpTimestamp >= 0.5 then
        v81 = v80 and v52
    else
        v81 = false
    end
    if v81 then
        p28.hoverboard:ApplyImpulse(Vector3.new(0, 3250, 0))
        p28.lastJumpTimestamp = os.clock()
    end
    p28.worldSpaceForce.Force = Vector3.new(0, v53, 0)
    local v82 = p28.localSpaceForce
    local v83 = -v78
    v82.Force = Vector3.new(v83, 0, v64)
    p28.angularVelocity.AngularVelocity = Vector3.new(v76, v72, v66)
end
function u19.setCharacterMassless(p84, p85) --[[ Line: 280 ]]
    for _, v86 in p84.character:GetDescendants() do
        if v86 ~= p84.hoverboard and v86:IsA("BasePart") then
            v86.Massless = p85
        end
    end
end
function u19.dismountHoverboard(_) --[[ Line: 290 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.Client:Get("DismountHoverboard"):SendToServer()
end
function u19.Destroy(p87) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if not p87:isOwn() then
        return nil
    end
    u6.Debug("Local hoverboard destroyed")
    p87.character.HumanoidRootPart.Anchored = false
    local v88 = p87.character
    if v88 ~= nil then
        local v89 = v88.Humanoid
        if v89 ~= nil then
            v89:ChangeState(Enum.HumanoidStateType.Running)
        end
    end
    p87.hoverSound:Destroy()
    p87.windSound:Destroy()
    p87.actionButtonMaid:DoCleaning()
end
function u19.isOwn(p90) --[[ Line: 311 ]]
    return p90.hoverboard.Parent == p90.character
end
u19.Tag = "Hoverboard"
return u19