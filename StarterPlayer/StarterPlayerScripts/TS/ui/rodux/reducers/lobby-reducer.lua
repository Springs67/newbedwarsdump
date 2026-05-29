local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u4 = {
    ["currentlyViewingProfileData"] = nil,
    ["profileData"] = nil,
    ["pendingMapRatings"] = {},
    ["mapBrowserProfileData"] = {
        ["ratings"] = {},
        ["joinedMaps"] = {}
    },
    ["kitStatsProfiles"] = {},
    ["kitContractProfiles"] = {},
    ["missionsData"] = {
        ["progress"] = {},
        ["stages"] = {}
    },
    ["clanWarMissionsData"] = {},
    ["checkInData"] = {},
    ["rewardsToDisplay"] = {},
    ["achievements"] = {},
    ["robuxStore"] = {
        ["dailyStoreItems"] = {},
        ["dailyPurchaseHistory"] = {}
    },
    ["kitShop"] = {
        ["CanvasPositionY"] = nil,
        ["FavoritedToggle"] = nil,
        ["KitClassFilter"] = nil,
        ["OwnedFilter"] = nil,
        ["SearchText"] = nil
    },
    ["ownedUGC"] = {}
}
return {
    ["LobbyReducer"] = function(p5, p6) --[[ Name: LobbyReducer, Line 36 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u3
        --]]
        if p5 == nil then
            p5 = u4
        end
        if p6.type == "LobbySetOwnedUGC" then
            local v7 = {}
            for v8, v9 in p5 do
                v7[v8] = v9
            end
            v7.ownedUGC = p6.ugc
            return v7
        end
        if p6.type == "LobbyAddOwnedUGC" then
            local v10 = p5.ownedUGC
            local v11 = p6.ugc
            table.insert(v10, v11)
            local v12 = {}
            for v13, v14 in p5 do
                v12[v13] = v14
            end
            return v12
        end
        if p6.type == "RobuxStoreSetDailyItems" then
            local v15 = {}
            for v16, v17 in p5 do
                v15[v16] = v17
            end
            local v18 = {}
            for v19, v20 in p5.robuxStore do
                v18[v19] = v20
            end
            local v21 = {}
            local v22 = #v21
            local v23 = p6.items
            table.move(v23, 1, #v23, v22 + 1, v21)
            v18.dailyStoreItems = v21
            v15.robuxStore = v18
            return v15
        end
        if p6.type == "RobuxStoreAddDailyPurchaseHistory" then
            local v24 = {}
            for v25, v26 in p5 do
                v24[v25] = v26
            end
            local v27 = {}
            for v28, v29 in p5.robuxStore do
                v27[v28] = v29
            end
            local v30 = {}
            local v31 = #v30
            local v32 = p5.robuxStore.dailyPurchaseHistory
            local v33 = #v32
            table.move(v32, 1, v33, v31 + 1, v30)
            v30[v31 + v33 + 1] = p6.item
            v27.dailyPurchaseHistory = v30
            v24.robuxStore = v27
            return v24
        end
        if p6.type == "RobuxStoreSetDailyPurchaseHistory" then
            local v34 = {}
            for v35, v36 in p5 do
                v34[v35] = v36
            end
            local v37 = {}
            for v38, v39 in p5.robuxStore do
                v37[v38] = v39
            end
            local v40 = {}
            local v41 = #v40
            local v42 = p6.dailyPurchaseHistory
            table.move(v42, 1, #v42, v41 + 1, v40)
            v37.dailyPurchaseHistory = v40
            v34.robuxStore = v37
            return v34
        end
        if p6.type == "LobbySetNewPlayerBundleData" then
            p5.robuxStore.newPlayerBundleData = p6.newPlayerBundleData
            return p5
        end
        if p6.type == "LobbySetCheckInData" then
            p5.checkInData[p6.system] = p6.data
            return p5
        end
        if p6.type == "LobbyRecordCheckIn" then
            local v43 = u2.getOrCreate(p5.checkInData, p6.system, {
                ["checkIns"] = {}
            }).checkIns
            local v44 = {
                ["time"] = u3:GetServerTimeNow()
            }
            table.insert(v43, v44)
            return p5
        end
        if p6.type == "LobbySetMapRating" then
            p5.pendingMapRatings[p6.rating.mapId] = p6.rating.rating
            return p5
        end
        if p6.type == "LobbyClearPendingMapData" then
            table.clear(p5.pendingMapRatings)
            return p5
        end
        if p6.type == "LobbySetMapBrowserProfileData" then
            p5.mapBrowserProfileData = p6.mapBrowserProfileData
            return p5
        end
        if p6.type == "LobbyUpdateAllKitStatsProfiles" then
            local v45 = {}
            for v46, v47 in p5 do
                v45[v46] = v47
            end
            v45.kitStatsProfiles = p6.kitStatsProfiles
            return v45
        end
        if p6.type == "LobbySetKitContractProfile" then
            p5.kitContractProfiles[p6.kit] = p6.kitContractProfile
            return p5
        end
        if p6.type == "LobbySetKitStatsProfile" then
            p5.kitStatsProfiles[p6.kit] = p6.kitStatsProfile
            return p5
        end
        if p6.type == "LobbySetMissionsData" then
            p5.missionsData = p6.missionsData
            return p5
        end
        if p6.type == "LobbySetClanWarMissionsData" then
            p5.clanWarMissionsData = p6.clanWarMissionsData
            return p5
        end
        if p6.type == "LobbySetCurrentlyViewingProfileData" then
            p5.currentlyViewingProfileData = p6.profileData
            return p5
        end
        if p6.type == "LobbySetProfileData" then
            p5.profileData = p6.profileData
            return p5
        end
        if p6.type == "LobbyClaimAchievementRewards" then
            local v48 = p5.profileData
            if v48 ~= nil then
                v48 = v48.achievements[p6.id]
            end
            if v48 then
                v48.rewardsClaimed = true
            end
            return p5
        end
        if p6.type == "LobbyAddRewardsToDisplay" then
            for v49, v50 in p6.rewards do
                local _ = v49 - 1
                local v51 = p5.rewardsToDisplay
                table.insert(v51, v50)
            end
            local v52 = {}
            for v53, v54 in p5 do
                v52[v53] = v54
            end
            local v55 = {}
            local v56 = #v55
            local v57 = p5.rewardsToDisplay
            table.move(v57, 1, #v57, v56 + 1, v55)
            v52.rewardsToDisplay = v55
            return v52
        end
        if p6.type ~= "LobbyRemoveRewardToDisplay" then
            if p6.type == "LobbySetAchievements" then
                p5.achievements = p6.achievements
            elseif p6.type == "LobbySetKitShopFilters" then
                p5.kitShop = p6.kitShop
                return p5
            end
            return p5
        end
        local v58 = -1
        for v59, v60 in p5.rewardsToDisplay do
            local _ = v59 - 1
            if v60 == p6.reward == true then
                v58 = v59 - 1
                break
            end
        end
        if v58 ~= -1 then
            table.remove(p5.rewardsToDisplay, v58 + 1)
        end
        if not p6.rerender then
            local v61 = {}
            for v62, v63 in p5 do
                v61[v62] = v63
            end
            return v61
        end
        local v64 = {}
        for v65, v66 in p5 do
            v64[v65] = v66
        end
        local v67 = {}
        local v68 = #v67
        local v69 = p5.rewardsToDisplay
        table.move(v69, 1, #v69, v68 + 1, v67)
        v64.rewardsToDisplay = v67
        return v64
    end
}