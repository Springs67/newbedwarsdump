local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = v1.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController
local u15 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "SwiftAugmentController"
    end,
    ["__index"] = u14
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
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u13
        [4] = u6
    --]]
    u14.constructor(p19, u9.SWIFT, u13.ARMOR_ENCHANT_SWIFT)
    p19.Name = "SwiftAugmentController"
    p19.swiftMaid = u6.new()
end
function u16.KnitStart(u20) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
    --]]
    u14.KnitStart(u20)
    u20.pulseEffect = u20:initPulseEffect()
    u20.trailEffectLeft = u20:initTrailEffect()
    u20.trailEffectRight = u20:initTrailEffect()
    u11.Client:Get("OutOfCombatTaskTriggered"):Connect(function(p21) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        if p21.taskName ~= "SwiftEnchantSpeedBuff" then
            return nil
        end
        u20:applySpeedBuff(p21.taskPlayer)
    end)
end
function u16.onArmorAugmentUpgraded(u22, u23) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u15
    --]]
    u4.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u23)
    task.delay(u15, function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
        --]]
        u22:applySpeedBuff(u23)
    end)
end
function u16.onArmorAugmentProced(p24, p25, _) --[[ Line: 54 ]]
    p24:removeSpeedBuff(p25)
end
function u16.onArmorEnchantRemoved(p26, p27) --[[ Line: 57 ]]
    p26:removeSpeedBuff(p27)
end
function u16.applySpeedBuff(u28, p29) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
        [3] = u10
    --]]
    if p29 ~= u8.LocalPlayer then
        return nil
    end
    local v30 = u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = 1 + u10.SWIFT_SPEED_PERCENT / 100
    })
    u28.swiftMaid:GiveTask(task.spawn(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u28
        --]]
        u28:addTrailEffects()
        u28:playPulseEffect()
    end))
    u28.swiftMaid:GiveTask(v30)
end
function u16.removeSpeedBuff(p31, p32) --[[ Line: 73 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    if p32 ~= u8.LocalPlayer then
        return nil
    end
    p31.swiftMaid:DoCleaning()
end
function u16.playPulseEffect(u33) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u2
        [3] = u12
    --]]
    local v34 = u8.LocalPlayer.Character
    if v34 ~= nil then
        v34 = v34:WaitForChild("HumanoidRootPart", 3)
    end
    if u33.pulseEffect and v34 then
        u33.pulseEffect.Parent = v34
        u33.pulseEffect.Enabled = true
        u33.pulseEffect:Emit(1)
        u2:playSound(u12.SWIFT_ENCHANT_PULSE_ACTIVATE, {
            ["volumeMultiplier"] = 0.6
        })
        task.delay(1, function() --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            if u33.pulseEffect then
                u33.pulseEffect.Enabled = false
                u33.pulseEffect.Parent = nil
            end
        end)
    end
end
function u16.addTrailEffects(u35) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v36 = u8.LocalPlayer.Character
    if u35.trailEffectLeft and (u35.trailEffectRight and v36) then
        local v37 = v36:WaitForChild("RightLowerLeg", 3)
        local v38 = v36:WaitForChild("LeftLowerLeg", 3)
        if not (v37 and v38) then
            return nil
        end
        local v39 = v37:WaitForChild("RightAnkleRigAttachment", 1)
        local v40 = v37:WaitForChild("RightKneeRigAttachment", 1)
        local v41 = v38:WaitForChild("LeftAnkleRigAttachment", 1)
        local v42 = v38:WaitForChild("LeftKneeRigAttachment", 1)
        for v43, v44 in { u35.trailEffectLeft, u35.trailEffectRight } do
            local v45 = v43 - 1
            local v46
            if v45 == 0 then
                v46 = v41
            else
                v46 = v39
            end
            v44.Attachment0 = v46
            local v47
            if v45 == 0 then
                v47 = v42
            else
                v47 = v40
            end
            v44.Attachment1 = v47
            local v48
            if v45 == 0 then
                v48 = v38
            else
                v48 = v37
            end
            v44.Parent = v48
            v44.Enabled = true
        end
        u35.swiftMaid:GiveTask(function() --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            if u35.trailEffectLeft and u35.trailEffectRight then
                u35.trailEffectLeft.Enabled = false
                u35.trailEffectLeft.Parent = nil
                u35.trailEffectRight.Enabled = false
                u35.trailEffectRight.Parent = nil
            end
        end)
    end
end
function u16.initPulseEffect(_) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v49 = u7("ParticleEmitter", {
        ["LightEmission"] = 1,
        ["Acceleration"] = Vector3.new(0, 4, 0),
        ["Drag"] = 3.5,
        ["Rate"] = 1,
        ["TimeScale"] = 1,
        ["Texture"] = "rbxassetid://10553903882",
        ["ZOffset"] = 0.11,
        ["Color"] = ColorSequence.new(Color3.fromRGB(188, 231, 249)),
        ["Orientation"] = Enum.ParticleOrientation.FacingCamera,
        ["Size"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0, 0), NumberSequenceKeypoint.new(0.265, 6.5, 0.383), NumberSequenceKeypoint.new(1, 9, 0) }),
        ["Transparency"] = NumberSequence.new(0.412, 1),
        ["EmissionDirection"] = Enum.NormalId.Top,
        ["Lifetime"] = NumberRange.new(0.35, 0.55)
    })
    v49:SetAttribute("FirstPersonVisible", false)
    return v49
end
function u16.initTrailEffect(_) --[[ Line: 151 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7("Trail", {
        ["LightEmission"] = 0.25,
        ["Lifetime"] = 0.5,
        ["MaxLength"] = 75,
        ["Texture"] = "rbxassetid://10548595199",
        ["Transparency"] = NumberSequence.new(0, 0.35),
        ["Color"] = ColorSequence.new(Color3.fromRGB(61, 166, 232))
    })
end
u4.CreateController(u16.new())
return nil