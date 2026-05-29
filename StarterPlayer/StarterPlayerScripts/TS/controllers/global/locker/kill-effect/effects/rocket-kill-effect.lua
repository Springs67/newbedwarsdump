local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "RocketKillEffect"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, p16) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, p16)
    u11.setPlayDefaultKillEffect(p15, false)
end
function u12.onKill(u17, _, p18, p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u11
        [4] = u7
        [5] = u2
        [6] = u10
        [7] = u5
        [8] = u9
        [9] = u3
    --]]
    local u20 = u4.new()
    task.delay(8, function() --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20:DoCleaning()
    end)
    local u21 = p19 * CFrame.new(0, 5, 0)
    local u22 = u21 * CFrame.Angles(0, -1.5707963267948966, 0)
    p18.Archivable = true
    local u23 = p18:Clone()
    u23.HumanoidRootPart.Anchored = true
    u23:PivotTo(u21)
    u23.Parent = u8
    u11.hideCharacter(u17, p18)
    u20:GiveTask(u23)
    local u24 = u7.Assets.Effects.RocketKillEffect:Clone()
    u24:PivotTo(u22)
    u24.Parent = u8
    u20:GiveTask(u24)
    local u25 = u2:playSound(u10.ROCKET_KILL_EFFECT, {
        ["rollOffMaxDistance"] = 100,
        ["position"] = u24:GetPrimaryPartCFrame().Position,
        ["parent"] = u24.PrimaryPart
    })
    local u26 = u24.Main.Attachment
    u26.Parent = nil
    u5(u24, 0.01)
    u26.Parent = u24.Main
    u20:GiveTask(u17:scaleModel(u24, 100, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut)).Completed:Connect(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u25
            [3] = u9
            [4] = u3
            [5] = u24
            [6] = u22
            [7] = u23
            [8] = u21
            [9] = u17
            [10] = u20
        --]]
        task.wait(0.3)
        u26.ParticleEmitter.Enabled = true
        task.wait(0.5)
        if u25 then
            u25:setProperty("RollOffMaxDistance", 300)
        end
        u9(2, u3, function(p27) --[[ Line: 69 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u22
                [3] = u23
                [4] = u21
            --]]
            if u24.PrimaryPart then
                u24:PivotTo(u22 * CFrame.new(0, p27, 0))
            end
            if u23.PrimaryPart then
                u23:PivotTo(u21 * CFrame.new(0, p27, 0))
            end
        end, 0, 600):Wait()
        u26.ParticleEmitter.Enabled = false
        u17:hideCharacter(u23)
        u20:GiveTask(u17:scaleModel(u24, 0.4, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)))
    end))
    return u20
end
return u12