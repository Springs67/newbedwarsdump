local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "scissor-sword-balance").ScissorSwordBalance
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "ScissorSwordComboHandler"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p12.comboCount = 0
    p12.lastComboTime = 0
    p12.eventMaid = u3.new()
end
function u9.enable(u13) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u7
        [4] = u5
        [5] = u2
    --]]
    local u17 = u6.On(function(_, _, _, _, p14, _, _, _, _, _, _, _, _, _) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u13
            [3] = u7
        --]]
        if p14 ~= u4.LocalPlayer.Character then
            return nil
        end
        local v15 = os.time()
        if u13.lastComboTime + u7.COMBO_TIME_WINDOW_SEC < v15 then
            u13.comboCount = 0
        else
            local v16 = u13
            v16.comboCount = v16.comboCount + 1
        end
        u13.lastComboTime = v15
    end)
    u13.eventMaid:GiveTask(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17()
    end)
    u13.eventMaid:GiveTask(u5.SwordSwing:setPriority(u2.HIGHEST):connect(function(p18) --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        if p18:isCancelled() or not u13:isScissorSword(p18.swordType) then
            return nil
        end
        p18.attackSpeed = u13:getAttackSpeedFromComboCount()
    end))
end
function u9.disable(p19) --[[ Line: 53 ]]
    p19.eventMaid:DoCleaning()
end
function u9.isScissorSword(_, p20) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return p20 == u8.VILLAIN_SCISSOR_SWORD and true or p20 == u8.HERO_SCISSOR_SWORD
end
function u9.getAttackSpeedFromComboCount(p21) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v22 = (p21.comboCount * -1 + 5) / 3
    local v23 = 5 / (math.exp(v22) + 1)
    return u7.BASE_ATTACK_SPEED_SEC / v23
end
return {
    ["ScissorSwordComboHandler"] = u9
}