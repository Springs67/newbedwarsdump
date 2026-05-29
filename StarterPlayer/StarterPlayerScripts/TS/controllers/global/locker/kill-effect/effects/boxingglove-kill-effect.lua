local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "BoxingGloveKillEffect"
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
function u15.constructor(p18, p19) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p18, p19)
    u14.setPlayDefaultKillEffect(p18, false)
end
function u15.onKill(p20, _, p21, u22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u14
        [4] = u7
        [5] = u5
        [6] = u11
        [7] = u10
        [8] = u13
        [9] = u2
        [10] = u12
        [11] = u9
        [12] = u3
    --]]
    local u23 = u4.new()
    p21.Archivable = true
    local u24 = p21:Clone()
    u24.HumanoidRootPart.Anchored = true
    u24.Parent = u8
    u14.hideCharacter(p20, p21)
    u23:GiveTask(u24)
    local u25 = u7.Assets.Misc.BoxingGlove:Clone()
    u25:PivotTo(u22 - Vector3.new(0, 0, 2))
    local v26 = u25.PrimaryPart
    if not v26 then
        return u23
    end
    u5(v26, 0.6)
    u25.Parent = u8
    u23:GiveTask(u25)
    local v27 = u25.AnimationController.Animator:LoadAnimation(u11:getAnimation(u10.BOXING_GLOVE_UPPER_CUT))
    v27:Play()
    v27:GetMarkerReachedSignal("hit"):Connect(function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u11
            [3] = u10
            [4] = u23
            [5] = u7
            [6] = u8
            [7] = u13
            [8] = u25
            [9] = u2
            [10] = u12
            [11] = u22
            [12] = u9
            [13] = u3
        --]]
        local v28 = u24:FindFirstChildWhichIsA("Humanoid")
        if v28 ~= nil then
            v28 = v28:FindFirstChild("Animator")
        end
        if v28 then
            local u29 = u11:playAnimation(v28, u10.DRAGON_SLAYER_LAUNCH_LOOP)
            u23:GiveTask(function() --[[ Line: 68 ]]
                --[[
                Upvalues:
                    [1] = u29
                --]]
                local v30 = u29
                if v30 ~= nil then
                    v30:Stop()
                end
            end)
        end
        local v31 = u7.Assets.Effects.PulseEffect:Clone()
        v31.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera
        v31.Position = u24:GetPivot().Position
        v31.Parent = u8
        v31.Anchored = true
        u13:playEffects({ v31 }, nil, {
            ["destroyAfterSec"] = 1
        })
        for v32, v33 in u25.boxing_glove.ParticleAttachment:GetChildren() do
            local _ = v32 - 1
            if v33:IsA("ParticleEmitter") then
                v33:Emit(15)
            end
        end
        u2:playSound(u12.BOXING_GLOVE_KILL_EFFECT, {
            ["rollOffMaxDistance"] = 40,
            ["volumeMultiplier"] = 0.8,
            ["parent"] = u25.PrimaryPart
        })
        u2:playSound(u12.PENGUIN_SQUAWK_1, {
            ["rollOffMaxDistance"] = 40,
            ["volumeMultiplier"] = 0.1,
            ["parent"] = u25.PrimaryPart
        })
        local v34 = u22.LookVector * -16
        local u35 = u22 + Vector3.new(0, 100, 0) + v34
        u9(2.5, u3, function(p36) --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u22
                [3] = u35
            --]]
            if not u24.PrimaryPart then
                return nil
            end
            u24:PivotTo(u22:Lerp(u35, p36))
        end)
    end)
    task.delay(3, function() --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        u23:DoCleaning()
    end)
    return u23
end
return u15