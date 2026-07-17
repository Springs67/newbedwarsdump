-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local HonorGUI = RuntimeLib.import(script, script.Parent, "honor-gui").HonorGUI;

return function(p4) -- Line: 13
    -- upvalues: OfflinePlayerUtil (copy), ColorUtil (copy), TeamColorHex (copy), u3 (copy), GameReducer (copy), BedwarsReducer (copy), u2 (copy), StoreProvider (copy), HonorGUI (copy)
    local v5 = {
        {
            id = "1",
            name = "Blue",
            members = {
                [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen,
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                [OfflinePlayerUtil.Dummy.Candelz.userId] = OfflinePlayerUtil.Dummy.Candelz,
                [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase
            },
            color = ColorUtil.hexColor(TeamColorHex.lightBlue)
        },
        {
            id = "2",
            name = "Orange",
            members = {
                [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken,
                [OfflinePlayerUtil.Dummy.JKJ.userId] = OfflinePlayerUtil.Dummy.JKJ,
                [OfflinePlayerUtil.Dummy.LongNameMan.userId] = OfflinePlayerUtil.Dummy.LongNameMan,
                [OfflinePlayerUtil.Dummy.Midciel.userId] = OfflinePlayerUtil.Dummy.Midciel
            },
            color = ColorUtil.hexColor(TeamColorHex.orange)
        },
        {
            id = "3",
            name = "Pink",
            members = {
                [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal,
                [OfflinePlayerUtil.Dummy.SnickTrix.userId] = OfflinePlayerUtil.Dummy.SnickTrix,
                [OfflinePlayerUtil.Dummy.SteamPulse.userId] = OfflinePlayerUtil.Dummy.SteamPulse,
                [OfflinePlayerUtil.Dummy.Vorlias.userId] = OfflinePlayerUtil.Dummy.Vorlias
            },
            color = ColorUtil.hexColor(TeamColorHex.pink)
        },
        {
            id = "4",
            name = "Yellow",
            members = {
                [OfflinePlayerUtil.Dummy.grilme99.userId] = OfflinePlayerUtil.Dummy.grilme99,
                [OfflinePlayerUtil.Dummy.leoduquartier.userId] = OfflinePlayerUtil.Dummy.leoduquartier,
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                [OfflinePlayerUtil.Dummy.spleenhook.userId] = OfflinePlayerUtil.Dummy.spleenhook
            },
            color = ColorUtil.hexColor(TeamColorHex.yellow)
        }
    };
    local v6 = {
        {
            teamId = "1",
            playerInfo = OfflinePlayerUtil.Dummy.Asen
        },
        {
            teamId = "1",
            playerInfo = OfflinePlayerUtil.Dummy.Bryan3838
        },
        {
            teamId = "1",
            playerInfo = OfflinePlayerUtil.Dummy.Candelz
        },
        {
            teamId = "1",
            playerInfo = OfflinePlayerUtil.Dummy.Chase
        },
        {
            teamId = "2",
            playerInfo = OfflinePlayerUtil.Dummy.DVwastaken
        },
        {
            teamId = "2",
            playerInfo = OfflinePlayerUtil.Dummy.JKJ
        },
        {
            teamId = "2",
            playerInfo = OfflinePlayerUtil.Dummy.LongNameMan
        },
        {
            teamId = "2",
            playerInfo = OfflinePlayerUtil.Dummy.Midciel
        },
        {
            teamId = "3",
            playerInfo = OfflinePlayerUtil.Dummy.Rascal
        },
        {
            teamId = "3",
            playerInfo = OfflinePlayerUtil.Dummy.SnickTrix
        },
        {
            teamId = "3",
            playerInfo = OfflinePlayerUtil.Dummy.SteamPulse
        },
        {
            teamId = "3",
            playerInfo = OfflinePlayerUtil.Dummy.Vorlias
        },
        {
            teamId = "4",
            playerInfo = OfflinePlayerUtil.Dummy.grilme99
        },
        {
            teamId = "4",
            playerInfo = OfflinePlayerUtil.Dummy.leoduquartier
        },
        {
            teamId = "4",
            playerInfo = OfflinePlayerUtil.Dummy.oiogy
        },
        {
            teamId = "4",
            playerInfo = OfflinePlayerUtil.Dummy.spleenhook
        }
    };
    local v7 = u3.Store.new(u3.combineReducers({
        Game = GameReducer,
        Bedwars = BedwarsReducer
    }), {
        Game = {
            teams = v5,
            myTeam = v5[1],
            honoredPlayers = {}
        },
        Bedwars = {
            finalDeaths = {
                [v6[1].playerInfo.userId] = true,
                [v6[2].playerInfo.userId] = true
            }
        }
    });
    local u8 = u2.mount(u2.createElement(StoreProvider, {
        store = v7
    }, { u2.createElement(HonorGUI, {
            AppId = "HonorGUI",
            PadBottom = true,
            PlayerDatas = v6
        }) }), p4);

    return function() -- Line: 129
        -- upvalues: u2 (ref), u8 (copy)
        return u2.unmount(u8);
    end;
end;