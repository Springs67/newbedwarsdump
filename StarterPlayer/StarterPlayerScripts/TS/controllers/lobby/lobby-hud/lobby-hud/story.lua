local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out")
local u4 = v3.PartyInvitesReducer
local u5 = v3.PartyReducer
local u6 = v3.QueueState
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "event-reducer").EventReducer
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "event-missions-util").EventMissionsUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-shop", "event-shop-item").EventShopItem
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local u23 = v1.import(script, script.Parent, "lobby-hud-main", "lobby-hud-main").LobbyHudMain
local u24 = v1.import(script, script.Parent, "lobby-hud-side", "lobby-hud-side").LobbyHudSide
return function(p25) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u15
        [3] = u17
        [4] = u9
        [5] = u12
        [6] = u5
        [7] = u4
        [8] = u10
        [9] = u11
        [10] = u13
        [11] = u20
        [12] = u2
        [13] = u6
        [14] = u19
        [15] = u18
        [16] = u7
        [17] = u8
        [18] = u23
        [19] = u24
        [20] = u14
        [21] = u22
        [22] = u21
    --]]
    local v26 = u16.EGG_HUNT_2024
    local v27 = {}
    for v28, v29 in u15[v26].missionGenerators do
        local _ = v28 - 1
        local v30 = u17.convertMissionsToDataStore(v26, v29.pool, v29.id)
        v27[v29.id] = v30
    end
    local v31 = {
        ["Bedwars"] = u12,
        ["Party"] = u5,
        ["PartyInvites"] = u4,
        ["Clans"] = u10,
        ["Event"] = u11,
        ["Lobby"] = u13
    }
    local v32 = u9.combineReducers(v31)
    local v33 = {}
    local v34 = {}
    local v35 = {
        ["newPlayerBundleData"] = {
            ["purchased"] = false,
            ["firstJoinTime"] = os.time()
        }
    }
    v34.robuxStore = v35
    v33.Lobby = v34
    v33.Bedwars = {
        ["bedCoins"] = 9999999999,
        ["playerLevel"] = 20,
        ["kit"] = u20.ALCHEMIST,
        ["kits"] = { u20.NONE, u20.ALCHEMIST },
        ["milestoneRewardsClaimed"] = {}
    }
    local v36 = {}
    local v37 = {}
    for v38, v39 in u2.Dummy.SnickTrix do
        v36[v38] = v39
    end
    v36.displayName = "SnickTrix"
    v37.leader = v36
    local v40 = {
        u2.Dummy.spleenhook,
        u2.Dummy.Vorlias,
        u2.Dummy.spleenhook,
        u2.Dummy.Vorlias,
        u2.Dummy.spleenhook,
        u2.Dummy.Vorlias,
        u2.Dummy.spleenhook,
        u2.Dummy.Vorlias,
        u2.Dummy.spleenhook,
        u2.Dummy.Vorlias,
        u2.Dummy.spleenhook,
        u2.Dummy.Vorlias,
        u2.Dummy.spleenhook
    }
    local v41 = table.create(#v40)
    for v42, v43 in v40 do
        local _ = v42 - 1
        local v44 = {}
        for v45, v46 in v43 do
            v44[v45] = v46
        end
        v44.displayName = v43.name
        v41[v42] = v44
    end
    v37.members = v41
    v37.queueData = nil
    v37.queueState = u6.NONE
    v37.outgoingInviteUserIds = {}
    v33.Party = v37
    local v47 = {}
    local v48 = {}
    local v49 = {
        ["fromPlayer"] = {
            ["name"] = "SnickTrix",
            ["userId"] = u2.Dummy.SnickTrix.userId
        },
        ["time"] = os.time()
    }
    local v50 = {
        ["fromPlayer"] = {
            ["name"] = "spleenhook",
            ["userId"] = u2.Dummy.spleenhook.userId
        },
        ["time"] = os.time() - 10
    }
    __set_list(v48, 1, {v49, v50})
    v47.incomingInvites = v48
    v33.PartyInvites = v47
    v33.Clans = {
        ["myClanId"] = "1"
    }
    local v51 = {}
    local v52 = {}
    for v53, v54 in u19.makeStarterEventData() do
        v51[v53] = v54
    end
    local v55 = {}
    local v56 = u16.EGG_HUNT_2024
    local v57 = {
        ["itemsPurchased"] = {
            {
                ["item"] = u18.HALLOWEEN_EMOTE,
                ["time"] = os.time()
            }
        },
        ["missionsClaimed"] = {},
        ["claimedEggs"] = {}
    }
    v55[v56] = v57
    v51.events = v55
    v52.profileData = v51
    v52.activeMissions = {
        [v26] = v27
    }
    v33.Event = v52
    local v58 = u9.Store.new(v32, v33)
    local u59 = u7.mount(u7.createElement(u8, {
        ["store"] = v58
    }, { u7.createElement(u23, {
            ["AppId"] = "LobbyHudMain"
        }) }), p25)
    local u60 = u7.mount(u7.createElement(u8, {
        ["store"] = v58
    }, { u7.createElement(u24, {
            ["AppId"] = "LobbyHudSide"
        }) }), p25)
    local v61 = u14
    local v62 = {
        ["type"] = "LobbyAddRewardsToDisplay",
        ["rewards"] = {
            {
                ["paid"] = false,
                ["clanShopContribution"] = 1000
            },
            {
                ["paid"] = false,
                ["killEffect"] = u22.BOXING_GLOVE
            },
            {
                ["paid"] = false,
                ["emote"] = u21.DISCO
            },
            {
                ["paid"] = false,
                ["emote"] = u21.PENGUIN_DISCO
            },
            {
                ["paid"] = false,
                ["clanShopContribution"] = 1000
            },
            {
                ["paid"] = false,
                ["killEffect"] = u22.BOXING_GLOVE
            },
            {
                ["paid"] = false,
                ["emote"] = u21.DISCO
            },
            {
                ["paid"] = false,
                ["emote"] = u21.PENGUIN_DISCO
            },
            {
                ["paid"] = false,
                ["clanShopContribution"] = 1000
            },
            {
                ["paid"] = false,
                ["killEffect"] = u22.BOXING_GLOVE
            },
            {
                ["paid"] = false,
                ["emote"] = u21.DISCO
            },
            {
                ["paid"] = false,
                ["emote"] = u21.PENGUIN_DISCO
            },
            {
                ["paid"] = false,
                ["clanShopContribution"] = 1000
            },
            {
                ["paid"] = false,
                ["killEffect"] = u22.BOXING_GLOVE
            },
            {
                ["paid"] = false,
                ["emote"] = u21.DISCO
            },
            {
                ["paid"] = false,
                ["emote"] = u21.PENGUIN_DISCO
            }
        }
    }
    v61:dispatch(v62)
    return function() --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u59
            [3] = u60
        --]]
        u7.unmount(u59)
        u7.unmount(u60)
    end
end