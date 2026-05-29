local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "hotdog-bat-balance").HotdogBatBalance
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "HotdogBatController"
    end
})
u13.__index = u13
function u13.new(...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(_) --[[ Line: 26 ]] end
function u13.onStart(u16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u11
        [4] = u7
        [5] = u6
        [6] = u8
        [7] = u3
    --]]
    u4.Controllers.PreloadController:preloadForItemType(u10.HOTDOG_BAT, {
        ["sounds"] = {
            u11.HOTDOG_BAT_HIT_1,
            u11.HOTDOG_BAT_HIT_2,
            u11.HOTDOG_BAT_HIT_3,
            u11.FRYING_PAN_CHARGE
        },
        ["animations"] = {
            u7.INFERNO_SWORD_SPIN,
            u7.FP_INFERNO_SWORD_SPIN,
            u7.INFERNO_SWORD_CHARGE,
            u7.FP_INFERNO_SWORD_CHARGE
        }
    })
    u6.SwordChargedSwing:connect(function(p17) --[[ Line: 33 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u16
            [3] = u8
            [4] = u11
            [5] = u3
        --]]
        if p17.weapon.Name ~= u10.HOTDOG_BAT then
            return nil
        end
        local v18 = not u16:hasTargets()
        if not v18 then
            local v19 = p17.chargedAttack
            if v19 ~= nil then
                v19 = v19.chargeTime
            end
            v18 = (v19 == nil and 0 or v19) < u8.MIN_CHARGE_TIME
        end
        if v18 then
            return nil
        end
        local v20 = p17.chargedAttack
        if v20 ~= nil then
            v20 = v20.chargeTime
        end
        local v21 = (v20 == nil and 0 or v20) / u8.MAX_CHARGE_TIME
        local v22 = u11.HOTDOG_BAT_HIT_1
        if v21 > 0.9 then
            v22 = u11.HOTDOG_BAT_HIT_3
        elseif v21 > 0.4 then
            v22 = u11.HOTDOG_BAT_HIT_2
        end
        u3:playSound(v22)
    end)
end
function u13.hasTargets(_) --[[ Line: 70 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u8
    --]]
    local v23 = u9:getLocalPlayerEntity()
    if not v23 then
        return false
    end
    local v24 = v23:getInstance():GetPivot().Position
    local v25 = 0
    local v26 = {}
    for v27, v28 in u12.getEntitiesWithinRadius(v24, u8.ATTACK_RANGE) do
        local _ = v27 - 1
        local v29 = v28:getInstance()
        local v30
        if v23 == nil then
            v30 = v23
        else
            v30 = v23:getInstance()
        end
        local v31 = v29 ~= v30
        if v31 then
            v31 = v23:canAttack(v28)
        end
        if v31 == true then
            v25 = v25 + 1
            v26[v25] = v28
        end
    end
    return #v26 ~= 0
end
v2.defineMetadata(u13, "identifier", "client/controllers/game/items/hotdog-bat/hotdog-bat-controller@HotdogBatController")
v2.defineMetadata(u13, "flamework:implements", { "$:flamework@OnStart" })
v2.decorate(u13, "$:flamework@Controller", v5, {
    {}
})
return {
    ["default"] = u13
}