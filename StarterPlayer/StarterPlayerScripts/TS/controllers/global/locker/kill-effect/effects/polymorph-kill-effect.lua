local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Debris
local u9 = v7.PhysicsService
local u10 = v7.ReplicatedStorage
local u11 = v7.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "PolymoprhKillEffect"
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
function u16.constructor(p19, ...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u10
    --]]
    u15.constructor(p19, ...)
    p19.mice = { u10.Assets.Misc.mouseBrown, u10.Assets.Misc.mouseGray, u10.Assets.Misc.mouseWhite }
end
function u16.onKill(p20, _, p21, p22) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u13
        [4] = u4
        [5] = u12
        [6] = u3
        [7] = u11
        [8] = u9
        [9] = u6
        [10] = u14
    --]]
    local u23 = u5.new()
    p20:hideCharacter(p21)
    local v24 = u10.Assets.Effects.PoofParticles:Clone()
    v24.Parent = p21
    v24.Position = p21:GetPivot().Position
    u23:GiveTask(v24)
    u13:playEffects({ v24 })
    u23:GiveTask(u4:playSound(u12.NINJA_SMOKE_3, {
        ["playbackSpeedMultiplier"] = 1.2,
        ["position"] = p22.Position
    }))
    local u25 = u3.randomArraySelectN(u3.shuffleArray(p20.mice), 1)[1]:Clone()
    u23:GiveTask(u25)
    u25:PivotTo(p22 + Vector3.new(0, 1, 0))
    u25.Parent = u11
    local v26 = u25:FindFirstChild("Humanoid")
    for _, v27 in u25:GetDescendants() do
        if v27:IsA("BasePart") then
            u9:SetPartCollisionGroup(v27, "Players")
        end
    end
    p20:createEmitter(u25.PrimaryPart, true)
    u23:GiveTask(u4:playSound(u12.GRIMOIRE_CAST_COMPLETE, {
        ["position"] = p22.Position
    }))
    local v28 = v26:FindFirstChildOfClass("Animator")
    if not v28 then
        return u23
    end
    local v29 = v28:LoadAnimation((u6("Animation", {
        ["AnimationId"] = "rbxassetid://5823056331"
    })))
    v29:Play()
    u23:GiveTask(v29.DidLoop:Once(function() --[[ Line: 79 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u25
        --]]
        u14.tweenModelTransparency(u25, 1, 0.5)
        task.delay(1, function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25:Destroy()
        end)
    end))
    task.delay(5, function() --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:DoCleaning()
        u23:Destroy()
    end)
    return u23
end
function u16.createEmitter(_, p30, _) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
    --]]
    local v31 = u6("ParticleEmitter", {})
    v31.Rate = 0
    v31.SpreadAngle = Vector2.new(120, 120)
    v31.Speed = NumberRange.new(4, 5)
    v31.Acceleration = Vector3.new(0, -5, 0)
    v31.Texture = "rbxassetid://5607858133"
    v31.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(0.8, 0.2), NumberSequenceKeypoint.new(1, 0) })
    v31.Color = ColorSequence.new(Color3.fromRGB(207, 23, 177))
    v31.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.8, 0), NumberSequenceKeypoint.new(1, 1) })
    v31.Parent = p30
    v31:Emit(20)
    u8:AddItem(v31, 5)
end
return u16