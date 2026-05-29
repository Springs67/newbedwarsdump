local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u7 = v6.OutExpo
local u8 = v6.SoftSpring
local u9 = v6.Spring
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "SarcophagusBreakBedEffect"
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
        [2] = u16
    --]]
    u19.constructor(p23, u16.SARCOPHAGUS)
    p23.Name = "SarcophagusBreakBedEffect"
end
function u20.KnitStart(p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p24)
end
function u20.onBedBreak(u25, _, p26, p27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u4
        [3] = u17
        [4] = u5
        [5] = u13
        [6] = u12
        [7] = u3
        [8] = u15
        [9] = u18
        [10] = u9
        [11] = u8
    --]]
    local u28 = u10.new()
    u25.maid:GiveTask(u28)
    u25.maid:GiveTask(u4:playSound(u17.SARCOPHAGUS_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 80,
        ["position"] = p26.Position
    }))
    local u29 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p27)
    u29:PivotTo(p26)
    u29.Parent = u13
    u28:GiveTask(u29)
    local u30 = u12.Assets.Misc.sarcophagus:Clone()
    for v31, v32 in u30:GetDescendants() do
        local _ = v31 - 1
        if v32:IsA("BasePart") then
            u3:setQueryIgnored(v32, true)
            v32.CanCollide = false
        end
    end
    local v33 = u29:GetPivot().Position
    local v34 = -(select(2, u30:GetBoundingBox()).Y / 2.6)
    local v35 = u15 * 1.8
    local v36 = Vector3.new(0, v34, v35)
    local u37 = CFrame.new(v33 - v36) * CFrame.Angles(0, 3.141592653589793, 0)
    local v38 = u15 * 4
    u30:PivotTo(u37 - Vector3.new(0, v38, 0))
    u30:ScaleTo(1.25)
    u30.Parent = u13
    u28:GiveTask(u30)
    u25.maid:GiveTask(task.delay(0.18, function() --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u30
            [4] = u37
            [5] = u18
            [6] = u28
        --]]
        local v39 = u12.Assets.Effects.DustLandEffect:Clone()
        v39.Parent = u13
        local v40 = select(2, u30:GetBoundingBox()).Y / 2
        v39.CFrame = u37 - Vector3.new(0, v40, 0)
        u18:playEffects({ v39 }, nil, {
            ["destroyAfterSec"] = 3
        })
        u28:GiveTask(v39)
    end))
    u25.maid:GiveTask(task.spawn(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u30
            [3] = u37
            [4] = u9
            [5] = u8
            [6] = u12
            [7] = u13
            [8] = u18
            [9] = u28
            [10] = u29
            [11] = u15
        --]]
        u25:tweenCFrame(u30, u37, 0.3, u9):Wait()
        local v41 = u30.front:GetPivot()
        local v42 = u25
        local v43 = u30.front
        local v44 = u30.front:GetPivot()
        local v45 = CFrame.new(-3, 0, 0)
        local v46 = CFrame.Angles(0, -0.3490658503988659, 0)
        v42:tweenCFrame(v43, v44 * v45 * v46, 0.4, u8):Wait()
        local v47 = u12.Assets.Effects.DustLandEffect:Clone()
        v47.Parent = u13
        v47.CFrame = u37 * CFrame.Angles(1.5707963267948966, 0, 0)
        u18:playEffects({ v47 }, nil, {
            ["destroyAfterSec"] = 3
        })
        u28:GiveTask(v47)
        u25:tweenCFrame(u29, (v41 - Vector3.new(0, -1.05, 0.8)) * CFrame.Angles(-1.5707963267948966, 3.141592653589793, 0), 0.4, u8):Wait()
        u25:tweenCFrame(u30.front, v41, 0.4, u8):Wait()
        u29:Destroy()
        local v48 = u25
        local v49 = u15 * 5
        v48:tweenCFrame(u30, u37 - Vector3.new(0, v49, 0), 0.65):Wait()
        u28:DoCleaning()
    end))
end
function u20.tweenCFrame(_, u50, p51, p52, p53) --[[ Line: 124 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
    --]]
    return u14(p52 == nil and 0.3 or p52, p53 or u7, function(p54) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        return u50:PivotTo(p54)
    end, u50:GetPivot(), p51)
end
u5.CreateController(u20.new())
return nil