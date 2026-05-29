local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "black-marketeer-balance").BlackMarketeerBalance
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil
local u10 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "FuryPotionController"
    end,
    ["__index"] = u5
})
u10.__index = u10
function u10.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v11 = u10
    local v12 = setmetatable({}, v11)
    return v12:constructor(...) or v12
end
function u10.constructor(p13) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    u5.constructor(p13)
    p13.Name = "FuryPotionController"
    p13.entityInstanceMaid = {}
end
function u10.KnitStart(p14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u7
        [5] = u9
        [6] = u8
        [7] = u6
    --]]
    u5.KnitStart(p14)
    u4.SwordSwing:setPriority(u3.HIGH):connect(function(p15) --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
            [3] = u8
            [4] = u6
        --]]
        local v16 = u7:getLocalPlayerEntity()
        if not v16 then
            return nil
        end
        if not u9:isActive(v16:getInstance(), u8.FURY_POTION) then
            return nil
        end
        local v17 = 1 - (u6.FURY_POTION_ATTACK_SPEED_MULTIPLIER - 1)
        p15.attackSpeed = p15.attackSpeed * v17
        p15.config = {
            ["respectAttackSpeedOverride"] = true
        }
    end)
end
v2.CreateController(u10.new())
return nil