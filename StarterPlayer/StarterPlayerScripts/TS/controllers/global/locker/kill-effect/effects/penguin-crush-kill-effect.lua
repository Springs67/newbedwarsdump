local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u18 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "PenguinCrushKillEffect"
    end,
    ["__index"] = u18
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22, p23) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.constructor(p22, p23)
    u18.setPlayDefaultKillEffect(p22, false)
end
function u19.onKill(u24, _, p25, u26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u18
        [4] = u11
        [5] = u4
        [6] = u9
        [7] = u15
        [8] = u14
        [9] = u17
        [10] = u6
        [11] = u16
        [12] = u3
        [13] = u13
        [14] = u7
        [15] = u5
    --]]
    local u27 = u8.new()
    p25.Archivable = true
    local u28 = p25:Clone()
    u28.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u28.HumanoidRootPart.Anchored = true
    u28:PivotTo(u26)
    u28.Parent = u12
    u18.hideCharacter(u24, p25)
    u27:GiveTask(u28)
    local v29 = u26 + Vector3.new(0, 0, 3.5)
    local u30 = u11.Assets.Misc.Penguins.BigPenguin:Clone()
    u30:PivotTo(v29)
    for v31, v32 in u30:GetDescendants() do
        local _ = v31 - 1
        if v32:IsA("BasePart") then
            v32.CanCollide = false
            u4:setQueryIgnored(v32, true)
        end
    end
    local v33 = u30.PrimaryPart
    if not v33 then
        return u27
    end
    v33.Anchored = true
    u24:hideCharacter(u30)
    u30.Parent = u12
    u27:GiveTask(u30)
    local v34 = u30:FindFirstChildWhichIsA("Humanoid")
    if v34 ~= nil then
        v34 = v34:FindFirstChildWhichIsA("Animator")
    end
    local u35 = v34 or u9("Animator", {
        ["Parent"] = u30:FindFirstChildWhichIsA("Humanoid")
    })
    if u35 ~= nil then
        u35 = u35:LoadAnimation(u15:getAnimation(u14.PENGUIN_KILL_EFFECT_2))
    end
    if not u35 then
        return u27
    end
    u35.Looped = false
    u35:Play()
    u35:AdjustSpeed(0.9)
    u35:GetMarkerReachedSignal("Top"):Connect(function() --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u30
            [3] = u12
            [4] = u27
            [5] = u17
            [6] = u6
            [7] = u16
            [8] = u28
            [9] = u3
            [10] = u15
            [11] = u14
            [12] = u13
            [13] = u7
            [14] = u5
        --]]
        local v36 = u11.Assets.Effects.PoofParticles:Clone()
        v36:PivotTo(u30:GetPivot() + Vector3.new(0, 5, 0))
        v36.Parent = u12
        u27:GiveTask(v36)
        u17:playInstanceEffects({ v36 }, {
            ["destroyAfterSec"] = 0.6
        })
        u6:playSound(u16.NINJA_SMOKE_2, {
            ["rollOffMaxDistance"] = 40,
            ["volumeMultiplier"] = 0.8,
            ["parent"] = u30.PrimaryPart
        })
        local u37 = u3:playAnimation(u28.Humanoid:WaitForChild("Animator"), u15:getAssetId(u14.TURN_AROUND))
        if u37 then
            local v38 = task
            local v39
            if u37 == nil then
                v39 = u37
            else
                v39 = u37.Length
            end
            v38.delay(v39 - 0.01, function() --[[ Line: 122 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                u37:AdjustSpeed(0)
            end)
        end
        u13(0.3, u7, function(p40) --[[ Line: 127 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            for v41, v42 in u30:GetDescendants() do
                local _ = v41 - 1
                if v42:IsA("BasePart") and (v42.Name ~= "HumanoidRootPart" and v42.Name ~= "Head") then
                    if v42.Name ~= "Part" then
                        v42.Transparency = 1 - p40
                    end
                end
            end
        end)
        local v43 = {
            u16.PENGUIN_ATTACK_1,
            u16.PENGUIN_ATTACK_2,
            u16.PENGUIN_ATTACK_3,
            u16.PENGUIN_SQUAWK_1
        }
        u5.shuffleArray(v43)
        u6:playSound(u5.randomArraySelectN(v43, 1)[1], {
            ["rollOffMaxDistance"] = 40,
            ["volumeMultiplier"] = 0.8,
            ["parent"] = u30.PrimaryPart
        })
    end)
    u35:GetMarkerReachedSignal("Stomp"):Connect(function() --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u28
            [3] = u12
            [4] = u27
            [5] = u17
            [6] = u24
            [7] = u6
            [8] = u16
            [9] = u30
        --]]
        local v44 = u11.Assets.Effects.PulseEffect:Clone()
        v44.Pulse.Rate = 0
        local v45 = u11.Assets.Effects.SmokePuff:Clone()
        v45:SetAttribute("EmitCount", 10)
        v45.Speed = NumberRange.new(25)
        v45.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 1.25, 0.75), NumberSequenceKeypoint.new(1, 0) })
        v45.SpreadAngle = Vector2.new(-180, 180)
        v45.Parent = v44
        v44:PivotTo(u28:GetPivot() - Vector3.new(0, 2, 0))
        v44.Parent = u12
        u27:GiveTask(v44)
        u17:playInstanceEffects({ v44 }, {
            ["destroyAfterSec"] = 0.6
        })
        u24:hideCharacter(u28)
        u6:playSound(u16.STOMPER_HIT, {
            ["rollOffMaxDistance"] = 40,
            ["volumeMultiplier"] = 0.8,
            ["parent"] = u30.PrimaryPart
        })
    end)
    u35:GetMarkerReachedSignal("End"):Connect(function() --[[ Line: 175 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u30
            [3] = u26
            [4] = u15
            [5] = u14
            [6] = u13
            [7] = u7
            [8] = u27
        --]]
        u35:AdjustSpeed(0)
        u30:PivotTo(u26 + Vector3.new(0, 0, 1.5))
        u35:Stop()
        local v46 = u30:FindFirstChildWhichIsA("Humanoid")
        if v46 ~= nil then
            v46 = v46:FindFirstChildWhichIsA("Animator")
            if v46 ~= nil then
                v46 = v46:LoadAnimation(u15:getAnimation(u14.PENGUIN_IDLE_2))
            end
        end
        if v46 ~= nil then
            v46:Play()
        end
        u13(0.45, u7, function(p47) --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            for v48, v49 in u30:GetDescendants() do
                local _ = v48 - 1
                if v49:IsA("BasePart") and (v49.Name ~= "HumanoidRootPart" and v49.Name ~= "Head") then
                    if v49.Name ~= "Part" then
                        v49.Transparency = p47
                    end
                end
            end
        end)
        task.delay(0.45, function() --[[ Line: 209 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            u27:DoCleaning()
        end)
    end)
    return u27
end
return u19