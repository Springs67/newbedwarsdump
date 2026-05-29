local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.OfflinePlayerUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").AuditTag
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u13 = v1.import(script, script.Parent, "custom-match-host-panel-app").CustomMatchHostPanelApp
return function(p14) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u10
        [4] = u7
        [5] = u8
        [6] = u12
        [7] = u9
        [8] = u11
        [9] = u6
        [10] = u13
        [11] = u5
    --]]
    local v15 = {}
    local v16 = {
        ["id"] = "2",
        ["name"] = "Red",
        ["members"] = {
            [u4.Dummy.SnickTrix.userId] = u4.Dummy.SnickTrix,
            [u4.Dummy.oiogy.userId] = u4.Dummy.oiogy,
            [u4.Dummy.Vorlias.userId] = u4.Dummy.Vorlias,
            [u4.Dummy.Rascal.userId] = u4.Dummy.Rascal,
            [u4.Dummy.SteamPulse.userId] = u4.Dummy.SteamPulse,
            [u4.Dummy.Candelz.userId] = u4.Dummy.Candelz,
            [u4.Dummy.Asen.userId] = u4.Dummy.Asen,
            [u4.Dummy.JKJ.userId] = u4.Dummy.JKJ
        },
        ["color"] = u3.hexColor(u10.red)
    }
    local v17 = {
        ["id"] = "1",
        ["name"] = "Blue",
        ["members"] = {
            [u4.Dummy.grilme99.userId] = u4.Dummy.grilme99,
            [u4.Dummy.LongNameMan.userId] = u4.Dummy.LongNameMan,
            [u4.Dummy.DVwastaken.userId] = u4.Dummy.DVwastaken
        },
        ["color"] = u3.hexColor(u10.lightBlue)
    }
    local v18 = {
        ["id"] = "3",
        ["name"] = "Green",
        ["members"] = {
            [u4.Dummy.spleenhook.userId] = u4.Dummy.spleenhook
        },
        ["color"] = u3.hexColor(u10.green)
    }
    local v19 = {
        ["id"] = "4",
        ["name"] = "Yellow",
        ["members"] = {},
        ["color"] = u3.hexColor(u10.yellow)
    }
    local v20 = {
        ["id"] = "5",
        ["name"] = "Cyan",
        ["members"] = {
            [u4.Dummy.Bryan3838.userId] = u4.Dummy.Bryan3838,
            [u4.Dummy.Chase.userId] = u4.Dummy.Chase,
            [u4.Dummy.Midciel.userId] = u4.Dummy.Midciel,
            [u4.Dummy.leoduquartier.userId] = u4.Dummy.leoduquartier
        },
        ["color"] = u3.hexColor(u10.cyan)
    }
    __set_list(v15, 1, {v16, v17, v18, v19, v20})
    u7:dispatch({
        ["type"] = "GameSetTeams",
        ["teams"] = v15
    })
    local v21 = u7
    local v22 = {
        ["type"] = "CustomMatchSetMapSaves",
        ["mapSaves"] = {
            {
                ["name"] = "Aqua 2v2",
                ["description"] = "nothing",
                ["code"] = "1234ABCD5678",
                ["published"] = false,
                ["copylock"] = true,
                ["image"] = u8(u12.YUZI_HYPE),
                ["creator"] = u4.Dummy.oiogy.userId,
                ["queueType"] = u9.BEDWARS_TO4,
                ["dateCreated"] = os.time(),
                ["lastUpdated"] = os.time()
            },
            {
                ["name"] = "Maze Map",
                ["description"] = "nothing",
                ["code"] = "1234ABCD5678",
                ["published"] = true,
                ["copylock"] = true,
                ["image"] = u8(u12.LASSY_CELEBRATION),
                ["creator"] = u4.Dummy.oiogy.userId,
                ["queueType"] = u9.BEDWARS_20v20,
                ["dateCreated"] = os.time(),
                ["lastUpdated"] = os.time()
            }
        }
    }
    v21:dispatch(v22)
    local v23 = u7
    local v24 = {
        ["type"] = "CustomMatchSetHostPanelAuditLog",
        ["updateType"] = "set",
        ["hostPanelAuditLog"] = {
            {
                ["property"] = "Speed",
                ["message"] = "Speed changed from 12 to 42",
                ["tag"] = u11.COMMAND,
                ["time"] = os.time(),
                ["executor"] = u4.Dummy.oiogy
            },
            {
                ["property"] = "Diamond Generator",
                ["message"] = "Speed changed from 12 to 42",
                ["tag"] = u11.HOST_PANEL,
                ["time"] = os.time(),
                ["executor"] = u4.Dummy.oiogy
            }
        }
    }
    v23:dispatch(v24)
    local u25 = u6("CustomMatchHostPanelApp", u13, {}, {}, {
        ["Parent"] = p14
    })
    return function() --[[ Line: 113 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u25
        --]]
        return u5.unmount(u25)
    end
end