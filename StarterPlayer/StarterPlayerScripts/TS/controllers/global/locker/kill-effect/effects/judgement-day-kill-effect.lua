local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InCirc
local u8 = v6.InExpo
local u9 = v6.InOutExpo
local u10 = v6.Linear
local u11 = v6.OutCirc
local u12 = v6.OutExpo
local u13 = v6.OutQuint
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.ReplicatedStorage
local u17 = v15.RunService
local u18 = v15.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u25 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u26 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "JudgementDayKillEffect"
    end,
    ["__index"] = u25
})
u26.__index = u26
function u26.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v27 = u26
    local v28 = setmetatable({}, v27)
    return v28:constructor(...) or v28
end
function u26.constructor(p29, p30) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    u25.constructor(p29, p30)
    u25.setPlayDefaultKillEffect(p29, false)
end
function u26.onKill(p31, _, p32, u33) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u25
        [4] = u5
        [5] = u23
        [6] = u22
        [7] = u16
        [8] = u17
        [9] = u4
        [10] = u19
        [11] = u11
        [12] = u3
        [13] = u21
        [14] = u20
        [15] = u8
        [16] = u24
        [17] = u10
        [18] = u7
        [19] = u13
        [20] = u9
        [21] = u12
    --]]
    local u34 = u14.new()
    p32.Archivable = true
    local u35 = p32:Clone()
    u35.HumanoidRootPart.Anchored = true
    u35.Parent = u18
    u34:GiveTask(u35)
    u25.hideCharacter(p31, p32)
    u34:GiveTask(u5:playSound(u23.GHOST_PILLAR_ERUPT, {
        ["position"] = u35:GetPivot().Position
    }))
    local v36 = u33 - u33.LookVector * (u22 * 4) - Vector3.new(0, 6, 0)
    local u37 = u33 - u33.LookVector * (u22 * 2)
    local u38 = u16.Assets.Misc.GrimReaper:Clone()
    u38:PivotTo(v36)
    u38.Parent = u18
    u38.HumanoidRootPart.Anchored = true
    u34:GiveTask(u38)
    u34:GiveTask(u17.Heartbeat:Connect(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u4
        --]]
        for v39, v40 in u38:GetDescendants() do
            local _ = v39 - 1
            if v40:IsA("BasePart") and v40.CanCollide then
                v40.CanCollide = false
                u4:setQueryIgnored(v40, true)
            end
        end
    end))
    u19(0.5, u11, function(p41) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        for v42, v43 in u38:GetDescendants() do
            local _ = v42 - 1
            if v43:IsA("BasePart") then
                if v43.Transparency ~= 1 then
                    v43.Transparency = p41
                end
            elseif v43:IsA("ParticleEmitter") then
                v43.Transparency = NumberSequence.new(p41)
            end
        end
    end, 0.99, 0)
    u19(0.25, u11, function(p44) --[[ Line: 101 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:PivotTo(p44)
    end, v36, u37)
    local u45 = u38.Humanoid.Animator
    local v46 = u3:playAnimation(u45, u21:getAssetId(u20.SCYTHE_SWING))
    if v46 then
        u34:GiveTask(v46)
        v46.Stopped:Connect(function() --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u45
                [3] = u21
                [4] = u20
                [5] = u34
            --]]
            local v47 = u3:playAnimation(u45, u21:getAssetId(u20.SCYTHE_IDLE), {
                ["looped"] = true
            })
            if v47 then
                u34:GiveTask(v47)
            end
        end)
    end
    u34:GiveTask(u5:playSound(u23.SCYTHE_SWING_1))
    u38["3DClothing"].Model:Destroy()
    local v48 = u16.Assets.Misc.ReaperScythe:Clone()
    for v49, v50 in v48:GetDescendants() do
        local _ = v49 - 1
        if v50:IsA("BasePart") then
            v50.CanCollide = false
            u4:setQueryIgnored(v50, true)
        end
    end
    v48.Parent = u38
    u34:GiveTask(v48)
    u38:ScaleTo(2)
    local u51 = u16.Assets.Misc.GrimReaperSoul.Spirit:Clone()
    u51.Anchored = true
    local v52 = u51:GetDescendants()
    local function v55(u53) --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u8
            [3] = u4
        --]]
        if u53:IsA("ParticleEmitter") then
            u53.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
            u53.LightInfluence = 1
            u19(1, u8, function(p54) --[[ Line: 167 ]]
                --[[
                Upvalues:
                    [1] = u53
                --]]
                u53.Transparency = NumberSequence.new(p54)
                return u53.Transparency
            end, 1, 0.5)
        elseif u53:IsA("BasePart") then
            u53.CanCollide = false
            u4:setQueryIgnored(u53, true)
        end
    end
    for v56, v57 in v52 do
        v55(v57, v56 - 1, v52)
    end
    u51:PivotTo(u35:GetPivot())
    u51.Parent = u18
    u24:scaleEffect({ u51 }, 2)
    u34:GiveTask(u51)
    local u58 = 0
    u34:GiveTask((u17.Heartbeat:Connect(function(p59) --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u51
        --]]
        u58 = u58 + p59
        local v60 = u51.Position
        local v61 = u58 * 10
        local v62 = math.sin(v61) / 15
        local v63 = u58 * 5
        local v64 = math.sin(v63) / 10
        local v65 = u58 * 10
        local v66 = math.cos(v65) / 15
        u51.Position = v60 + Vector3.new(v62, v64, v66)
    end)))
    task.delay(0.5, function() --[[ Line: 191 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u10
            [3] = u38
            [4] = u7
            [5] = u37
            [6] = u35
            [7] = u13
            [8] = u22
            [9] = u58
            [10] = u51
            [11] = u9
            [12] = u34
            [13] = u5
            [14] = u23
            [15] = u16
            [16] = u33
            [17] = u18
            [18] = u12
        --]]
        task.delay(0.5, function() --[[ Line: 192 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u10
                [3] = u38
                [4] = u7
                [5] = u37
            --]]
            u19(0.5, u10, function(p67) --[[ Line: 193 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                for v68, v69 in u38:GetDescendants() do
                    local _ = v68 - 1
                    if v69:IsA("BasePart") then
                        if v69.Transparency ~= 1 then
                            v69.Transparency = p67
                        end
                    elseif v69:IsA("ParticleEmitter") then
                        v69.Transparency = NumberSequence.new(p67)
                    end
                end
            end, 0, 1)
            u19(0.5, u7, function(p70) --[[ Line: 209 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                u38:PivotTo(p70)
            end, u37, u37 - Vector3.new(0, 3, 0))
        end)
        local v71 = u38.PrimaryPart.CFrame.LookVector * -2
        local u72 = v71.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v71.Unit)
        u35:BreakJoints()
        local v73 = u35:GetDescendants()
        local function v79(p74) --[[ Line: 219 ]]
            --[[
            Upvalues:
                [1] = u72
            --]]
            if p74:IsA("BasePart") then
                p74.CanCollide = false
                local v75 = (u72 + Vector3.new(0, 1, 0)).Unit
                local v76 = math.random(50, 100)
                local v77 = math.random(100, 200)
                local v78 = math.random
                p74.AssemblyLinearVelocity = v75 * Vector3.new(v76, v77, v78(50, 100))
            end
        end
        for v80, v81 in v73 do
            v79(v81, v80 - 1, v73)
        end
        u19(0.7, u13, function(u82) --[[ Line: 232 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            local v83 = u35:GetDescendants()
            local function v85(p84) --[[ Line: 234 ]]
                --[[
                Upvalues:
                    [1] = u82
                --]]
                if p84:IsA("BasePart") and u82 > p84.Transparency then
                    p84.Transparency = u82
                    return
                elseif p84:IsA("GuiObject") then
                    p84.Transparency = u82
                    return
                elseif p84:IsA("UIStroke") then
                    p84.Transparency = u82
                    return
                elseif p84:IsA("Decal") then
                    p84.Transparency = u82
                elseif p84:IsA("ParticleEmitter") then
                    p84.Transparency = NumberSequence.new(u82)
                end
            end
            for v86, v87 in v83 do
                v85(v87, v86 - 1, v83)
            end
        end, 0, 1)
        local function v89(p88) --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            return u35:PivotTo(p88)
        end
        local v90 = u35:GetPivot()
        local v91 = u35:GetPivot()
        local v92 = u22 * 1
        u19(0.7, u10, v89, v90, v91 - Vector3.new(0, v92, 0))
        local v93 = math.random()
        local v94 = math.round(v93) * 2 - 1
        local function v102(p95) --[[ Line: 259 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u51
            --]]
            local v96 = u58 * 10
            local v97 = math.sin(v96) / 10
            local v98 = u58 * 5
            local v99 = math.sin(v98) / 10
            local v100 = u58 * 10
            local v101 = math.cos(v100) / 10
            u51.Position = p95 + Vector3.new(v97, v99, v101)
        end
        local v103 = u51.Position
        local v104 = u51.Position
        local v105 = v94 * u22 * 5
        u19(3, u9, v102, v103, v104 + Vector3.new(0, v105, 0))
        local v106 = u51:GetDescendants()
        local function v109(u107) --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u10
            --]]
            if u107:IsA("ParticleEmitter") then
                u107.Color = ColorSequence.new(Color3.new(255, 255, 255))
                u19(3, u10, function(p108) --[[ Line: 272 ]]
                    --[[
                    Upvalues:
                        [1] = u107
                    --]]
                    u107.Transparency = NumberSequence.new(p108)
                    return u107.Transparency
                end, 0.5, 1)
            end
        end
        for v110, v111 in v106 do
            v109(v111, v110 - 1, v106)
        end
        if v94 > 0 then
            u34:GiveTask(u5:playSound(u23.HEAVEN_ASCEND, {
                ["position"] = u51.Position
            }))
            task.spawn(function() --[[ Line: 286 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u10
                    [3] = u51
                    [4] = u16
                    [5] = u33
                    [6] = u22
                    [7] = u18
                    [8] = u34
                --]]
                u19(1, u10, function(p112) --[[ Line: 287 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                    --]]
                    for v113, v114 in u51:GetDescendants() do
                        local _ = v113 - 1
                        if v114:IsA("ParticleEmitter") then
                            v114.Color = ColorSequence.new(p112)
                        end
                    end
                end, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 245, 184))
                local u115 = u16.Assets.Misc.LightBeam:Clone()
                local v116 = u33
                local v117 = u115.Size.Y / 2 - u22
                u115.CFrame = v116 + Vector3.new(0, v117, 0)
                u115.Parent = u18
                u34:GiveTask(u115)
                u19(2, u10, function(p118) --[[ Line: 304 ]]
                    --[[
                    Upvalues:
                        [1] = u115
                    --]]
                    u115.Transparency = p118
                end, 1, 0.8):Wait()
                u19(2, u10, function(p119) --[[ Line: 308 ]]
                    --[[
                    Upvalues:
                        [1] = u115
                    --]]
                    u115.Transparency = p119
                end, 0.8, 1)
            end)
        else
            local u120 = u5:playSound(u23.ROCK_RUMBLE, {
                ["playbackSpeedMultiplier"] = 0.25,
                ["position"] = u51.Position
            })
            u34:GiveTask(u120)
            local u121 = u5:playSound(u23.EVIL_LAUGH, {
                ["volumeMultiplier"] = 0.02,
                ["position"] = u51.Position
            })
            u34:GiveTask(u121)
            u19(2.5, u10, function(p122) --[[ Line: 324 ]]
                --[[
                Upvalues:
                    [1] = u120
                    [2] = u121
                --]]
                local v123 = u120:getInstance()
                local v124 = u121:getInstance()
                if not (v123 and v124) then
                    return nil
                end
                v123.Volume = p122
                v124.Volume = p122
            end, 1, 0)
            task.spawn(function() --[[ Line: 333 ]]
                --[[
                Upvalues:
                    [1] = u16
                    [2] = u35
                    [3] = u18
                    [4] = u34
                    [5] = u19
                    [6] = u12
                    [7] = u58
                    [8] = u22
                    [9] = u10
                    [10] = u51
                --]]
                local u125 = u16.Assets.Misc.MagmaRift:Clone()
                local v126 = u35:GetPivot().Position
                local v127 = u35.Humanoid.HipHeight + u125[1].Size.Y
                local v128 = Vector3.new(0, v127, 0)
                u125:PivotTo(CFrame.new(v126 - v128))
                for v129, v130 in u125:GetDescendants() do
                    local _ = v129 - 1
                    if v130:IsA("BasePart") then
                        v130.Transparency = 1
                    end
                end
                u125.Parent = u18
                u34:GiveTask(u125)
                task.spawn(function() --[[ Line: 350 ]]
                    --[[
                    Upvalues:
                        [1] = u125
                        [2] = u19
                        [3] = u12
                        [4] = u58
                        [5] = u22
                        [6] = u10
                    --]]
                    local v131 = false
                    local v132 = 1
                    while true do
                        if v131 then
                            v132 = v132 + 1
                        else
                            v131 = true
                        end
                        if v132 > 3 then
                            task.wait(1)
                            for v133, u134 in u125:GetDescendants() do
                                local _ = v133 - 1
                                u19(0.5, u10, function(p135) --[[ Line: 383 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u134
                                    --]]
                                    if u134:IsA("BasePart") then
                                        u134.Transparency = p135
                                    elseif u134:IsA("ParticleEmitter") then
                                        u134.Transparency = NumberSequence.new(p135)
                                    end
                                end, 0, 1)
                            end
                            return
                        end
                        local u136 = u125[tostring(v132)]
                        u19(0.25, u12, function(p137) --[[ Line: 364 ]]
                            --[[
                            Upvalues:
                                [1] = u136
                            --]]
                            u136.Transparency = p137
                        end, 1, 0)
                        local function v143(p138) --[[ Line: 367 ]]
                            --[[
                            Upvalues:
                                [1] = u136
                                [2] = u125
                                [3] = u58
                            --]]
                            u136.Position = p138
                            local v139 = u125
                            local v140 = u125:GetPivot()
                            local v141 = u58 * 50
                            local v142 = math.sin(v141) / 10
                            v139:PivotTo(v140 + Vector3.new(0, v142, 0))
                        end
                        local v144 = u22
                        local v145 = Vector3.new(0, v144, 0)
                        u19(0.5, u10, v143, u136.Position - v145, u136.Position)
                        task.wait(0.5)
                    end
                end)
                u19(1, u10, function(p146) --[[ Line: 395 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                    --]]
                    for v147, v148 in u51:GetDescendants() do
                        local _ = v147 - 1
                        if v148:IsA("ParticleEmitter") then
                            v148.Color = ColorSequence.new(p146)
                        end
                    end
                end, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 100, 100))
            end)
        end
    end)
    u19(1, u10, function(p149) --[[ Line: 428 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        for v150, v151 in u51:GetDescendants() do
            local _ = v150 - 1
            if v151:IsA("ParticleEmitter") then
                v151.LightInfluence = p149
            end
        end
    end, 0, 20)
    task.delay(6, function() --[[ Line: 439 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:DoCleaning()
    end)
    return u34
end
return u26