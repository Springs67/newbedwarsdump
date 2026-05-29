local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local v6 = {}
local v7 = setmetatable({}, {
    ["__index"] = v6
})
v7.READY = 0
v6[0] = "READY"
v7.THROWN = 1
v6[1] = "THROWN"
v7.WAITING = 2
v6[2] = "WAITING"
v7.TRAVELING = 3
v6[3] = "TRAVELING"
v7.ACTIVE = 4
v6[4] = "ACTIVE"
v7.RETURNING = 5
v6[5] = "RETURNING"
local v32 = {
    ["DEFAULT_SUMMONER_DATA"] = {
        ["summonTier"] = 1,
        ["targetType"] = nil,
        ["affinity"] = v5.ATTACK
    },
    ["getClosestEntity"] = function(u8, u9, u10) --[[ Name: getClosestEntity, Line 35 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
        --]]
        local v11 = u3:getEntitiesNearPosition(u8, u4.DEPLOY_RADIUS, false)
        local function v16(p12) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u9
                [3] = u10
            --]]
            local v13 = u3:getEntity(p12)
            if v13 then
                if u3:getPlayerFromEntityInstance(p12) == u9 then
                    return false
                elseif u10 == "attack" then
                    local v14 = u3:getEntity(u9)
                    if v14 ~= nil then
                        v14 = v14:canAttack(v13)
                    end
                    return v14
                else
                    local v15 = u3:getEntity(u9)
                    if v15 ~= nil then
                        v15 = v15:canAttack(v13)
                    end
                    return not v15
                end
            else
                return false
            end
        end
        local v17 = 0
        local v18 = {}
        for v19, v20 in v11 do
            if v16(v20, v19 - 1, v11) == true then
                v17 = v17 + 1
                v18[v17] = v20
            end
        end
        table.sort(v18, function(p21, p22) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            return (p21:GetPivot().Position - u8).Magnitude < (p22:GetPivot().Position - u8).Magnitude
        end)
        if #v18 ~= 0 then
            return v18[1]
        end
    end,
    ["getClosestItemDrop"] = function(u23) --[[ Name: getClosestItemDrop, Line 88 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local v24 = 0
        local v25 = {}
        for v26, v27 in u2:GetTagged("ItemDrop") do
            local _ = v26 - 1
            local v28 = v27:GetAttribute("SpiritTargetted")
            if v28 == 0 or v28 ~= v28 then
                v28 = false
            elseif v28 == "" then
                v28 = false
            end
            local v29 = not v28
            if v29 then
                v29 = (v27:GetPivot().Position - u23).Magnitude <= u4.DEPLOY_RADIUS
            end
            if v29 == true then
                v24 = v24 + 1
                v25[v24] = v27
            end
        end
        if #v25 == 0 then
            return nil
        end
        table.sort(v25, function(p30, p31) --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            return (p30:GetPivot().Position - u23).Magnitude < (p31:GetPivot().Position - u23).Magnitude
        end)
        return v25[1]
    end
}
return {
    ["SummonedSpiritState"] = v7,
    ["SpiritSummonerUtil"] = v32
}