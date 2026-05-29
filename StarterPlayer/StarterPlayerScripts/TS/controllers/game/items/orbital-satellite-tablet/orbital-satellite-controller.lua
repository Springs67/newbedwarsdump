local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.ConstantManager
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local u6 = v2.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Lighting
local u15 = v13.Players
local u16 = v13.RunService
local u17 = v13.TweenService
local u18 = v13.UserInputService
local u19 = v13.Workspace
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "fade", "fade-util").FadeUtil
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "screen-shake", "screen-shake-util").ScreenShakeUtil
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "orbital-satellite", "orbital-satellite-balance").OrbitalSatelliteBalanceFile
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw")
local u32 = v3.registerConstants(script, {
    ["Sensitivity"] = 0.001,
    ["ControllerDeltaMultiplier"] = 5,
    ["AngleLowerLimitY"] = 1.6,
    ["AngleUpperLimitY"] = 1.6,
    ["DampingRatio"] = 0.75,
    ["Frequency"] = 4,
    ["AimSendRate"] = 0.1,
    ["RingRotationSpeed"] = 1
})
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 48 ]]
        return "OrbitalSatelliteController"
    end,
    ["__index"] = u23
})
u33.__index = u33
function u33.new(...) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u28
        [3] = u11
        [4] = u31
    --]]
    u23.constructor(p36)
    p36.Name = "OrbitalSatelliteController"
    p36.remotes = u28.Client:GetNamespace("OrbitalSatellite")
    p36.inSatellite = false
    p36.localSatelliteMaid = u11.new()
    p36.debugRay = u31.ray(Ray.new())
end
function u33.KnitStart(u37) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u20
        [3] = u26
        [4] = u6
        [5] = u15
        [6] = u9
        [7] = u25
        [8] = u24
        [9] = u27
    --]]
    u23.KnitStart(u37)
    u20.StartConsuming:connect(function(p38) --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u37
        --]]
        if p38.itemType == u26.ORBITAL_SATELLITE_TABLET and u37.inSatellite then
            p38:setCancelled(true)
        end
    end)
    u6("OrbitalSatellite", function(u39) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u15
            [3] = u9
            [4] = u25
            [5] = u24
            [6] = u27
        --]]
        task.spawn(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u37
                [3] = u15
                [4] = u9
                [5] = u25
                [6] = u24
                [7] = u27
            --]]
            u39:WaitForChild("Camera")
            task.spawn(function() --[[ Line: 78 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u39
                --]]
                u37:hookSatellite(u39)
            end)
            if u39:GetAttribute("Owner") ~= u15.LocalPlayer.UserId then
                return nil
            end
            local u40 = u9.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = true,
                ["moveSpeedMultiplier"] = 0
            })
            u37.localSatelliteMaid:GiveTask(function() --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40.Destroy()
            end)
            local u41 = u25:playAnimation(u15.LocalPlayer, u24.USE_TABLET, {
                ["looped"] = true
            })
            u37.localSatelliteMaid:GiveTask(function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u41
                --]]
                local v42 = u41
                if v42 ~= nil then
                    v42:Stop()
                end
            end)
            u37:enterSatelliteView(u39)
            task.delay(u27.LASER_CHARGE_DURATION, function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u39
                --]]
                u37:enableSatelliteControls(u39)
            end)
            local u43 = nil
            local u44 = nil
            u43 = u39.Destroying:Connect(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u39
                    [3] = u43
                    [4] = u44
                --]]
                u37:cleanup(u39)
                local v45 = u43
                if v45 ~= nil then
                    v45:Disconnect()
                end
                local v46 = u44
                if v46 ~= nil then
                    v46:Disconnect()
                end
            end)
            local v47 = u15.LocalPlayer.Character
            if v47 ~= nil then
                v47 = v47:FindFirstChildWhichIsA("Humanoid")
            end
            if v47 ~= nil then
                v47 = v47.Died:Connect(function() --[[ Line: 127 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u39
                        [3] = u43
                        [4] = u44
                    --]]
                    u37:cleanup(u39)
                    local v48 = u43
                    if v48 ~= nil then
                        v48:Disconnect()
                    end
                    local v49 = u44
                    if v49 ~= nil then
                        v49:Disconnect()
                    end
                end)
            end
            u44 = v47
            local v50 = u27.LASER_CHARGE_DURATION + u27.LASER_DURATION
            task.delay(v50 - 1.2, function() --[[ Line: 142 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u39
                --]]
                u37:deactivateLaser(u39)
                task.delay(1, function() --[[ Line: 144 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u39
                    --]]
                    u37.localSatelliteMaid:DoCleaning()
                    u39:Destroy()
                end)
            end)
        end)
    end)
end
function u33.hookSatellite(u51, u52) --[[ Line: 152 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u16
        [3] = u15
        [4] = u9
        [5] = u4
        [6] = u29
        [7] = u22
        [8] = u17
    --]]
    local u53 = u11.new()
    local u54 = true
    u52:WaitForChild("Crystal", 1)
    u53:GiveTask(u52.AncestryChanged:Connect(function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u54
            [3] = u53
        --]]
        if not u52.Parent then
            u54 = false
            u53:DoCleaning()
        end
    end))
    local u55 = 0
    u53:GiveTask(u16.Heartbeat:Connect(function(p56) --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u55
            [2] = u52
        --]]
        u55 = u55 + p56
        local v57 = u52.Star.OuterMetalRing.Motor6D.C0 * CFrame.Angles(0, p56 * 1.5, 0)
        u52.Star.OuterMetalRing.Motor6D.C0 = v57
        local v58 = u52.Star.InnerMetalRing.Motor6D.C0 * CFrame.Angles(p56 * 2, 0, 0)
        u52.Star.InnerMetalRing.Motor6D.C0 = v58
        local v59 = u52.Star.Aura.Motor6D.C0
        local v60 = CFrame.Angles(0, p56 * -7, 0)
        u52.Star.Aura.Motor6D.C0 = v59 * v60
        local v61 = u52.Star.Aura2.Motor6D.C0
        local v62 = CFrame.Angles(0, p56 * 7, 0)
        u52.Star.Aura2.Motor6D.C0 = v61 * v62
    end))
    if u52:GetAttribute("Owner") ~= u15.LocalPlayer.UserId then
        local v63 = u15.LocalPlayer.Character
        if not v63 then
            return nil
        end
        local u64 = false
        local u65 = nil
        local u66 = u9.Controllers.MapController:getCFrame("center"):expect()
        if u66 ~= nil then
            u66 = u66.Position
        end
        if u66 == nil then
            u66 = v63:GetPivot().Position
        end
        local function v72() --[[ Line: 199 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u66
            --]]
            local v67 = u52:GetAttribute("AngleX")
            local v68 = u52:GetAttribute("AngleY")
            if v67 == nil or v68 == nil then
                return nil
            end
            if u52 == nil then
                return nil
            end
            local v69 = CFrame.new(u52.Rotate.Position, u66)
            local v70 = CFrame.Angles(0, math.rad(v67), 0)
            local v71 = CFrame.Angles(math.rad(v68), 0, 0)
            u52.Rotate.CFrame = v69 * v70 * v71
        end
        u53:GiveTask(u52:GetAttributeChangedSignal("AngleX"):Connect(v72))
        u53:GiveTask(u52:GetAttributeChangedSignal("AngleY"):Connect(v72))
        local u73 = 0
        u51.localSatelliteMaid:GiveTask(u16.Heartbeat:Connect(function(_) --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u73
                [3] = u15
                [4] = u64
                [5] = u65
                [6] = u4
                [7] = u29
                [8] = u22
            --]]
            if u52 == nil then
                return nil
            end
            if u73 < time() then
                u73 = time() + 0.5
                local v74 = u52.Rotate.CFrame.Position
                local v75 = u52.Laser.CFrame.Position
                local v76 = u52.Rotate.CFrame.Position
                local v77 = Ray.new(v74, v75 - v76).Unit
                local v78 = u15.LocalPlayer.Character
                if v78 then
                    local v79 = v77:ClosestPoint(v78:GetPivot().Position)
                    if (v78:GetPivot().Position - v79).Magnitude < 30 then
                        if not u64 then
                            if u65 then
                                u65:Play()
                                u64 = true
                            else
                                u65 = u4:playModifiableSound(u29.ORB_SAT_LASER_IMPACT_LOOP, {
                                    ["looped"] = true,
                                    ["position"] = v79
                                })
                                u64 = true
                            end
                        end
                        local v80 = u22
                        local v81 = v78:GetPivot().Position
                        v80.shake(v79, (v79 - v81).Unit, {
                            ["magnitude"] = 1,
                            ["duration"] = 0.5
                        })
                        return
                    end
                    local v82 = u65
                    if v82 ~= nil then
                        v82:Pause()
                    end
                    u64 = false
                end
            end
        end))
    end
    u4:playSound(u29.ORB_SAT_LASER_CHARGE)
    local u83 = u54
    for v84, v85 in u52.Crystal.ChargeEffect:GetChildren() do
        local _ = v84 - 1
        if v85:IsA("ParticleEmitter") then
            v85.Enabled = true
        end
    end
    task.wait(2)
    for v86, v87 in u52.Crystal.ChargeEffect:GetChildren() do
        local _ = v86 - 1
        if v87:IsA("ParticleEmitter") then
            v87.Enabled = false
        end
    end
    local u88 = u4:playSound(u29.ORB_SAT_LASER_FIRE_LOOP)
    u51.localSatelliteMaid:GiveTask(function() --[[ Line: 324 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        local v89 = u88
        if v89 ~= nil then
            v89:Stop()
        end
        local v90 = u88
        if v90 ~= nil then
            v90:Destroy()
        end
    end)
    task.delay(1, function() --[[ Line: 334 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u83
            [3] = u9
            [4] = u4
            [5] = u29
            [6] = u51
            [7] = u17
        --]]
        if not (u52 and u83) then
            return nil
        end
        u9.Controllers.ScreenShakeController:shake(u52.Crystal.Position, u52.Crystal.Position - u52.Camera.Position, {
            ["magnitude"] = 2,
            ["duration"] = 0.46
        })
        for v91, v92 in u52.Laser.Beam:GetChildren() do
            local _ = v91 - 1
            if v92:IsA("Beam") then
                v92.Enabled = true
            end
        end
        for v93, v94 in u52.ImpactEffect:GetChildren() do
            local _ = v93 - 1
            if v94:IsA("ParticleEmitter") then
                v94.Enabled = true
            end
        end
        local u95 = u4:playSound(u29.ORB_SAT_LASER_IMPACT_LOOP, {
            ["parent"] = u52.ImpactEffect
        })
        u51.localSatelliteMaid:GiveTask(function() --[[ Line: 367 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            local v96 = u95
            if v96 ~= nil then
                v96:Stop()
            end
            local v97 = u95
            if v97 ~= nil then
                v97:Destroy()
            end
        end)
        local v98 = u17
        local v99 = u52.Laser
        local v100 = TweenInfo.new(0.6, Enum.EasingStyle.Exponential)
        local v101 = {}
        local v102 = u52.Laser.Size.Y
        local v103 = u52.Laser.Size.Z
        v101.Size = Vector3.new(600, v102, v103)
        v98:Create(v99, v100, v101):Play()
        u17:Create(u52.Laser.Motor6D, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {
            ["C1"] = u52.Laser.Motor6D.C1 * CFrame.new(-300, 0, 0)
        }):Play()
        task.delay(0.6, function() --[[ Line: 389 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u83
                [3] = u4
                [4] = u29
                [5] = u51
                [6] = u9
            --]]
            if not (u52 and u83) then
                return nil
            end
            local u104 = u4:playSound(u29.ORB_SAT_LASER_AMBIENT_LOOP, {
                ["looped"] = true
            })
            u51.localSatelliteMaid:GiveTask(function() --[[ Line: 396 ]]
                --[[
                Upvalues:
                    [1] = u104
                --]]
                local v105 = u104
                if v105 ~= nil then
                    v105:Stop()
                end
                local v106 = u104
                if v106 ~= nil then
                    v106:Destroy()
                end
            end)
            u9.Controllers.ScreenShakeController:shake(u52.Crystal.Position, u52.Crystal.Position - u52.Camera.Position, {
                ["magnitude"] = 0.6,
                ["duration"] = 10
            })
        end)
    end)
end
function u33.enterSatelliteView(u107, p108) --[[ Line: 417 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u29
        [3] = u12
        [4] = u14
        [5] = u19
        [6] = u21
        [7] = u17
        [8] = u5
        [9] = u15
        [10] = u30
    --]]
    if u107.inSatellite then
        return nil
    end
    u107.inSatellite = true
    u107.localSatelliteMaid:DoCleaning()
    local u109 = u4:playSound(u29.ORB_SAT_ACTIVATE)
    local u110 = u12("DepthOfFieldEffect", {
        ["Name"] = "SatelliteDepthOfField",
        ["InFocusRadius"] = 50,
        ["FocusDistance"] = 200,
        ["FarIntensity"] = 0.5,
        ["NearIntensity"] = 0,
        ["Parent"] = u14
    })
    u107.localSatelliteMaid:GiveTask(function() --[[ Line: 433 ]]
        --[[
        Upvalues:
            [1] = u110
            [2] = u109
        --]]
        u110:Destroy()
        local v111 = u109
        if v111 ~= nil then
            v111:Stop()
        end
        local v112 = u109
        if v112 ~= nil then
            v112:Destroy()
        end
    end)
    local u113 = u19.CurrentCamera
    if not u113 then
        return nil
    end
    local u114 = u113.CameraType
    local u115 = u113.FieldOfView
    u113.CameraType = Enum.CameraType.Scriptable
    u113.FieldOfView = 90
    u21:fade(0.12, 0.12, 0.7)
    u17:Create(u113, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
        ["CFrame"] = p108.Camera.CFrame
    }):Play()
    u107.localSatelliteMaid:GiveTask(u5(function(p116, p117, p118) --[[ Line: 459 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u12
            [3] = u30
            [4] = u107
        --]]
        if p116.Team == u15.LocalPlayer.Team then
            return nil
        end
        local v119 = u12
        local v120 = {
            ["StudsOffset"] = Vector3.new(0, 7, 0),
            ["AlwaysOnTop"] = true,
            ["Parent"] = p117.PrimaryPart,
            ["Size"] = UDim2.fromOffset(40, 40),
            ["Children"] = { u12("ImageLabel", {
                    ["Image"] = "rbxassetid://9429977101",
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["ImageColor3"] = u30.mcRed
                }) }
        }
        local u121 = v119("BillboardGui", v120)
        p118:GiveTask(u121)
        u107.localSatelliteMaid:GiveTask(function() --[[ Line: 478 ]]
            --[[
            Upvalues:
                [1] = u121
            --]]
            u121:Destroy()
        end)
    end))
    u107.localSatelliteMaid:GiveTask(function() --[[ Line: 483 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u113
            [3] = u114
            [4] = u115
        --]]
        u21:fade(0.12, 0.12, 0.7)
        u113.CameraType = u114
        u113.FieldOfView = u115
    end)
end
function u33.enableSatelliteControls(u122, u123) --[[ Line: 489 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
        [3] = u10
        [4] = u9
        [5] = u16
        [6] = u32
        [7] = u19
    --]]
    local v124 = u15.LocalPlayer.Character
    if not v124 then
        return nil
    end
    local u125 = 0
    local u126 = 0
    local u127 = 0
    local u128 = u18.MouseBehavior
    local u129 = u10.GroupMotor.new({
        ["x"] = 0,
        ["y"] = 0
    })
    local u130 = u9.Controllers.MapController:getCFrame("center"):expect()
    if u130 ~= nil then
        u130 = u130.Position
    end
    if u130 == nil then
        u130 = v124:GetPivot().Position
    end
    local u135 = u129:onStep(function(p131) --[[ Line: 512 ]]
        --[[
        Upvalues:
            [1] = u123
            [2] = u130
        --]]
        if u123 == nil then
            return nil
        end
        local v132 = CFrame.new(u123.Rotate.Position, u130)
        local v133 = CFrame.Angles(0, p131.x, 0)
        local v134 = CFrame.Angles(p131.y, 0, 0)
        u123.Rotate.CFrame = v132 * v133 * v134
    end)
    u122.localSatelliteMaid:GiveTask(function() --[[ Line: 521 ]]
        --[[
        Upvalues:
            [1] = u135
        --]]
        u135:disconnect()
    end)
    local v136 = u15.LocalPlayer.UserId
    local u137 = "satellite_" .. tostring(v136)
    u122.localSatelliteMaid:GiveTask(function() --[[ Line: 526 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u137
            [3] = u18
            [4] = u128
        --]]
        u16:UnbindFromRenderStep(u137)
        u18.MouseBehavior = u128
        u18.MouseIconEnabled = true
    end)
    u16:BindToRenderStep(u137, Enum.RenderPriority.Camera.Value + 2, function() --[[ Line: 531 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u126
            [3] = u32
            [4] = u127
            [5] = u129
            [6] = u10
            [7] = u19
            [8] = u123
            [9] = u125
            [10] = u122
        --]]
        u18.MouseBehavior = Enum.MouseBehavior.LockCenter
        u18.MouseIconEnabled = false
        local v138 = u18:GetMouseDelta()
        u126 = u126 - v138.X * u32.Sensitivity
        local v139 = u127 - v138.Y * u32.Sensitivity
        local v140 = -u32.AngleLowerLimitY
        local v141 = u32.AngleUpperLimitY
        u127 = math.clamp(v139, v140, v141)
        local v142 = u129
        local v143 = {
            ["x"] = u10.Spring.new(u126, {
                ["dampingRatio"] = u32.DampingRatio,
                ["frequency"] = u32.Frequency
            }),
            ["y"] = u10.Spring.new(u127, {
                ["dampingRatio"] = u32.DampingRatio,
                ["frequency"] = u32.Frequency
            })
        }
        v142:setGoal(v143)
        local v144 = u19.CurrentCamera
        if v144 then
            v144.CFrame = u123.Camera.CFrame
        end
        if u125 < time() then
            u125 = time() + u32.AimSendRate
            local v145 = u122.remotes:Get("AimSatellite")
            local v146 = {}
            local v147 = u126 % 6.283185307179586
            v146.angleX = math.deg(v147)
            local v148 = u127
            v146.angleY = math.deg(v148)
            v145:SendToServer(v146)
        end
    end)
end
function u33.deactivateLaser(_, p149) --[[ Line: 564 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u29
        [3] = u17
    --]]
    local v150 = p149.Laser.Size.X
    u4:playSound(u29.ORB_SAT_LASER_POWER_DOWN)
    local v151 = u17
    local v152 = p149.Laser
    local v153 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)
    local v154 = {}
    local v155 = p149.Laser.Size.Y
    local v156 = p149.Laser.Size.Z
    v154.Size = Vector3.new(0, v155, v156)
    v151:Create(v152, v153, v154):Play()
    u17:Create(p149.Laser.Motor6D, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {
        ["C1"] = p149.Laser.Motor6D.C1 * CFrame.new(-v150 / 2, 0, 0)
    }):Play()
end
function u33.cleanup(p157, p158) --[[ Line: 580 ]]
    p157.inSatellite = false
    p157.localSatelliteMaid:DoCleaning()
    p157.remotes:Get("ExitSatellite"):SendToServer(p158)
end
v8.CreateController(u33.new())
return nil