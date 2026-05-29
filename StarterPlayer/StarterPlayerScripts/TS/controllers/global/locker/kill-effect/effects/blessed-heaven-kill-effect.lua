local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u13 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "BlessedHeavenKillEffect"
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
        [5] = u12
        [6] = u10
        [7] = u9
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
    local v24 = u6.Assets.Effects.BlessedWings:Clone()
    v24.Parent = u23
    u12:weldCharacterAccessories(u23)
    u22:GiveTask(v24)
    local u25 = u10:playAnimation(u23:FindFirstChildWhichIsA("Humanoid"):FindFirstChild("Animator"), u9.HEAVEN_ASCEND)
    u25.Looped = true
    u22:GiveTask(function() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25:Stop()
    end)
    local v26 = u6.Assets.Effects.HeavenBlessed:Clone()
    v26:PivotTo(u23.PrimaryPart.CFrame)
    v26.Parent = u7
    u22:GiveTask(v26)
    local v27 = u6.Assets.Misc.HeavenlyHarp:Clone()
    v27:PivotTo(u23.PrimaryPart.CFrame + Vector3.new(7, 0, 7))
    v27.Parent = u7
    v27.RootPart.Anchored = true
    u22:GiveTask(v27)
    local u28 = u21 + Vector3.new(0, 30, 0)
    u8(7, u3, function(p29) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u21
            [3] = u28
        --]]
        if not u23.PrimaryPart then
            return nil
        end
        u23:PivotTo(u21:Lerp(u28, p29))
    end)
    u2:playSound(u11.HEAVEN_ASCEND, {
        ["rollOffMaxDistance"] = 50,
        ["volumeMultiplier"] = 0.5,
        ["parent"] = v27.PrimaryPart
    })
    task.delay(5, function() --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:DoCleaning()
    end)
    return u22
end
return u14