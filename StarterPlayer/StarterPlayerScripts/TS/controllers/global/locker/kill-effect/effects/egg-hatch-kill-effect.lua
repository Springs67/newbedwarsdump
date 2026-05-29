local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.GameQueryUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InCubic
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "EggHatchKillEffect"
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
function u16.onKill(u21, _, p22, u23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u9
        [3] = u15
        [4] = u3
        [5] = u14
        [6] = u5
        [7] = u8
        [8] = u13
        [9] = u4
        [10] = u12
        [11] = u11
        [12] = u10
    --]]
    local u24 = u6.new()
    p22.Archivable = true
    local u25 = p22:Clone()
    u25:PivotTo(u23)
    u25.Parent = u9
    u25.HumanoidRootPart.Anchored = false
    u15.hideCharacter(u21, p22)
    u24:GiveTask(u25)
    for _, v26 in u25:GetDescendants() do
        if v26:IsA("BasePart") then
            u3:setQueryIgnored(v26, false)
        end
    end
    u14.tweenModelTransparency(u25, 1, 0.55)
    u14.tweenModelSizeScaleTo(u25, 0.55, u5, 0)
    local u27 = u8.Assets.Effects.GoldenEgg:Clone()
    u24:GiveTask(u27)
    task.delay(0.3, function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u27
            [3] = u23
            [4] = u9
            [5] = u8
            [6] = u3
            [7] = u24
            [8] = u13
            [9] = u4
            [10] = u12
        --]]
        u14.tweenModelTransparency(u27, 1, 0)
        u14.scaleModel(u27, 3)
        u27:PivotTo(u23)
        u27.Parent = u9
        u14.tweenModelTransparency(u27, 0, 0.3)
        local v28 = u8.Assets.Effects.StarParticle:Clone()
        for v29, v30 in v28:GetDescendants() do
            local _ = v29 - 1
            if v30:IsA("ParticleEmitter") then
                v30.Enabled = false
            end
        end
        u3:setQueryIgnored(v28, true)
        v28.Transparency = 1
        v28.CFrame = u23
        v28.Parent = u9
        u24:GiveTask(v28)
        u13:playEffects({ v28 }, nil, {
            ["destroyAfterSec"] = 1
        })
        u4:playSound(u12.EGG_LAUNCH, {
            ["position"] = u23.Position
        })
    end)
    task.delay(0.8, function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u25
            [3] = u9
            [4] = u13
            [5] = u21
            [6] = u27
            [7] = u24
            [8] = u4
            [9] = u12
            [10] = u23
        --]]
        local v31 = u8.Assets.Effects.PulseEffect:Clone()
        v31.Pulse.Orientation = Enum.ParticleOrientation.FacingCamera
        v31.Position = u25:GetPivot().Position
        v31.Anchored = true
        v31.Parent = u9
        u13:playEffects({ v31 }, nil, {
            ["destroyAfterSec"] = 1
        })
        local u32 = u21:shakeEgg(u27)
        u24:GiveTask(u32)
        u24:GiveTask(u27.Destroying:Once(function() --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            return u32:Disconnect()
        end))
        u4:playSound(u12.EGG_HUNT_EGG_DEPOSIT, {
            ["position"] = u23.Position
        })
    end)
    task.delay(1.5, function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u25
            [3] = u9
            [4] = u13
            [5] = u27
            [6] = u23
            [7] = u24
            [8] = u21
            [9] = u11
            [10] = u10
            [11] = u4
            [12] = u12
            [13] = u14
        --]]
        local v33 = u8.Assets.Effects.EggExplosion:Clone()
        v33.Attachment:Destroy()
        v33.Position = u25:GetPivot().Position
        v33.Anchored = true
        v33.Parent = u9
        u13:playEffects({ v33 }, nil, {
            ["destroyAfterSec"] = 1
        })
        task.delay(0.1, function() --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            u27:Destroy()
        end)
        local u34 = u8.Assets.Misc.BunnyChicken:Clone()
        u34:PivotTo(u23)
        for v35, v36 in u34:GetDescendants() do
            local _ = v35 - 1
            if v36:IsA("BasePart") then
                v36.CollisionGroup = "DisablePlayerCollisions"
            end
        end
        u34.Parent = u9
        u24:GiveTask(u34)
        local u37 = u34.Humanoid:FindFirstChildWhichIsA("Animator")
        if u37 then
            u21.chickenAnim = u21.chickenAnim or u11:getAnimation(u10.CHICKEN_FLAP)
            local v38 = u37:LoadAnimation(u21.chickenAnim)
            v38:Play()
            u24:GiveTask(v38.Stopped:Once(function() --[[ Line: 146 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u11
                    [3] = u10
                --]]
                u37:LoadAnimation(u11:getAnimation(u10.CHICKEN_IDLE)):Play()
            end))
        end
        u4:playSound(u12.CHICKEN_DEPLOY, {
            ["position"] = u23.Position
        })
        task.delay(2, function() --[[ Line: 154 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u34
                [3] = u24
            --]]
            u14.tweenModelTransparency(u34, 1, 0.5)
            task.delay(1, function() --[[ Line: 156 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:DoCleaning()
            end)
        end)
    end)
    return u24
end
function u16.shakeEgg(_, p39) --[[ Line: 163 ]]
    local u40 = p39.PrimaryPart
    if not u40 then
        error("Egg Kill Effect Model has no PrimaryPart")
    end
    local u41 = game:GetService("TweenService")
    local u42 = u40.CFrame
    local u43 = TweenInfo.new(0.08, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0)
    local u44 = {
        CFrame.Angles(0, 0, 0.3141592653589793),
        CFrame.Angles(0, 0, -0.3141592653589793),
        CFrame.Angles(0.20943951023931956, 0, 0.17453292519943295),
        CFrame.Angles(-0.20943951023931956, 0, -0.17453292519943295),
        CFrame.Angles(0, 0.2617993877991494, 0.20943951023931956),
        CFrame.Angles(0, -0.2617993877991494, -0.20943951023931956)
    }
    local u45 = 0
    local u46 = nil
    return game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u44
            [3] = u45
            [4] = u42
            [5] = u41
            [6] = u40
            [7] = u43
        --]]
        if u46 and u46.PlaybackState == Enum.PlaybackState.Playing then
            return nil
        end
        local v47 = u44[u45 % #u44 + 1]
        u45 = u45 + 1
        u46 = u41:Create(u40, u43, {
            ["CFrame"] = u42 * v47
        })
        u46:Play()
    end)
end
return u16