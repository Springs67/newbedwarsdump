local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.Linear
local u8 = v6.OutQuad
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u10 = v9.SingleMotor
local u11 = v9.Spring
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.ReplicatedStorage
local u16 = v14.RunService
local u17 = v14.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u21 = Random.new()
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "ButterflyKillEffect"
    end,
    ["__index"] = u20
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25, p26) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    u20.constructor(p25, p26)
    u20.setPlayDefaultKillEffect(p25, false)
end
function u22.onKill(p27, _, p28, u29) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
        [3] = u20
        [4] = u15
        [5] = u5
        [6] = u4
        [7] = u19
        [8] = u21
        [9] = u13
        [10] = u10
        [11] = u16
        [12] = u3
        [13] = u18
        [14] = u7
        [15] = u11
        [16] = u8
    --]]
    local u30 = u12.new()
    p28.Archivable = true
    local u31 = p28:Clone()
    u31.HumanoidRootPart.Anchored = true
    u31:PivotTo(u29)
    u31.Parent = u17
    u20.hideCharacter(p27, p28)
    u30:GiveTask(u31)
    local u32 = u15.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone()
    u32.Parent = u17.Terrain
    u30:GiveTask(u32)
    local u33 = {}
    for _, v34 in u32:GetDescendants() do
        if v34:IsA("ParticleEmitter") then
            u33[v34] = u5.copy(v34.Size.Keypoints)
        end
    end
    u4:playSound(u19.SPIRIT_EFFECT, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = u29.Position
    })
    local v35 = false
    local v36 = 0
    local u37 = {}
    while true do
        if v35 then
            v36 = v36 + 1
        else
            v35 = true
        end
        if v36 >= 10 then
            u30:GiveTask(u16.Heartbeat:Connect(function(p38) --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u29
                --]]
                for _, v39 in u37 do
                    v39.elapsedTime = v39.elapsedTime + p38
                    local v40 = v39.instance:GetPivot()
                    local v41 = math.noise(v39.elapsedTime / 3, v39.seed, 0) * 0.5
                    local v42 = math.noise(v39.elapsedTime / 3, 1, -v39.seed) * 0.5
                    local v43 = math.noise(v39.elapsedTime / 3, 0, v39.seed * 2) * 0.5
                    local v44 = Vector3.new(v41, v42, v43)
                    local v45 = u29.Position
                    local v46 = v39.elapsedTime * 0.5
                    local v47 = math.sin(v46) * 6
                    local v48 = v39.elapsedTime + v39.seed
                    local v49 = math.sin(v48) * 3
                    local v50 = v39.elapsedTime * 0.5
                    local v51 = math.cos(v50) * 6
                    local v52 = (v45 + Vector3.new(v47, v49, v51) - v40.Position).Unit * -0.3
                    local v53 = u29.Position
                    local v54 = v40.Position
                    local v55 = v44 + ((v53 - Vector3.new(0, 1, 0) - v54).Y > 0 and Vector3.new(0, -0.6, 0) or Vector3.new()) + v52
                    local v56 = (v40 * CFrame.new(0, 0, 3)).Position + v55 - v40.Position
                    local v57 = CFrame
                    local v58 = v40.Position
                    local v59 = v40.Position
                    v39.goalAttachment.WorldCFrame = v57.lookAt(v58, v59 + v55)
                    v39.linearVelocity.VectorVelocity = v56.Unit * 4
                end
            end))
            task.delay(1, function() --[[ Line: 158 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u30
                    [3] = u16
                    [4] = u4
                    [5] = u3
                    [6] = u19
                    [7] = u37
                    [8] = u21
                    [9] = u13
                    [10] = u18
                    [11] = u7
                    [12] = u11
                    [13] = u32
                    [14] = u33
                    [15] = u8
                --]]
                local v60 = 0
                local u61 = {}
                for v62, v63 in u31:GetDescendants() do
                    local _ = v62 - 1
                    if v63:IsA("BasePart") == true then
                        v60 = v60 + 1
                        u61[v60] = v63
                    end
                end
                for _, v64 in u61 do
                    v64:BreakJoints()
                    v64.Anchored = true
                end
                local u65 = 4 / #u61
                local u66 = -1
                u30:GiveTask(u16.Heartbeat:Connect(function() --[[ Line: 180 ]]
                    --[[
                    Upvalues:
                        [1] = u66
                        [2] = u65
                        [3] = u61
                        [4] = u4
                        [5] = u3
                        [6] = u19
                        [7] = u37
                        [8] = u21
                        [9] = u13
                        [10] = u18
                        [11] = u7
                        [12] = u11
                        [13] = u32
                        [14] = u33
                        [15] = u8
                    --]]
                    if u65 <= os.clock() - u66 then
                        u66 = os.clock()
                        local v67 = #u61
                        local u68 = u61[v67]
                        u61[v67] = nil
                        if u68 == nil then
                            return nil
                        end
                        u4:playSound(u3.fromList(u19.SPIRITORB_PULL_1, u19.SPIRITORB_PULL_2, u19.SPIRITORB_PULL_3), {
                            ["position"] = u68.Position
                        })
                        local u69 = u37[u21:NextInteger(0, #u37 - 1) + 1]
                        local v70 = u68:FindFirstChildOfClass("Attachment")
                        if v70 == nil then
                            v70 = u13("Attachment", {
                                ["Parent"] = u68
                            })
                        end
                        u69.beam.Attachment1 = v70
                        task.spawn(function() --[[ Line: 204 ]]
                            --[[
                            Upvalues:
                                [1] = u18
                                [2] = u7
                                [3] = u68
                                [4] = u69
                                [5] = u11
                                [6] = u4
                                [7] = u3
                                [8] = u19
                                [9] = u32
                                [10] = u33
                                [11] = u8
                            --]]
                            u18(0.3, u7, function(p71) --[[ Line: 205 ]]
                                --[[
                                Upvalues:
                                    [1] = u68
                                --]]
                                u68.CFrame = p71
                            end, u68.CFrame, u69.instance:GetPivot())
                            task.wait(0.2)
                            if u69.instance.PrimaryPart then
                                u69.motor:setGoal(u11.new(1 + u69.partCount * 0.3, {
                                    ["dampingRatio"] = 0.8,
                                    ["frequency"] = 6
                                }))
                                u4:playSound(u3.fromList(u19.SPIRITORB_ABSORB_1, u19.SPIRITORB_ABSORB_2, u19.SPIRITORB_ABSORB_2), {
                                    ["position"] = u68.Position
                                })
                                u32.WorldCFrame = u69.instance:GetPivot()
                                for _, v72 in u32:GetChildren() do
                                    if v72:IsA("ParticleEmitter") then
                                        local v73 = v72:GetAttribute("EmitCount")
                                        local v74 = u33[v72]
                                        if v74 ~= nil then
                                            local v75 = {}
                                            for v76, v77 in pairs(v74) do
                                                local v78 = NumberSequenceKeypoint.new(v77.Time, v74[v76 - 1 + 1].Value * 0.6, v74[v76 - 1 + 1].Envelope)
                                                table.insert(v75, v78)
                                            end
                                            v72.Size = NumberSequence.new(v75)
                                            v72:Emit(v73)
                                        end
                                    end
                                end
                                local v79 = u69
                                v79.partCount = v79.partCount + 1
                            end
                            u18(0.1, u8, function(p80) --[[ Line: 239 ]]
                                --[[
                                Upvalues:
                                    [1] = u68
                                --]]
                                u68.Size = p80
                            end, u68.Size, Vector3.new(0, 0, 0)):Wait()
                            u68:Destroy()
                        end)
                    end
                end))
            end)
            u30:GiveTask(function() --[[ Line: 247 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                for _, v81 in u37 do
                    v81.instance:Destroy()
                    v81.goalAttachment:Destroy()
                    v81.motor:destroy()
                end
            end)
            task.delay(7, function() --[[ Line: 254 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u18
                    [3] = u8
                    [4] = u30
                --]]
                for _, u82 in u37 do
                    local function v84(p83) --[[ Line: 256 ]]
                        --[[
                        Upvalues:
                            [1] = u82
                        --]]
                        if u82.instance.PrimaryPart then
                            u82.instance.PrimaryPart.Size = p83
                        end
                    end
                    local v85 = u82.instance.PrimaryPart
                    if v85 ~= nil then
                        v85 = v85.Size
                    end
                    u18(0.5, u8, v84, v85 == nil and Vector3.new(1, 1, 1) or v85, (Vector3.new()))
                end
                task.wait(0.5)
                u30:DoCleaning()
            end)
            return u30
        end
        local v86 = CFrame.new
        local v87 = u21:NextNumber(0, 1) * 100
        local v88 = math.sin(v87) * 5
        local v89 = u21:NextNumber(0, 1) * 100
        local v90 = u29 * v86(v88, 0, math.cos(v89) * 5)
        local u91 = u15.Assets.Effects.KillEffectButterfly:Clone()
        u91:PivotTo(CFrame.lookAt(v90.Position, u29.Position))
        u91.Parent = u17
        local v92 = u13("Attachment", {
            ["Parent"] = u91.PrimaryPart
        })
        local v93 = u13("Attachment", {
            ["Parent"] = u17.Terrain
        })
        local v94 = u13("LinearVelocity", {
            ["Parent"] = u91.PrimaryPart,
            ["MaxForce"] = u91.PrimaryPart.AssemblyMass * 10,
            ["Attachment0"] = v92
        })
        u13("AlignOrientation", {
            ["MaxTorque"] = 50000000,
            ["Responsiveness"] = 3,
            ["Parent"] = u91.PrimaryPart,
            ["Attachment0"] = v92,
            ["Attachment1"] = v93
        })
        local v95 = u15.Assets.Effects.ButterflyBeam:Clone()
        v95.Parent = v92
        v95.Attachment0 = v92
        u91.PrimaryPart.Anchored = false
        local v96 = u10.new(1)
        v96:onStep(function(p97) --[[ Line: 108 ]]
            --[[
            Upvalues:
                [1] = u91
            --]]
            if u91.PrimaryPart then
                u91.PrimaryPart.Size = Vector3.new(p97, p97, p97)
            end
        end)
        local v98 = {
            ["partCount"] = 1,
            ["consuming"] = false,
            ["instance"] = u91,
            ["origin"] = v90,
            ["seed"] = u21:NextNumber(-50000, 50000),
            ["linearVelocity"] = v94,
            ["goalAttachment"] = v93,
            ["elapsedTime"] = v36 * 0.6283185307179586 * 2,
            ["motor"] = v96,
            ["beam"] = v95
        }
        table.insert(u37, v98)
    end
end
return u22