local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types")
local u11 = v10.ClanHqBackgroundMusicType
local u12 = v10.ClanHqSkyboxType
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type")
local u14 = v13.ClanUpgradeTier
local u15 = v13.ClanUpgradeType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u17 = v1.import(script, script.Parent, "clan-hq-selector-app").ClanHqSelectorApp
local u18 = v1.import(script, script.Parent, "clan-hq-selector-type").ClanHqSelectorType
return function(p19) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u6
        [3] = u5
        [4] = u8
        [5] = u11
        [6] = u12
        [7] = u7
        [8] = u9
        [9] = u15
        [10] = u14
        [11] = u16
        [12] = u4
        [13] = u17
        [14] = u18
        [15] = u3
    --]]
    local v20 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = "oiogy",
            ["displayName"] = "Sprux",
            ["userId"] = u2.Dummy.oiogy.userId
        },
        ["rank"] = u6.LEADER
    }
    local v21 = {
        ["contribution"] = 345,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u2.Dummy.SnickTrix.name,
            ["userId"] = u2.Dummy.SnickTrix.userId,
            ["displayName"] = u2.Dummy.SnickTrix.displayName
        },
        ["rank"] = u6.ADMIN
    }
    local v22 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u2.Dummy.Chase.name,
            ["userId"] = u2.Dummy.Chase.userId,
            ["displayName"] = u2.Dummy.Chase.displayName
        },
        ["rank"] = u6.OFFICER
    }
    local v23 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u2.Dummy.Asen.name,
            ["userId"] = u2.Dummy.Asen.userId,
            ["displayName"] = u2.Dummy.Asen.displayName
        },
        ["rank"] = u6.MEMBER
    }
    local v24 = u5
    local v25 = {
        ["type"] = "ClanUpdate",
        ["myClanId"] = "123"
    }
    local v26 = {
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
        ["timeToDelete"] = os.time() + u8.CLAN_MARKED_DELETE_GRACE_PERIOD,
        ["clanHq"] = {
            ["allLobbyMusic"] = { u11.DEFAULT, u11.S10_LOBBY_MUSIC },
            ["allSkyboxes"] = { u12.DEFAULT, u12.VOID_SKYBOX }
        }
    }
    local v27 = {}
    local v28 = {
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
    v27.outgoing = v28
    v26.invites = v27
    v26.privacySetting = u7.ANYONE_CAN_JOIN
    v26.clanContribution = {
        ["totalXPEarned"] = 0,
        ["id"] = u8.getContributionDayId(),
        ["dailyClanContribution"] = {},
        ["dailyMemberContributions"] = {}
    }
    v26.clanWar = {
        ["allTimeStats"] = u9.createStarterClanWarStats(),
        ["wars"] = {},
        ["medals"] = {}
    }
    v26.leader = v20
    local v29 = {}
    local v30 = v20.offlinePlayer.userId
    v29[tostring(v30)] = v20
    local v31 = v21.offlinePlayer.userId
    v29[tostring(v31)] = v21
    local v32 = v21.offlinePlayer.userId
    v29[tostring(v32)] = v21
    local v33 = v21.offlinePlayer.userId
    v29[tostring(v33)] = v21
    local v34 = v22.offlinePlayer.userId
    v29[tostring(v34)] = v22
    local v35 = v22.offlinePlayer.userId
    v29[tostring(v35)] = v22
    local v36 = v22.offlinePlayer.userId
    v29[tostring(v36)] = v22
    local v37 = v22.offlinePlayer.userId
    v29[tostring(v37)] = v22
    local v38 = v23.offlinePlayer.userId
    v29[tostring(v38)] = v23
    local v39 = v23.offlinePlayer.userId
    v29[tostring(v39)] = v23
    local v40 = v23.offlinePlayer.userId
    v29[tostring(v40)] = v23
    v26.members = v29
    v26.upgrades = {
        [u15.CLAN_LEVEL] = u14.CLAN_LEVEL5,
        [u15.SHOP] = u14.SHOP3
    }
    local v41 = {
        ["stock"] = 1,
        ["id"] = u8.getWeekId(),
        ["kits"] = { u16.BARBARIAN, u16.BIGMAN, u16.DASHER }
    }
    local v42 = {
        [u16.AERY] = {
            ["purchaseTime"] = 1645663458,
            ["endTime"] = 1646981858,
            ["duration"] = 518400,
            ["kit"] = u16.AERY
        }
    }
    v41.unlocks = v42
    v26.kitShop = v41
    v26.flags = {}
    v26.placeAuctionBids = {}
    v26.rewardedAuctionItems = {}
    v25.myClan = v26
    v25.me = v20
    v24:dispatch(v25)
    local u43 = u4("CleanHqSelectorApp", u17, {
        ["type"] = u18.SKYBOX
    }, {}, {
        ["Parent"] = p19
    })
    return function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u43
        --]]
        return u3.unmount(u43)
    end
end