local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.InExpo
local u5 = v3.InQuart
local u6 = v3.Linear
local u7 = v3.OutExpo
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.RunService
local u12 = v9.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u17 = Random.new()
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "AbductionKillEffect"
    end,
    ["__index"] = u16
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21, p22) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.constructor(p21, p22)
    u16.setPlayDefaultKillEffect(p21, false)
end
function u18.onKill(p23, _, p24, p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u16
        [4] = u2
        [5] = u15
        [6] = u10
        [7] = u11
        [8] = u1
        [9] = u14
        [10] = u7
        [11] = u4
        [12] = u6
        [13] = u13
        [14] = u17
        [15] = u5
    --]]
    local v26 = u8.new()
    p24.Archivable = true
    local u27 = p24:Clone()
    u27.HumanoidRootPart.Anchored = true
    u27.Parent = u12
    v26:GiveTask(u27)
    u16.hideCharacter(p23, p24)
    v26:GiveTask((u2:playSound(u15.UFO_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = p25.Position
    })))
    local u28 = u10.Assets.Misc.UFO:Clone()
    for v29, v30 in u28:GetDescendants() do
        local _ = v29 - 1
        if v30:IsA("BasePart") then
            v30.CanQuery = false
        end
    end
    u28:PivotTo(u27:GetPivot() * CFrame.new(0, 50, 0))
    u28.Parent = u12
    v26:GiveTask(u28)
    local u31 = u28.Body
    u31.Parent = u12
    v26:GiveTask(u31)
    local u38 = u11.Heartbeat:Connect(function(_) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u28
        --]]
        local v32 = u31:GetPivot()
        local v33 = v32 - v32.Position
        local v34 = u31
        local v35 = CFrame.new(u28.Main.Position)
        local v36 = CFrame.new
        local v37 = time() * 2
        v34:PivotTo(v35 * v36(0, math.sin(v37) / 1.5, 0) * v33 * CFrame.Angles(0, 0.05235987755982989, 0))
    end)
    v26:GiveTask(u38)
    local u47 = u1.Promise.new(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u28
            [2] = u27
            [3] = u14
            [4] = u7
            [5] = u31
            [6] = u4
            [7] = u6
            [8] = u13
            [9] = u17
            [10] = u5
            [11] = u38
        --]]
        task.wait(0.15)
        u14(0.3, u7, function(p39) --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            return u28:PivotTo(p39)
        end, u28:GetPivot(), u27:GetPivot() * CFrame.new(0, 10, 0)):Wait()
        local u40 = u31:FindFirstChild("Beam")
        if u40 then
            u14(0.5, u4, function(p41) --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u6
                --]]
                u40.Transparency = u6(p41, 1, -0.4, 1)
            end, 0, 1):Wait()
        end
        for _, u43 in u27:GetChildren() do
            if u43:IsA("Accessory") then
                local u43 = u43:FindFirstChild("Handle")
                if u13.instanceIsA("BasePart")(u43) then
                    ::l9::
                    u43.Anchored = true
                    u43:BreakJoints()
                    task.spawn(function() --[[ Line: 115 ]]
                        --[[
                        Upvalues:
                            [1] = u17
                            [2] = u43
                            [3] = u28
                            [4] = u14
                            [5] = u4
                        --]]
                        u14(u17:NextNumber(0.2, 0.3), u4, function(p44) --[[ Line: 117 ]]
                            --[[
                            Upvalues:
                                [1] = u43
                            --]]
                            u43.CFrame = p44
                        end, u43.CFrame, u28:GetPivot() * CFrame.new(u17:NextNumber(-3, 3), u17:NextNumber(1, 2), u17:NextNumber(-3, 3))):Wait()
                        u43:Destroy()
                    end)
                    task.wait(0.1)
                end
            elseif u43:IsA("BasePart") and u43 ~= u27.PrimaryPart then
                goto l9
            end
        end
        task.wait(1)
        if u40 then
            u14(0.5, u4, function(p45) --[[ Line: 131 ]]
                --[[
                Upvalues:
                    [1] = u40
                --]]
                u40.Transparency = p45
                return u40.Transparency
            end, u40.Transparency, 1):Wait()
        end
        u14(0.2, u5, function(p46) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            return u28:PivotTo(p46)
        end, u28:GetPivot(), u28:GetPivot() * CFrame.new(0, 10, 0)):Wait()
        u38:Disconnect()
        u31:Destroy()
        u28:Destroy()
        u27:Destroy()
    end)
    v26:GiveTask(function() --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u47
        --]]
        return u47:cancel()
    end)
    return v26
end
return u18