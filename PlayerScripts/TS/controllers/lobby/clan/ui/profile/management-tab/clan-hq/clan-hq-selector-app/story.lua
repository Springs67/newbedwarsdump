-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanPrivacySetting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types");
local ClanHqBackgroundMusicType = v2.ClanHqBackgroundMusicType;
local ClanHqSkyboxType = v2.ClanHqSkyboxType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local ClanUpgradeTier = v3.ClanUpgradeTier;
local ClanUpgradeType = v3.ClanUpgradeType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ClanHqSelectorApp = RuntimeLib.import(script, script.Parent, "clan-hq-selector-app").ClanHqSelectorApp;
local ClanHqSelectorType = RuntimeLib.import(script, script.Parent, "clan-hq-selector-type").ClanHqSelectorType;

return function(p4) -- Line: 20
    -- upvalues: OfflinePlayerUtil (copy), ClanMemberRank (copy), ClientStore (copy), ClanUtil (copy), ClanHqBackgroundMusicType (copy), ClanHqSkyboxType (copy), ClanPrivacySetting (copy), ClanWarUtils (copy), ClanUpgradeType (copy), ClanUpgradeTier (copy), BedwarsKit (copy), CreateRoduxApp (copy), ClanHqSelectorApp (copy), ClanHqSelectorType (copy), u1 (copy)
    local v5 = {
        contribution = 2346,
        dateJoined = 100,
        offlinePlayer = {
            name = "oiogy",
            displayName = "Sprux",
            userId = OfflinePlayerUtil.Dummy.oiogy.userId
        },
        rank = ClanMemberRank.LEADER
    };
    local v6 = {
        contribution = 345,
        dateJoined = 100,
        offlinePlayer = {
            name = OfflinePlayerUtil.Dummy.SnickTrix.name,
            userId = OfflinePlayerUtil.Dummy.SnickTrix.userId,
            displayName = OfflinePlayerUtil.Dummy.SnickTrix.displayName
        },
        rank = ClanMemberRank.ADMIN
    };
    local v7 = {
        contribution = 2346,
        dateJoined = 100,
        offlinePlayer = {
            name = OfflinePlayerUtil.Dummy.Chase.name,
            userId = OfflinePlayerUtil.Dummy.Chase.userId,
            displayName = OfflinePlayerUtil.Dummy.Chase.displayName
        },
        rank = ClanMemberRank.OFFICER
    };
    local v8 = {
        contribution = 2346,
        dateJoined = 100,
        offlinePlayer = {
            name = OfflinePlayerUtil.Dummy.Asen.name,
            userId = OfflinePlayerUtil.Dummy.Asen.userId,
            displayName = OfflinePlayerUtil.Dummy.Asen.displayName
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
            image = "rbxassetid://8661722623",
            announcement = "Cap daily or else >:(",
            introduction = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m",
            level = 4,
            coins = 3324549,
            totalCoinsEarned = 4324549,
            maxMembers = 10,
            dateCreated = 100,
            isAddedToClanService = false,
            isAddedToClanService2 = true,
            timeToDelete = os.time() + ClanUtil.CLAN_MARKED_DELETE_GRACE_PERIOD,
            clanHq = {
                allLobbyMusic = { ClanHqBackgroundMusicType.DEFAULT, ClanHqBackgroundMusicType.S10_LOBBY_MUSIC },
                allSkyboxes = { ClanHqSkyboxType.DEFAULT, ClanHqSkyboxType.VOID_SKYBOX }
            },
            invites = {
                outgoing = {
                    ["225721992"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 225721992,
                        inviter = 21406719,
                        time = os.time() - 86400
                    },
                    ["21406719"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 21406719,
                        inviter = 21406719,
                        time = os.time() - 186400
                    },
                    ["22808138"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 22808138,
                        inviter = 21406719,
                        time = os.time() - 186400
                    },
                    ["2237298638"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 2237298638,
                        inviter = 21406719,
                        time = os.time() - 186400
                    },
                    ["3123002278"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 3123002278,
                        inviter = 21406719,
                        time = os.time() - 186400
                    },
                    ["3361695884"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 3361695884,
                        inviter = 21406719,
                        time = os.time() - 186400
                    },
                    ["3778192109"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 3778192109,
                        inviter = 21406719,
                        time = os.time() - 186400
                    },
                    ["4001781"] = {
                        clanId = "123",
                        clanTag = "Dom",
                        clanName = "Doms Clan",
                        targetUserId = 4001781,
                        inviter = 21406719,
                        time = os.time() - 186400
                    }
                }
            },
            privacySetting = ClanPrivacySetting.ANYONE_CAN_JOIN,
            clanContribution = {
                totalXPEarned = 0,
                id = ClanUtil.getContributionDayId(),
                dailyClanContribution = {},
                dailyMemberContributions = {}
            },
            clanWar = {
                allTimeStats = ClanWarUtils.createStarterClanWarStats(),
                wars = {},
                medals = {}
            },
            leader = v5,
            members = {
                [tostring(v5.offlinePlayer.userId)] = v5,
                [tostring(v6.offlinePlayer.userId)] = v6,
                [tostring(v6.offlinePlayer.userId)] = v6,
                [tostring(v6.offlinePlayer.userId)] = v6,
                [tostring(v7.offlinePlayer.userId)] = v7,
                [tostring(v7.offlinePlayer.userId)] = v7,
                [tostring(v7.offlinePlayer.userId)] = v7,
                [tostring(v7.offlinePlayer.userId)] = v7,
                [tostring(v8.offlinePlayer.userId)] = v8,
                [tostring(v8.offlinePlayer.userId)] = v8,
                [tostring(v8.offlinePlayer.userId)] = v8
            },
            upgrades = {
                [ClanUpgradeType.CLAN_LEVEL] = ClanUpgradeTier.CLAN_LEVEL5,
                [ClanUpgradeType.SHOP] = ClanUpgradeTier.SHOP3
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
        me = v5
    });
    local u9 = CreateRoduxApp("CleanHqSelectorApp", ClanHqSelectorApp, {
        type = ClanHqSelectorType.SKYBOX
    }, {}, {
        Parent = p4
    });

    return function() -- Line: 216
        -- upvalues: u1 (ref), u9 (copy)
        return u1.unmount(u9);
    end;
end;