local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.CollectionService
local u9 = v7.ReplicatedStorage
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = v1.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController
local u15 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "AbsorbingAugmentController"
    end,
    ["__index"] = u14
})
u16.__index = u16
function u16.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
        [3] = u13
    --]]
    u14.constructor(p19, u10.ABSORPTION, u13.ARMOR_ENCHANT_ABSORPTION)
    p19.Name = "AbsorbingAugmentController"
    p19.damageStoredConnectionMap = {}
    p19.bubbleEffectMap = {}
end
function u16.KnitStart(p20) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p20)
end
function u16.onArmorAugmentUpgraded(u21, u22) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u15
        [3] = u3
        [4] = u11
    --]]
    u5.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u22)
    task.delay(u15, function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u22
            [3] = u3
            [4] = u11
        --]]
        u21:setUpBubbleEffect(u22)
        local v25 = u22:GetAttributeChangedSignal("DamageStored"):Connect(function() --[[ Line: 48 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u22
                [3] = u3
                [4] = u11
            --]]
            local v23 = u21.bubbleEffectMap[u22]
            if v23 ~= nil then
                v23 = v23.Bubble
            end
            if not v23 then
                return nil
            end
            v23.Transparency = u3:rangeMap(u22:GetAttribute("DamageStored"), { 0, u11.ABSORBING_AMOUNT_MAX }, { 0.6, 0.2 })
            local v24 = u3:rangeMap(u22:GetAttribute("DamageStored"), { 0, u11.ABSORBING_AMOUNT_MAX }, { 3, 6 })
            v23.Size = Vector3.new(v24, v24, v24)
        end)
        u21.damageStoredConnectionMap[u22] = v25
    end)
end
function u16.onArmorAugmentProced(p26, p27, _) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
    --]]
    if not p27.Character then
        return nil
    end
    u4:playSound(u12.ABSORPTION_BUBBLE_POP, {
        ["volumeMultiplier"] = 1.8,
        ["position"] = p27.Character:GetPivot().Position
    })
    p26:playEffect(p27)
end
function u16.onArmorEnchantRemoved(p28, p29) --[[ Line: 79 ]]
    local v30 = p28.damageStoredConnectionMap[p29]
    if v30 ~= nil then
        v30:Disconnect()
    end
    local v31 = p28.bubbleEffectMap[p29]
    if v31 ~= nil then
        v31:Destroy()
    end
end
function u16.playEffect(_, p32) --[[ Line: 95 ]]
    if not p32.Character then
        return nil
    end
end
function u16.setUpBubbleEffect(p33, p34) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u6
    --]]
    local v35 = p34.Character
    if v35 ~= nil then
        v35 = v35.PrimaryPart
    end
    if not v35 then
        return nil
    end
    local v36 = u9.Assets.Effects.AbsorptionEnchantBubble:Clone()
    v36.Parent = p34.Character
    v36:PivotTo(p34.Character.PrimaryPart.CFrame)
    p33.bubbleEffectMap[p34] = v36
    for v37, v38 in v36:GetDescendants() do
        local _ = v37 - 1
        u8:AddTag(v38, "FirstPersonHidden")
    end
    u6("WeldConstraint", {
        ["Part0"] = v36,
        ["Part1"] = p34.Character.PrimaryPart,
        ["Parent"] = p34.Character
    })
end
u5.CreateController(u16.new())
return nil