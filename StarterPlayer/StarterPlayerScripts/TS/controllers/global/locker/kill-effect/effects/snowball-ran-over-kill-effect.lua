local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SnowballRanOverKillEffect"
    end,
    ["__index"] = u10
})
u11.__index = u11
function u11.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, p15) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p14, p15)
    u10.setPlayDefaultKillEffect(p14, false)
end
function u11.onKill(p16, _, p17, _) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u10
        [5] = u4
        [6] = u9
        [7] = u8
        [8] = u2
    --]]
    local v18 = u3.new()
    p17.Archivable = true
    local u19 = p17:Clone()
    u19.Parent = u7
    local u20 = u6.Assets.Effects.Snowball:Clone()
    u19.PrimaryPart.Anchored = true
    for v21, v22 in u19:GetChildren() do
        local _ = v21 - 1
        if v22:IsA("Part") or v22:IsA("MeshPart") then
            v22.CanCollide = false
        end
    end
    u19.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    v18:GiveTask(u19)
    u10.hideCharacter(p16, p17)
    local u23 = u19.PrimaryPart
    if u23 ~= nil then
        u23 = u23.CFrame
    end
    if not u23 then
        return v18
    end
    local u24 = u23 * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966) - Vector3.new(0, 2, 0)
    local v25 = (u23 * CFrame.Angles(0, -1.5707963267948966, 0)).LookVector
    local v26 = u23.Position + v25 * 45 + Vector3.new(0, 1, 0)
    u20:PivotTo(CFrame.new(v26))
    u20.Parent = u7
    v18:GiveTask(u20)
    v18:GiveTask((u4("Sound", {
        ["RollOffMinDistance"] = 80,
        ["RollOffMaxDistance"] = 120,
        ["Volume"] = 0.6,
        ["Playing"] = true,
        ["SoundId"] = u9.ROLLING_BOULDER_LOOP,
        ["Parent"] = u20
    })))
    local u27 = u7:GetServerTimeNow()
    local u28 = u20.Size
    local u29 = u27
    u8(3, u2, function(p30) --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u29
            [3] = u27
            [4] = u20
            [5] = u23
            [6] = u28
        --]]
        local _ = u7:GetServerTimeNow() - u29
        u29 = u7:GetServerTimeNow()
        local v31 = u7:GetServerTimeNow() - u27
        u20:PivotTo(CFrame.new(p30) * CFrame.fromAxisAngle(u23.LookVector, -v31 * 3.141592653589793 * 2))
        local v32 = v31 * 3
        local v33 = v31 * 3
        local v34 = v31 * 3
        u20.Size = u28 + Vector3.new(v32, v33, v34)
    end, u20.Position, u20.Position - v25 * 120)
    v18:GiveTask(task.delay(1.65, function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u8
            [3] = u2
            [4] = u24
        --]]
        u19.PrimaryPart.Anchored = false
        u8(0.15, u2, function(p35) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19:PivotTo(p35)
        end, u19.PrimaryPart.CFrame, u24)
    end))
    v18:GiveTask(task.delay(1.8, function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u4
        --]]
        u19.Parent = u20
        u4("WeldConstraint", {
            ["Parent"] = u20,
            ["Part0"] = u20,
            ["Part1"] = u19.PrimaryPart
        })
    end))
    v18:GiveTask(task.delay(3, function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u19
        --]]
        u20:Destroy()
        u19:Destroy()
    end))
    return v18
end
return u11