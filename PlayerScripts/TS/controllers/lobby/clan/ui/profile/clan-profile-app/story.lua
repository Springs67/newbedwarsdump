-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AuctionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType;
local ArmorTrimEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local ClanChatTagColorOptions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ClanChatTagColorOptions;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanPrivacySetting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local ClanWarMedal = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").ClanWarMedal;
local ClanPodiumBannerType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type");
local ClanUpgradeTier = v2.ClanUpgradeTier;
local ClanUpgradeType = v2.ClanUpgradeType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local LobbyGadgetType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType;
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil;
local v3 = RuntimeLib.import(script, script.Parent, "clan-profile-core");
local ClanProfileCore = v3.ClanProfileCore;
local ClanProfileTab = v3.ClanProfileTab;

return function(p4) -- Line: 26
    -- upvalues: OfflinePlayerUtil (copy), ClanMemberRank (copy), ClientStore (copy), ClanUtil (copy), ClanPrivacySetting (copy), ClanWarUtils (copy), ClanWarMedal (copy), ClanUpgradeType (copy), ClanUpgradeTier (copy), BedwarsKit (copy), EmoteType (copy), ClanPodiumBannerType (copy), AuctionType (copy), ArmorTrimType (copy), ArmorTrimEffectType (copy), LobbyGadgetType (copy), ClanChatTagColorOptions (copy), CreateRoduxApp (copy), ClanProfileCore (copy), ClanProfileTab (copy), u1 (copy)
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
                medals = {
                    CLAN_WAR_60 = ClanWarMedal.GOLD
                }
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
            placeAuctionBids = { "4" },
            rewardedAuctionItems = {}
        },
        me = v5
    });
    ClientStore:dispatch({
        type = "ClanSetWinningAuctionBids",
        winningAuctionBids = {
            {
                auctionItemId = "1",
                winningBidAmount = 123123123123,
                currency = "ClanContributionCoin",
                numberOfWinningBids = 1,
                reward = {
                    emote = EmoteType.ACADEMY_AERY_GL
                },
                auctionEndTime = os.time() - 60
            },
            {
                auctionItemId = "2",
                winningBidAmount = 200,
                currency = "ClanContributionCoin",
                numberOfWinningBids = 25,
                reward = {
                    emote = EmoteType.AFK
                },
                auctionEndTime = os.time() - 60
            },
            {
                auctionItemId = "3",
                winningBidAmount = 6200,
                currency = "ClanWarCrystal",
                numberOfWinningBids = 1,
                reward = {
                    clanPodiumBanner = ClanPodiumBannerType.DEFAULT
                },
                auctionEndTime = os.time() - 60
            }
        }
    });
    ClientStore:dispatch({
        type = "ClanSetAllAuctionBidIds",
        allAuctionBidIds = { "1", "2", "3", "5" }
    });
    ClientStore:dispatch({
        type = "ClanSetAuctions",
        auctions = {
            {
                id = "clan-individual-auction",
                startEpochTime = os.time() - 60,
                endEpochTime = os.time() + 86400,
                auctionType = AuctionType.ClanIndividual,
                activeItemsIds = { "1", "2", "6" }
            },
            {
                id = "clan-auction",
                startEpochTime = os.time() - 60,
                endEpochTime = os.time() + 86400,
                auctionType = AuctionType.Clan,
                activeItemsIds = { "3", "4", "5" }
            }
        }
    });
    ClientStore:dispatch({
        type = "ClanSetAuctionItems",
        auctionItems = {
            ["1"] = {
                id = "1",
                maxWinningBids = 25,
                currentBid = 123123123,
                auctionType = AuctionType.ClanIndividual,
                definition = {
                    maxWinningBids = 1,
                    bidCurrency = "ClanContributionCoin",
                    startingBid = 2000,
                    reward = {
                        emote = EmoteType.ACADEMY_AERY_GL
                    }
                },
                winningBids = {
                    {
                        maxAmount = 123123123,
                        bidderId = {
                            kind = "Player",
                            id = OfflinePlayerUtil.Dummy.Bryan3838.userId
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 2200,
                        bidderId = {
                            kind = "Player",
                            id = OfflinePlayerUtil.Dummy.oiogy.userId
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 6000,
                        bidderId = {
                            kind = "Player",
                            id = 2
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 2200,
                        bidderId = {
                            kind = "Player",
                            id = 3
                        },
                        bidTime = os.time()
                    }
                }
            },
            ["2"] = {
                id = "2",
                maxWinningBids = 50,
                currentBid = 500,
                auctionType = AuctionType.ClanIndividual,
                definition = {
                    maxWinningBids = 1,
                    bidCurrency = "ClanContributionCoin",
                    startingBid = 1000,
                    reward = {
                        emote = EmoteType.AFK
                    }
                },
                winningBids = {
                    {
                        maxAmount = 5000,
                        bidderId = {
                            kind = "Player",
                            id = 0
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 500,
                        bidderId = {
                            kind = "Player",
                            id = 1
                        },
                        bidTime = os.time()
                    }
                }
            },
            ["6"] = {
                id = "6",
                maxWinningBids = 1,
                currentBid = 5000,
                auctionType = AuctionType.ClanIndividual,
                definition = {
                    maxWinningBids = 1,
                    bidCurrency = "ClanContributionCoin",
                    startingBid = 2500,
                    reward = {
                        armorTrimEffectUnlock = {
                            kit = BedwarsKit.AERY,
                            trim = ArmorTrimType.TRIM_5,
                            effect = ArmorTrimEffectType.FIRE_BLACK
                        }
                    }
                },
                winningBids = {
                    {
                        maxAmount = 5000,
                        bidderId = {
                            kind = "Player",
                            id = OfflinePlayerUtil.Dummy.Bryan3838.userId
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 3750,
                        bidderId = {
                            kind = "Player",
                            id = OfflinePlayerUtil.Dummy.oiogy.userId
                        },
                        bidTime = os.time()
                    }
                }
            },
            ["3"] = {
                id = "3",
                maxWinningBids = 50,
                currentBid = 3000,
                auctionType = AuctionType.Clan,
                definition = {
                    maxWinningBids = 1,
                    bidCurrency = "ClanWarCrystal",
                    startingBid = 3000,
                    reward = {
                        clanPodiumBanner = ClanPodiumBannerType.DEFAULT
                    }
                },
                winningBids = {
                    {
                        maxAmount = 3000,
                        bidderId = {
                            kind = "Clan",
                            id = "123"
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 6200,
                        bidderId = {
                            kind = "Clan",
                            id = "Some random clan id"
                        },
                        bidTime = os.time()
                    }
                }
            },
            ["4"] = {
                id = "4",
                maxWinningBids = 50,
                currentBid = 3000,
                auctionType = AuctionType.Clan,
                definition = {
                    maxWinningBids = 1,
                    bidCurrency = "ClanWarCrystal",
                    startingBid = 3000,
                    reward = {
                        lobbyGadget = LobbyGadgetType.ADETUNDE_CROWN
                    }
                },
                winningBids = {
                    {
                        maxAmount = 3000,
                        bidderId = {
                            kind = "Clan",
                            id = "Some random clan id"
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 6200,
                        bidderId = {
                            kind = "Clan",
                            id = "Some random clan id"
                        },
                        bidTime = os.time()
                    }
                }
            },
            ["5"] = {
                id = "5",
                maxWinningBids = 50,
                currentBid = 1750,
                auctionType = AuctionType.Clan,
                definition = {
                    maxWinningBids = 1,
                    bidCurrency = "ClanWarCrystal",
                    startingBid = 1500,
                    reward = {
                        duration = 86400,
                        clanTagChatColor = ClanChatTagColorOptions.Rainbow
                    }
                },
                winningBids = {
                    {
                        maxAmount = 1750,
                        bidderId = {
                            kind = "Clan",
                            id = "123"
                        },
                        bidTime = os.time()
                    },
                    {
                        maxAmount = 2200,
                        bidderId = {
                            kind = "Clan",
                            id = "Some random clan id"
                        },
                        bidTime = os.time()
                    }
                }
            }
        }
    });
    local u9 = CreateRoduxApp("ClanProfileApp", ClanProfileCore, {
        ClanId = "123",
        tab = ClanProfileTab.AUCTION
    }, {}, {
        Parent = p4
    });

    return function() -- Line: 471
        -- upvalues: u1 (ref), u9 (copy)
        return u1.unmount(u9);
    end;
end;