local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["StyxKitBalance"] = {
        ["GHOST_STATE_DURATION"] = 7,
        ["BLOCK_TRANSPARENCY"] = 0.8,
        ["BLOCK_CULL_RADIUS"] = 50,
        ["PORTAL_UNOPENED_LIFETIME"] = 15,
        ["PORTAL_OPENED_LIFETIME"] = 30,
        ["PORTAL_OPEN_COOLDOWN_SECONDS"] = 15,
        ["TELEPORT_SPEED"] = 110,
        ["PORTAL_USE_COUNT_MAX"] = 5,
        ["GIVE_SHIELD_AFTER_TELEPORT"] = true,
        ["SHIELD_AMOUNT"] = 10,
        ["SHIELD_DURATION"] = 5,
        ["GIVE_SPEED_BOOST_AFTER_TELEPORT"] = true,
        ["SPEED_BOOST_MULTIPLIER"] = 1.1,
        ["SPEED_BOOST_DURATION"] = 5,
        ["getBlockHealth"] = function(p5, p6) --[[ Name: getBlockHealth, Line 37 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u3
                [3] = u4
            --]]
            local v7 = u2(p6).teamGenSpeedMultipliers
            if v7 ~= nil then
                v7 = v7.all
            end
            local v8 = ((v7 == nil and 1 or v7) - 1) / 2
            local v9 = 1 - math.clamp(v8, 0, 0.3)
            local v10 = u3(u4.STYX_ENTRANCE_PORTAL).block.health
            local v11 = {
                {
                    ["maxDuration"] = 2,
                    ["healthMultiplier"] = 1
                },
                {
                    ["healthMultiplier"] = 1.5,
                    ["maxDuration"] = 360 * v9
                },
                {
                    ["healthMultiplier"] = 2,
                    ["maxDuration"] = 660 * v9
                },
                {
                    ["healthMultiplier"] = 2.5,
                    ["maxDuration"] = 960 * v9
                }
            }
            local v12 = nil
            for v13, v14 in v11 do
                local _ = v13 - 1
                if p5 <= v14.maxDuration == true then
                    v12 = v14
                    break
                end
            end
            if v12 == nil then
                v12 = v11[#v11 - 1 + 1]
            end
            if v12 ~= nil then
                v12 = v12.healthMultiplier
            end
            return v10 * (v12 == nil and 1 or v12)
        end
    }
}