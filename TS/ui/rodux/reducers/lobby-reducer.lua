-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local u1 = {
    currentlyViewingProfileData = nil,
    profileData = nil,
    pendingMapRatings = {},
    mapBrowserProfileData = {
        ratings = {},
        joinedMaps = {}
    },
    kitStatsProfiles = {},
    kitContractProfiles = {},
    missionsData = {
        progress = {},
        stages = {}
    },
    clanWarMissionsData = {},
    checkInData = {},
    rewardsToDisplay = {},
    achievements = {},
    robuxStore = {
        dailyStoreItems = {},
        dailyPurchaseHistory = {}
    },
    kitShop = {
        CanvasPositionY = nil,
        FavoritedToggle = nil,
        KitClassFilter = nil,
        OwnedFilter = nil,
        SearchText = nil
    },
    ownedUGC = {}
};

return {
    LobbyReducer = function(u2, u3) -- Line: 36, Name: LobbyReducer
        -- upvalues: u1 (copy), MapUtil (copy), Workspace (copy)
        if u2 == nil then
            u2 = u1;
        end;

        if u3.type == "LobbySetOwnedUGC" then
            local v4 = {};

            for i, v in u2 do
                v4[i] = v;
            end;

            v4.ownedUGC = u3.ugc;

            return v4;
        end;

        if u3.type == "LobbyAddOwnedUGC" then
            table.insert(u2.ownedUGC, u3.ugc);
            local v5 = {};

            for i, v in u2 do
                v5[i] = v;
            end;

            return v5;
        end;

        if u3.type == "RobuxStoreSetDailyItems" then
            local v6 = {};

            for i, v in u2 do
                v6[i] = v;
            end;

            local v7 = {};

            for i, v in u2.robuxStore do
                v7[i] = v;
            end;

            local v8 = {};
            local items = u3.items;
            table.move(items, 1, #items, #v8 + 1, v8);
            v7.dailyStoreItems = v8;
            v6.robuxStore = v7;

            return v6;
        end;

        if u3.type == "RobuxStoreAddDailyPurchaseHistory" then
            local v9 = {};

            for i, v in u2 do
                v9[i] = v;
            end;

            local v10 = {};

            for i, v in u2.robuxStore do
                v10[i] = v;
            end;

            local v11 = {};
            local v12 = #v11;
            local dailyPurchaseHistory = u2.robuxStore.dailyPurchaseHistory;
            local v13 = #dailyPurchaseHistory;
            table.move(dailyPurchaseHistory, 1, v13, v12 + 1, v11);
            v11[v12 + v13 + 1] = u3.item;
            v10.dailyPurchaseHistory = v11;
            v9.robuxStore = v10;

            return v9;
        end;

        if u3.type == "RobuxStoreSetDailyPurchaseHistory" then
            local v14 = {};

            for i, v in u2 do
                v14[i] = v;
            end;

            local v15 = {};

            for i, v in u2.robuxStore do
                v15[i] = v;
            end;

            local v16 = {};
            local dailyPurchaseHistory = u3.dailyPurchaseHistory;
            table.move(dailyPurchaseHistory, 1, #dailyPurchaseHistory, #v16 + 1, v16);
            v15.dailyPurchaseHistory = v16;
            v14.robuxStore = v15;

            return v14;
        end;

        if u3.type == "LobbySetNewPlayerBundleData" then
            u2.robuxStore.newPlayerBundleData = u3.newPlayerBundleData;

            return u2;
        end;

        if u3.type == "LobbySetCheckInData" then
            u2.checkInData[u3.system] = u3.data;

            return u2;
        end;

        if u3.type == "LobbyRecordCheckIn" then
            local checkIns = MapUtil.getOrCreate(u2.checkInData, u3.system, {
                checkIns = {}
            }).checkIns;
            local v17 = {
                time = Workspace:GetServerTimeNow()
            };
            table.insert(checkIns, v17);

            return u2;
        end;

        if u3.type == "LobbySetMapRating" then
            u2.pendingMapRatings[u3.rating.mapId] = u3.rating.rating;

            return u2;
        end;

        if u3.type == "LobbyClearPendingMapData" then
            table.clear(u2.pendingMapRatings);

            return u2;
        end;

        if u3.type == "LobbySetMapBrowserProfileData" then
            u2.mapBrowserProfileData = u3.mapBrowserProfileData;

            return u2;
        end;

        if u3.type == "LobbyUpdateAllKitStatsProfiles" then
            local v18 = {};

            for i, v in u2 do
                v18[i] = v;
            end;

            v18.kitStatsProfiles = u3.kitStatsProfiles;

            return v18;
        end;

        if u3.type == "LobbySetKitContractProfile" then
            u2.kitContractProfiles[u3.kit] = u3.kitContractProfile;

            return u2;
        end;

        if u3.type == "LobbySetKitStatsProfile" then
            u2.kitStatsProfiles[u3.kit] = u3.kitStatsProfile;

            return u2;
        end;

        if u3.type == "LobbySetMissionsData" then
            u2.missionsData = u3.missionsData;

            return u2;
        end;

        if u3.type == "LobbySetClanWarMissionsData" then
            u2.clanWarMissionsData = u3.clanWarMissionsData;

            return u2;
        end;

        if u3.type == "LobbySetCurrentlyViewingProfileData" then
            u2.currentlyViewingProfileData = u3.profileData;

            return u2;
        end;

        if u3.type == "LobbySetProfileData" then
            u2.profileData = u3.profileData;

            return u2;
        end;

        if u3.type == "LobbyClaimAchievementRewards" then
            local profileData = u2.profileData;

            if profileData ~= nil then
                profileData = profileData.achievements[u3.id];
            end;

            if profileData then
                profileData.rewardsClaimed = true;
            end;

            return u2;
        end;

        if u3.type == "LobbyAddRewardsToDisplay" then
            local function _(p19) -- Line: 189
                -- upvalues: u2 (ref)
                table.insert(u2.rewardsToDisplay, p19);
            end;

            for i, v in u3.rewards do
                local _ = i - 1;
                table.insert(u2.rewardsToDisplay, v);
            end;

            local v20 = {};

            for i, v in u2 do
                v20[i] = v;
            end;

            local v21 = {};
            local rewardsToDisplay = u2.rewardsToDisplay;
            table.move(rewardsToDisplay, 1, #rewardsToDisplay, #v21 + 1, v21);
            v20.rewardsToDisplay = v21;

            return v20;
        end;

        if u3.type ~= "LobbyRemoveRewardToDisplay" then
            if u3.type == "LobbySetAchievements" then
                u2.achievements = u3.achievements;
            elseif u3.type == "LobbySetKitShopFilters" then
                u2.kitShop = u3.kitShop;

                return u2;
            end;

            return u2;
        end;

        local function _(p22) -- Line: 210
            -- upvalues: u3 (copy)
            return p22 == u3.reward;
        end;

        local v23 = -1;

        for i, v in u2.rewardsToDisplay do
            local _ = i - 1;

            if v == u3.reward == true then
                v23 = i - 1;
                break;
            end;
        end;

        if v23 ~= -1 then
            table.remove(u2.rewardsToDisplay, v23 + 1);
        end;

        if not u3.rerender then
            local v24 = {};

            for i, v in u2 do
                v24[i] = v;
            end;

            return v24;
        end;

        local v25 = {};

        for i, v in u2 do
            v25[i] = v;
        end;

        local v26 = {};
        local rewardsToDisplay = u2.rewardsToDisplay;
        table.move(rewardsToDisplay, 1, #rewardsToDisplay, #v26 + 1, v26);
        v25.rewardsToDisplay = v26;

        return v25;
    end
};