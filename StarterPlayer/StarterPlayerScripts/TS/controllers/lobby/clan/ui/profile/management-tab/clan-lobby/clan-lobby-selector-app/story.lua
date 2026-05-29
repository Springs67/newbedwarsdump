local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ClanChatTagColorOptions
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType
local u12 = v1.import(script, script.Parent, "clan-lobby-selector-app").ClanLobbySelectorApp
local u13 = v1.import(script, script.Parent, "clan-lobby-selector-type").ClanLobbySelectorType
return function(p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u5
        [4] = u11
        [5] = u6
        [6] = u9
        [7] = u10
        [8] = u8
        [9] = u4
        [10] = u12
        [11] = u13
        [12] = u3
    --]]
    local v15 = os.time() + 86400
    local v16 = {
        ["contribution"] = 0,
        ["offlinePlayer"] = {
            ["displayName"] = "Bryan3838",
            ["name"] = u2.Dummy.Bryan3838.name,
            ["userId"] = u2.Dummy.Bryan3838.userId
        },
        ["rank"] = u7.LEADER,
        ["dateJoined"] = os.time()
    }
    local v17 = u5
    local v18 = {
        ["type"] = "ClanUpdate",
        ["myClanId"] = "1"
    }
    local v19 = {
        ["id"] = "1",
        ["name"] = "Big Bait",
        ["tag"] = "b8",
        ["image"] = "",
        ["announcement"] = "",
        ["introduction"] = "We are the best clan",
        ["level"] = 1,
        ["coins"] = 0,
        ["totalCoinsEarned"] = 0,
        ["maxMembers"] = 10,
        ["isAddedToClanService2"] = true,
        ["clanLobby"] = {
            ["allPodiumBanners"] = { u11.DEFAULT, u11.ARCANE },
            ["selectedPodiumBanner"] = u11.DEFAULT
        },
        ["chatTagColors"] = {
            {
                ["chatTagColorOption"] = u6.Rainbow,
                ["expiresAt"] = v15
            },
            {
                ["chatTagColorOption"] = u6.SolidBlue,
                ["expiresAt"] = v15
            }
        },
        ["selectedChatTagColor"] = {
            ["chatTagColorOption"] = u6.SolidBlue,
            ["expiresAt"] = v15
        },
        ["clanContribution"] = {
            ["totalXPEarned"] = 0,
            ["id"] = u9.getContributionDayId(),
            ["dailyClanContribution"] = {},
            ["dailyMemberContributions"] = {}
        },
        ["clanWar"] = {
            ["allTimeStats"] = u10.createStarterClanWarStats(),
            ["wars"] = {},
            ["medals"] = {}
        },
        ["leader"] = v16
    }
    local v20 = {}
    local v21 = v16.offlinePlayer.userId
    v20[tostring(v21)] = v16
    v19.members = v20
    v19.upgrades = {}
    v19.invites = {
        ["outgoing"] = {}
    }
    v19.privacySetting = u8.INVITE_ONLY
    v19.kitShop = {
        ["stock"] = 1,
        ["id"] = u9.getWeekId(),
        ["kits"] = {},
        ["unlocks"] = {}
    }
    v19.dateCreated = os.time()
    v19.flags = {}
    v19.placeAuctionBids = {}
    v19.rewardedAuctionItems = {}
    v18.myClan = v19
    v18.me = v16
    v17:dispatch(v18)
    local u22 = u4("ClanLobbySelectorApp", u12, {
        ["AppId"] = "ClanLobbySelectorStory",
        ["type"] = u13.CLAN_TAG_COLOR
    }, {}, {
        ["Parent"] = p14
    })
    return function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u22
        --]]
        return u3.unmount(u22)
    end
end