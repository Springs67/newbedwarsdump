-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local getEmoteAsset = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local AuditTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "host-panel", "host-panel-settings.dto").AuditTag;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local CustomMatchHostPanelApp = RuntimeLib.import(script, script.Parent, "custom-match-host-panel-app").CustomMatchHostPanelApp;

return function(p3) -- Line: 15
    -- upvalues: OfflinePlayerUtil (copy), ColorUtil (copy), TeamColorHex (copy), ClientStore (copy), getEmoteAsset (copy), EmoteType (copy), QueueType (copy), AuditTag (copy), CreateRoduxApp (copy), CustomMatchHostPanelApp (copy), u2 (copy)
    ClientStore:dispatch({
        type = "GameSetTeams",
        teams = {
            {
                id = "2",
                name = "Red",
                members = {
                    [OfflinePlayerUtil.Dummy.SnickTrix.userId] = OfflinePlayerUtil.Dummy.SnickTrix,
                    [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                    [OfflinePlayerUtil.Dummy.Vorlias.userId] = OfflinePlayerUtil.Dummy.Vorlias,
                    [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal,
                    [OfflinePlayerUtil.Dummy.SteamPulse.userId] = OfflinePlayerUtil.Dummy.SteamPulse,
                    [OfflinePlayerUtil.Dummy.Candelz.userId] = OfflinePlayerUtil.Dummy.Candelz,
                    [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                    [OfflinePlayerUtil.Dummy.JKJ.userId] = OfflinePlayerUtil.Dummy.JKJ
                },
                color = ColorUtil.hexColor(TeamColorHex.red)
            },
            {
                id = "1",
                name = "Blue",
                members = {
                    [OfflinePlayerUtil.Dummy.grilme99.userId] = OfflinePlayerUtil.Dummy.grilme99,
                    [OfflinePlayerUtil.Dummy.LongNameMan.userId] = OfflinePlayerUtil.Dummy.LongNameMan,
                    [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
                },
                color = ColorUtil.hexColor(TeamColorHex.lightBlue)
            },
            {
                id = "3",
                name = "Green",
                members = {
                    [OfflinePlayerUtil.Dummy.spleenhook.userId] = OfflinePlayerUtil.Dummy.spleenhook
                },
                color = ColorUtil.hexColor(TeamColorHex.green)
            },
            {
                id = "4",
                name = "Yellow",
                members = {},
                color = ColorUtil.hexColor(TeamColorHex.yellow)
            },
            {
                id = "5",
                name = "Cyan",
                members = {
                    [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                    [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                    [OfflinePlayerUtil.Dummy.Midciel.userId] = OfflinePlayerUtil.Dummy.Midciel,
                    [OfflinePlayerUtil.Dummy.leoduquartier.userId] = OfflinePlayerUtil.Dummy.leoduquartier
                },
                color = ColorUtil.hexColor(TeamColorHex.cyan)
            }
        }
    });
    ClientStore:dispatch({
        type = "CustomMatchSetMapSaves",
        mapSaves = {
            {
                name = "Aqua 2v2",
                description = "nothing",
                code = "1234ABCD5678",
                published = false,
                copylock = true,
                image = getEmoteAsset(EmoteType.YUZI_HYPE),
                creator = OfflinePlayerUtil.Dummy.oiogy.userId,
                queueType = QueueType.BEDWARS_TO4,
                dateCreated = os.time(),
                lastUpdated = os.time()
            },
            {
                name = "Maze Map",
                description = "nothing",
                code = "1234ABCD5678",
                published = true,
                copylock = true,
                image = getEmoteAsset(EmoteType.LASSY_CELEBRATION),
                creator = OfflinePlayerUtil.Dummy.oiogy.userId,
                queueType = QueueType.BEDWARS_20v20,
                dateCreated = os.time(),
                lastUpdated = os.time()
            }
        }
    });
    ClientStore:dispatch({
        type = "CustomMatchSetHostPanelAuditLog",
        updateType = "set",
        hostPanelAuditLog = {
            {
                property = "Speed",
                message = "Speed changed from 12 to 42",
                tag = AuditTag.COMMAND,
                time = os.time(),
                executor = OfflinePlayerUtil.Dummy.oiogy
            },
            {
                property = "Diamond Generator",
                message = "Speed changed from 12 to 42",
                tag = AuditTag.HOST_PANEL,
                time = os.time(),
                executor = OfflinePlayerUtil.Dummy.oiogy
            }
        }
    });
    local u4 = CreateRoduxApp("CustomMatchHostPanelApp", CustomMatchHostPanelApp, {}, {}, {
        Parent = p3
    });

    return function() -- Line: 113
        -- upvalues: u2 (ref), u4 (copy)
        return u2.unmount(u4);
    end;
end;