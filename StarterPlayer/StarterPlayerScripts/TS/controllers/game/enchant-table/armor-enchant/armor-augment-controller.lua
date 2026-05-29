local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, script.Parent, "armor-augment-manager-controller").AUGMENT_UPGRADE_EFFECT_DURATION
local v8 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ArmorAugmentController"
    end,
    ["__index"] = u4
})
v8.__index = v8
function v8.constructor(p9, p10, p11) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9)
    p9.Name = "ArmorAugmentController"
    p9.armorEnchant = p10
    p9.statusEffectType = p11
end
function v8.KnitStart(u12) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u7
        [4] = u2
        [5] = u3
        [6] = u5
    --]]
    u4.KnitStart(u12)
    u6.Client:Get("ArmorAugmentUpgraded"):Connect(function(u13) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u2
        --]]
        if u13.armorEnchantName ~= u12.armorEnchant then
            return nil
        end
        u12:onArmorAugmentUpgraded(u13.player)
        task.delay(u7, function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u13
            --]]
            u2.Controllers.ArmorAugmentManagerController:refreshArmorModels(u13.player)
        end)
    end)
    u6.Client:Get("ArmorAugmentPassiveProced"):Connect(function(p14) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u12
        --]]
        if p14.armorEnchantName ~= u12.armorEnchant then
            return nil
        end
        u12:onArmorAugmentProced(p14.player, p14.procedBy)
    end)
    u3.StatusEffectRemoved:connect(function(p15) --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
        --]]
        if p15.statusEffect ~= u12.statusEffectType then
            return nil
        end
        local v16 = u5:getPlayerFromEntityInstance(p15.entityInstance)
        if not v16 then
            return nil
        end
        u12:onArmorEnchantRemoved(v16)
    end)
end
return {
    ["ArmorAugmentController"] = v8
}