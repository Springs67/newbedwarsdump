-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local BedTeamUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-team-upgrade", "bed-team-upgrade-type").BedTeamUpgrade;
local TeamUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade;
local v2 = u1.keys(TeamUpgrade);

local function _(p3) -- Line: 19
    return { p3, 0 };
end;

local v4 = table.create(#v2);
local u5 = {
    kills = {},
    bedBreaks = {},
    finalDeaths = {},
    kits = {},
    othersUsingKitSkin = {},
    teamBedStatus = {},
    itemTiersPurchased = {}
};

for i, v in v2 do
    local _ = i - 1;
    v4[i] = { v, 0 };
end;

local v6 = {};

for _, v in v4 do
    v6[v[1]] = v[2];
end;

u5.myTeamUpgrades = v6;
u5.teamUpgrades = {};
u5.kit = nil;
u5.weapon = nil;
u5.equippedKitSkins = nil;
u5.ownedKits = {};
u5.ownedKitSkins = {};
u5.useKitSkin = true;
u5.playerLevel = 0;
u5.playerLevelTotalExperience = 0;
u5.milestoneRewardsClaimed = {};
u5.freeKitLevel = 0;
u5.bedCoins = 0;
u5.favoriteKits = {};
local v7 = u1.keys(BedTeamUpgrade);

local function _(p8) -- Line: 48
    return { p8, false };
end;

local v9 = table.create(#v7);

for i, v in v7 do
    local _ = i - 1;
    v9[i] = { v, false };
end;

local v10 = {};

for _, v in v9 do
    v10[v[1]] = v[2];
end;

u5.myBedTeamUpgrades = v10;
u5.bedTeamUpgrades = {};
u5.bedHealth = {};
u5.bedPlatingHealth = {};

return {
    BedwarsReducer = function(p11, p12) -- Line: 66, Name: BedwarsReducer
        -- upvalues: u5 (copy), u1 (copy), BedPlatingUtil (copy), MapUtil (copy)
        if p11 == nil then
            p11 = u5;
        end;

        if p12.type == "BedwarsSetSome" then
            local v13 = {};

            for i, v in p11 do
                v13[i] = v;
            end;

            for i, v in p12.data do
                v13[i] = v;
            end;

            return v13;
        end;

        if p12.type == "BedwarsSetKills" then
            local v14 = {};

            for i, v in p11 do
                v14[i] = v;
            end;

            local v15 = {};

            for i, v in p11.kills do
                v15[i] = v;
            end;

            v15[p12.userId] = p12.kills;
            v14.kills = v15;

            return v14;
        end;

        if p12.type == "BedwarsIncrementKills" then
            local v16 = p11.kills[p12.userId];

            if v16 ~= 0 and (v16 == v16 and v16) then
                local kills = p11.kills;
                local userId = p12.userId;
                kills[userId] = kills[userId] + 1;

                return p11;
            end;

            local v17 = {};

            for i, v in p11 do
                v17[i] = v;
            end;

            local v18 = {};

            for i, v in p11.kills do
                v18[i] = v;
            end;

            v18[p12.userId] = 1;
            v17.kills = v18;

            return v17;
        end;

        if p12.type == "BedwarsSetBedBreaks" then
            local userId = p12.userId;

            if userId ~= 0 and (userId == userId and userId) then
                local v19 = p11.bedBreaks[p12.userId];

                if v19 ~= 0 and (v19 == v19 and v19) then
                    local bedBreaks = p11.bedBreaks;
                    local userId2 = p12.userId;
                    bedBreaks[userId2] = bedBreaks[userId2] + 1;
                    local v20 = {};

                    for i, v in p11 do
                        v20[i] = v;
                    end;

                    return v20;
                end;

                local v21 = {};

                for i, v in p11 do
                    v21[i] = v;
                end;

                local v22 = {};

                for i, v in p11.bedBreaks do
                    v22[i] = v;
                end;

                v22[p12.userId] = 1;
                v21.bedBreaks = v22;

                return v21;
            end;
        end;

        if p12.type == "BedwarsSetFinalDeaths" then
            local v23 = {};

            for i, v in p11 do
                v23[i] = v;
            end;

            local v24 = {};

            for i, v in p11.finalDeaths do
                v24[i] = v;
            end;

            v24[p12.userId] = p12.dead;
            v23.finalDeaths = v24;

            return v23;
        end;

        if p12.type == "BedwarsSetKits" then
            local v25 = {};

            for i, v in p11 do
                v25[i] = v;
            end;

            local v26 = {};

            for i, v in p11.kits do
                v26[i] = v;
            end;

            v26[p12.userId] = p12.kit;
            v25.kits = v26;

            return v25;
        end;

        if p12.type == "SetBedwarsWeapon" then
            local v27 = {};

            for i, v in p11 do
                v27[i] = v;
            end;

            v27.weapon = p12.weapon;

            return v27;
        end;

        if p12.type == "BedwarsSetTeamUpgrades" then
            local v28 = {};

            for i, v in p11 do
                v28[i] = v;
            end;

            local v29 = {};

            for i, v in p11.teamUpgrades do
                v29[i] = v;
            end;

            v29[p12.teamId] = p12.teamUpgrades;
            v28.teamUpgrades = v29;

            return v28;
        end;

        if p12.type == "SetMyTeamUpgrades" then
            local v30 = {};

            for i, v in p11 do
                v30[i] = v;
            end;

            v30.myTeamUpgrades = p12.myTeamUpgrades;

            return v30;
        end;

        if p12.type == "BedwarsSetBedTeamUpgrades" then
            local v31 = {};

            for i, v in p11 do
                v31[i] = v;
            end;

            local v32 = {};

            for i, v in p11.bedTeamUpgrades do
                v32[i] = v;
            end;

            v32[p12.teamId] = p12.bedTeamUpgrades;
            v31.bedTeamUpgrades = v32;

            return v31;
        end;

        if p12.type == "SetMyBedTeamUpgrades" then
            local v33 = {};

            for i, v in p11 do
                v33[i] = v;
            end;

            v33.myBedTeamUpgrades = p12.myBedTeamUpgrades;

            return v33;
        end;

        if p12.type == "SetBedHealth" then
            local v34 = {};

            for i, v in p11 do
                v34[i] = v;
            end;

            local v35 = {};

            for i, v in p11.bedHealth do
                v35[i] = v;
            end;

            v35[p12.teamId] = {
                health = p12.bedHealth,
                maxHealth = p12.maxBedHealth
            };
            v34.bedHealth = v35;

            return v34;
        end;

        if p12.type == "SetBedPlatingHealth" then
            local v36 = {};

            for i, v in p11 do
                v36[i] = v;
            end;

            local v37 = {};

            for i, v in p11.bedPlatingHealth do
                v37[i] = v;
            end;

            v37[p12.teamId] = {
                health = p12.platingHealth,
                maxHealth = p12.maxPlatingHealth
            };
            v36.bedPlatingHealth = v37;

            return v36;
        end;

        if p12.type == "BedwarsSetBedStatus" then
            local v38 = {};

            for i, v in p11 do
                v38[i] = v;
            end;

            local v39 = {};

            for i, v in p11.teamBedStatus do
                v39[i] = v;
            end;

            v39[p12.teamId] = p12.bedStatus;
            v38.teamBedStatus = v39;

            return v38;
        end;

        if p12.type == "BedwarsSetBedAliveSuddenDeath" then
            print("[BW Reducer]: Before", p11.teamBedStatus);
            local u40 = {};

            local function _(p41) -- Line: 272
                -- upvalues: u40 (copy), BedPlatingUtil (ref)
                u40[p41] = BedPlatingUtil.BedStatus.BED_BROKEN;

                return u40[p41];
            end;

            for i, v in u1.keys(p11.teamBedStatus) do
                local _ = i - 1;
                u40[v] = BedPlatingUtil.BedStatus.BED_BROKEN;
                local _ = u40[v];
            end;

            print("[BW Reducer]: After", p11.teamBedStatus);
            local v42 = {};

            for i, v in p11 do
                v42[i] = v;
            end;

            v42.teamBedStatus = u40;

            return v42;
        end;

        if p12.type == "BedwarsAddItemPurchased" then
            local v43 = {};

            for i, v in p11 do
                v43[i] = v;
            end;

            local v44 = {};
            local v45 = #v44;
            local itemTiersPurchased = p11.itemTiersPurchased;
            local v46 = #itemTiersPurchased;
            table.move(itemTiersPurchased, 1, v46, v45 + 1, v44);
            v44[v45 + v46 + 1] = p12.itemType;
            v43.itemTiersPurchased = v44;

            return v43;
        end;

        if p12.type == "BedwarsBulkAddItemPurchased" then
            local v47 = {};

            for i, v in p11 do
                v47[i] = v;
            end;

            local v48 = {};
            local v49 = #v48;
            local itemTiersPurchased = p11.itemTiersPurchased;
            local v50 = #itemTiersPurchased;
            table.move(itemTiersPurchased, 1, v50, v49 + 1, v48);
            local itemTypes = p12.itemTypes;
            table.move(itemTypes, 1, #itemTypes, v49 + v50 + 1, v48);
            v47.itemTiersPurchased = v48;

            return v47;
        end;

        if p12.type == "SetBedwarsKit" then
            local v51 = {};

            for i, v in p11 do
                v51[i] = v;
            end;

            v51.kit = p12.kit;

            return v51;
        end;

        if p12.type == "AddOwnedKits" then
            local v52 = {};

            for i, v in p11 do
                v52[i] = v;
            end;

            local v53 = {};
            local v54 = #v53;
            local ownedKits = p11.ownedKits;
            local v55 = #ownedKits;
            table.move(ownedKits, 1, v55, v54 + 1, v53);
            local kits = p12.kits;
            table.move(kits, 1, #kits, v54 + v55 + 1, v53);
            v52.ownedKits = v53;

            return v52;
        end;

        if p12.type == "SetOwnedKitSkins" then
            local v56 = {};

            for i, v in p11 do
                v56[i] = v;
            end;

            v56.ownedKitSkins = p12.ownedKitSkins;

            return v56;
        end;

        if p12.type == "SetUseKitSkin" then
            local v57 = {};

            for i, v in p11 do
                v57[i] = v;
            end;

            v57.useKitSkin = p12.useKitSkin;

            return v57;
        end;

        if p12.type == "SetEquippedKitSkins" then
            local v58 = {};

            for i, v in p11 do
                v58[i] = v;
            end;

            v58.equippedKitSkins = p12.equippedKitSkins;

            return v58;
        end;

        if p12.type == "EquipKitSkin" then
            local v59 = {};

            for i, v in p11 do
                v59[i] = v;
            end;

            local v60 = {};

            for i, v in p11.equippedKitSkins do
                v60[i] = v;
            end;

            v60[p12.kit] = p12.kitSkin;
            v59.equippedKitSkins = v60;

            return v59;
        end;

        if p12.type == "BedwarsUpdateBossBar" then
            local v61 = {};

            for i, v in p11 do
                v61[i] = v;
            end;

            local v62 = {
                health = p12.health
            };
            local maxHealth = p12.maxHealth;

            if maxHealth == nil then
                maxHealth = p11.bossBar;

                if maxHealth ~= nil then
                    maxHealth = maxHealth.maxHealth;
                end;
            end;

            v62.maxHealth = maxHealth;
            v61.bossBar = v62;

            return v61;
        end;

        if p12.type == "BedwarsSetPvPArenaAugmentSelection" then
            local v63 = {};

            for i, v in p11 do
                v63[i] = v;
            end;

            if not v63.pvpArena then
                v63.pvpArena = {};
            end;

            if not v63.pvpArena.userIdAugmentMap then
                v63.pvpArena.userIdAugmentMap = {};
            end;

            local v64 = MapUtil.getOrCreate(v63.pvpArena.userIdAugmentMap, p12.userId, {});
            table.insert(v64, p12.augment);

            return v63;
        end;

        if p12.type == "AddFavoriteKit" then
            local v65 = {};

            for i, v in p11 do
                v65[i] = v;
            end;

            local favoriteKits = p11.favoriteKits;
            favoriteKits[p12.kit] = true;
            v65.favoriteKits = favoriteKits;

            return v65;
        end;

        if p12.type == "RemoveFavoriteKit" then
            p11.favoriteKits[p12.kit] = nil;
            local v66 = {};

            for i, v in p11 do
                v66[i] = v;
            end;

            v66.favoriteKits = p11.favoriteKits;

            return v66;
        end;

        if p12.type == "BedwarsSetPregameVoteState" then
            local v67 = {};

            for i, v in p11 do
                v67[i] = v;
            end;

            if not v67.pregameVote then
                v67.pregameVote = {};
            end;

            v67.pregameVote.voteState = p12.voteState;

            return v67;
        end;

        if p12.type == "SetPregameVoteWon" then
            local v68 = {};

            for i, v in p11 do
                v68[i] = v;
            end;

            if not v68.pregameVote then
                v68.pregameVote = {};
            end;

            v68.pregameVote.winningVotingOption = p12.winningVotingOption;
            v68.pregameVote.winningVoterIndex = p12.winningVoterIndex;

            return v68;
        end;

        if p12.type ~= "BedwarsSetPregameVoteEndTime" then
            return p11;
        end;

        local v69 = {};

        for i, v in p11 do
            v69[i] = v;
        end;

        if not v69.pregameVote then
            v69.pregameVote = {};
        end;

        v69.pregameVote.pregameVoteEndTime = p12.voteEndTime;

        return v69;
    end
};