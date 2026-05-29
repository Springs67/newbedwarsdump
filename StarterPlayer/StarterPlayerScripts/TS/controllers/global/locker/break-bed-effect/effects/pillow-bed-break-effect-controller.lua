local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "PillowBedBreakEffectController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
    --]]
    u14.constructor(p18, u12.PILLOW)
    p18.Name = "PillowBedBreakEffectController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.onBedBreak(u20, _, u21, p22, _) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u9
        [4] = u8
        [5] = u3
        [6] = u11
        [7] = u10
        [8] = u4
        [9] = u13
    --]]
    local u23 = u6.new()
    u20.maid:GiveTask(u23)
    local u24 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p22)
    u24:PivotTo(u21)
    u24.Parent = u9
    local u25
    if u24 == nil then
        u25 = u24
    else
        u25 = u24:WaitForChild("Root", 1)
    end
    local v26 = u8.Assets.Effects.PillowBedBreak:Clone()
    v26.Parent = u9
    local v27 = u21.Position
    v26:PivotTo(CFrame.new(v27 + Vector3.new(2, 0, 0), u21.Position))
    u23:GiveTask(u24)
    u23:GiveTask(v26)
    u3:playAnimation(v26, u11:getAssetId(u10.PILLOW_FIGHT))
    if u24 and u25 then
        local u28 = u8.Assets.Effects.WhiteFeatherEffect:Clone()
        u28.Parent = u9
        u28:PivotTo(u21)
        u20.maid:GiveTask(u28)
        u20.maid:GiveTask(task.delay(0.7, function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u13
                [4] = u21
                [5] = u28
            --]]
            u20.maid:GiveTask(u4:playSound(u13.PILLOW_HIT_2, {
                ["rollOffMaxDistance"] = 300,
                ["volumeMultiplier"] = 1.8,
                ["position"] = u21.Position
            }))
            for v29, v30 in u28:GetDescendants() do
                local _ = v29 - 1
                if v30:IsA("ParticleEmitter") then
                    v30:Emit(30)
                end
            end
        end))
        u20.maid:GiveTask(task.delay(0.8, function() --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u13
                [4] = u21
                [5] = u25
            --]]
            u20.maid:GiveTask(u4:playSound(u13.WOOD_BLOCK_BREAK, {
                ["rollOffMaxDistance"] = 300,
                ["position"] = u21.Position
            }))
            u20:createBedDebris(u25)
        end))
    end
    u20.maid:GiveTask(task.delay(0.8, function() --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        u24:Destroy()
        u24.Parent = nil
    end))
    u20.maid:GiveTask(task.delay(1.5, function() --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:DoCleaning()
    end))
end
u5.CreateController(u15.new())
return nil