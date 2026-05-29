local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.RunService
local u11 = v8.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u14 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u15 = Random.new()
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "RibbonKillEffect"
    end,
    ["__index"] = u14
})
u16.__index = u16
function u16.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p19, p20)
    u14.setPlayDefaultKillEffect(p19, false)
end
function u16.calculateSourcePositionForTime(_, p21, p22, p23, p24, p25) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v26 = p21.Position
    local v27 = p22 + p23
    local v28 = math.sin(v27) * 8
    local v29 = u5(math.clamp(p24, 0, 6), 0, 9, 6) + math.noise(p22 + p25) * 2
    local v30 = p22 + p23
    local v31 = math.cos(v30) * 8
    return v26 + Vector3.new(v28, v29, v31)
end
function u16.onKill(u32, _, p33, p34) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u11
        [3] = u14
        [4] = u4
        [5] = u12
        [6] = u7
        [7] = u3
        [8] = u9
        [9] = u10
        [10] = u15
        [11] = u13
    --]]
    local u35 = u6.new()
    p33.Archivable = true
    local u36 = p33:Clone()
    u36.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u36.HumanoidRootPart.Anchored = true
    u36:PivotTo(p34)
    u36.Parent = u11
    u14.hideCharacter(u32, p33)
    u35:GiveTask(u36)
    u35:GiveTask(u4:playSound(u12.STRING_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 150,
        ["rollOffMinDistance"] = 50,
        ["position"] = p34.Position
    }))
    local u37 = p34 * CFrame.new(0, -3.5, 0)
    local u38 = u7("Part", {
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Size"] = Vector3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Parent"] = u11,
        ["CFrame"] = u37,
        ["CustomPhysicalProperties"] = PhysicalProperties.new(10, 1, 1)
    })
    u3:setQueryIgnored(u38, true)
    u35:GiveTask(u38)
    local v39 = u7("Part", {
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Size"] = Vector3.new(1, 1, 1),
        ["Transparency"] = 1,
        ["Parent"] = u11,
        ["CFrame"] = u37 * CFrame.new(0, 8, 0)
    })
    u3:setQueryIgnored(u38, true)
    u35:GiveTask(v39)
    local u40 = u7("Attachment", {
        ["Parent"] = v39
    })
    u35:GiveTask(u40)
    local u41 = u7("Part", {
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Size"] = Vector3.new(1, 1, 1),
        ["Parent"] = u11,
        ["CFrame"] = p34 * CFrame.new(-5, 0, 0)
    })
    u3:setQueryIgnored(u41, true)
    u35:GiveTask(u41)
    local v42 = u7("Attachment", {
        ["Parent"] = u41
    })
    local u43 = u7("RopeConstraint", {
        ["Visible"] = false,
        ["Thickness"] = 0.2,
        ["Color"] = BrickColor.new("Bright red"),
        ["Parent"] = u40,
        ["Length"] = (u38.Position - u41.Position).Magnitude,
        ["Attachment0"] = u40,
        ["Attachment1"] = v42
    })
    local u44 = u7("Folder", {
        ["Parent"] = u11
    })
    u35:GiveTask(u44)
    local u45 = u9.Assets.Effects.RopeSegment:Clone()
    u3:setQueryIgnored(u45, true)
    u45.Color = Color3.fromRGB(255, 0, 0)
    u45.Parent = u11
    u35:GiveTask(u45)
    local u46 = {
        {
            ["position"] = u41.Position,
            ["relativePosition"] = u36.HumanoidRootPart.Position - u41.Position
        }
    }
    local u47 = math.random() * 500
    local u48 = math.random() * 500
    local u49 = 0
    local u50 = 0
    local u51 = false
    u35:GiveTask(u10.Heartbeat:Connect(function(p52) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u51
            [3] = u43
            [4] = u41
            [5] = u36
            [6] = u15
            [7] = u35
            [8] = u32
            [9] = u37
            [10] = u50
            [11] = u47
            [12] = u48
            [13] = u38
            [14] = u46
            [15] = u44
            [16] = u11
            [17] = u9
            [18] = u3
            [19] = u13
            [20] = u40
            [21] = u45
        --]]
        if u49 > 2.8 then
            if u51 == false then
                u51 = true
                u43.Length = 10
                u41:Destroy()
                u36.HumanoidRootPart.Anchored = false
                u36.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                for _, v53 in u36:GetDescendants() do
                    if v53:IsA("BasePart") then
                        v53.CanCollide = false
                    end
                end
                task.delay(0.05, function() --[[ Line: 153 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u15
                    --]]
                    local v54 = u36.HumanoidRootPart
                    local v55 = u36.HumanoidRootPart.AssemblyMass * 60
                    local v56 = u36.HumanoidRootPart.AssemblyMass * 60
                    local v57 = u36.HumanoidRootPart.AssemblyMass * 60
                    v54:ApplyImpulse(Vector3.new(v55, v56, v57) * (Vector3.new(0, 1, 0) + u15:NextUnitVector() * 0.1))
                end)
                task.delay(0.37, function() --[[ Line: 160 ]]
                    --[[
                    Upvalues:
                        [1] = u35
                    --]]
                    u35:DoCleaning()
                end)
            end
        else
            local v58 = (u32:calculateSourcePositionForTime(u37, u50 + p52 * 50, u47, u49 + p52, u48) - u38.Position).Magnitude
            local v59
            if u49 < 0.1 then
                v59 = 1
            else
                local v60 = v58 / 0.5
                v59 = math.floor(v60)
            end
            local v61 = math.clamp(v59, 0, 20)
            local v62 = false
            local v63 = 0
            while true do
                if true then
                    if v62 then
                        v63 = v63 + 1
                    else
                        v62 = true
                    end
                end
                if v63 >= v61 then
                    break
                end
                local v64 = p52 * ((v63 + 1) / v61)
                local v65 = u49 + v64
                local v66 = u32:calculateSourcePositionForTime(u37, u50 + v64 * 50, u47, v65, u48)
                u38.Position = v66
                local v67 = u46[#u46 - 1 + 1]
                local v68 = v67.position - v66
                local v69 = RaycastParams.new()
                v69.FilterType = Enum.RaycastFilterType.Whitelist
                v69.FilterDescendantsInstances = { u36, u44 }
                local v70 = u11:Raycast(v66, v68, v69)
                if v70 and (v67 == nil or (v67.position - v70.Position).Magnitude > 0.2) then
                    local v71 = v70.Position + v70.Normal * 0.05
                    local v72 = {
                        ["position"] = v71,
                        ["relativePosition"] = v71 - u36.HumanoidRootPart.Position
                    }
                    local v73 = u46
                    table.insert(v73, v72)
                    if v67 and #u46 > 2 then
                        local v74 = u9.Assets.Effects.RopeSegment:Clone()
                        u3:setQueryIgnored(v74, true)
                        v74.Color = Color3.fromRGB(255, 0, 0)
                        v74.Anchored = false
                        local v75 = v67.position:Lerp(v71, 0.5)
                        local v76 = (v67.position - v71).Magnitude
                        v74.Size = Vector3.new(0.1, 0.1, v76)
                        v74:PivotTo(CFrame.lookAt(v75, v71))
                        v74.Parent = u44
                        u13:weldPartsWithJoint(u36.HumanoidRootPart, v74, "Weld")
                        u35:GiveTask(v74)
                    end
                end
            end
        end
        u50 = u50 + p52 * 50
        u49 = u49 + p52
        local v77 = u46[#u46 - 1 + 1]
        local v78
        if u49 > 2.8 then
            v78 = u40.WorldPosition
        else
            v78 = u38.Position
        end
        if v77 then
            local v79 = u36.HumanoidRootPart.Position + v77.relativePosition
            local v80 = v79:Lerp(v78, 0.5)
            local v81 = u45
            local v82 = (v79 - v78).Magnitude
            v81.Size = Vector3.new(0.1, 0.1, v82)
            u45:PivotTo(CFrame.lookAt(v80, v78))
        end
    end))
    return u35
end
return u16