local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "studio-config-override").StudioQueueType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopFilter
local u11 = { v9.WOOL_WHITE, v9.LEATHER_CHESTPLATE, v9.STONE_SWORD }
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "BeginnerTutorialShopFilter"
    end,
    ["__index"] = u10
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, ...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p15, ...)
end
function u12.apply(_, _, p16) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u6
        [4] = u5
        [5] = u4
        [6] = u8
        [7] = u11
    --]]
    local v17 = nil
    if u2.isHoarceKat() then
        v17 = u7
    elseif u6:IsServer() then
        v17 = u5.Services.MatchService:getMatchConfig()
        if v17 ~= nil then
            v17 = v17.queueType
        end
    elseif u6:IsClient() then
        v17 = u4.Controllers.MatchController:getQueueType()
    end
    if not v17 or v17 ~= u8.BEGINNER_TUTORIAL then
        return p16
    end
    local v18 = 0
    local v19 = {}
    for v20, v21 in p16 do
        local _ = v20 - 1
        local v22 = v21.itemType
        if table.find(u11, v22) ~= nil == true then
            v18 = v18 + 1
            v19[v18] = v21
        end
    end
    return v19
end
return {
    ["BeginnerTutorialShopFilter"] = u12,
    ["default"] = u12.new()
}