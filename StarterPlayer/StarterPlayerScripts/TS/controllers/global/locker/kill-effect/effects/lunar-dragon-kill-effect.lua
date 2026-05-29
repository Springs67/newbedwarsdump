local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.Workspace
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u10 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "LunarDragonKillEffect"
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
function u11.onKill(p16, _, p17, p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u10
        [4] = u5
        [5] = u8
        [6] = u7
        [7] = u2
        [8] = u9
    --]]
    local u19 = u3.new()
    p17.Archivable = true
    local u20 = p17:Clone()
    u20.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u20.HumanoidRootPart.Anchored = true
    u20:PivotTo(p18)
    u20.Parent = u6
    u10.hideCharacter(p16, p17)
    u19:GiveTask(u20)
    local u21 = u5.Assets.Effects.GiantSmoke:Clone()
    u21.ParticleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera
    u21.Position = u20:GetPivot().Position
    u21.Parent = u6
    u21.Anchored = true
    u19:GiveTask(u21)
    task.delay(1.5, function() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u20
        --]]
        u21.ParticleEmitter.Enabled = false
        u20:Destroy()
    end)
    local v22 = u5.Assets.Misc.LunarDragon:Clone()
    v22:ScaleTo(2)
    v22:PivotTo(p18 - Vector3.new(0, 2, 3))
    if not v22.PrimaryPart then
        return u19
    end
    v22.Parent = u6
    u19:GiveTask(v22)
    local v23 = v22.AnimationController.Animator:LoadAnimation(u8:getAnimation(u7.DRAGON_KILL_EFFECT))
    v23:Play()
    v23:AdjustSpeed(0.6)
    u19:GiveTask(u2:playSound(u9.DRAGON_ROAR, {
        ["rollOffMaxDistance"] = 100,
        ["volumeMultiplier"] = 0.8,
        ["playbackSpeedMultiplier"] = 0.8,
        ["parent"] = v22.PrimaryPart
    }))
    v23.Stopped:Connect(function() --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u19
        --]]
        u19:DoCleaning()
    end)
    return u19
end
return u11