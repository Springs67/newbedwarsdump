local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "BroomKillEffect"
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
function u14.onKill(p19, _, p20, p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
        [3] = u13
        [4] = u7
        [5] = u11
        [6] = u10
        [7] = u9
        [8] = u3
        [9] = u12
        [10] = u4
    --]]
    local u22 = u5.new()
    p20.Archivable = true
    local u23 = p20:Clone()
    u23.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    u23.HumanoidRootPart.Anchored = true
    u23:PivotTo(p21)
    u23.Parent = u8
    u13.hideCharacter(p19, p20)
    u22:GiveTask(u23)
    local u24 = u7.Assets.Misc.BroomSweep:Clone()
    u24:PivotTo(p21 - Vector3.new(0, 1, 1))
    if not u24.PrimaryPart then
        return u22
    end
    u24.Parent = u8
    u22:GiveTask(u24)
    u23:BreakJoints()
    local v25 = u24.AnimationController.Animator:LoadAnimation(u11:getAnimation(u10.BROOM_SWEEP))
    v25:Play()
    v25.Looped = true
    local u26 = true
    u24.Brush.CanCollide = true
    local u27 = u24.PrimaryPart
    v25:GetMarkerReachedSignal("impact"):Connect(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u23
            [3] = u9
            [4] = u27
            [5] = u8
            [6] = u7
            [7] = u3
            [8] = u12
            [9] = u4
            [10] = u24
        --]]
        u26 = not u26
        local v28
        if u26 == false then
            v28 = Enum.NormalId.Front
        else
            v28 = Enum.NormalId.Back
        end
        local v29 = u26 == false and -15 or 15
        for _, v31 in u23:GetChildren() do
            if v31:IsA("Accessory") then
                local v31 = v31:FindFirstChild("Handle")
                if u9.instanceIsA("BasePart")(v31) then
                    goto l13
                end
            elseif v31:IsA("BasePart") and v31 ~= u23.PrimaryPart then
                ::l13::
                if u27 then
                    for _, v32 in u8:GetPartsInPart(u27) do
                        if v32 == v31 then
                            v32:ApplyImpulse((Vector3.new(0, 0, v29)))
                        end
                    end
                end
            end
        end
        local u33 = u7.Assets.Effects.SweepDustEffect:Clone()
        u33.Position = u23:GetPivot().Position - Vector3.new(0, 1, 0)
        u33.Parent = u8
        u33.Anchored = true
        u33.DustParticle.EmissionDirection = v28
        u33.DustParticle.Transparency = NumberSequence.new(0.5, 0.75)
        u33.DustParticle:Emit(10)
        task.delay(1, function() --[[ Line: 102 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:Destroy()
        end)
        u4:playSound(u3.fromList(u12.BROOM_SWEEP_EFFECT_1, u12.BROOM_SWEEP_EFFECT_2, u12.BROOM_SWEEP_EFFECT_3, u12.BROOM_SWEEP_EFFECT_4), {
            ["rollOffMaxDistance"] = 40,
            ["volumeMultiplier"] = 0.8,
            ["parent"] = u24.PrimaryPart
        })
    end)
    task.delay(4, function() --[[ Line: 112 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:DoCleaning()
    end)
    return u22
end
return u14