local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-meta").HalloweenAbilityMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 15 ]]
        return "HalloweenAbilityUtil"
    end
})
u11.__index = u11
function u11.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(_) --[[ Line: 24 ]] end
function u11.getAttributeName(_, p14) --[[ Line: 26 ]]
    return "HalloweenAbility_" .. p14
end
function u11.getAbilityStacks(p15, p16, p17) --[[ Line: 29 ]]
    local v18 = p16:GetAttribute(p15:getAttributeName(p17))
    return v18 == nil and 0 or v18
end
function u11.getActiveAbilities(p19, p20) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    local v21 = {}
    for _, v22 in u2.values(u10) do
        local v23 = p20:GetAttribute(p19:getAttributeName(v22))
        if v23 ~= 0 and (v23 == v23 and (v23 ~= "" and v23)) then
            table.insert(v21, v22)
        end
    end
    return v21
end
function u11.isActive(p24, p25, p26) --[[ Line: 47 ]]
    return p25:GetAttribute(p24:getAttributeName(p26)) ~= nil
end
function u11.getAbilityPoolByKitAndTier(_, u27, u28, u29) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u9
        [3] = u8
        [4] = u11
    --]]
    local v30 = u2.entries(u9)
    local function v36(p31) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u28
            [3] = u29
            [4] = u27
            [5] = u11
        --]]
        local v32 = p31[1]
        local v33 = p31[2]
        if v33.disabled then
            return false
        end
        local v34
        if v33.bedwarsKit == u8.NONE or v33.bedwarsKit == u28 then
            v34 = v33.upgradeTier == u29
        else
            v34 = false
        end
        local v35 = v33.unique
        if v35 then
            v35 = u27:GetAttribute(u11:getAttributeName(v32))
        end
        if v33.maxStacks ~= nil and u11:getAbilityStacks(u27, v32) >= v33.maxStacks then
            return false
        end
        if v34 then
            if v35 == 0 or v35 ~= v35 then
                v35 = false
            elseif v35 == "" then
                v35 = false
            end
            v34 = not v35
        end
        return v34
    end
    local v37 = 0
    local v38 = {}
    for v39, v40 in v30 do
        if v36(v40, v39 - 1, v30) == true then
            v37 = v37 + 1
            v38[v37] = v40
        end
    end
    local v41 = table.create(#v38)
    for v42, v43 in v38 do
        local _ = v42 - 1
        v41[v42] = v43[1]
    end
    return v41
end
function u11.getStarterKit(_, p44) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u10
    --]]
    local v45 = 0
    local v46 = {}
    for v47, v48 in u11:getActiveAbilities(p44) do
        local _ = v47 - 1
        if ((v48 == u10.DEATH_ADDER_STARTER or (v48 == u10.SILAS_STARTER or v48 == u10.KAIDA_STARTER)) and true or v48 == u10.NAZAR_STARTER) == true then
            v45 = v45 + 1
            v46[v45] = v48
        end
    end
    if #v46 > 0 then
        local v49 = v46[1]
        for v50, v51 in u11.halloweenStarterAbilityMap do
            if v51 == v49 then
                return v50
            end
        end
    end
    return nil
end
function u11.matchIsHalloweenEvent(_) --[[ Line: 118 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u7
        [4] = u4
    --]]
    if u6:IsServer() then
        return (u5.Services.MatchService:getQueueType() == u7.HALLOWEEN_2024_EVENT or u5.Services.MatchService:getQueueType() == u7.HALLOWEEN_EVENT) and true or u5.Services.MatchService:getQueueType() == u7.HALLOWEEN_2025_EVENT_PVE
    else
        return (u4.Controllers.MatchController:getQueueType() == u7.HALLOWEEN_2024_EVENT or u4.Controllers.MatchController:getQueueType() == u7.HALLOWEEN_EVENT) and true or u5.Services.MatchService:getQueueType() == u7.HALLOWEEN_2025_EVENT_PVE
    end
end
u11.halloweenStarterAbilityMap = {
    [u8.SORCERER] = u10.DEATH_ADDER_STARTER,
    [u8.REBELLION_LEADER] = u10.SILAS_STARTER,
    [u8.SUMMONER] = u10.KAIDA_STARTER,
    [u8.NAZAR] = u10.NAZAR_STARTER
}
return {
    ["HalloweenAbilityUtil"] = u11
}