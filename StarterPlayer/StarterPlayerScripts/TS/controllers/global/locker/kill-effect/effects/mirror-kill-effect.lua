local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InCubic
local u8 = v6.Linear
local u9 = v6.OutElastic
local u10 = v6.OutQuad
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u12 = v11.SingleMotor
local u13 = v11.Spring
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.ReplicatedStorage
local u18 = v16.RunService
local u19 = v16.Workspace
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic")
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u26 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
Random.new()
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "MirrorKillEffect"
    end,
    ["__index"] = u26
})
u27.__index = u27
function u27.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30, p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    u26.constructor(p30, p31)
    u26.setPlayDefaultKillEffect(p30, false)
end
function u27.onKill(p32, _, p33, u34) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u5
        [3] = u24
        [4] = u19
        [5] = u26
        [6] = u12
        [7] = u17
        [8] = u4
        [9] = u21
        [10] = u15
        [11] = u3
        [12] = u1
        [13] = u20
        [14] = u9
        [15] = u10
        [16] = u13
        [17] = u23
        [18] = u22
        [19] = u8
        [20] = u18
        [21] = u7
        [22] = u25
    --]]
    local u35 = u14.new()
    u35:GiveTask(u5:playSound(u24.MIRROR_EFFECT, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = u34.Position
    }))
    p33.Archivable = true
    local u36 = p33:Clone()
    u36.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u36.HumanoidRootPart.Anchored = true
    u36:PivotTo(u34)
    u36.Parent = u19
    u26.hideCharacter(p32, p33)
    u35:GiveTask(u36)
    local u37 = u12.new(0)
    local u38 = u34 * CFrame.new(0, -20, 10)
    local u39 = u17.Assets.Effects.MagicMirror:Clone()
    for _, v40 in u39:GetChildren() do
        if v40:IsA("BasePart") then
            v40.Anchored = true
            v40.CanCollide = false
        end
    end
    u4:setQueryIgnored(u39, true)
    u39.Parent = u19
    u35:GiveTask(u39)
    local u41 = u21.createFaces(u39.PrimaryPart, u36, { Enum.NormalId.Front })
    local v42 = {}
    local v43 = u41[Enum.NormalId.Front]
    if v43 ~= nil then
        v43 = v43.slice.worldModel
    end
    v42.Parent = v43
    v42.Anchored = true
    v42.CanCollide = false
    v42.Color = Color3.fromRGB(255, 255, 255)
    v42.Size = Vector3.new(256, 1, 256)
    v42.CFrame = u38 * CFrame.new(0, 16.5, 0)
    v42.Material = Enum.Material.SmoothPlastic
    local u44 = u15("Part", v42)
    u4:setQueryIgnored(u44, true)
    u35:GiveTask(u44)
    local v45 = u17.Assets.Effects.FloorShadow:Clone()
    v45.Anchored = true
    v45.CanCollide = false
    u4:setQueryIgnored(v45, true)
    v45.Size = Vector3.new(8, 1, 5)
    local v46 = u41[Enum.NormalId.Front]
    if v46 ~= nil then
        v46 = v46.slice.worldModel
    end
    v45.Parent = v46
    v45.CFrame = u38 * CFrame.new(0, 16.55, 1.5)
    u35:GiveTask(v45)
    u41[Enum.NormalId.Front].slice.viewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    u41[Enum.NormalId.Front].slice.viewportFrame.BackgroundTransparency = 0
    u41[Enum.NormalId.Front].slice.viewportFrame.LightColor = Color3.fromRGB(255, 255, 255)
    for _, v47 in u41 do
        u3:playAnimation(v47.slice.clone.Humanoid.Animator, "rbxassetid://507766388")
    end
    u3:playAnimation(u36.Humanoid.Animator, "rbxassetid://507766388")
    local u88 = u1.Promise.new(function() --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u20
            [3] = u9
            [4] = u39
            [5] = u38
            [6] = u10
            [7] = u37
            [8] = u13
            [9] = u36
            [10] = u41
            [11] = u23
            [12] = u22
            [13] = u8
            [14] = u44
            [15] = u35
            [16] = u18
            [17] = u7
            [18] = u17
            [19] = u4
            [20] = u19
            [21] = u25
        --]]
        local u48 = u34 * CFrame.new(0, 0, 10)
        u20(0.1, u9, function(p49) --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u38
                [3] = u48
            --]]
            u39:PivotTo(u38:Lerp(u48, p49))
        end, 0, 1):Wait()
        local u50 = nil
        u20(0.2, u10, function(p51) --[[ Line: 138 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u48
                [3] = u50
                [4] = u37
                [5] = u13
                [6] = u36
                [7] = u41
            --]]
            local v52 = u34:Lerp(u34 * CFrame.new(0, 0, 12), p51)
            local v53 = v52.Position - (u48 * CFrame.new(0, 0, -1)).Position
            if u50 then
                local v54 = v52.Position - u50.Position
                local v55 = u37
                local v56 = u13.new
                local v57 = v54.Magnitude * 50
                v55:setGoal(v56(math.rad(v57), {
                    ["dampingRatio"] = 0.75,
                    ["frequency"] = 15
                }))
            end
            if u48.LookVector:Dot(v53) < 0 then
                u36:PivotTo(CFrame.new((1 / 0), (1 / 0), (1 / 0)))
            elseif u36.PrimaryPart then
                local v58 = v52 * CFrame.Angles(u37:getValue(), 0, 0)
                u50 = v58
                u36:PivotTo(v58)
            end
            for _, v59 in u41 do
                local v60 = v52 * CFrame.Angles(u37:getValue(), 0, 0)
                u50 = v60
                local v61 = v59.slice.clone
                if v61 ~= nil then
                    v61:PivotTo(v60)
                end
            end
        end, 0, 1):Wait()
        for _, v62 in u41 do
            local v63 = u34 * CFrame.new(0, 0, 12)
            local v64 = v62.slice.clone
            if v64 ~= nil then
                v64:PivotTo(v63)
            end
        end
        task.wait(0.1)
        local u65 = u23:playAnimation(u41[Enum.NormalId.Front].slice.clone.Humanoid.Animator, u22.MIRROR_KILL_EFFECT, {
            ["looped"] = false
        })
        if u65 == nil then
            return nil
        end
        u65:AdjustSpeed(2)
        local function u67() --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            for _, v66 in u39.Part.Attachment:GetChildren() do
                if v66:IsA("ParticleEmitter") then
                    v66:Emit((v66:GetAttribute("EmitCount")))
                end
            end
        end
        task.delay(0.175, function() --[[ Line: 204 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            return u67()
        end)
        task.delay(0.6083, function() --[[ Line: 207 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            return u67()
        end)
        task.delay(0.975, function() --[[ Line: 210 ]]
            --[[
            Upvalues:
                [1] = u67
            --]]
            return u67()
        end)
        local u69 = u20(u65.Length / 2 - 0.8, u8, function(p68) --[[ Line: 213 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u44
            --]]
            u41[Enum.NormalId.Front].slice.viewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(171, 33, 33), p68)
            u41[Enum.NormalId.Front].slice.viewportFrame.LightColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 0, 0), p68)
            u44.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(153, 56, 79), p68)
        end, 0, 1)
        u35:GiveTask(function() --[[ Line: 220 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:Cancel()
        end)
        local u70 = 0
        local v80 = u18.Heartbeat:Connect(function(p71) --[[ Line: 224 ]]
            --[[
            Upvalues:
                [1] = u70
                [2] = u65
                [3] = u7
                [4] = u39
                [5] = u34
            --]]
            u70 = u70 + p71
            local v72 = u65.TimePosition / (u65.Length == 0 and 1 or u65.Length)
            local v73 = u70 * 30
            local v74 = math.sin(v73) * u7(v72, 0.5, 5, 1)
            local v75 = math.rad(v74)
            local v76 = u39
            local v77 = u34
            local v78 = CFrame.new(math.noise(u70 * 20) * u7(v72, 0.1, 2, 1), 0, 10)
            local v79 = CFrame.Angles(0, 0, v75)
            v76:PivotTo(v77 * v78 * v79)
        end)
        local v81 = task
        if u65 ~= nil then
            u65 = u65.Length
        end
        v81.wait(u65 / 2 - 0.2)
        v80:Disconnect()
        u39:Destroy()
        local u82 = u17.Assets.Effects.MagicMirrorExplosion:Clone()
        u82.Anchored = true
        u82.CanCollide = false
        u82.CFrame = u34 * CFrame.new(0, 0, 10)
        u4:setQueryIgnored(u82, true)
        u82.Parent = u19
        for _, v83 in u82:GetDescendants() do
            if v83:IsA("ParticleEmitter") then
                v83:Emit((v83:GetAttribute("EmitCount")))
            end
        end
        u35:GiveTask(u82)
        task.delay(3, function() --[[ Line: 257 ]]
            --[[
            Upvalues:
                [1] = u82
            --]]
            local v84 = u82
            if v84 ~= nil then
                v84 = v84:Destroy()
            end
            return v84
        end)
        local v85 = u17.Assets.Effects.FracturedMirror:Clone()
        u4:setQueryIgnored(v85, true)
        v85:PivotTo(u34 * CFrame.new(0, 0, 10))
        v85.Parent = u19
        u35:GiveTask(v85)
        for _, v86 in v85:GetDescendants() do
            if v86:IsA("BasePart") then
                v86.Anchored = false
                v86.CanCollide = false
                local v87 = u25.randomUnitVector(Vector3.new(0, 1, 0), 0.8726646259971648)
                v86:ApplyImpulse(v87 * (v86.AssemblyMass * 50))
                v86:ApplyAngularImpulse(v87 * (v86.AssemblyMass * 10))
            end
        end
    end)
    u35:GiveTask(function() --[[ Line: 286 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        return u88:cancel()
    end)
    u35:GiveTask(u18.Heartbeat:Connect(function() --[[ Line: 289 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u21
        --]]
        for _, v89 in u41 do
            u21.update(v89.surfaceGui, {
                ["viewportFrame"] = v89.slice.viewportFrame,
                ["camera"] = v89.slice.camera
            })
        end
    end))
    u35:GiveTask(function() --[[ Line: 297 ]]
        --[[
        Upvalues:
            [1] = u41
        --]]
        for _, v90 in u41 do
            v90.surfaceGui:Destroy()
        end
    end)
    return u35
end
return u27