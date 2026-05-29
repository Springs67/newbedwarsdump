local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.RunService
local u8 = v5.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u11 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = {
    "arm",
    "leg",
    "hand",
    "foot"
}
local function u18(p13) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v14 = string.lower(p13.Name)
    local v15 = false
    for v16, v17 in u12 do
        local _ = v16 - 1
        if string.find(v14, v17) ~= nil then
            return true
        end
    end
    return v15
end
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
        return "PopKillEffect"
    end,
    ["__index"] = u11
})
u19.__index = u19
function u19.new(...) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, p23) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p22, p23)
    u11.setPlayDefaultKillEffect(p22, false)
end
function u19.onKill(p24, _, p25, u26) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u11
        [4] = u2
        [5] = u9
        [6] = u18
        [7] = u7
        [8] = u3
        [9] = u6
        [10] = u10
    --]]
    local u27 = u4.new()
    p25.Archivable = true
    local u28 = p25:Clone()
    u28.Name = "PopKillEffectCharacterClone"
    u28:PivotTo(u26)
    u28.Parent = u8
    u27:GiveTask(u28)
    if not u28.PrimaryPart then
        return u27
    end
    u11.hideCharacter(p24, p25)
    local u29 = u26.Position
    local u30 = u2:playSound(u9.BED_INFLATE_SOUND, {
        ["position"] = u29
    })
    if u30 then
        u27:GiveTask(function() --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            return u30:Destroy()
        end)
    end
    local u31 = u28:GetPivot()
    local u32 = {}
    local u33 = (1 / 0)
    local v34 = u28:GetDescendants()
    local function v38(p35) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u18
            [3] = u32
            [4] = u33
        --]]
        if p35:IsA("BasePart") then
            p35.Anchored = true
            p35.CanCollide = false
            p35.CanQuery = false
            p35.CanTouch = false
            local v36 = u31:ToObjectSpace(p35.CFrame)
            u32[p35] = {
                ["initialSize"] = p35.Size,
                ["initialLocalCFrame"] = v36,
                ["isLimb"] = u18(p35)
            }
            local v37 = v36.Position.Y - p35.Size.Y / 2
            if v37 < u33 then
                u33 = v37
            end
        end
    end
    local u39 = u33
    for v40, v41 in v34 do
        v38(v41, v40 - 1, v34)
    end
    local u42 = 0
    local u91 = u7.Heartbeat:Connect(function(p43) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u3
            [3] = u39
            [4] = u31
            [5] = u26
            [6] = u32
        --]]
        u42 = u42 + p43
        local v44 = u42 / 3
        local v45 = math.min(1, v44)
        local v46 = u42
        local v47 = u3(math.min(v46, 3), 0, 1, 3)
        local u48 = math.lerp(1, 2.200000047683716, v47)
        local u49 = math.lerp(1, 1.7999999523162842, v47)
        local u50 = math.lerp(1, 2.200000047683716, v47)
        local u51 = math.lerp(1, 1.8, v47)
        local v52 = u39 >= 0 and 0 or (u49 - 1) * -u39
        local v53 = math.lerp(0, 0.25, v45) + v52
        local v54 = math.pow(v45, 2.2)
        local v55 = math.pow(v45, 2.4)
        local v56 = v54 * math.lerp(1, 0.82, v55)
        local v57 = math.lerp(2.2, 22, v56)
        local v58 = math.lerp(0.042, 0.24, v56)
        local v59 = math.lerp(0.0020943951023931952, 0.01832595714594046, v56)
        local v60 = u42
        local v61 = CFrame.new
        local v62 = v60 * v57 * 1.07
        local v63 = math.sin(v62) * v58
        local v64 = v60 * v57 * 0.93
        local v65 = math.cos(v64) * v58 * 0.55 + v53
        local v66 = v60 * v57 * 0.71 + 1.2
        local v67 = v61(v63, v65, math.sin(v66) * v58)
        local v68 = CFrame.Angles
        local v69 = v60 * v57 * 1.21
        local v70 = math.cos(v69) * v59 * 0.5
        local v71 = v60 * v57 * 0.88
        local v72 = math.sin(v71) * v59 * 0.5
        local v73 = v60 * v57 * 0.76 + 0.5
        local u74 = v67 * v68(v70, v72, math.cos(v73) * v59 * 0.5)
        local function v88(p75, p76) --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u51
                [2] = u50
                [3] = u48
                [4] = u49
                [5] = u31
                [6] = u26
                [7] = u74
            --]]
            local v77
            if p75.isLimb then
                v77 = u51
            else
                v77 = u50
            end
            local v78 = p75.initialLocalCFrame
            local v79 = v78.Position
            local v80 = v79.X * u48
            local v81 = v79.Y * u49
            local v82 = v79.Z * v77
            local v83 = Vector3.new(v80, v81, v82)
            local v84 = v78 - v78.Position
            p76.CFrame = u26:ToWorldSpace(u74 * u26:ToObjectSpace((u31:ToWorldSpace(CFrame.new(v83) * v84))))
            local v85 = p75.initialSize.X * u48
            local v86 = p75.initialSize.Y * u49
            local v87 = p75.initialSize.Z * v77
            p76.Size = Vector3.new(v85, v86, v87)
        end
        for v89, v90 in u32 do
            v88(v90, v89, u32)
        end
    end)
    u27:GiveTask(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u91
        --]]
        return u91:Disconnect()
    end)
    task.delay(2.7, function() --[[ Line: 153 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u2
            [3] = u9
            [4] = u29
            [5] = u6
            [6] = u8
            [7] = u10
        --]]
        local v92 = u30
        if v92 ~= nil then
            v92:Stop()
        end
        local v93 = {
            ["position"] = u29
        }
        u2:playSound(u9.BED_POP_SOUND, v93)
        local v94 = u6.Assets.Effects.BedPopExplosion:Clone()
        v94.Parent = u8
        v94.CFrame = CFrame.new(u29)
        u10:playEffects({ v94 }, nil, {
            ["sizeMultiplier"] = 2,
            ["destroyAfterSec"] = 3
        })
    end)
    task.delay(2.8499999999999996, function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u91
            [2] = u28
        --]]
        u91:Disconnect()
        u28:Destroy()
    end)
    task.delay(6, function() --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:DoCleaning()
    end)
    return u27
end
return u19