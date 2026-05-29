local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, script.Parent, "armor-enchant", "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local u10 = {
    [u8.ENCHANT_FIRE] = v7.FIRE_ENCHANT_APPLY,
    [u8.ENCHANT_STATIC] = v7.STATIC_ENCHANT_APPLY,
    [u8.ENCHANT_CRITICAL_STRIKE] = v7.CRIT_ENCHANT_APPLY,
    [u8.ENCHANT_FOREST] = v7.FOREST_ENCHANT_APPLY,
    [u8.ENCHANT_CLOUD] = v7.CLOUD_ENCHANT_APPLY,
    [u8.ENCHANT_SOUL_REAVER] = v7.SOUL_REAVER_ENCHANT_APPLY,
    [u8.ENCHANT_EXECUTE] = v7.EXECUTE_ENCHANT_APPLY,
    [u8.ENCHANT_CLEAVE] = v7.CLEAVE_ENCHANT_APPLY,
    [u8.ENCHANT_BERSERKER] = v7.BERSERKER_ENCHANT_APPLY,
    [u8.ARMOR_ENCHANT_ABSORPTION] = v7.ABSORPTION_ENCHANT_APPLY,
    [u8.ARMOR_ENCHANT_BLOCKING] = v7.BLOCKING_ENCHANT_APPLY,
    [u8.ARMOR_ENCHANT_SAFEGUARD] = v7.SOUND_BARRIER_ENCHANT_APPLY,
    [u8.ARMOR_ENCHANT_FROST] = v7.FROST_ENCHANT_APPLY,
    [u8.ARMOR_ENCHANT_ENDURANCE] = v7.ENDURANCE_ENCHANT_APPLY,
    [u8.ARMOR_ENCHANT_SWIFT] = v7.SWIFT_ENCHANT_APPLY,
    [u8.TOOL_ENCHANT_CRITICAL_STRIKE] = v7.SHATTER_STRIKE_ENCHANT_APPLY,
    [u8.TOOL_ENCHANT_EXPLOSIVE] = v7.EXPLOSIVE_ENCHANT_APPLY,
    [u8.TOOL_ENCHANT_HEAVY_HITTER] = v7.HEAVY_HITTER_ENCHANT_APPLY,
    [u8.TOOL_ENCHANT_EFFICIENCY] = v7.EFFICIENCY_ENCHANT_APPLY,
    [u8.GROUNDED] = v7.GROUNDED_EFFECT_APPLY
}
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "EnchantSoundController"
    end,
    ["__index"] = u6
})
u11.__index = u11
function u11.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p14)
    p14.Name = "EnchantSoundController"
end
function u11.KnitStart(p15) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u4
        [4] = u10
        [5] = u8
        [6] = u9
        [7] = u2
    --]]
    u6.KnitStart(p15)
    u5.StatusEffectAdded:connect(function(p16) --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u10
            [3] = u8
            [4] = u9
            [5] = u2
        --]]
        local v17 = u4:GetPlayerFromCharacter(p16.entityInstance)
        if v17 and v17 == u4.LocalPlayer then
            local u18 = u10[p16.statusEffect]
            if u18 == "" or not u18 then
                return nil
            end
            local u19 = (p16.statusEffect == u8.TOOL_ENCHANT_EXPLOSIVE or p16.statusEffect == u8.ARMOR_ENCHANT_SWIFT) and 0.6 or 1
            task.delay(u9 - 0.05, function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u18
                    [3] = u19
                --]]
                u2:playSound(u18, {
                    ["volumeMultiplier"] = u19
                })
            end)
        end
    end)
end
v3.CreateController(u11.new())
return nil