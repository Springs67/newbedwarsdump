local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, script.Parent.Parent.Parent, "map", "published-maps", "rate-map-modal").RateMapModal
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-constants").MapBrowser
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 14 ]]
        return "CustomMapBrowserController"
    end,
    ["__index"] = u5
})
u9.__index = u9
function u9.new(...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u8
    --]]
    u5.constructor(p12)
    p12.Name = "CustomMapBrowserController"
    p12.remotes = u8.Client:GetNamespace("CustomMapBrowser")
end
function u9.KnitStart(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u4
    --]]
    u5.KnitStart(p13)
    p13.remotes:Get("ClearBatchData"):Connect(function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local v14 = u6:getState().Lobby
        local v15 = u6
        local v16 = {
            ["joinedMaps"] = v14.mapBrowserProfileData.joinedMaps
        }
        local v17 = {}
        local v18 = #v17
        local v19 = {
            ["type"] = "LobbySetMapBrowserProfileData"
        }
        for v20, v21 in v14.mapBrowserProfileData.ratings do
            v18 = v18 + 1
            v17[v18] = { v20, v21 }
        end
        for v22, v23 in v14.pendingMapRatings do
            v18 = v18 + 1
            v17[v18] = { v22, v23 }
        end
        local v24 = {}
        for _, v25 in v17 do
            v24[v25[1]] = v25[2]
        end
        v16.ratings = v24
        v19.mapBrowserProfileData = v16
        v15:dispatch(v19)
        u6:dispatch({
            ["type"] = "LobbyClearPendingMapData"
        })
    end)
    p13.remotes:Get("DisplayRateMapPopup"):Connect(function(p26) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        if u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):isAppOpen("RateMapModal") then
            return nil
        end
        local v27 = {
            ["appId"] = "RateMapModal",
            ["app"] = u4
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v27, {
            ["AppId"] = "RateMapModal",
            ["mapData"] = p26
        })
    end)
end
function u9.getExistingLocalRatings(p28) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    if p28.existingMapData then
        return p28.existingMapData
    end
    p28.existingMapData = p28.remotes:Get("GetMyMapBrowserData"):CallServer()
    u6:dispatch({
        ["type"] = "LobbySetMapBrowserProfileData",
        ["mapBrowserProfileData"] = p28.existingMapData
    })
    return p28.existingMapData
end
function u9.getPublishedMapCount(p29) --[[ Line: 89 ]]
    return p29.remotes:Get("MapBrowserGetPublishedCount"):CallServerAsync()
end
function u9.getFeaturedList(p30) --[[ Line: 92 ]]
    return p30.remotes:Get("MapBrowserGetFeaturedList"):CallServerAsync(8)
end
function u9.searchMap(p31, p32) --[[ Line: 95 ]]
    return p31.remotes:Get("MapBrowserSearchMap"):CallServerAsync(p32)
end
function u9.publishMap(p33, p34, p35) --[[ Line: 98 ]]
    return p33.remotes:Get("MapBrowserPublishMap"):CallServerAsync(p34, p35)
end
function u9.updateMapMetadata(p36, p37, p38) --[[ Line: 101 ]]
    p36.remotes:Get("MapBrowserUpdateMap"):SendToServer({
        ["mapId"] = p37,
        ["patchDto"] = p38
    })
end
function u9.userRateMap(p39, p40) --[[ Line: 107 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u6
    --]]
    if u7.MAP_RATING_DISABLED then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "Rating a map is temporarily disabled. Check back soon!"
        })
        return {
            ["success"] = false,
            ["errorMessage"] = "Rating a map is temporarily disabled. Check back soon!"
        }
    end
    if u6:getState().Lobby.mapBrowserProfileData.joinedMaps[p40.mapId] == nil then
        return {
            ["success"] = false,
            ["errorMessage"] = "You must play the map before rating it."
        }
    end
    u6:dispatch({
        ["type"] = "LobbySetMapRating",
        ["rating"] = p40
    })
    p39.remotes:Get("MapBrowserRateMap"):SendToServer(p40)
    return {
        ["success"] = true
    }
end
v3.CreateController(u9.new())
return nil