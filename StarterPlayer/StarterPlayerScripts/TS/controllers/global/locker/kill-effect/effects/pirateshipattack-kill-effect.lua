local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.InExpo
local u5 = v3.OutExpo
local u6 = v3.OutSine
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.RunService
local u13 = v10.Workspace
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "PirateShipAttackKillEffect"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p20, p21)
    u16.setPlayDefaultKillEffect(p20, false)
end
function u17.onKill(p22, _, p23, u24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u16
        [4] = u11
        [5] = u9
        [6] = u14
        [7] = u5
        [8] = u8
        [9] = u4
        [10] = u2
        [11] = u15
        [12] = u1
        [13] = u6
        [14] = u12
    --]]
    local u25 = u7.new()
    p23.Archivable = true
    local u26 = p23:Clone()
    u26.HumanoidRootPart.Anchored = true
    u26:PivotTo(u24)
    u26.Parent = u13
    local u27 = true
    for v28, v29 in u26:GetDescendants() do
        local _ = v28 - 1
        if v29:IsA("BasePart") then
            v29.CanCollide = false
            v29.CanQuery = false
        end
    end
    u16.hideCharacter(p22, p23)
    u25:GiveTask(u26)
    local u30 = u26:GetPivot()
    local u31 = u11.Assets.Misc.PirateShip:Clone()
    u31:PivotTo(u30 * (CFrame.new(5, 8, 10) * CFrame.fromOrientation(0.5235987755982988, 1.5707963267948966, 0)))
    local v32 = u31:FindFirstChild("RootPart")
    if v32 ~= nil then
        local v33 = v32:FindFirstChild("master_bone")
        if v33 ~= nil then
            local v34 = v33:FindFirstChild("hull")
            if v34 ~= nil then
                v34:Destroy()
            end
        end
    end
    for v35, v36 in u31:GetDescendants() do
        local _ = v35 - 1
        if v36:IsA("BasePart") then
            v36.CanCollide = false
            v36.CanQuery = false
            v36.Transparency = 1
        elseif v36:IsA("Decal") then
            v36.Transparency = 1
        end
    end
    u9(u31, 0.05)
    u31.Parent = u13
    u25:GiveTask(u31)
    for v37, u38 in u31:GetDescendants() do
        local _ = v37 - 1
        if u38:IsA("BasePart") then
            u14(0.75, u5, function(p39) --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                u38.Transparency = p39
                return u38.Transparency
            end, 1, 0)
        end
    end
    local function u43() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u8
            [3] = u25
            [4] = u31
            [5] = u13
            [6] = u14
            [7] = u4
            [8] = u30
            [9] = u11
            [10] = u24
            [11] = u2
            [12] = u15
        --]]
        if not u27 then
            return nil
        end
        local u40 = u8("Part", {
            ["Name"] = "PirateShipAttackKillEffect_CannonBall",
            ["Size"] = Vector3.new(2, 2, 2),
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["Shape"] = Enum.PartType.Ball,
            ["Color"] = Color3.fromHex("#353536")
        })
        u25:GiveTask(u40)
        u40.CFrame = u31:GetPivot()
        u40.Parent = u13
        u8("Trail", {
            ["Attachment0"] = u8("Attachment", {
                ["Position"] = Vector3.new(0, -0.75, 0),
                ["Parent"] = u40
            }),
            ["Attachment1"] = u8("Attachment", {
                ["Position"] = Vector3.new(0, 0.75, 0),
                ["Parent"] = u40
            }),
            ["Parent"] = u40,
            ["Transparency"] = NumberSequence.new(0.6)
        })
        u14(0.5, u4, function(p41) --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40.CFrame = p41
            return u40.CFrame
        end, u40.CFrame, u30 * CFrame.new(0, -3 + u40.Size.Y / 2, 0)):Wait()
        if not u27 then
            return nil
        end
        if u40 then
            u40:Destroy()
            local v42 = u11.Assets.Effects.GuidedMissileExplosion:Clone()
            u25:GiveTask(v42)
            v42.Position = u24.Position
            v42.Parent = u13
            v42.Debris1.Size = NumberSequence.new(0.25)
            v42.Debris2.Size = NumberSequence.new(0.5)
            v42.Debris2.Lifetime = NumberRange.new(4)
            v42.ExplosionFlames.Size = NumberSequence.new(1.5)
            v42.Debris1:Emit(5)
            v42.Debris2:Emit(5)
            v42.ExplosionFlames:Emit(50)
        end
        u25:GiveTask(u2:playSound(u15.MINICOPTER_EXPLODE, {
            ["rollOffMaxDistance"] = 160,
            ["position"] = u24.Position
        }))
    end
    local u60 = u1.Promise.new(function() --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u14
            [3] = u6
            [4] = u30
            [5] = u25
            [6] = u12
            [7] = u27
            [8] = u1
            [9] = u43
            [10] = u5
            [11] = u26
            [12] = u8
        --]]
        u14(1, u6, function(p44) --[[ Line: 166 ]]
            --[[
            Upvalues:
                [1] = u31
            --]]
            return u31:PivotTo(p44)
        end, u31:GetPivot(), u30 * (CFrame.new(0, 10, 10) * CFrame.Angles(0, 1.5707963267948966, 0))):Wait()
        local u45 = u30
        u25:GiveTask(u12.Heartbeat:Connect(function(_) --[[ Line: 176 ]]
            --[[
            Upvalues:
                [1] = u45
                [2] = u31
            --]]
            u45 = u45 * CFrame.Angles(0, -0.005, 0)
            local v46 = u31
            local v47 = u45
            local v48 = CFrame.new(0, 10, 10)
            local v49 = CFrame.Angles(0, 1.5707963267948966, 0)
            v46:PivotTo(v47 * v48 * v49)
        end))
        local v50 = Random.new(os.time())
        local v51 = v50:NextInteger(4, 6)
        local v52 = math.round(v51)
        local v53 = false
        local v54 = 0
        while true do
            if v53 then
                v54 = v54 + 1
            else
                v53 = true
            end
            if v54 >= v52 then
                for v55, u56 in u31:GetDescendants() do
                    local _ = v55 - 1
                    if u56:IsA("BasePart") then
                        u14(0.75, u5, function(p57) --[[ Line: 217 ]]
                            --[[
                            Upvalues:
                                [1] = u56
                            --]]
                            u56.Transparency = p57
                            return u56.Transparency
                        end, 0, 1)
                    end
                end
                if not u27 then
                    return nil
                end
                u26:BreakJoints()
                u25:GiveTask(u8("Explosion", {
                    ["BlastRadius"] = 1,
                    ["DestroyJointRadiusPercent"] = 0,
                    ["Position"] = u26:GetPivot().Position,
                    ["Parent"] = game.Workspace
                }))
                local u58 = u1.Promise.delay(1):andThen(function() --[[ Line: 238 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                    --]]
                    u25:DoCleaning()
                end)
                u25:GiveTask(function() --[[ Line: 242 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                    --]]
                    return u58:cancel()
                end)
                return
            end
            if not u27 then
                return nil
            end
            local u59 = u1.Promise.new(function() --[[ Line: 204 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                return u43()
            end)
            u25:GiveTask(function() --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u59
                --]]
                return u59:cancel()
            end)
            task.wait(v50:NextNumber(0.3, 0.6))
        end
    end)
    u25:GiveTask(function() --[[ Line: 246 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u27
            [3] = u60
        --]]
        u25:DoCleaning()
        u27 = false
        u60:cancel()
    end)
    u25:GiveTask(function() --[[ Line: 251 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        for v61, v62 in u13:GetChildren() do
            local _ = v61 - 1
            if v62.Name == "PirateShipAttackKillEffect_CannonBall" then
                v62:Destroy()
            end
        end
    end)
    return u25
end
return u17