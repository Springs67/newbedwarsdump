local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.InCirc
local u8 = v6.InExpo
local u9 = v6.Linear
local u10 = v6.OutExpo
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "UFOBreakBedEffect"
    end,
    ["__index"] = u19
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u17
    --]]
    u19.constructor(p23, u17.UFO)
    p23.Name = "UFOBreakBedEffect"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p24)
end
function u20.onBedBreak(u25, _, u26, p27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u18
        [3] = u5
        [4] = u14
        [5] = u12
        [6] = u16
        [7] = u3
        [8] = u13
        [9] = u15
        [10] = u9
        [11] = u7
    --]]
    u25.maid:GiveTask(u4:playSound(u18.UFO_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = u26.Position
    }))
    local u28 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p27)
    u28:PivotTo(u26)
    u28.Parent = u14
    u25.maid:GiveTask(u28)
    local u29 = u12.Assets.Misc.UFO_Silver:Clone()
    local v30 = u26.Position
    local v31 = u16 * 10
    local u32 = v30 + Vector3.new(0, v31, 0)
    for v33, v34 in u29:GetDescendants() do
        local _ = v33 - 1
        if v34:IsA("BasePart") then
            u3:setQueryIgnored(v34, true)
            v34.CanCollide = false
        end
    end
    u29:PivotTo(CFrame.new(u32))
    u29.Parent = u14
    u25.maid:GiveTask(u29)
    local u37 = u13.Heartbeat:Connect(function(_) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        local v35 = u29.Body:GetPivot()
        local v36 = v35 - v35.Position
        u29.Body:PivotTo(CFrame.new(u29.Body:GetPivot().Position) * v36 * CFrame.Angles(0, 0.020943951023931952, 0))
    end)
    u25.maid:GiveTask(u37)
    u25.maid:GiveTask(task.spawn(function() --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u26
            [3] = u16
            [4] = u29
            [5] = u28
            [6] = u15
            [7] = u9
            [8] = u32
            [9] = u7
            [10] = u37
        --]]
        local v38 = u25
        local v39 = u26
        local v40 = u16 * 4.4
        v38:tweenUFOPosition(u29, v39 + Vector3.new(0, v40, 0), 0.3)
        u25:activateBeam(u29)
        u15(1.4, u9, function(p41) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:PivotTo(p41)
        end, u28:GetPivot(), u29:GetPivot() * CFrame.Angles(1.2217304763960306, 10.471975511965978, -1.0471975511965976))
        u15(1.4, u9, function(p42) --[[ Line: 98 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:ScaleTo(p42)
        end, 1, 0.5)
        u25.maid:GiveTask(task.delay(1.4, function() --[[ Line: 101 ]]
            --[[
            Upvalues:
                [1] = u28
            --]]
            u28:Destroy()
        end))
        u25.maid:GiveTask(task.delay(1.5, function() --[[ Line: 105 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u29
                [3] = u32
                [4] = u7
            --]]
            u25:deactivateBeam(u29)
            u25:tweenUFOPosition(u29, CFrame.new(u32), 1, u7)
        end))
        u25.maid:GiveTask(task.delay(3, function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u29
                [3] = u37
            --]]
            u28:Destroy()
            u29:Destroy()
            u37:Disconnect()
        end))
    end))
end
function u20.tweenUFOPosition(_, u43, p44, p45, p46) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
    --]]
    u15(p45 == nil and 0.3 or p45, p46 or u10, function(p47) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        return u43:PivotTo(p47)
    end, u43:GetPivot(), p44):Wait()
end
function u20.activateBeam(_, u48) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
        [3] = u9
    --]]
    u15(0.5, u8, function(p49) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u9
        --]]
        local v50 = u48:FindFirstChild("Beam")
        if v50 then
            v50.Transparency = u9(p49, 1, -0.4, 1)
        end
    end, 0, 1):Wait()
end
function u20.deactivateBeam(_, u51) --[[ Line: 136 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u8
    --]]
    u15(0.5, u8, function(p52) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        local v53 = u51:FindFirstChild("Beam")
        if v53 then
            v53.Transparency = p52
        end
    end, u51.Beam.Transparency, 1):Wait()
end
u5.CreateController(u20.new())
return nil