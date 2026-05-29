local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.NONE = 0
v2[0] = "NONE"
v3.PARTY = 1
v2[1] = "PARTY"
v3.INVITES = 2
v2[2] = "INVITES"
v3.INVENTORY = 3
v2[3] = "INVENTORY"
v3.BEDWARS_UPGRADE_SHOP = 4
v2[4] = "BEDWARS_UPGRADE_SHOP"
v3.BEDWARS_ITEM_SHOP = 5
v2[5] = "BEDWARS_ITEM_SHOP"
v3.LOCKER = 6
v2[6] = "LOCKER"
v3.MISSIONS = 7
v2[7] = "MISSIONS"
v3.BATTLEPASS = 8
v2[8] = "BATTLEPASS"
v3.TAB_LIST = 9
v2[9] = "TAB_LIST"
v3.CUSTOM_MATCHES = 10
v2[10] = "CUSTOM_MATCHES"
v3.FLAMETHROWER_UPGRADES = 11
v2[11] = "FLAMETHROWER_UPGRADES"
v3.GIFTING = 12
v2[12] = "GIFTING"
v3.GIFTED = 13
v2[13] = "GIFTED"
v3.SOCIAL_CONNECTIONS = 14
v2[14] = "SOCIAL_CONNECTIONS"
v3.GAME_UPDATES = 15
v2[15] = "GAME_UPDATES"
v3.RANKED_PAID_RESTRICTION = 16
v2[16] = "RANKED_PAID_RESTRICTION"
v3.CUSTOM_MATCH_HOST_PANEL = 17
v2[17] = "CUSTOM_MATCH_HOST_PANEL"
local u4 = {
    ["scaleComponentValue"] = 0,
    ["shownApp"] = v3.NONE,
    ["showHotbarPartyControls"] = not v1.isGameServer()
}
return {
    ["AppReducer"] = function(p5, p6) --[[ Name: AppReducer, Line 52 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        if p5 == nil then
            p5 = u4
        end
        if p6.type == "SetShownApp" then
            local v7 = {}
            for v8, v9 in p5 do
                v7[v8] = v9
            end
            v7.shownApp = p6.app
            return v7
        end
        if p6.type == "SetShowHotbarPartyControls" then
            local v10 = {}
            for v11, v12 in p5 do
                v10[v11] = v12
            end
            v10.showHotbarPartyControls = p6.value
            return v10
        end
        if p6.type ~= "SetScaleComponentValue" then
            return p5
        end
        local v13 = {}
        for v14, v15 in p5 do
            v13[v14] = v15
        end
        v13.scaleComponentValue = p6.scale
        return v13
    end,
    ["App"] = v3
}