local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = v6.RunService
local u11 = v6.TweenService
local u12 = v6.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-type").ArmorEnchantType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u18 = v1.import(script, script.Parent, "armor-augment-controller").ArmorAugmentController
local u19 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "BlockingAugmentController"
    end,
    ["__index"] = u18
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u13
        [3] = u16
    --]]
    u18.constructor(p23, u13.BLOCKING, u16.ARMOR_ENCHANT_BLOCKING)
    p23.Name = "BlockingAugmentController"
    p23.shieldEffectMap = {}
end
function u20.KnitStart(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
        [3] = u17
        [4] = u16
        [5] = u2
        [6] = u15
    --]]
    u18.KnitStart(u24)
    u14.Client:Get("BlockingEnchantOffCooldown"):Connect(function(p25) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u16
            [3] = u24
            [4] = u2
            [5] = u15
        --]]
        if not p25.player.Character then
            return nil
        end
        if u17:getActive(p25.player.Character, u16.ARMOR_ENCHANT_BLOCKING) then
            u24:takeShieldEffectOffCooldown(p25.player)
            u2:playSound(u15.ARMOR_BLOCK_CD_OFF, {
                ["position"] = p25.player.Character:GetPivot().Position
            })
        end
    end)
end
function u20.onArmorAugmentUpgraded(u26, u27) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u19
    --]]
    u3.Controllers.ArmorAugmentManagerController:playVoidifyEffect(u27)
    task.delay(u19, function() --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u27
        --]]
        u26:setUpShieldEffect(u27)
    end)
end
function u20.onArmorAugmentProced(p28, p29, p30) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u8
        [4] = u3
    --]]
    if not p29.Character then
        return nil
    end
    u2:playSound(u15.VOID_SHIELD_BREAK, {
        ["position"] = p29.Character:GetPivot().Position
    })
    p28:playProcEffect(p29)
    if p30 == u8.LocalPlayer then
        local v31 = p29.Character
        if v31 ~= nil then
            v31 = v31.PrimaryPart
            if v31 ~= nil then
                v31 = v31.Position
            end
        end
        if v31 then
            u3.Controllers.DamageIndicatorController:spawnDamageIndicator(v31, 1, {
                ["text"] = "Blocked",
                ["color"] = Color3.fromRGB(255, 107, 245)
            })
        end
    end
end
function u20.onArmorEnchantRemoved(p32, p33) --[[ Line: 86 ]]
    local v34 = p32.shieldEffectMap[p33]
    if v34 ~= nil then
        v34:Destroy()
    end
end
function u20.playProcEffect(p35, u36) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u10
        [4] = u5
    --]]
    if not u36.Character then
        return nil
    end
    local u37 = u9.Assets.Effects.VoidShieldBreak:Clone()
    u37:PivotTo(u36.Character:GetPivot())
    u37.Parent = u12
    local u38 = u37:WaitForChild("Shield", 3)
    u38.Transparency = 0.4
    local u39 = tick() + 1
    local u40 = 1
    u10.Heartbeat:Connect(function(p41) --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u38
            [3] = u36
            [4] = u37
            [5] = u5
            [6] = u40
        --]]
        if u39 < tick() + p41 then
            u38:Destroy()
            return nil
        end
        if not u36.Character then
            return nil
        end
        u37:PivotTo(u36.Character:GetPivot())
        local v42 = u38
        v42.Transparency = v42.Transparency + p41 * 2.5
        u5(u37, u40)
        u40 = u40 + p41
    end)
    p35:putShieldEffectOnCooldown(u36)
end
function u20.setUpShieldEffect(p43, p44) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
        [3] = u4
    --]]
    local v45 = p44.Character
    if v45 ~= nil then
        v45 = v45.PrimaryPart
    end
    if not v45 then
        return nil
    end
    local v46 = u9.Assets.Effects.BlockingEnchantShields:Clone()
    v46.Parent = p44.Character
    v46:PivotTo(p44.Character.PrimaryPart.CFrame)
    p43.shieldEffectMap[p44] = v46
    for v47, v48 in v46:GetDescendants() do
        local _ = v47 - 1
        u7:AddTag(v48, "FirstPersonHidden")
    end
    u4("WeldConstraint", {
        ["Part0"] = v46,
        ["Part1"] = p44.Character.PrimaryPart,
        ["Parent"] = p44.Character
    })
    p43:tweenShieldSizeUp(v46.Shields)
end
function u20.tweenShieldSizeUp(_, p49) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11:Create(p49, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
        ["Size"] = Vector3.new(6, 2.4, 6)
    }):Play()
end
function u20.putShieldEffectOnCooldown(p50, p51) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local u52 = p50.shieldEffectMap[p51]
    if not u52 then
        return nil
    end
    u11:Create(u52.Shields, TweenInfo.new(0.4, Enum.EasingStyle.Sine), {
        ["Transparency"] = 1
    }):Play()
    task.delay(0.4, function() --[[ Line: 165 ]]
        --[[
        Upvalues:
            [1] = u52
        --]]
        u52.Shields.Size = Vector3.new(2, 1.3, 2)
    end)
end
function u20.takeShieldEffectOffCooldown(p53, p54) --[[ Line: 169 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v55 = p53.shieldEffectMap[p54]
    if not v55 then
        p53:setUpShieldEffect(p54)
        return nil
    end
    u11:Create(v55.Shields, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
        ["Transparency"] = 0.3
    }):Play()
    p53:tweenShieldSizeUp(v55.Shields)
end
u3.CreateController(u20.new())
return nil