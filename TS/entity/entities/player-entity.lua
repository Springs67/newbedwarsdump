local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u3 = v2.KnitClient
local u4 = v2.KnitServer
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.CollectionService
local u7 = v5.Players
local u8 = v5.RunService
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").FriendlyFireAttr
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "inventory-entity").InventoryEntity
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "PlayerEntity"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18, p19, p20) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p18, p20)
    p18.player = p19
end
function u15.onServerSetup(p21) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.onServerSetup(p21)
end
function u15.getPlayer(p22) --[[ Line: 37 ]]
    return p22.player
end
function u15.canAttack(p23, p24, p25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
        [3] = u6
        [4] = u7
        [5] = u13
        [6] = u9
        [7] = u8
        [8] = u3
        [9] = u10
        [10] = u4
        [11] = u11
        [12] = u1
        [13] = u15
    --]]
    if not u14.canAttack(p23, p24) then
        return false
    end
    if u12.isLobbyServer() and u6:HasTag(p24:getInstance(), "Monster") then
        return true
    end
    local v26 = u12.isLobbyServer()
    if v26 then
        v26 = p23.player:GetAttribute("LobbyFriendlyFire") == true
    end
    if v26 then
        local v27 = u7:GetPlayerFromCharacter(p24:getInstance())
        if v27 ~= nil then
            v27 = v27:GetAttribute("LobbyFriendlyFire")
        end
        v26 = v27 == true
    end
    if v26 then
        print("Friendly fire enabled, returning true")
        return true
    end
    if p25 ~= nil then
        p25 = p25.friendlyFire
    end
    if p25 or u13(p23:getInstance(), u9) == true then
        return true
    end
    if u8:IsClient() then
        local v28 = u3.Controllers.MatchController
        if v28 then
            local v29 = v28:getQueueType()
            if v29 and u10(v29).enableFriendlyFire then
                return true
            end
        end
    else
        local v30 = u8:IsServer() and u4.Services.MatchService
        if v30 then
            local v31 = v30:getMatchConfig()
            if v31 ~= nil then
                v31 = v31.queueType
            end
            if v31 and u10(v31).enableFriendlyFire then
                return true
            end
        end
    end
    local v32 = u11.getGamePlayer(p23:getPlayer())
    if u1.instanceof(p24, u15) then
        if u11.getGamePlayer(p24:getPlayer()):getTeamId() == v32:getTeamId() then
            return false
        end
    else
        if p24:getInstance():GetAttribute("Team") == v32:getTeamId() then
            return false
        end
        local v33 = p24:getInstance():GetAttribute("PlacedByUserId")
        if v33 == nil then
            v33 = p24:getInstance():GetAttribute("PlayerUserId")
        end
        local v34 = v33 ~= 0 and (v33 == v33 and (v33 and u7:GetPlayerByUserId(v33)))
        if v34 then
            local v35 = u11.getGamePlayer(v34)
            if v32:getTeamId() == v35:getTeamId() then
                return false
            end
        end
    end
    return true
end
function u15.getGamePlayer(p36) --[[ Line: 135 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11.getGamePlayer(p36.player)
end
return {
    ["PlayerEntity"] = u15
}