-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanChatTagColorOptions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ClanChatTagColorOptions;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanPrivacySetting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local ClanWarUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils;
local ClanPodiumBannerType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType;
local ClanLobbySelectorApp = RuntimeLib.import(script, script.Parent, "clan-lobby-selector-app").ClanLobbySelectorApp;
local ClanLobbySelectorType = RuntimeLib.import(script, script.Parent, "clan-lobby-selector-type").ClanLobbySelectorType;

return function(p2) -- Line: 15
    -- upvalues: OfflinePlayerUtil (copy), ClanMemberRank (copy), ClientStore (copy), ClanPodiumBannerType (copy), ClanChatTagColorOptions (copy), ClanUtil (copy), ClanWarUtils (copy), ClanPrivacySetting (copy), CreateRoduxApp (copy), ClanLobbySelectorApp (copy), ClanLobbySelectorType (copy), u1 (copy)
    local v3 = os.time() + 86400;
    local v4 = {
        contribution = 0,
        offlinePlayer = {
            displayName = "Bryan3838",
            name = OfflinePlayerUtil.Dummy.Bryan3838.name,
            userId = OfflinePlayerUtil.Dummy.Bryan3838.userId
        },
        rank = ClanMemberRank.LEADER,
        dateJoined = os.time()
    };
    ClientStore:dispatch({
        type = "ClanUpdate",
        myClanId = "1",
        myClan = {
            id = "1",
            name = "Big Bait",
            tag = "b8",
            image = "",
            announcement = "",
            introduction = "We are the best clan",
            level = 1,
            coins = 0,
            totalCoinsEarned = 0,
            maxMembers = 10,
            isAddedToClanService2 = true,
            clanLobby = {
                allPodiumBanners = { ClanPodiumBannerType.DEFAULT, ClanPodiumBannerType.ARCANE },
                selectedPodiumBanner = ClanPodiumBannerType.DEFAULT
            },
            chatTagColors = {
                {
                    chatTagColorOption = ClanChatTagColorOptions.Rainbow,
                    expiresAt = v3
                },
                {
                    chatTagColorOption = ClanChatTagColorOptions.SolidBlue,
                    expiresAt = v3
                }
            },
            selectedChatTagColor = {
                chatTagColorOption = ClanChatTagColorOptions.SolidBlue,
                expiresAt = v3
            },
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
            leader = v4,
            members = {
                [tostring(v4.offlinePlayer.userId)] = v4
            },
            upgrades = {},
            invites = {
                outgoing = {}
            },
            privacySetting = ClanPrivacySetting.INVITE_ONLY,
            kitShop = {
                stock = 1,
                id = ClanUtil.getWeekId(),
                kits = {},
                unlocks = {}
            },
            dateCreated = os.time(),
            flags = {},
            placeAuctionBids = {},
            rewardedAuctionItems = {}
        },
        me = v4
    });
    local u5 = CreateRoduxApp("ClanLobbySelectorApp", ClanLobbySelectorApp, {
        AppId = "ClanLobbySelectorStory",
        type = ClanLobbySelectorType.CLAN_TAG_COLOR
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 97
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;