local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "animation-util").AnimationUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u15 = {
    u13.DEER_STOMP_1,
    u13.DEER_STOMP_2,
    u13.DEER_STOMP_3,
    u13.DEER_STOMP_4
}
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "SleighRanOverKillEffect"
    end,
    ["__index"] = u14
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p19, p20)
    p19.preloaded = false
    u14.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(p21, _, p22, _) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u15
        [4] = u13
        [5] = u10
        [6] = u11
        [7] = u14
        [8] = u7
        [9] = u3
        [10] = u12
        [11] = u5
        [12] = u2
        [13] = u8
    --]]
    local v23 = u6.new()
    if not p21.preloaded then
        local v24 = u4.Controllers.PreloadController
        local v25 = {}
        local v26 = {}
        local v27 = #v26
        local v28 = #u15
        table.move(u15, 1, v28, v27 + 1, v26)
        local v29 = v27 + v28
        v26[v29 + 1] = u13.DEER_SLEIGH_CRUSH
        v26[v29 + 2] = u13.DEER_SLEIGH_LOOP
        v25.sounds = v26
        v24:runPreload(v25)
        p21.preloaded = true
    end
    p22.Archivable = true
    local u30 = p22:Clone()
    local u31 = u10.Assets.Misc:WaitForChild("santa"):WaitForChild("santa_sleigh"):Clone()
    u30.Parent = u11
    u30.PrimaryPart.Anchored = true
    for v32, v33 in u30:GetChildren() do
        local _ = v32 - 1
        if v33:IsA("Part") or v33:IsA("MeshPart") then
            v33.CanCollide = false
        end
    end
    u30.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    v23:GiveTask(u30)
    u14.hideCharacter(p21, p22)
    local v34 = u30.PrimaryPart
    if v34 ~= nil then
        v34 = v34.CFrame
    end
    if not v34 then
        return v23
    end
    local u35 = v34 * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966) - Vector3.new(0, 1.5, 0)
    local v36 = (v34 * CFrame.Angles(0, -1.5707963267948966, 0)).LookVector
    local v37 = v34.Position + v36 * 75 + Vector3.new(0, 2.5, 0)
    u31:PivotTo(CFrame.new(v37, v34.Position) * CFrame.Angles(0, -1.5707963267948966, 0))
    local v38 = u31:WaitForChild("sleigh")
    u31.Parent = u11
    u7("Sound", {
        ["RollOffMinDistance"] = 110,
        ["RollOffMaxDistance"] = 220,
        ["Volume"] = 1,
        ["Playing"] = true,
        ["Looped"] = true,
        ["SoundId"] = u13.DEER_SLEIGH_LOOP,
        ["Parent"] = v38.PrimaryPart
    })
    local v39 = {
        {
            ["sleighDelta"] = Vector3.new(0, 0, 0),
            ["model"] = v38
        }
    }
    for _, v40 in u31:GetChildren() do
        if v40:IsA("Model") and v40.Name == "deer" then
            local v41 = {
                ["model"] = v40,
                ["sleighDelta"] = (v40:GetPivot():Inverse() * v38:GetPivot()).Position
            }
            table.insert(v39, v41)
            u3:playAnimation(v40:FindFirstChildWhichIsA("AnimationController"):FindFirstChildWhichIsA("Animator"), "rbxassetid://8246523829", {
                ["looped"] = true
            })
        end
    end
    u12(5, u5, function(p42) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:PivotTo(p42)
    end, v38.PrimaryPart.CFrame, v38.PrimaryPart.CFrame - v36 * 150)
    task.delay(5, function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:Destroy()
    end)
    task.delay(6.5, function() --[[ Line: 132 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:Destroy()
    end)
    task.delay(3.25, function() --[[ Line: 135 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u30
            [4] = u35
        --]]
        u12(0.1, u5, function(p43) --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:PivotTo(p43)
        end, u30.PrimaryPart.CFrame, u35)
    end)
    task.delay(3.35, function() --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u12
            [3] = u5
            [4] = u2
            [5] = u15
        --]]
        local u44 = u30.PrimaryPart.CFrame
        u12(0.5, u5, function(_) --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u44
            --]]
            u30:PivotTo(u44 * CFrame.Angles(math.random(-1, 1) * 3.141592653589793 / 32, math.random(-1, 1) * 3.141592653589793 / 32, math.random(-1, 1) * 3.141592653589793 / 32))
        end, 0, 1)
        local v45 = false
        local v46 = 0
        while true do
            if v45 then
                v46 = v46 + 1
            else
                v45 = true
            end
            if v46 >= 4 then
                return
            end
            u2:playSound(u15[v46 + 1], {
                ["position"] = u44.Position
            })
            task.wait(0.1)
        end
    end)
    task.delay(4, function() --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u2
            [3] = u13
            [4] = u12
            [5] = u5
            [6] = u35
            [7] = u8
        --]]
        local v47 = u30.PrimaryPart.CFrame
        u2:playSound(u13.DEER_SLEIGH_CRUSH, {
            ["position"] = v47.Position
        })
        u12(0.05, u5, function(p48) --[[ Line: 182 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:PivotTo(p48)
        end, u30.PrimaryPart.CFrame, u35 - Vector3.new(0, 1, 0))
        u8(u30, Vector3.new(1, 1, 0.1))
    end)
    return v23
end
return u16