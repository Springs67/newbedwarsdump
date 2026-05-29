local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ClanChatTagColorOptions
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").ClanWarMedal
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type")
local u16 = v15.ClanUpgradeTier
local u17 = v15.ClanUpgradeType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local v22 = v1.import(script, script.Parent, "clan-profile-core")
local u23 = v22.ClanProfileCore
local u24 = v22.ClanProfileTab
return function(p25) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u9
        [3] = u4
        [4] = u11
        [5] = u10
        [6] = u12
        [7] = u13
        [8] = u17
        [9] = u16
        [10] = u18
        [11] = u19
        [12] = u14
        [13] = u5
        [14] = u7
        [15] = u6
        [16] = u20
        [17] = u8
        [18] = u3
        [19] = u23
        [20] = u24
        [21] = u2
    --]]
    local v26 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = "oiogy",
            ["displayName"] = "Sprux",
            ["userId"] = u21.Dummy.oiogy.userId
        },
        ["rank"] = u9.LEADER
    }
    local v27 = {
        ["contribution"] = 345,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u21.Dummy.SnickTrix.name,
            ["userId"] = u21.Dummy.SnickTrix.userId,
            ["displayName"] = u21.Dummy.SnickTrix.displayName
        },
        ["rank"] = u9.ADMIN
    }
    local v28 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u21.Dummy.Chase.name,
            ["userId"] = u21.Dummy.Chase.userId,
            ["displayName"] = u21.Dummy.Chase.displayName
        },
        ["rank"] = u9.OFFICER
    }
    local v29 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u21.Dummy.Asen.name,
            ["userId"] = u21.Dummy.Asen.userId,
            ["displayName"] = u21.Dummy.Asen.displayName
        },
        ["rank"] = u9.MEMBER
    }
    local v30 = u4
    local v31 = {
        ["type"] = "ClanUpdate",
        ["myClanId"] = "123"
    }
    local v32 = {
        ["id"] = "123",
        ["name"] = "Doms Clan",
        ["tag"] = "Dom",
        ["image"] = "rbxassetid://8661722623",
        ["announcement"] = "Cap daily or else >:(",
        ["introduction"] = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m",
        ["level"] = 4,
        ["coins"] = 3324549,
        ["totalCoinsEarned"] = 4324549,
        ["maxMembers"] = 10,
        ["dateCreated"] = 100,
        ["isAddedToClanService"] = false,
        ["isAddedToClanService2"] = true,
        ["timeToDelete"] = os.time() + u11.CLAN_MARKED_DELETE_GRACE_PERIOD
    }
    local v33 = {}
    local v34 = {
        ["225721992"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 225721992,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 86400
        },
        ["21406719"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 21406719,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        },
        ["22808138"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 22808138,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        },
        ["2237298638"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 2237298638,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        },
        ["3123002278"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 3123002278,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        },
        ["3361695884"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 3361695884,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        },
        ["3778192109"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 3778192109,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        },
        ["4001781"] = {
            ["clanId"] = "123",
            ["clanTag"] = "Dom",
            ["clanName"] = "Doms Clan",
            ["targetUserId"] = 4001781,
            ["inviter"] = 21406719,
            ["time"] = os.time() - 186400
        }
    }
    v33.outgoing = v34
    v32.invites = v33
    v32.privacySetting = u10.ANYONE_CAN_JOIN
    v32.clanContribution = {
        ["totalXPEarned"] = 0,
        ["id"] = u11.getContributionDayId(),
        ["dailyClanContribution"] = {},
        ["dailyMemberContributions"] = {}
    }
    local v35 = {
        ["allTimeStats"] = u12.createStarterClanWarStats(),
        ["wars"] = {},
        ["medals"] = {
            ["CLAN_WAR_60"] = u13.GOLD
        }
    }
    v32.clanWar = v35
    v32.leader = v26
    local v36 = {}
    local v37 = v26.offlinePlayer.userId
    v36[tostring(v37)] = v26
    local v38 = v27.offlinePlayer.userId
    v36[tostring(v38)] = v27
    local v39 = v27.offlinePlayer.userId
    v36[tostring(v39)] = v27
    local v40 = v27.offlinePlayer.userId
    v36[tostring(v40)] = v27
    local v41 = v28.offlinePlayer.userId
    v36[tostring(v41)] = v28
    local v42 = v28.offlinePlayer.userId
    v36[tostring(v42)] = v28
    local v43 = v28.offlinePlayer.userId
    v36[tostring(v43)] = v28
    local v44 = v28.offlinePlayer.userId
    v36[tostring(v44)] = v28
    local v45 = v29.offlinePlayer.userId
    v36[tostring(v45)] = v29
    local v46 = v29.offlinePlayer.userId
    v36[tostring(v46)] = v29
    local v47 = v29.offlinePlayer.userId
    v36[tostring(v47)] = v29
    v32.members = v36
    v32.upgrades = {
        [u17.CLAN_LEVEL] = u16.CLAN_LEVEL5,
        [u17.SHOP] = u16.SHOP3
    }
    local v48 = {
        ["stock"] = 1,
        ["id"] = u11.getWeekId(),
        ["kits"] = { u18.BARBARIAN, u18.BIGMAN, u18.DASHER }
    }
    local v49 = {
        [u18.AERY] = {
            ["purchaseTime"] = 1645663458,
            ["endTime"] = 1646981858,
            ["duration"] = 518400,
            ["kit"] = u18.AERY
        }
    }
    v48.unlocks = v49
    v32.kitShop = v48
    v32.flags = {}
    v32.placeAuctionBids = { "4" }
    v32.rewardedAuctionItems = {}
    v31.myClan = v32
    v31.me = v26
    v30:dispatch(v31)
    local v50 = u4
    local v51 = {
        ["type"] = "ClanSetWinningAuctionBids"
    }
    local v52 = {}
    local v53 = {
        ["auctionItemId"] = "1",
        ["winningBidAmount"] = 123123123123,
        ["currency"] = "ClanContributionCoin",
        ["numberOfWinningBids"] = 1,
        ["reward"] = {
            ["emote"] = u19.ACADEMY_AERY_GL
        },
        ["auctionEndTime"] = os.time() - 60
    }
    local v54 = {
        ["auctionItemId"] = "2",
        ["winningBidAmount"] = 200,
        ["currency"] = "ClanContributionCoin",
        ["numberOfWinningBids"] = 25,
        ["reward"] = {
            ["emote"] = u19.AFK
        },
        ["auctionEndTime"] = os.time() - 60
    }
    local v55 = {
        ["auctionItemId"] = "3",
        ["winningBidAmount"] = 6200,
        ["currency"] = "ClanWarCrystal",
        ["numberOfWinningBids"] = 1,
        ["reward"] = {
            ["clanPodiumBanner"] = u14.DEFAULT
        },
        ["auctionEndTime"] = os.time() - 60
    }
    __set_list(v52, 1, {v53, v54, v55})
    v51.winningAuctionBids = v52
    v50:dispatch(v51)
    u4:dispatch({
        ["type"] = "ClanSetAllAuctionBidIds",
        ["allAuctionBidIds"] = {
            "1",
            "2",
            "3",
            "5"
        }
    })
    u4:dispatch({
        ["type"] = "ClanSetAuctions",
        ["auctions"] = {
            {
                ["id"] = "clan-individual-auction",
                ["startEpochTime"] = os.time() - 60,
                ["endEpochTime"] = os.time() + 86400,
                ["auctionType"] = u5.ClanIndividual,
                ["activeItemsIds"] = { "1", "2", "6" }
            },
            {
                ["id"] = "clan-auction",
                ["startEpochTime"] = os.time() - 60,
                ["endEpochTime"] = os.time() + 86400,
                ["auctionType"] = u5.Clan,
                ["activeItemsIds"] = { "3", "4", "5" }
            }
        }
    })
    local v56 = u4
    local v57 = {
        ["type"] = "ClanSetAuctionItems"
    }
    local v58 = {}
    local v59 = {
        ["id"] = "1",
        ["maxWinningBids"] = 25,
        ["currentBid"] = 123123123,
        ["auctionType"] = u5.ClanIndividual
    }
    local v60 = {
        ["maxWinningBids"] = 1,
        ["bidCurrency"] = "ClanContributionCoin",
        ["startingBid"] = 2000,
        ["reward"] = {
            ["emote"] = u19.ACADEMY_AERY_GL
        }
    }
    v59.definition = v60
    local v61 = {}
    local v62 = {
        ["maxAmount"] = 123123123,
        ["bidderId"] = {
            ["kind"] = "Player",
            ["id"] = u21.Dummy.Bryan3838.userId
        },
        ["bidTime"] = os.time()
    }
    local v63 = {
        ["maxAmount"] = 2200,
        ["bidderId"] = {
            ["kind"] = "Player",
            ["id"] = u21.Dummy.oiogy.userId
        },
        ["bidTime"] = os.time()
    }
    __set_list(v61, 1, {v62, v63, {
    ["maxAmount"] = 6000,
    ["bidderId"] = {
        ["kind"] = "Player",
        ["id"] = 2
    },
    ["bidTime"] = os.time()
}, {
    ["maxAmount"] = 2200,
    ["bidderId"] = {
        ["kind"] = "Player",
        ["id"] = 3
    },
    ["bidTime"] = os.time()
}})
    v59.winningBids = v61
    v58["1"] = v59
    local v64 = {
        ["id"] = "2",
        ["maxWinningBids"] = 50,
        ["currentBid"] = 500,
        ["auctionType"] = u5.ClanIndividual
    }
    local v65 = {
        ["maxWinningBids"] = 1,
        ["bidCurrency"] = "ClanContributionCoin",
        ["startingBid"] = 1000,
        ["reward"] = {
            ["emote"] = u19.AFK
        }
    }
    v64.definition = v65
    v64.winningBids = {
        {
            ["maxAmount"] = 5000,
            ["bidderId"] = {
                ["kind"] = "Player",
                ["id"] = 0
            },
            ["bidTime"] = os.time()
        },
        {
            ["maxAmount"] = 500,
            ["bidderId"] = {
                ["kind"] = "Player",
                ["id"] = 1
            },
            ["bidTime"] = os.time()
        }
    }
    v58["2"] = v64
    local v66 = {
        ["id"] = "6",
        ["maxWinningBids"] = 1,
        ["currentBid"] = 5000,
        ["auctionType"] = u5.ClanIndividual
    }
    local v67 = {
        ["maxWinningBids"] = 1,
        ["bidCurrency"] = "ClanContributionCoin",
        ["startingBid"] = 2500
    }
    local v68 = {
        ["armorTrimEffectUnlock"] = {
            ["kit"] = u18.AERY,
            ["trim"] = u7.TRIM_5,
            ["effect"] = u6.FIRE_BLACK
        }
    }
    v67.reward = v68
    v66.definition = v67
    local v69 = {}
    local v70 = {
        ["maxAmount"] = 5000,
        ["bidderId"] = {
            ["kind"] = "Player",
            ["id"] = u21.Dummy.Bryan3838.userId
        },
        ["bidTime"] = os.time()
    }
    local v71 = {
        ["maxAmount"] = 3750,
        ["bidderId"] = {
            ["kind"] = "Player",
            ["id"] = u21.Dummy.oiogy.userId
        },
        ["bidTime"] = os.time()
    }
    __set_list(v69, 1, {v70, v71})
    v66.winningBids = v69
    v58["6"] = v66
    local v72 = {
        ["id"] = "3",
        ["maxWinningBids"] = 50,
        ["currentBid"] = 3000,
        ["auctionType"] = u5.Clan
    }
    local v73 = {
        ["maxWinningBids"] = 1,
        ["bidCurrency"] = "ClanWarCrystal",
        ["startingBid"] = 3000,
        ["reward"] = {
            ["clanPodiumBanner"] = u14.DEFAULT
        }
    }
    v72.definition = v73
    v72.winningBids = {
        {
            ["maxAmount"] = 3000,
            ["bidderId"] = {
                ["kind"] = "Clan",
                ["id"] = "123"
            },
            ["bidTime"] = os.time()
        },
        {
            ["maxAmount"] = 6200,
            ["bidderId"] = {
                ["kind"] = "Clan",
                ["id"] = "Some random clan id"
            },
            ["bidTime"] = os.time()
        }
    }
    v58["3"] = v72
    local v74 = {
        ["id"] = "4",
        ["maxWinningBids"] = 50,
        ["currentBid"] = 3000,
        ["auctionType"] = u5.Clan
    }
    local v75 = {
        ["maxWinningBids"] = 1,
        ["bidCurrency"] = "ClanWarCrystal",
        ["startingBid"] = 3000,
        ["reward"] = {
            ["lobbyGadget"] = u20.ADETUNDE_CROWN
        }
    }
    v74.definition = v75
    v74.winningBids = {
        {
            ["maxAmount"] = 3000,
            ["bidderId"] = {
                ["kind"] = "Clan",
                ["id"] = "Some random clan id"
            },
            ["bidTime"] = os.time()
        },
        {
            ["maxAmount"] = 6200,
            ["bidderId"] = {
                ["kind"] = "Clan",
                ["id"] = "Some random clan id"
            },
            ["bidTime"] = os.time()
        }
    }
    v58["4"] = v74
    local v76 = {
        ["id"] = "5",
        ["maxWinningBids"] = 50,
        ["currentBid"] = 1750,
        ["auctionType"] = u5.Clan
    }
    local v77 = {
        ["maxWinningBids"] = 1,
        ["bidCurrency"] = "ClanWarCrystal",
        ["startingBid"] = 1500,
        ["reward"] = {
            ["duration"] = 86400,
            ["clanTagChatColor"] = u8.Rainbow
        }
    }
    v76.definition = v77
    v76.winningBids = {
        {
            ["maxAmount"] = 1750,
            ["bidderId"] = {
                ["kind"] = "Clan",
                ["id"] = "123"
            },
            ["bidTime"] = os.time()
        },
        {
            ["maxAmount"] = 2200,
            ["bidderId"] = {
                ["kind"] = "Clan",
                ["id"] = "Some random clan id"
            },
            ["bidTime"] = os.time()
        }
    }
    v58["5"] = v76
    v57.auctionItems = v58
    v56:dispatch(v57)
    local u78 = u3("ClanProfileApp", u23, {
        ["ClanId"] = "123",
        ["tab"] = u24.AUCTION
    }, {}, {
        ["Parent"] = p25
    })
    return function() --[[ Line: 471 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u78
        --]]
        return u2.unmount(u78)
    end
end