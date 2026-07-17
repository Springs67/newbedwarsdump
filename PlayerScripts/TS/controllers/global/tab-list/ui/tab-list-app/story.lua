-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanPrivacySetting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local ClanUpgradeTier = v3.ClanUpgradeTier;
local ClanUpgradeType = v3.ClanUpgradeType;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local TabList = RuntimeLib.import(script, script.Parent, "tab-list").TabList;

return function(p4) -- Line: 20
    -- upvalues: OfflinePlayerUtil (copy), BedwarsKit (copy), ColorUtil (copy), TeamColorHex (copy), ClientStore (copy), u1 (copy), ClanMemberRank (copy), ClanUtil (copy), ClanPrivacySetting (copy), ClanWarUtils (copy), ClanUpgradeType (copy), ClanUpgradeTier (copy), BedwarsImageId (copy), CreateRoduxApp (copy), TabList (copy), u2 (copy)
    local v5 = {
        [OfflinePlayerUtil.Dummy.SnickTrix.userId] = BedwarsKit.ARCHER,
        [OfflinePlayerUtil.Dummy.oiogy.userId] = BedwarsKit.BAKER,
        [OfflinePlayerUtil.Dummy.Bryan3838.userId] = BedwarsKit.BARBARIAN,
        [OfflinePlayerUtil.Dummy.spleenhook.userId] = BedwarsKit.BIGMAN,
        [OfflinePlayerUtil.Dummy.Asen.userId] = BedwarsKit.FARMER_CLETUS,
        [OfflinePlayerUtil.Dummy.Vorlias.userId] = BedwarsKit.SHIELDER,
        [OfflinePlayerUtil.Dummy.Rascal.userId] = BedwarsKit.COWGIRL
    };
    ClientStore:dispatch({
        type = "GameSetTeams",
        teams = {
            {
                id = "2",
                name = "Pink",
                members = {
                    [OfflinePlayerUtil.Dummy.SnickTrix.userId] = OfflinePlayerUtil.Dummy.SnickTrix,
                    [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                    [OfflinePlayerUtil.Dummy.Vorlias.userId] = OfflinePlayerUtil.Dummy.Vorlias,
                    [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal
                },
                color = ColorUtil.hexColor(TeamColorHex.pink)
            },
            {
                id = "1",
                name = "Orange",
                members = {
                    [OfflinePlayerUtil.Dummy.LongNameMan.userId] = OfflinePlayerUtil.Dummy.LongNameMan,
                    [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
                },
                color = ColorUtil.hexColor(TeamColorHex.orange)
            },
            {
                id = "3",
                name = "Blue",
                members = {
                    [OfflinePlayerUtil.Dummy.spleenhook.userId] = OfflinePlayerUtil.Dummy.spleenhook,
                    [OfflinePlayerUtil.Dummy.Midciel.userId] = OfflinePlayerUtil.Dummy.Midciel
                },
                color = ColorUtil.hexColor(TeamColorHex.lightBlue)
            },
            {
                id = "4",
                name = "Yellow",
                members = {
                    [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                    [OfflinePlayerUtil.Dummy.SteamPulse.userId] = OfflinePlayerUtil.Dummy.SteamPulse,
                    [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838
                },
                color = ColorUtil.hexColor(TeamColorHex.yellow)
            },
            {
                id = "5",
                name = "Black",
                members = {
                    [OfflinePlayerUtil.Dummy.Candelz.userId] = OfflinePlayerUtil.Dummy.Candelz,
                    [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
                },
                color = ColorUtil.hexColor(TeamColorHex.black)
            },
            {
                id = "6",
                name = "White",
                members = {
                    [OfflinePlayerUtil.Dummy.leoduquartier.userId] = OfflinePlayerUtil.Dummy.leoduquartier,
                    [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal
                },
                color = ColorUtil.hexColor(TeamColorHex.white)
            }
        }
    });
    local v6 = u1.entries(OfflinePlayerUtil.Dummy);

    local function v9(p7) -- Line: 96
        -- upvalues: ClientStore (ref)
        local _ = p7[1];
        local v8 = p7[2];
        ClientStore:dispatch({
            type = "BedwarsSetKills",
            kills = 420,
            userId = v8.userId
        });
        ClientStore:dispatch({
            type = "BedwarsSetBedBreaks",
            userId = v8.userId
        });

        return 0;
    end;

    local v10 = table.create(#v6);

    for i, v in v6 do
        v10[i] = v9(v, i - 1, v6);
    end;

    local function _(p11, p12) -- Line: 118
        local _ = p11[1];
        local _ = p11[2];

        return p12 < 0;
    end;

    local v13 = 0;
    local v14 = {};

    for i, v in u1.entries(OfflinePlayerUtil.Dummy) do
        local _ = v[1];
        local _ = v[2];

        if i - 1 < 0 == true then
            v13 = v13 + 1;
            v14[v13] = v;
        end;
    end;

    local function v17(p15) -- Line: 136
        -- upvalues: ClientStore (ref)
        local _ = p15[1];
        local v16 = p15[2];
        ClientStore:dispatch({
            type = "BedwarsSetKills",
            kills = 420,
            userId = v16.userId
        });
        ClientStore:dispatch({
            type = "BedwarsSetFinalDeaths",
            dead = true,
            userId = v16.userId
        });

        return 0;
    end;

    local v18 = table.create(#v14);

    for i, v in v14 do
        v18[i] = v17(v, i - 1, v14);
    end;

    local v19 = u1.entries(v5);

    local function _(p20) -- Line: 158
        -- upvalues: ClientStore (ref)
        ClientStore:dispatch({
            type = "BedwarsSetKits",
            userId = p20[1],
            kit = p20[2]
        });

        return 0;
    end;

    local v21 = table.create(#v19);

    for i, v in v19 do
        local _ = i - 1;
        ClientStore:dispatch({
            type = "BedwarsSetKits",
            userId = v[1],
            kit = v[2]
        });
        v21[i] = 0;
    end;

    local v22 = {
        contribution = 2346,
        dateJoined = 100,
        offlinePlayer = {
            name = "oiogy",
            displayName = "Sprux",
            userId = OfflinePlayerUtil.Dummy.oiogy.userId
        },
        rank = ClanMemberRank.LEADER
    };
    local v23 = {
        contribution = 345,
        dateJoined = 100,
        offlinePlayer = {
            name = OfflinePlayerUtil.Dummy.SnickTrix.name,
            userId = OfflinePlayerUtil.Dummy.SnickTrix.userId,
            displayName = OfflinePlayerUtil.Dummy.SnickTrix.displayName
        },
        rank = ClanMemberRank.ADMIN
    };
    local v24 = {
        contribution = 2346,
        dateJoined = 100,
        offlinePlayer = {
            name = OfflinePlayerUtil.Dummy.Chase.name,
            userId = OfflinePlayerUtil.Dummy.Chase.userId,
            displayName = OfflinePlayerUtil.Dummy.Chase.displayName
        },
        rank = ClanMemberRank.MEMBER
    };
    ClientStore:dispatch({
        type = "ClanUpdate",
        myClanId = "123",
        myClan = {
            id = "123",
            name = "Doms Clan",
            tag = "Dom",
            image = "",
            announcement = "Cap daily or else >:(",
            introduction = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m",
            level = 4,
            coins = 100,
            totalCoinsEarned = 100,
            maxMembers = 10,
            dateCreated = 100,
            isAddedToClanService = false,
            isAddedToClanService2 = true,
            clanContribution = {
                totalXPEarned = 0,
                id = ClanUtil.getContributionDayId(),
                dailyClanContribution = {},
                dailyMemberContributions = {}
            },
            leader = v22,
            invites = {
                outgoing = {}
            },
            privacySetting = ClanPrivacySetting.ANYONE_CAN_JOIN,
            members = {
                ["123"] = v22,
                ["1"] = v23,
                ["12"] = v23,
                ["13"] = v23,
                ["14"] = v24,
                ["15"] = v24,
                ["16"] = v24,
                ["17"] = v24,
                ["18"] = v24,
                ["19"] = v24,
                ["20"] = v24
            },
            clanWar = {
                allTimeStats = ClanWarUtils.createStarterClanWarStats(),
                wars = {},
                medals = {}
            },
            upgrades = {
                [ClanUpgradeType.CLAN_LEVEL] = ClanUpgradeTier.CLAN_LEVEL5
            },
            kitShop = {
                stock = 1,
                id = ClanUtil.getWeekId(),
                kits = { BedwarsKit.BARBARIAN, BedwarsKit.BIGMAN, BedwarsKit.DASHER },
                unlocks = {
                    [BedwarsKit.AERY] = {
                        purchaseTime = 1645663458,
                        endTime = 1646981858,
                        duration = 518400,
                        kit = BedwarsKit.AERY
                    }
                }
            },
            flags = {},
            placeAuctionBids = {},
            rewardedAuctionItems = {}
        },
        me = v23
    });
    ClientStore:dispatch({
        type = "GameAddMatchEvent",
        matchEvent = {
            id = "titan_boss",
            name = "TITAN BOSS",
            image = BedwarsImageId.THREE_TITANS_ICON,
            time = os.time() + 600,
            isOnTopHud = {
                shouldDisplay = false
            }
        }
    });
    ClientStore:dispatch({
        type = "GameAddMatchEvent",
        matchEvent = {
            id = "diamond_guards",
            name = "DIAMOND GUARDS",
            image = BedwarsImageId.DIAMOND,
            time = os.time() + 60,
            isOnTopHud = {
                shouldDisplay = false
            }
        }
    });
    ClientStore:dispatch({
        type = "GameAddMatchEvent",
        matchEvent = {
            id = "void_invasion",
            image = "rbxassetid://137680717472661",
            name = "Void Invasion",
            time = os.time() + 30,
            isOnTopHud = {
                shouldDisplay = false
            }
        }
    });
    local u25 = CreateRoduxApp("TabList", TabList, {}, {}, {
        Parent = p4
    });

    return function() -- Line: 313
        -- upvalues: u2 (ref), u25 (copy)
        u2.unmount(u25);
    end;
end;