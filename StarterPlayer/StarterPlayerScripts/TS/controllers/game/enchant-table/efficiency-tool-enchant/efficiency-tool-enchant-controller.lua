local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "enchant-util").EnchantBalance
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u14 = v1.import(script, script.Parent.Parent.Parent, "block-break-controller").BlockBreakController
local u15 = {
    v11.EFFICIENCY_TOOL_ENCHANT_HIT_1,
    v11.EFFICIENCY_TOOL_ENCHANT_HIT_2,
    v11.EFFICIENCY_TOOL_ENCHANT_HIT_3,
    v11.EFFICIENCY_TOOL_ENCHANT_HIT_4
}
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "EfficiencyToolEnchantController"
    end,
    ["__index"] = u6
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
        [1] = u6
    --]]
    u6.constructor(p19)
    p19.Name = "EfficiencyToolEnchantController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u12
        [4] = u14
        [5] = u7
        [6] = u9
        [7] = u4
        [8] = u10
        [9] = u8
        [10] = u13
        [11] = u15
        [12] = u2
    --]]
    u6.KnitStart(p20)
    u5.StatusEffectAdded:connect(function(p21) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u14
            [3] = u7
        --]]
        local v22 = p21.statusEffect == u12.TOOL_ENCHANT_EFFICIENCY and u14:getBlockBreaker()
        if v22 then
            v22:setCooldown(v22:getCooldown() * (1 - u7.EFFICIENCY_TOOL_PERCENT / 100))
        end
    end)
    u5.DamageBlock:connect(function(p23) --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u4
            [3] = u10
            [4] = u8
            [5] = u13
            [6] = u12
            [7] = u15
            [8] = u2
        --]]
        if p23:isCancelled() then
            return nil
        end
        local v24 = u9.getInventory(u4.LocalPlayer).hand
        if v24 then
            local v25 = u10(v24.itemType)
            local v26 = u8:getEntity(u4.LocalPlayer)
            if v26 ~= nil then
                v26 = v26:getInstance()
            end
            if v25.breakBlock and (v26 and u13:isActive(v26, u12.TOOL_ENCHANT_EFFICIENCY)) then
                u2:playSound(u15[math.random(0, #u15 - 1) + 1], {
                    ["volumeMultiplier"] = 0.2
                })
            end
        end
    end)
    u5.StatusEffectRemoved:connect(function(p27) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u14
        --]]
        if p27.statusEffect == u12.TOOL_ENCHANT_EFFICIENCY and u14:getBlockBreaker() then
            u14:setDefaultCooldown()
        end
    end)
end
v3.CreateController(u16.new())
return nil