local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.InOutExpo
local u5 = v3.OutExpo
local u6 = v3.OutQuart
local u7 = v3.SoftSpring
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.Workspace
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u15 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "CoffinKillEffect"
    end,
    ["__index"] = u15
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
        [1] = u15
    --]]
    u15.constructor(p19, p20)
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(p21, _, p22, p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u11
        [3] = u2
        [4] = u13
        [5] = u15
        [6] = u10
        [7] = u1
        [8] = u12
        [9] = u5
        [10] = u7
        [11] = u6
        [12] = u14
        [13] = u4
    --]]
    local v24 = u8.new()
    p22.Archivable = true
    local u25 = p22:Clone()
    u25.HumanoidRootPart.Anchored = true
    u25.Parent = u11
    v24:GiveTask(u25)
    local u26 = u25:GetPivot()
    v24:GiveTask(u2:playSound(u13.COFFIN_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = p23.Position
    }))
    u15.hideCharacter(p21, p22)
    local u27 = u10.Assets.Misc.Coffin:Clone()
    u27:PivotTo(u26 * CFrame.new(0, -10, 8))
    u27.Parent = u11
    v24:GiveTask(u27)
    local u44 = u1.Promise.new(function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u12
            [3] = u5
            [4] = u26
            [5] = u7
            [6] = u25
            [7] = u6
            [8] = u14
            [9] = u4
        --]]
        u12(0.4, u5, function(p28) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            return u27:PivotTo(p28)
        end, u27:GetPivot(), u26 * CFrame.new(0, -3 + u27.PrimaryPart.Size.Y / 2, 8)):Wait()
        task.wait(0.2)
        local u29 = u27:FindFirstChild("Door")
        local v30
        if u29 == nil then
            v30 = u29
        else
            v30 = u29.CFrame
        end
        if u29 then
            u12(0.4, u7, function(p31) --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29.CFrame = p31
            end, v30, v30 * CFrame.new(0, 0, -3) * CFrame.Angles(0, -0.3490658503988659, 0)):Wait()
        end
        local function v33(p32) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            return u25:PivotTo(p32)
        end
        local v34 = u27:GetPivot()
        local v35 = CFrame.new(0, 3, 0)
        local v36 = CFrame.Angles(1.5707963267948966, 0, 0)
        u12(0.3, u5, v33, u26, v34 * v35 * v36):Wait()
        task.wait(0.1)
        local function v38(p37) --[[ Line: 89 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            return u25:PivotTo(p37)
        end
        local v39 = u25:GetPivot()
        local v40 = u27:GetPivot()
        local v41 = CFrame.new(0, -1, 0)
        local v42 = CFrame.Angles(1.5707963267948966, 0, 0)
        u12(0.3, u6, v38, v39, v40 * v41 * v42):Wait()
        task.wait(0.25)
        if u29 then
            u12(0.3, u7, function(p43) --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                u29.CFrame = p43
            end, u27.Door.CFrame, v30):Wait()
        end
        task.wait(0.4)
        u25:Destroy()
        u14.tweenModelSize(u27, 0.1, u4, 0):await()
        u27:Destroy()
    end)
    v24:GiveTask(function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u44
        --]]
        return u44:cancel()
    end)
    return v24
end
return u16