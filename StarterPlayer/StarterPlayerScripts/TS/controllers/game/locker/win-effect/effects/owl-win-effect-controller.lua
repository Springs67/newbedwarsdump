local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.RunService
local u11 = v7.Workspace
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "OwlWinEffectController"
    end,
    ["__index"] = u19
})
u20.__index = u20
function u20.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u16
        [3] = u5
    --]]
    u19.constructor(p23, u16.OWL)
    p23.Name = "OwlWinEffectController"
    p23.maid = u5.new()
    p23.upHeld = false
    p23.downHeld = false
end
function u20.KnitStart(u24) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
        [3] = u15
        [4] = u6
        [5] = u11
        [6] = u9
        [7] = u18
        [8] = u2
        [9] = u14
        [10] = u13
        [11] = u8
        [12] = u4
        [13] = u10
    --]]
    u19.KnitStart(u24)
    u17.Client:Get("OwlWinEffectSetupComplete"):Connect(function(p25) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u6
            [3] = u11
            [4] = u24
            [5] = u9
            [6] = u18
            [7] = u2
            [8] = u14
            [9] = u13
            [10] = u8
            [11] = u4
            [12] = u10
        --]]
        local v26 = p25.winningPlayer
        local u27 = v26.Character
        if not u27 then
            return nil
        end
        if not u27.PrimaryPart then
            return nil
        end
        local v28 = u27.PrimaryPart
        if v28 ~= nil then
            v28 = v28.CFrame
        end
        if not v28 then
            return nil
        end
        local u29 = u27:FindFirstChild("Humanoid")
        if not u29 then
            return nil
        end
        local v30 = u27.PrimaryPart
        if not v30 then
            return nil
        end
        local u31 = u15:getEntity(v26)
        if not u31 then
            return nil
        end
        local v32 = u6("Folder", {
            ["Parent"] = u11,
            ["Name"] = "Owl_" .. v26.Name
        })
        u24.maid:GiveTask(v32)
        local u33 = u9.Assets.Pets.Owl:Clone()
        if not u33.PrimaryPart then
            return nil
        end
        u33:PivotTo(v28)
        for v34, v35 in u33:GetDescendants() do
            local _ = v34 - 1
            if v35:IsA("Part") then
                v35.CanCollide = false
                v35.CanQuery = false
                v35.CanTouch = false
            end
        end
        u33.PrimaryPart.Anchored = true
        u33:ScaleTo(5)
        u33.Parent = v32
        local v36 = u33:FindFirstChild("RootPart")
        if v36 ~= nil then
            v36 = v36:FindFirstChild("master_bone")
            if v36 ~= nil then
                v36 = v36:FindFirstChild("torso")
            end
        end
        if not v36 then
            return nil
        end
        u6("Sound", {
            ["Name"] = "OwlWinEffectSound",
            ["Looped"] = true,
            ["SoundId"] = u18.OWL_FLY,
            ["Parent"] = u27.PrimaryPart
        }):Play()
        u2:playAnimation(u33.AnimationController.Animator, u14:getAssetId(u13.OWL_FLY_STEADY_HEIGHT), {
            ["looped"] = true
        })
        if u8.LocalPlayer == v26 then
            u24:bindFlightControls()
            u24:orientCamera(u27.PrimaryPart)
        end
        u27.Archivable = true
        local u37 = u27:Clone()
        u37.Parent = v32
        u37.Name = "Pilot"
        for v38, v39 in u37:GetDescendants() do
            local _ = v38 - 1
            if v39:IsA("Part") then
                v39.CanCollide = false
                v39.CanQuery = false
                v39.CanTouch = false
            end
        end
        u37.PrimaryPart.Anchored = true
        u37:PivotTo(u33:GetPivot() + Vector3.new(0, 10, 0))
        u24.maid:GiveTask(u37)
        local u40 = u37:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation((u6("Animation", {
            ["AnimationId"] = u14:getAssetId(u13.R15_SIT)
        })))
        u40:Play()
        u24.maid:GiveTask(function() --[[ Line: 156 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:Stop()
            u40:Destroy()
        end)
        u31:getInstance():SetAttribute("Transparency", 1)
        u31:hideNametag()
        u24.maid:GiveTask(function() --[[ Line: 163 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            u31:getInstance():SetAttribute("Transparency", 0)
            u31:showNametag()
        end)
        u27.PrimaryPart.CanCollide = false
        local v41 = v30.AssemblyMass
        local v42 = u6
        local v43 = {
            ["Name"] = "AntiGrav"
        }
        local v44 = u11.Gravity * v41
        v43.Force = Vector3.new(0, v44, 0)
        v43.Parent = v30
        v42("BodyForce", v43)
        local v45 = u6("Attachment", {
            ["Parent"] = u27.PrimaryPart
        })
        u6("AngularVelocity", {
            ["MaxTorque"] = 5000,
            ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
            ["Attachment0"] = v45,
            ["Parent"] = u27.PrimaryPart
        })
        local u46 = u4.SingleMotor.new(0)
        u10.Heartbeat:Connect(function(p47) --[[ Line: 188 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u37
                [3] = u24
                [4] = u46
                [5] = u4
                [6] = u29
                [7] = u33
            --]]
            if not u27.PrimaryPart then
                return nil
            end
            if not u37.PrimaryPart then
                return nil
            end
            local v48 = u27.PrimaryPart.CFrame
            local v49 = CFrame.new(0, 0, -35 * p47)
            u27.PrimaryPart.CFrame = v48 * v49
            if u24.upHeld and not u24.downHeld then
                u46:setGoal(u4.Spring.new(10))
            elseif u24.downHeld and not u24.upHeld then
                u46:setGoal(u4.Spring.new(-10))
            else
                u46:setGoal(u4.Spring.new(0, {
                    ["frequency"] = 1
                }))
            end
            local v50 = u27.PrimaryPart
            local v51 = u46:getValue()
            v50.AssemblyLinearVelocity = Vector3.new(0, v51, 0)
            u29:Move(Vector3.new(0, 0, 0))
            u33:PivotTo(u27.PrimaryPart.CFrame)
            u37:PivotTo(u27.PrimaryPart.CFrame + Vector3.new(0, 4, 0))
        end)
    end)
end
function u20.onWin(_, _) --[[ Line: 221 ]] end
function u20.orientCamera(_, p52) --[[ Line: 223 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u8
    --]]
    if u11.CurrentCamera then
        u11.CurrentCamera.CameraSubject = p52
        u8.LocalPlayer.CameraMaxZoomDistance = 30
        u8.LocalPlayer.CameraMinZoomDistance = 30
    end
end
function u20.bindFlightControls(u53) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v54 = u12.bindUpDownControls()
    u53.maid:GiveTask(v54.bindActionMaid)
    u53.maid:GiveTask(v54.shouldFlyUpRef.Changed:Connect(function(p55) --[[ Line: 233 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        u53.upHeld = p55
        return u53.upHeld
    end))
    u53.maid:GiveTask(v54.shouldFlyDownRef.Changed:Connect(function(p56) --[[ Line: 237 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        u53.downHeld = p56
        return u53.downHeld
    end))
end
v3.CreateController(u20.new())
return nil