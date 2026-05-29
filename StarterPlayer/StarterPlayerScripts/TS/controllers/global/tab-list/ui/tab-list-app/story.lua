local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war").ClanWarUtils
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-type")
local u12 = v11.ClanUpgradeTier
local u13 = v11.ClanUpgradeType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "offline-player-util").OfflinePlayerUtil
local u18 = v1.import(script, script.Parent, "tab-list").TabList
return function(p19) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u15
        [3] = u2
        [4] = u14
        [5] = u6
        [6] = u3
        [7] = u7
        [8] = u9
        [9] = u8
        [10] = u10
        [11] = u13
        [12] = u12
        [13] = u16
        [14] = u5
        [15] = u18
        [16] = u4
    --]]
    local v20 = {
        [u17.Dummy.SnickTrix.userId] = u15.ARCHER,
        [u17.Dummy.oiogy.userId] = u15.BAKER,
        [u17.Dummy.Bryan3838.userId] = u15.BARBARIAN,
        [u17.Dummy.spleenhook.userId] = u15.BIGMAN,
        [u17.Dummy.Asen.userId] = u15.FARMER_CLETUS,
        [u17.Dummy.Vorlias.userId] = u15.SHIELDER,
        [u17.Dummy.Rascal.userId] = u15.COWGIRL
    }
    u6:dispatch({
        ["type"] = "GameSetTeams",
        ["teams"] = {
            {
                ["id"] = "2",
                ["name"] = "Pink",
                ["members"] = {
                    [u17.Dummy.SnickTrix.userId] = u17.Dummy.SnickTrix,
                    [u17.Dummy.oiogy.userId] = u17.Dummy.oiogy,
                    [u17.Dummy.Vorlias.userId] = u17.Dummy.Vorlias,
                    [u17.Dummy.Rascal.userId] = u17.Dummy.Rascal
                },
                ["color"] = u2.hexColor(u14.pink)
            },
            {
                ["id"] = "1",
                ["name"] = "Orange",
                ["members"] = {
                    [u17.Dummy.LongNameMan.userId] = u17.Dummy.LongNameMan,
                    [u17.Dummy.DVwastaken.userId] = u17.Dummy.DVwastaken
                },
                ["color"] = u2.hexColor(u14.orange)
            },
            {
                ["id"] = "3",
                ["name"] = "Blue",
                ["members"] = {
                    [u17.Dummy.spleenhook.userId] = u17.Dummy.spleenhook,
                    [u17.Dummy.Midciel.userId] = u17.Dummy.Midciel
                },
                ["color"] = u2.hexColor(u14.lightBlue)
            },
            {
                ["id"] = "4",
                ["name"] = "Yellow",
                ["members"] = {
                    [u17.Dummy.Asen.userId] = u17.Dummy.Asen,
                    [u17.Dummy.SteamPulse.userId] = u17.Dummy.SteamPulse,
                    [u17.Dummy.Bryan3838.userId] = u17.Dummy.Bryan3838
                },
                ["color"] = u2.hexColor(u14.yellow)
            },
            {
                ["id"] = "5",
                ["name"] = "Black",
                ["members"] = {
                    [u17.Dummy.Candelz.userId] = u17.Dummy.Candelz,
                    [u17.Dummy.Chase.userId] = u17.Dummy.Chase
                },
                ["color"] = u2.hexColor(u14.black)
            },
            {
                ["id"] = "6",
                ["name"] = "White",
                ["members"] = {
                    [u17.Dummy.leoduquartier.userId] = u17.Dummy.leoduquartier,
                    [u17.Dummy.Rascal.userId] = u17.Dummy.Rascal
                },
                ["color"] = u2.hexColor(u14.white)
            }
        }
    })
    local v21 = u3.entries(u17.Dummy)
    local function v24(p22) --[[ Line: 96 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local _ = p22[1]
        local v23 = p22[2]
        u6:dispatch({
            ["type"] = "BedwarsSetKills",
            ["kills"] = 420,
            ["userId"] = v23.userId
        })
        u6:dispatch({
            ["type"] = "BedwarsSetBedBreaks",
            ["userId"] = v23.userId
        })
        return 0
    end
    local v25 = table.create(#v21)
    for v26, v27 in v21 do
        v25[v26] = v24(v27, v26 - 1, v21)
    end
    local v28 = 0
    local v29 = {}
    for v30, v31 in u3.entries(u17.Dummy) do
        local v32 = v30 - 1
        local _ = v31[1]
        local _ = v31[2]
        if v32 < 0 == true then
            v28 = v28 + 1
            v29[v28] = v31
        end
    end
    local function v35(p33) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        local _ = p33[1]
        local v34 = p33[2]
        u6:dispatch({
            ["type"] = "BedwarsSetKills",
            ["kills"] = 420,
            ["userId"] = v34.userId
        })
        u6:dispatch({
            ["type"] = "BedwarsSetFinalDeaths",
            ["dead"] = true,
            ["userId"] = v34.userId
        })
        return 0
    end
    local v36 = table.create(#v29)
    for v37, v38 in v29 do
        v36[v37] = v35(v38, v37 - 1, v29)
    end
    local v39 = u3.entries(v20)
    local v40 = table.create(#v39)
    for v41, v42 in v39 do
        local _ = v41 - 1
        u6:dispatch({
            ["type"] = "BedwarsSetKits",
            ["userId"] = v42[1],
            ["kit"] = v42[2]
        })
        v40[v41] = 0
    end
    local v43 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = "oiogy",
            ["displayName"] = "Sprux",
            ["userId"] = u17.Dummy.oiogy.userId
        },
        ["rank"] = u7.LEADER
    }
    local v44 = {
        ["contribution"] = 345,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u17.Dummy.SnickTrix.name,
            ["userId"] = u17.Dummy.SnickTrix.userId,
            ["displayName"] = u17.Dummy.SnickTrix.displayName
        },
        ["rank"] = u7.ADMIN
    }
    local v45 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 100,
        ["offlinePlayer"] = {
            ["name"] = u17.Dummy.Chase.name,
            ["userId"] = u17.Dummy.Chase.userId,
            ["displayName"] = u17.Dummy.Chase.displayName
        },
        ["rank"] = u7.MEMBER
    }
    local v46 = u6
    local v47 = {
        ["type"] = "ClanUpdate",
        ["myClanId"] = "123"
    }
    local v48 = {
        ["id"] = "123",
        ["name"] = "Doms Clan",
        ["tag"] = "Dom",
        ["image"] = "",
        ["announcement"] = "Cap daily or else >:(",
        ["introduction"] = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean m",
        ["level"] = 4,
        ["coins"] = 100,
        ["totalCoinsEarned"] = 100,
        ["maxMembers"] = 10,
        ["dateCreated"] = 100,
        ["isAddedToClanService"] = false,
        ["isAddedToClanService2"] = true,
        ["clanContribution"] = {
            ["totalXPEarned"] = 0,
            ["id"] = u9.getContributionDayId(),
            ["dailyClanContribution"] = {},
            ["dailyMemberContributions"] = {}
        },
        ["leader"] = v43,
        ["invites"] = {
            ["outgoing"] = {}
        },
        ["privacySetting"] = u8.ANYONE_CAN_JOIN,
        ["members"] = {
            ["123"] = v43,
            ["1"] = v44,
            ["12"] = v44,
            ["13"] = v44,
            ["14"] = v45,
            ["15"] = v45,
            ["16"] = v45,
            ["17"] = v45,
            ["18"] = v45,
            ["19"] = v45,
            ["20"] = v45
        },
        ["clanWar"] = {
            ["allTimeStats"] = u10.createStarterClanWarStats(),
            ["wars"] = {},
            ["medals"] = {}
        },
        ["upgrades"] = {
            [u13.CLAN_LEVEL] = u12.CLAN_LEVEL5
        },
        ["kitShop"] = {
            ["stock"] = 1,
            ["id"] = u9.getWeekId(),
            ["kits"] = { u15.BARBARIAN, u15.BIGMAN, u15.DASHER },
            ["unlocks"] = {
                [u15.AERY] = {
                    ["purchaseTime"] = 1645663458,
                    ["endTime"] = 1646981858,
                    ["duration"] = 518400,
                    ["kit"] = u15.AERY
                }
            }
        },
        ["flags"] = {},
        ["placeAuctionBids"] = {},
        ["rewardedAuctionItems"] = {}
    }
    v47.myClan = v48
    v47.me = v44
    v46:dispatch(v47)
    u6:dispatch({
        ["type"] = "GameAddMatchEvent",
        ["matchEvent"] = {
            ["id"] = "titan_boss",
            ["name"] = "TITAN BOSS",
            ["image"] = u16.THREE_TITANS_ICON,
            ["time"] = os.time() + 600,
            ["isOnTopHud"] = {
                ["shouldDisplay"] = false
            }
        }
    })
    u6:dispatch({
        ["type"] = "GameAddMatchEvent",
        ["matchEvent"] = {
            ["id"] = "diamond_guards",
            ["name"] = "DIAMOND GUARDS",
            ["image"] = u16.DIAMOND,
            ["time"] = os.time() + 60,
            ["isOnTopHud"] = {
                ["shouldDisplay"] = false
            }
        }
    })
    u6:dispatch({
        ["type"] = "GameAddMatchEvent",
        ["matchEvent"] = {
            ["id"] = "void_invasion",
            ["image"] = "rbxassetid://137680717472661",
            ["name"] = "Void Invasion",
            ["time"] = os.time() + 30,
            ["isOnTopHud"] = {
                ["shouldDisplay"] = false
            }
        }
    })
    local u49 = u5("TabList", u18, {}, {}, {
        ["Parent"] = p19
    })
    return function() --[[ Line: 313 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u49
        --]]
        u4.unmount(u49)
    end
end