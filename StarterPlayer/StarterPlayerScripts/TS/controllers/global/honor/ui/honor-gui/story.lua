local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.OfflinePlayerUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u11 = v1.import(script, script.Parent, "honor-gui").HonorGUI
return function(p12) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u10
        [4] = u7
        [5] = u9
        [6] = u8
        [7] = u5
        [8] = u6
        [9] = u11
    --]]
    local v13 = {}
    local v14 = {
        ["id"] = "1",
        ["name"] = "Blue",
        ["members"] = {
            [u4.Dummy.Asen.userId] = u4.Dummy.Asen,
            [u4.Dummy.Bryan3838.userId] = u4.Dummy.Bryan3838,
            [u4.Dummy.Candelz.userId] = u4.Dummy.Candelz,
            [u4.Dummy.Chase.userId] = u4.Dummy.Chase
        },
        ["color"] = u3.hexColor(u10.lightBlue)
    }
    local v15 = {
        ["id"] = "2",
        ["name"] = "Orange",
        ["members"] = {
            [u4.Dummy.DVwastaken.userId] = u4.Dummy.DVwastaken,
            [u4.Dummy.JKJ.userId] = u4.Dummy.JKJ,
            [u4.Dummy.LongNameMan.userId] = u4.Dummy.LongNameMan,
            [u4.Dummy.Midciel.userId] = u4.Dummy.Midciel
        },
        ["color"] = u3.hexColor(u10.orange)
    }
    local v16 = {
        ["id"] = "3",
        ["name"] = "Pink",
        ["members"] = {
            [u4.Dummy.Rascal.userId] = u4.Dummy.Rascal,
            [u4.Dummy.SnickTrix.userId] = u4.Dummy.SnickTrix,
            [u4.Dummy.SteamPulse.userId] = u4.Dummy.SteamPulse,
            [u4.Dummy.Vorlias.userId] = u4.Dummy.Vorlias
        },
        ["color"] = u3.hexColor(u10.pink)
    }
    local v17 = {
        ["id"] = "4",
        ["name"] = "Yellow",
        ["members"] = {
            [u4.Dummy.grilme99.userId] = u4.Dummy.grilme99,
            [u4.Dummy.leoduquartier.userId] = u4.Dummy.leoduquartier,
            [u4.Dummy.oiogy.userId] = u4.Dummy.oiogy,
            [u4.Dummy.spleenhook.userId] = u4.Dummy.spleenhook
        },
        ["color"] = u3.hexColor(u10.yellow)
    }
    __set_list(v13, 1, {v14, v15, v16, v17})
    local v18 = {
        {
            ["teamId"] = "1",
            ["playerInfo"] = u4.Dummy.Asen
        },
        {
            ["teamId"] = "1",
            ["playerInfo"] = u4.Dummy.Bryan3838
        },
        {
            ["teamId"] = "1",
            ["playerInfo"] = u4.Dummy.Candelz
        },
        {
            ["teamId"] = "1",
            ["playerInfo"] = u4.Dummy.Chase
        },
        {
            ["teamId"] = "2",
            ["playerInfo"] = u4.Dummy.DVwastaken
        },
        {
            ["teamId"] = "2",
            ["playerInfo"] = u4.Dummy.JKJ
        },
        {
            ["teamId"] = "2",
            ["playerInfo"] = u4.Dummy.LongNameMan
        },
        {
            ["teamId"] = "2",
            ["playerInfo"] = u4.Dummy.Midciel
        },
        {
            ["teamId"] = "3",
            ["playerInfo"] = u4.Dummy.Rascal
        },
        {
            ["teamId"] = "3",
            ["playerInfo"] = u4.Dummy.SnickTrix
        },
        {
            ["teamId"] = "3",
            ["playerInfo"] = u4.Dummy.SteamPulse
        },
        {
            ["teamId"] = "3",
            ["playerInfo"] = u4.Dummy.Vorlias
        },
        {
            ["teamId"] = "4",
            ["playerInfo"] = u4.Dummy.grilme99
        },
        {
            ["teamId"] = "4",
            ["playerInfo"] = u4.Dummy.leoduquartier
        },
        {
            ["teamId"] = "4",
            ["playerInfo"] = u4.Dummy.oiogy
        },
        {
            ["teamId"] = "4",
            ["playerInfo"] = u4.Dummy.spleenhook
        }
    }
    local v19 = u7.Store.new
    local v20 = {
        ["Game"] = u9,
        ["Bedwars"] = u8
    }
    local v21 = u7.combineReducers(v20)
    local v22 = {
        ["Game"] = {
            ["teams"] = v13,
            ["myTeam"] = v13[1],
            ["honoredPlayers"] = {}
        }
    }
    local v23 = {
        ["finalDeaths"] = {
            [v18[1].playerInfo.userId] = true,
            [v18[2].playerInfo.userId] = true
        }
    }
    v22.Bedwars = v23
    local v24 = v19(v21, v22)
    local u25 = u5.mount(u5.createElement(u6, {
        ["store"] = v24
    }, { u5.createElement(u11, {
            ["AppId"] = "HonorGUI",
            ["PadBottom"] = true,
            ["PlayerDatas"] = v18
        }) }), p12)
    return function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u25
        --]]
        return u5.unmount(u25)
    end
end