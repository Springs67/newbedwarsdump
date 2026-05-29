local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.OfflinePlayerUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "draft-reducer").DraftReducer
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u16 = v15.Consumable
local u17 = v15.ConsumableStatus
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-mode").MatchDraftMode
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-selector-options").MatchDraftSelectorOption
local u25 = v1.import(script, script.Parent, "match-draft-app").MatchDraftApp
return function(p26) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u19
        [4] = u5
        [5] = u21
        [6] = u20
        [7] = u8
        [8] = u14
        [9] = u12
        [10] = u10
        [11] = u11
        [12] = u13
        [13] = u18
        [14] = u17
        [15] = u16
        [16] = u22
        [17] = u23
        [18] = u9
        [19] = u24
        [20] = u6
        [21] = u7
        [22] = u25
    --]]
    local v27 = {}
    local v28 = {
        ["id"] = "1",
        ["name"] = "Blue",
        ["members"] = {
            [u4.Dummy.Chase.userId] = u4.Dummy.Chase,
            [u4.Dummy.oiogy.userId] = u4.Dummy.oiogy,
            [u4.Dummy.Bryan3838.userId] = u4.Dummy.Bryan3838,
            [u4.Dummy.Asen.userId] = u4.Dummy.Asen
        },
        ["color"] = u3.hexColor(u19.lightBlue)
    }
    local v29 = {
        ["id"] = "2",
        ["name"] = "Orange",
        ["members"] = {
            [u4.Dummy.LongNameMan.userId] = u4.Dummy.LongNameMan,
            [u4.Dummy.DVwastaken.userId] = u4.Dummy.DVwastaken
        },
        ["color"] = u3.hexColor(u19.orange)
    }
    __set_list(v27, 1, {v28, v29})
    local function v34() --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u21
            [3] = u20
        --]]
        local v30 = u5.values(u21)
        local v31 = table.create(#v30)
        for v32, v33 in v30 do
            local _ = v32 - 1
            v31[v32] = { v33, u20.DEFAULT }
        end
        return u5.fromEntries(v31)
    end
    local v35 = u8.Store.new
    local v36 = {
        ["Game"] = u14,
        ["Bedwars"] = u12,
        ["Clans"] = u10,
        ["Consumable"] = u11,
        ["Draft"] = u13
    }
    local v37 = u8.combineReducers(v36)
    local v38 = {}
    local v39 = {
        ["playerLevel"] = 20,
        ["freeKitLevel"] = 20,
        ["favoriteKits"] = {
            [u21.CYBER] = true,
            [u21.NAZAR] = true,
            [u21.FROSTY_HAMMER] = true
        },
        ["ownedKits"] = { u21.FROSTY_HAMMER },
        ["equippedKitSkins"] = v34()
    }
    v38.Bedwars = v39
    v38.Game = {
        ["myTeam"] = v27[1],
        ["teams"] = v27,
        ["queueType"] = u18.BEDWARS_RANKED_S16
    }
    v38.Clans = {}
    local v40 = {}
    local v41 = {
        ["1"] = {
            ["id"] = "1",
            ["matchUsesLeft"] = 3,
            ["status"] = u17.ACTIVE,
            ["consumable"] = u16.BATTLE_PASS_2X
        },
        ["2"] = {
            ["id"] = "2",
            ["status"] = u17.ACTIVE,
            ["consumable"] = u16.BATTLE_PASS_3X,
            ["endTime"] = os.clock() + 86400
        }
    }
    v40.record = v41
    v38.Consumable = v40
    local v42 = {
        ["draftMode"] = u22.MULTI_TEAM
    }
    local v43 = {
        ["draftEnded"] = false,
        ["completedPhases"] = {},
        ["matchDraftPhase"] = u23.LOADING,
        ["matchDraftPhaseEndTime"] = u9:GetServerTimeNow() + 5,
        ["kitBans"] = {
            ["1"] = { u21.CYBER },
            ["2"] = { u21.AERY }
        }
    }
    v42.sharedData = v43
    local v44 = {}
    local v45 = {
        [u4.Dummy.oiogy.userId] = {
            ["kit"] = u21.BIGMAN,
            ["selectorOption"] = u24.HOVER
        },
        [u4.Dummy.Bryan3838.userId] = {
            ["kit"] = u21.AGNI,
            ["selectorOption"] = u24.HOVER
        },
        [u4.Dummy.Chase.userId] = {
            ["kit"] = u21.SLIME_TAMER,
            ["selectorOption"] = u24.SELECT
        },
        [u4.Dummy.Asen.userId] = {
            ["kit"] = u21.AIRBENDER,
            ["selectorOption"] = u24.HOVER
        }
    }
    v44.votedKitBans = v45
    local v46 = {
        [u4.Dummy.oiogy.userId] = {
            ["kit"] = u21.METAL_DETECTOR,
            ["selectorOption"] = u24.HOVER
        },
        [u4.Dummy.Bryan3838.userId] = {
            ["kit"] = u21.SEAHORSE,
            ["selectorOption"] = u24.HOVER
        },
        [u4.Dummy.Chase.userId] = {
            ["kit"] = u21.VOID_KNIGHT,
            ["selectorOption"] = u24.SELECT
        },
        [u4.Dummy.Asen.userId] = {
            ["kit"] = u21.BLOCK_KICKER,
            ["selectorOption"] = u24.HOVER
        }
    }
    v44.kitSelection = v46
    v42.teamData = v44
    local v47 = {}
    local v48 = {
        ["playersVoted"] = {
            [u4.Dummy.DVwastaken.userId] = true
        }
    }
    v47["2"] = v48
    v42.enemyTeamData = v47
    v38.Draft = v42
    local v49 = {
        ["store"] = v35(v37, v38)
    }
    local u50 = u6.mount(u6.createElement(u7, v49, { u6.createElement(u25, {
            ["AppId"] = "MatchDraftApp",
            ["MapId"] = "to4_Blossom"
        }) }), p26)
    return function() --[[ Line: 169 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u50
        --]]
        return u6.unmount(u50)
    end
end