local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.ReplicatedStorage
local u8 = v5.TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = v1.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController
local u16 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "FrostAugmentController"
    end,
    ["__index"] = u15
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
        [1] = u15
        [2] = u9
        [3] = u12
    --]]
    u15.constructor(p20, u9.FROST, u12.ARMOR_ENCHANT_FROST)
    p20.Name = "FrostAugmentController"
    p20.iceEffectMap = {}
end
function u17.KnitStart(p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.KnitStart(p21)
end
function u17.onArmorAugmentUpgraded(u22, u23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u16
    --]]
    u3.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u23)
    task.delay(u16, function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u23
        --]]
        u22:setUpIceEffect(u23)
    end)
end
function u17.onArmorAugmentProced(p24, p25, _) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
    --]]
    if not p25.Character then
        return nil
    end
    p24:playProcEffect(p25)
    u2:playSound(u11.FROST_ARMOR_ICY_BLAST, {
        ["position"] = p25.Character:GetPivot().Position
    })
end
function u17.onArmorEnchantRemoved(p26, p27) --[[ Line: 55 ]]
    local v28 = p26.iceEffectMap[p27]
    if v28 ~= nil then
        v28:Destroy()
    end
end
function u17.playProcEffect(p29, p30) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if not p30.Character then
        return nil
    end
    local v31 = p29.iceEffectMap[p30]
    if not v31 then
        p29:setUpIceEffect(p30)
    end
    if v31 ~= nil then
        local v32 = 0
        v31 = {}
        for v33, v34 in v31:GetDescendants() do
            local _ = v33 - 1
            if v34:IsA("ParticleEmitter") == true then
                v32 = v32 + 1
                v31[v32] = v34
            end
        end
    end
    if v31 then
        u14:playEffects(v31, p30.Character)
    end
    p29:putIceEffectOnCooldown(p30)
end
function u17.setUpIceEffect(p35, p36) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
        [3] = u4
    --]]
    local v37 = p36.Character
    if v37 ~= nil then
        v37 = v37.PrimaryPart
    end
    if not v37 then
        return nil
    end
    local v38 = u7.Assets.Effects.FrostEnchantIce:Clone()
    v38.Parent = p36.Character
    v38:PivotTo(p36.Character.PrimaryPart.CFrame)
    p35.iceEffectMap[p36] = v38
    for v39, v40 in v38:GetDescendants() do
        local _ = v39 - 1
        if not v40:IsA("ParticleEmitter") then
            u6:AddTag(v40, "FirstPersonHidden")
        end
    end
    u4("WeldConstraint", {
        ["Part0"] = v38,
        ["Part1"] = p36.Character.PrimaryPart,
        ["Parent"] = p36.Character
    })
    p35:tweenTransparencyUp(v38)
end
function u17.tweenTransparencyUp(_, p41) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v42 = p41:GetDescendants()
    local function v44(p43) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        if p43:IsA("MeshPart") then
            u8:Create(p43, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {
                ["Transparency"] = 0
            }):Play()
        elseif p43:IsA("Decal") then
            u8:Create(p43, TweenInfo.new(1.2, Enum.EasingStyle.Sine), {
                ["Transparency"] = 0
            }):Play()
        end
    end
    for v45, v46 in v42 do
        v44(v46, v45 - 1, v42)
    end
end
function u17.putIceEffectOnCooldown(u47, u48) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u13
        [3] = u12
        [4] = u2
        [5] = u11
    --]]
    local v49 = u47.iceEffectMap[u48]
    if not v49 then
        return nil
    end
    for v50, v51 in v49:GetDescendants() do
        local _ = v50 - 1
        if v51:IsA("MeshPart") or v51:IsA("Decal") then
            v51.Transparency = 1
        end
    end
    task.delay(u10.FROST_COOLDOWN, function() --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u13
            [3] = u12
            [4] = u47
            [5] = u2
            [6] = u11
        --]]
        if not u48.Character then
            return nil
        end
        if u13:getActive(u48.Character, u12.ARMOR_ENCHANT_FROST) then
            u47:takeIceEffectOffCooldown(u48)
            u2:playSound(u11.FROST_ARMOR_CD_OFF, {
                ["position"] = u48.Character:GetPivot().Position
            })
        end
    end)
end
function u17.takeIceEffectOffCooldown(p52, p53) --[[ Line: 174 ]]
    local v54 = p52.iceEffectMap[p53]
    if not v54 then
        p52:setUpIceEffect(p53)
        return nil
    end
    p52:tweenTransparencyUp(v54)
end
u3.CreateController(u17.new())
return nil