local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "robux-store", "new-player-bundle-config").NewPlayerBundleConfig
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "robux-daily-store", "robux-daily-store-items").getDailyStoreItemMetadata
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ui", "ui-alert").UIAlert
local u18 = v1.import(script, script.Parent, "ui", "new-player-bundle-util-client").NewPlayerBundleClientUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "RobuxStoreController"
    end,
    ["__index"] = u10
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p22)
    p22.Name = "RobuxStoreController"
    p22.dailyStorePurchaseHistoryRequseted = false
    p22.dailyStoreItemsRequested = false
end
function u19.KnitStart(u23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u9
        [3] = u17
        [4] = u13
        [5] = u11
        [6] = u8
        [7] = u14
    --]]
    u10.KnitStart(u23)
    u9.NewUIAlert:connect(function(p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u23
        --]]
        if p24.uiAlert == u17.NEW_PLAYER_BUNDLE and p24.data.alerts > 0 then
            task.delay(5, function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:attemptNewPlayerBundlePopup()
            end)
        end
    end)
    u13.Client:Get("SendNewPlayerBundleData"):Connect(function(p25, p26) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u14
        --]]
        local v27 = {
            ["type"] = "LobbySetNewPlayerBundleData",
            ["newPlayerBundleData"] = {
                ["firstJoinTime"] = p25,
                ["purchased"] = p26
            }
        }
        u11:dispatch(v27)
        u8.LocalPlayer:SetAttribute("NewPlayerStatusExpireTime", p25 + u14.NEW_PLAYER_TIME)
    end)
    u13.Client:Get("DailyStoreSendPurchaseUpdate"):Connect(function(p28) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:dispatch({
            ["type"] = "RobuxStoreAddDailyPurchaseHistory",
            ["item"] = p28
        })
    end)
    u13.Client:Get("DailyStoreSendItemsUpdate"):Connect(function(p29) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:dispatch({
            ["type"] = "RobuxStoreSetDailyItems",
            ["items"] = p29
        })
    end)
    u9.DailyReset:connect(function() --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u11
        --]]
        u11:dispatch({
            ["type"] = "RobuxStoreSetDailyPurchaseHistory",
            ["dailyPurchaseHistory"] = {}
        })
    end)
end
function u19.openRobuxStoreUI(_) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u12
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.STORE_MENU_APP, {
        ["AppId"] = u12.STORE_MENU_APP
    })
end
function u19.getNewPlayerBundleData(_) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11:getState().Lobby.robuxStore.newPlayerBundleData
end
function u19.requestDailyStorePurchaseHistory(p30) --[[ Line: 88 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    if p30.dailyStorePurchaseHistoryRequseted then
        return u11:getState().Lobby.robuxStore.dailyPurchaseHistory
    end
    local v31 = u13.Client:Get("DailyStoreRequestPurchaseHistory"):CallServer()
    u11:dispatch({
        ["type"] = "RobuxStoreSetDailyPurchaseHistory",
        ["dailyPurchaseHistory"] = v31
    })
    p30.dailyStorePurchaseHistoryRequseted = true
    return v31
end
function u19.requestDailyStoreItems(p32) --[[ Line: 100 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    if p32.dailyStoreItemsRequested then
        return u11:getState().Lobby.robuxStore.dailyStoreItems
    end
    local v33 = u13.Client:Get("DailyStoreRequestItems"):CallServer()
    u11:dispatch({
        ["type"] = "RobuxStoreSetDailyItems",
        ["items"] = v33
    })
    p32.dailyStoreItemsRequested = true
    return v33
end
function u19.purchaseDailyStoreItem(_, u34, p35) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u3
        [4] = u15
        [5] = u7
    --]]
    local v36 = u13.Client:Get("DailyStoreRequestPurchase"):CallServerAsync(u34, p35)
    v36:andThen(function(p37) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u34
            [3] = u3
            [4] = u15
            [5] = u7
        --]]
        if p37.success then
            if u16(u34).freeItem then
                u3:playSound(u15.BEDWARS_UPGRADE_SUCCESS)
                return
            end
        else
            u7.Info(p37.error)
        end
    end)
    return v36
end
function u19.requestDailyStoreRefresh(_) --[[ Line: 127 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.Controllers.BedCoinProductPurchaseController:purchase({
        ["productId"] = 64
    })
end
function u19.attemptNewPlayerBundlePopup(p38) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u17
        [3] = u18
        [4] = u5
    --]]
    local v39 = u11:getState().GameUpdates.uiAlerts
    if v39 ~= nil then
        v39 = v39[u17.NEW_PLAYER_BUNDLE]
    end
    if u18.shouldShowNewPlayerBundle() and (v39 and v39.alerts > 0) then
        p38:openRobuxStoreUI()
        u5.Controllers.UiAlertController:confirmUIAlert(u17.NEW_PLAYER_BUNDLE)
    end
end
u5.CreateController(u19.new())
return nil