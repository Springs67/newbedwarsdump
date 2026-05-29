local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.SoundManager
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.InSine
local u7 = v5.Linear
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.RunService
local u11 = v9.Workspace
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u16 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "PaperKillEffect"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20, p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p20, p21)
    u16.setPlayDefaultKillEffect(p20, false)
end
function u17.onKill(p22, _, p23, u24) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u16
        [4] = u12
        [5] = u7
        [6] = u3
        [7] = u1
        [8] = u15
        [9] = u10
        [10] = u4
        [11] = u14
        [12] = u6
        [13] = u13
    --]]
    local u25 = u8.new()
    p23.Archivable = true
    local u26 = p23:Clone()
    u26.HumanoidRootPart.Anchored = true
    u26.Parent = u11
    u25:GiveTask(u26)
    local v27 = u26:FindFirstChild("_DamageHighlight_")
    if v27 then
        v27:Destroy()
    end
    u16.hideCharacter(p22, p23)
    local u28 = {}
    for v29, v30 in u26:GetDescendants() do
        local _ = v29 - 1
        if v30:IsA("BasePart") then
            v30.CanCollide = false
            v30.CanQuery = false
            v30.CanTouch = false
            local v31 = {
                ["part"] = v30,
                ["originalSize"] = v30.Size
            }
            table.insert(u28, v31)
        end
    end
    local u39 = u12(0.25, u7, function(p32) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u28
        --]]
        for v33, v34 in u28 do
            local _ = v33 - 1
            local v35 = u3:lerp(v34.originalSize.Z, 0.1, p32)
            local v36 = v34.part
            local v37 = v34.part.Size.X
            local v38 = v34.part.Size.Y
            v36.Size = Vector3.new(v37, v38, v35)
        end
    end, 0, 1)
    u39:Play()
    u25:GiveTask(function() --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39:Cancel()
    end)
    local u59 = u1.Promise.new(function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u10
            [3] = u26
            [4] = u25
            [5] = u4
            [6] = u14
            [7] = u24
            [8] = u12
            [9] = u6
            [10] = u13
        --]]
        task.wait(0.75)
        local v40 = u15.randomFloatMaxInclusive(1, 3.5, true)
        local v41 = u15.randomFloatMaxInclusive(1, 3.5, true)
        local v42 = u15.randomFloatMaxInclusive(1, 3.5, true)
        local u43 = Vector3.new(v40, v41, v42)
        local u46 = u10.Heartbeat:Connect(function(p44) --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u43
            --]]
            local v45 = u26.PrimaryPart
            if v45 then
                v45.CFrame = v45.CFrame * CFrame.Angles(u43.X * p44, u43.Y * p44, u43.Z * p44)
            end
        end)
        u25:GiveTask(function() --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u46
            --]]
            u46:Disconnect()
        end)
        local u47 = u4:playModifiableSound(u14.WIND_LOOP, {
            ["volumeMultiplier"] = 1,
            ["looped"] = true,
            ["parent"] = u26,
            ["position"] = u26:GetPivot().Position
        })
        local u48 = 1
        local u49 = nil
        u49 = u10.Heartbeat:Connect(function(p50) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u48
                [2] = u47
                [3] = u49
            --]]
            u48 = u48 - p50 / 5
            u47.Volume = u48
            if u48 <= 0 then
                u49:Disconnect()
                u47:Stop()
                u47:Destroy()
            end
        end)
        u25:GiveTask(u47)
        u25:GiveTask(u49)
        local u51 = u24.Position
        local v52 = u15.randomFloatMaxInclusive(80, 100, true)
        local v53 = u15.randomFloatMaxInclusive(80, 100, true)
        local v54 = u15.randomFloatMaxInclusive(200, 210, false)
        local u55 = u24.Position + Vector3.new(v52, v54, v53)
        local u58 = u12(17, u6, function(p56) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u51
                [2] = u55
                [3] = u26
                [4] = u13
            --]]
            local v57 = u51:Lerp(u55, p56)
            if u26.PrimaryPart then
                u13.setPosition(u26.PrimaryPart, v57)
            end
        end, 0, 1)
        u25:GiveTask(function() --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u58
            --]]
            u58:Cancel()
        end)
        u58:Play():Wait()
    end)
    u25:GiveTask(function() --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u59
        --]]
        return u59:cancel()
    end)
    return u25
end
return u17