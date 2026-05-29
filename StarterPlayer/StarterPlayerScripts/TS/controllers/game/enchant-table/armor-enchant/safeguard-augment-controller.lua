local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.ReplicatedStorage
local u9 = v5.RunService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u16 = v1.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController
local u17 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "SafeguardAugmentController"
    end,
    ["__index"] = u16
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u10
        [3] = u13
    --]]
    u16.constructor(p21, u10.SAFEGUARD, u13.ARMOR_ENCHANT_SAFEGUARD)
    p21.Name = "SafeguardAugmentController"
    p21.musicEffectMap = {}
end
function u18.KnitStart(p22) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p22)
end
function u18.onArmorAugmentUpgraded(u23, u24) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u17
    --]]
    u3.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u24)
    task.delay(u17, function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u24
        --]]
        u23:setUpMusicEffect(u24)
    end)
end
function u18.onArmorAugmentProced(p25, p26, _) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
    --]]
    if not p26.Character then
        return nil
    end
    p25:playProcEffect(p26)
    u2:playSound(u12.SOUND_BARRIER_PULSE, {
        ["position"] = p26.Character:GetPivot().Position
    })
end
function u18.onArmorEnchantRemoved(p27, p28) --[[ Line: 56 ]]
    local v29 = p27.musicEffectMap[p28]
    if v29 ~= nil then
        v29:Destroy()
    end
    p27.musicEffectMap[p28] = nil
end
function u18.playProcEffect(p30, p31) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    if not p31.Character then
        return nil
    end
    local v32 = p30.musicEffectMap[p31]
    if not v32 then
        p30:setUpMusicEffect(p31)
    end
    if v32 ~= nil then
        local v33 = 0
        v32 = {}
        for v34, v35 in v32.Explosion:GetDescendants() do
            local _ = v34 - 1
            if v35:IsA("ParticleEmitter") == true then
                v33 = v33 + 1
                v32[v33] = v35
            end
        end
    end
    if v32 then
        u15:playEffects(v32, p31.Character)
    end
    p30:putMusicEffectOnCooldown(p31)
end
function u18.setUpMusicEffect(u36, u37) --[[ Line: 102 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u7
        [3] = u6
        [4] = u4
        [5] = u9
    --]]
    local v38 = u37.Character
    if v38 ~= nil then
        v38 = v38.PrimaryPart
    end
    if not v38 then
        return nil
    end
    local u39 = u8.Assets.Effects.SoundBarrierEnchantMusic:Clone()
    u39.Parent = u37.Character
    u39:PivotTo(u37.Character.PrimaryPart.CFrame)
    u36.musicEffectMap[u37] = u39
    if u37 == u7.LocalPlayer then
        u6:AddTag(u39.Notes.MusicNotes, "FirstPersonHidden")
    end
    u4("WeldConstraint", {
        ["Part0"] = u39,
        ["Part1"] = u37.Character.PrimaryPart,
        ["Parent"] = u37.Character
    })
    local u40 = 0
    local u41 = u39.Position
    local u42 = nil
    u42 = u9.Heartbeat:Connect(function(p43) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u40
            [2] = u36
            [3] = u37
            [4] = u41
            [5] = u42
            [6] = u39
        --]]
        u40 = u40 + p43
        local v44 = u36.musicEffectMap[u37]
        if v44 ~= nil then
            v44 = v44.Position
        end
        u41 = v44
        if not u41 then
            u42:Disconnect()
            return nil
        end
        if not u37.Character then
            u42:Disconnect()
            return nil
        end
        local v45 = u41
        local v46 = u40 * 1.3
        local v47 = math.sin(v46) * 4
        local v48 = u40 * 1.3
        local v49 = math.cos(v48) * 4
        local v50 = v45 + Vector3.new(v47, 0, v49)
        local v51 = u41
        local v52 = (u40 + 0.1) * 1.3
        local v53 = math.sin(v52) * 4
        local v54 = (u40 + 0.1) * 1.3
        local v55 = math.cos(v54) * 4
        local v56 = v51 + Vector3.new(v53, 0, v55)
        u39.Notes:PivotTo(CFrame.new(v50, v56))
    end)
end
function u18.putMusicEffectOnCooldown(u57, u58) --[[ Line: 156 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u13
        [4] = u2
        [5] = u12
    --]]
    local v59 = u57.musicEffectMap[u58]
    if not v59 then
        return nil
    end
    for v60, v61 in v59:GetDescendants() do
        local _ = v60 - 1
        if v61:IsA("ParticleEmitter") then
            v61.Enabled = false
        end
    end
    task.delay(u11.SAFEGUARD_COOLDOWN, function() --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u14
            [3] = u13
            [4] = u57
            [5] = u2
            [6] = u12
        --]]
        if not u58.Character then
            return nil
        end
        if u14:getActive(u58.Character, u13.ARMOR_ENCHANT_SAFEGUARD) then
            u57:takeMusicEffectOffCooldown(u58)
            u2:playSound(u12.SOUND_BARRIER_CD_OFF, {
                ["position"] = u58.Character:GetPivot().Position
            })
        end
    end)
end
function u18.takeMusicEffectOffCooldown(p62, p63) --[[ Line: 185 ]]
    local v64 = p62.musicEffectMap[p63]
    if not v64 then
        p62:setUpMusicEffect(p63)
        return nil
    end
    for v65, v66 in v64.Notes:GetDescendants() do
        local _ = v65 - 1
        if v66:IsA("ParticleEmitter") then
            v66.Enabled = true
        end
    end
end
u3.CreateController(u18.new())
return nil