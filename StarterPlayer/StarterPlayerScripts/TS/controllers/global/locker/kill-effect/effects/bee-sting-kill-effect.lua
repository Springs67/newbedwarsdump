local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InQuad
local u7 = v5.Linear
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.RunService
local u12 = v9.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u19 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u20 = {
    "arm",
    "leg",
    "hand",
    "foot"
}
local function u26(p21) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v22 = string.lower(p21.Name)
    local v23 = false
    for v24, v25 in u20 do
        local _ = v24 - 1
        if string.find(v22, v25) ~= nil then
            return true
        end
    end
    return v23
end
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 72 ]]
        return "BeeStingKillEffect"
    end,
    ["__index"] = u19
})
u27.__index = u27
function u27.new(...) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30, p31) --[[ Line: 82 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.constructor(p30, p31)
    u19.setPlayDefaultKillEffect(p30, false)
end
function u27.onKill(p32, _, p33, _) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u19
        [4] = u4
        [5] = u17
        [6] = u11
        [7] = u3
        [8] = u10
        [9] = u15
        [10] = u14
        [11] = u18
        [12] = u13
        [13] = u6
        [14] = u7
        [15] = u26
        [16] = u1
        [17] = u16
    --]]
    local u34 = u8.new()
    p33.Archivable = true
    local u35 = p33:Clone()
    local u36 = u35.HumanoidRootPart
    u36.Anchored = true
    u35.Parent = u12
    u34:GiveTask(u35)
    local u37 = task.delay(30, function() --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:Destroy()
    end)
    u34:GiveTask(function() --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        return task.cancel(u37)
    end)
    local v38 = u35:FindFirstChild("_DamageHighlight_")
    if v38 then
        v38:Destroy()
    end
    u19.hideCharacter(p32, p33)
    local u39 = u4:playModifiableSound(u17.ANGRY_BEE, {
        ["volumeMultiplier"] = 2,
        ["rollOffMaxDistance"] = 80,
        ["looped"] = true,
        ["parent"] = u36
    })
    u34:GiveTask(u39)
    local v40 = false
    local u41 = u35.PrimaryPart.Position + Vector3.new(0, 0, 0)
    local u42 = v40
    local u43 = 0
    local v44 = false
    while true do
        if v44 then
            u43 = u43 + 1
        else
            v44 = true
        end
        if u43 >= 5 then
            task.wait(2)
            u34:GiveTask((u4:playSound(u17.BED_INFLATE_SOUND, {
                ["volumeMultiplier"] = 1,
                ["playbackSpeedMultiplier"] = 2,
                ["rollOffMaxDistance"] = 80,
                ["parent"] = u36
            })))
            local v45 = u35:GetDescendants()
            local u46 = {}
            local function v50(p47) --[[ Line: 238 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u46
                --]]
                if not p47:IsA("BasePart") then
                    return nil
                end
                p47.CanCollide = false
                p47.CanQuery = false
                p47.CanTouch = false
                local v48 = {
                    ["part"] = p47,
                    ["originalSize"] = p47.Size,
                    ["isLimb"] = u26(p47)
                }
                local v49 = u46
                table.insert(v49, v48)
            end
            for v51, v52 in v45 do
                v50(v52, v51 - 1, v45)
            end
            local u63 = u13(3, u7, function(u53) --[[ Line: 255 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u46
                --]]
                local function v60(p54) --[[ Line: 256 ]]
                    --[[
                    Upvalues:
                        [1] = u3
                        [2] = u53
                    --]]
                    local v55 = p54.isLimb and 2.05 or 2.4
                    local v56 = u3:lerp(p54.originalSize.X, p54.originalSize.X * 2.4, u53)
                    local v57 = u3:lerp(p54.originalSize.Z, p54.originalSize.Z * v55, u53)
                    local v58 = p54.part
                    local v59 = p54.originalSize.Y
                    v58.Size = Vector3.new(v56, v59, v57)
                end
                for v61, v62 in u46 do
                    v60(v62, v61 - 1, u46)
                end
            end, 0, 1)
            u63:Play()
            u34:GiveTask(function() --[[ Line: 267 ]]
                --[[
                Upvalues:
                    [1] = u63
                --]]
                u63:Cancel()
            end)
            local u83 = u1.Promise.new(function() --[[ Line: 270 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u11
                    [3] = u35
                    [4] = u34
                    [5] = u4
                    [6] = u17
                    [7] = u36
                    [8] = u16
                --]]
                task.wait(3.5)
                local v64 = u18.randomFloatMaxInclusive(1, 3.5)
                local v65 = u18.randomFloatMaxInclusive(1, 3.5)
                local v66 = u18.randomFloatMaxInclusive(1, 3.5)
                local u67 = Vector3.new(v64, v65, v66)
                local u70 = u11.Heartbeat:Connect(function(p68) --[[ Line: 278 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u67
                    --]]
                    local v69 = u35.PrimaryPart
                    if v69 then
                        v69.CFrame = v69.CFrame * CFrame.Angles(u67.X * p68, u67.Y * p68, u67.Z * p68)
                    end
                end)
                u34:GiveTask(function() --[[ Line: 286 ]]
                    --[[
                    Upvalues:
                        [1] = u70
                    --]]
                    u70:Disconnect()
                end)
                local v71 = {
                    ["volumeMultiplier"] = 1,
                    ["rollOffMaxDistance"] = 80,
                    ["looped"] = true,
                    ["parent"] = u36
                }
                local u72 = u4:playModifiableSound(u17.WIND_LOOP, v71)
                local u73 = 1
                local u74 = nil
                u74 = u11.Heartbeat:Connect(function(p75) --[[ Line: 298 ]]
                    --[[
                    Upvalues:
                        [1] = u73
                        [2] = u72
                        [3] = u74
                    --]]
                    u73 = u73 - p75 / 5
                    u72.Volume = u73
                    if u73 <= 0 then
                        u74:Disconnect()
                        u72:Stop()
                        u72:Destroy()
                    end
                end)
                u34:GiveTask(u72)
                u34:GiveTask(u74)
                local u82 = u11.Heartbeat:Connect(function(p76) --[[ Line: 310 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                        [2] = u16
                    --]]
                    local v77 = u35.PrimaryPart
                    if not v77 then
                        return nil
                    end
                    local v78 = u16
                    local v79 = v77.Position
                    local v80 = 18 * p76
                    local v81 = Vector3.new(0, v80, 0)
                    v78.setPosition(v77, v79 + v81)
                end)
                u34:GiveTask(function() --[[ Line: 320 ]]
                    --[[
                    Upvalues:
                        [1] = u82
                    --]]
                    u82:Disconnect()
                end)
            end)
            u34:GiveTask(function() --[[ Line: 324 ]]
                --[[
                Upvalues:
                    [1] = u83
                --]]
                return u83:cancel()
            end)
            return u34
        end
        task.spawn(function() --[[ Line: 153 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u41
                [3] = u10
                [4] = u12
                [5] = u15
                [6] = u14
                [7] = u18
                [8] = u13
                [9] = u6
                [10] = u42
                [11] = u39
                [12] = u11
                [13] = u3
                [14] = u34
                [15] = u7
            --]]
            local v84 = u43 / 5 * 3.141592653589793 * 2
            local v85 = math.cos(v84) * 8
            local v86 = math.sin(v84) * 8
            local v87 = u41 + Vector3.new(v85, 3, v86)
            local u88 = u10.Assets.Effects.KillEffectBee:Clone()
            u88:PivotTo(CFrame.lookAt(v87, u41))
            u88.Parent = u12
            local v89 = u88:FindFirstChildOfClass("AnimationController")
            if v89 ~= nil then
                local v90 = v89:LoadAnimation(u15:getAnimation(u14.BEE_FLAP))
                v90.Looped = true
                v90:Play()
            end
            local v91 = u18.randomFloatMaxInclusive(0, 1)
            local v92 = u41 + Vector3.new(0, v91, 0)
            local v93 = false
            local v94 = 0
            local v95 = true
            while true do
                if v93 then
                    v94 = v94 + 1
                else
                    v93 = true
                end
                if v94 >= 10 then
                    if not u42 then
                        u42 = true
                        local u96 = u39.Volume
                        local u97 = 0
                        local u98 = nil
                        u98 = u11.Heartbeat:Connect(function(p99) --[[ Line: 125 ]]
                            --[[
                            Upvalues:
                                [1] = u97
                                [2] = u39
                                [3] = u3
                                [4] = u96
                                [5] = u98
                            --]]
                            u97 = u97 + p99
                            local v100 = u97 / 2
                            local v101 = math.clamp(v100, 0, 1)
                            u39.Volume = u3:lerp(u96, 0, v101)
                            if v101 >= 1 then
                                u98:Disconnect()
                                u39:Stop()
                            end
                        end)
                        u34:GiveTask(u98)
                    end
                    local u102 = u88:GetPivot().Position
                    local v103 = u18.randomFloatMaxInclusive(-5, 5)
                    local v104 = u18.randomFloatMaxInclusive(30, 38)
                    local v105 = u18.randomFloatMaxInclusive
                    local u106 = u102 + Vector3.new(v103, v104, v105(-5, 5))
                    local u107 = u18.randomFloatMaxInclusive(3, 4)
                    local u108 = (u106 - u102).Unit
                    u13(u107, u7, function(p109) --[[ Line: 212 ]]
                        --[[
                        Upvalues:
                            [1] = u88
                            [2] = u102
                            [3] = u106
                            [4] = u107
                            [5] = u108
                        --]]
                        local v110 = u88
                        local v111 = u102:Lerp(u106, p109)
                        local v112 = u108 * (p109 * u107 * 10)
                        v110:PivotTo(CFrame.new(v111, u106 + v112))
                    end):Play():Wait()
                    u88:Destroy()
                    return
                end
                local v113
                if v95 then
                    v113 = v87
                else
                    v113 = v92
                end
                local v114 = u18.randomFloatMaxInclusive(0, 0.4)
                local v115 = u18.randomFloatMaxInclusive(0, 0.4)
                local v116 = u18.randomFloatMaxInclusive
                local u117 = v113 + Vector3.new(v114, v115, v116(0, 0.4))
                local v118
                if v95 then
                    v118 = v92
                else
                    v118 = v87
                end
                local v119 = u18.randomFloatMaxInclusive(0, 0.3, true)
                local u120 = v118 + Vector3.new(0, v119, 0)
                local v121 = u13
                local v122
                if v95 then
                    v122 = u18.randomFloatMaxInclusive(0.3, 0.4)
                else
                    v122 = u18.randomFloatMaxInclusive(0.4, 0.5)
                end
                v121(v122, u6, function(p123) --[[ Line: 194 ]]
                    --[[
                    Upvalues:
                        [1] = u117
                        [2] = u120
                        [3] = u88
                    --]]
                    local v124 = u117:Lerp(u120, p123)
                    local v125 = (u120 - u117).Unit
                    u88:PivotTo(CFrame.new(v124, u120 + v125))
                end, 0, 1):Play():Wait()
                v95 = not v95
            end
        end)
    end
end
return u27