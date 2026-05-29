local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-type").BattlePass
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers")
local u8 = v7.GetTarmacAsset
local u9 = v7.GetTarmacAssetFromPath
local u10 = {}
local u11 = u2.values(v6)
local u12 = nil
local function v22() --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u2
        [4] = u4
        [5] = u3
        [6] = u5
    --]]
    u12((u9({ "emotes" })))
    u12(u9({ "emotes", "CrateRewards" }))
    u12(u9({ "emotes", "RobuxStore" }))
    for v13, v14 in u2.values(u4) do
        local _ = v13 - 1
        local v15 = u9({ "emotes", "Event", v14 })
        if v15 then
            u12(v15)
        end
    end
    for v16, v17 in u2.values(u3) do
        local _ = v16 - 1
        local v18 = u9({ "emotes", v17 })
        if v18 then
            u12(v18)
        end
    end
    for v19, v20 in u2.values(u5) do
        local _ = v19 - 1
        local v21 = u9({ "emotes", "KitContractRewards", v20 })
        if v21 then
            u12(v21)
        end
    end
end
u12 = function(p23) --[[ Name: setEmoteAssets, Line 55 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u8
        [4] = u10
    --]]
    for _, v24 in u2.keys(p23) do
        if table.find(u11, v24) ~= nil and type(v24) == "string" then
            u10[v24] = u8(v24, p23).Image
        end
    end
end
v22()
return {
    ["getEmoteAsset"] = function(p25) --[[ Name: getEmoteAsset, Line 68 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        return u10[p25]
    end,
    ["getEmoteAssetFromString"] = function(p26) --[[ Name: getEmoteAssetFromString, Line 72 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        return u10[p26]
    end,
    ["EmoteAssets"] = u10
}