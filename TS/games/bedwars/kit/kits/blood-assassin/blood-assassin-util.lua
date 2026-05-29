local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade-meta").BloodUpgradeMeta
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "BloodAssassinUtil"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(_) --[[ Line: 17 ]] end
function u4.getDefaultAssassinUpgradeInfo(_) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v7 = {}
    for _, v8 in u2.entries(u3) do
        local v9 = v8[1]
        local v10 = v8[2].initialValue
        v7[v9] = v10 == nil and 0 or v10
    end
    return v7
end
u4.ABANDON_TIME_SEC = 60
local v11 = {}
local v12 = setmetatable({}, {
    ["__index"] = v11
})
v12.PLAYER_SELECTED_CONTRACT = 0
v11[0] = "PLAYER_SELECTED_CONTRACT"
v12.PLAYER_ABANDON_CONTRACT = 1
v11[1] = "PLAYER_ABANDON_CONTRACT"
v12.CONTRACT_SUCCESS = 2
v11[2] = "CONTRACT_SUCCESS"
v12.CONTRACT_TARGET_UNAVAILABLE = 3
v11[3] = "CONTRACT_TARGET_UNAVAILABLE"
v12.CONTRACT_TIMEOUT = 4
v11[4] = "CONTRACT_TIMEOUT"
return {
    ["BloodAssassinUtil"] = u4,
    ["ContractChangeReason"] = v12
}