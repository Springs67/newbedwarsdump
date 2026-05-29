local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.ReplicatedStorage
local u9 = v5.TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController
local u15 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u16 = { v11.ENDURANCE_ROCK_HIT_1, v11.ENDURANCE_ROCK_HIT_2, v11.ENDURANCE_ROCK_HIT_3 }
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "EnduranceAugmentController"
    end,
    ["__index"] = u14
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
        [3] = u12
    --]]
    u14.constructor(p20, u10.ENDURANCE, u12.ARMOR_ENCHANT_ENDURANCE)
    p20.Name = "EnduranceAugmentController"
    p20.rockEffectMap = {}
end
function u17.KnitStart(p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p21)
end
function u17.onArmorAugmentUpgraded(u22, u23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u15
    --]]
    u3.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u23)
    task.delay(u15, function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
        --]]
        u22:setUpRockEffect(u23)
    end)
end
function u17.onArmorAugmentProced(_, p24, p25) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
        [3] = u2
    --]]
    if p24 ~= u7.LocalPlayer then
        return nil
    end
    if p24 ~= p25 then
        return nil
    end
    u2:playSound(u16[math.random(0, #u16 - 1) + 1], {
        ["volumeMultiplier"] = 0.5
    })
end
function u17.onArmorEnchantRemoved(p26, p27) --[[ Line: 58 ]]
    local v28 = p26.rockEffectMap[p27]
    if v28 ~= nil then
        v28:Destroy()
    end
end
function u17.setUpRockEffect(p29, p30) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u13
        [4] = u4
    --]]
    local v31 = p30.Character
    if v31 ~= nil then
        v31 = v31.PrimaryPart
    end
    if not v31 then
        return nil
    end
    local v32 = u8.Assets.Effects.EnduranceEnchantRocks:Clone()
    v32.Parent = p30.Character
    v32:PivotTo(p30.Character.PrimaryPart.CFrame)
    p29.rockEffectMap[p30] = v32
    local v33 = {}
    for v34, v35 in v32:GetDescendants() do
        local _ = v34 - 1
        if v35:IsA("ParticleEmitter") then
            table.insert(v33, v35)
        elseif v35:IsA("Part") then
            u6:AddTag(v35, "FirstPersonHidden")
        end
    end
    u13:playEffects(v33, p30.Character)
    u4("WeldConstraint", {
        ["Part0"] = v32,
        ["Part1"] = p30.Character.PrimaryPart,
        ["Parent"] = p30.Character
    })
    p29:tweenTransparencyUp(v32)
end
function u17.tweenTransparencyUp(_, p36) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v37 = p36:GetDescendants()
    local function v39(p38) --[[ Line: 105 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if p38:IsA("MeshPart") then
            u9:Create(p38, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
                ["Transparency"] = 0
            }):Play()
        end
    end
    for v40, v41 in v37 do
        v39(v41, v40 - 1, v37)
    end
end
u3.CreateController(u17.new())
return nil