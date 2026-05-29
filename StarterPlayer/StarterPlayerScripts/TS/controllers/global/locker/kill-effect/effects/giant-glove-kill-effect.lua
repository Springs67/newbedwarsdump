local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u13 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "GiantGloveKillEffect"
    end,
    ["__index"] = u13
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, p18) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p17, p18)
    u13.setPlayDefaultKillEffect(p17, false)
end
function u14.onKill(p19, _, p20, u21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u13
        [4] = u6
        [5] = u10
        [6] = u9
        [7] = u12
        [8] = u8
        [9] = u3
        [10] = u2
        [11] = u11
    --]]
    local u22 = u4.new()
    p20.Archivable = true
    local u23 = p20:Clone()
    u23.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u23.HumanoidRootPart.Anchored = true
    u23:PivotTo(u21)
    u23.Parent = u7
    u13.hideCharacter(p19, p20)
    u22:GiveTask(u23)
    local v24 = u6.Assets.Misc.GiantGlove:Clone()
    v24:PivotTo(u21 - Vector3.new(0, -2.5, 3))
    if not v24.PrimaryPart then
        return u22
    end
    v24.Parent = u7
    u22:GiveTask(v24)
    local v25 = u23:FindFirstChildWhichIsA("Humanoid")
    if v25 ~= nil then
        v25 = v25:FindFirstChild("Animator")
    end
    if v25 then
        local u26 = u10:playAnimation(v25, u9.DISCO_DANCE)
        u22:GiveTask(function() --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            local v27 = u26
            if v27 ~= nil then
                v27:Stop()
            end
        end)
    end
    local u28 = v24.AnimationController.Animator:LoadAnimation(u10:getAnimation(u9.GIANT_GLOVE_FLICK))
    u28:Play()
    u28:AdjustSpeed(0.5)
    u28:GetMarkerReachedSignal("impact"):Connect(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u10
            [3] = u9
            [4] = u22
            [5] = u28
            [6] = u6
            [7] = u7
            [8] = u12
            [9] = u21
            [10] = u8
            [11] = u3
        --]]
        local v29 = u23:FindFirstChildWhichIsA("Humanoid")
        if v29 ~= nil then
            v29 = v29:FindFirstChild("Animator")
        end
        if v29 then
            local u30 = u10:playAnimation(v29, u9.DRAGON_SLAYER_LAUNCH_LOOP)
            u22:GiveTask(function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                local v31 = u30
                if v31 ~= nil then
                    v31:Stop()
                end
            end)
        end
        u28:AdjustSpeed(0.8)
        local v32 = u6.Assets.Effects.CartoonImpactEffect:Clone()
        v32.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera
        v32.Position = u23:GetPivot().Position - Vector3.new(0, -7, 0)
        v32.Parent = u7
        v32.Anchored = true
        u12:playEffects({ v32 }, nil, {
            ["destroyAfterSec"] = 1
        })
        local v33 = u21.LookVector * -16
        local u34 = u21 + Vector3.new(0, 0, 300) + v33
        u8(2.5, u3, function(p35) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u21
                [3] = u34
            --]]
            if not u23.PrimaryPart then
                return nil
            end
            u23:PivotTo(u21:Lerp(u34, p35))
        end)
    end)
    u2:playSound(u11.GLOVE_FLICK, {
        ["rollOffMaxDistance"] = 40,
        ["volumeMultiplier"] = 0.8,
        ["parent"] = v24.PrimaryPart
    })
    task.delay(3, function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:DoCleaning()
    end)
    return u22
end
return u14