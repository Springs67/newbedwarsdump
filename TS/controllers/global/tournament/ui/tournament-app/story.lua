-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local RegionValues = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").RegionValues;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local TournamentReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "tournament-reducer").TournamentReducer;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local TournamentDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-types").TournamentDivision;
local TournamentApp = RuntimeLib.import(script, script.Parent, "tournament-app").TournamentApp;

return function(p3) -- Line: 13
    -- upvalues: u2 (copy), GameReducer (copy), TournamentReducer (copy), EmoteType (copy), OfflinePlayerUtil (copy), RegionValues (copy), TournamentDivision (copy), u1 (copy), StoreProvider (copy), TournamentApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Tournament = TournamentReducer
    }), {
        Tournament = {
            myTeamId = "1",
            myTeamName = "Faze Clan",
            myTeamIcon = EmoteType.ACADEMY_AERY_GL,
            myTeamLeader = OfflinePlayerUtil.Dummy.oiogy.userId,
            myTeamRegion = RegionValues.NA,
            myTeamMembers = { OfflinePlayerUtil.Dummy.Asen.userId, OfflinePlayerUtil.Dummy.Chase.userId, OfflinePlayerUtil.Dummy.Bryan3838.userId },
            outboundTournamentInvites = { OfflinePlayerUtil.Dummy.spleenhook.userId, OfflinePlayerUtil.Dummy.SnickTrix.userId, OfflinePlayerUtil.Dummy.DVwastaken.userId },
            incomingTournamentInvites = {
                {
                    teamId = "2",
                    teamName = "Jeep Joggers",
                    teamTag = "JJ",
                    weekId = "22",
                    teamIcon = EmoteType.AXOLOTL_SLEEPING,
                    division = TournamentDivision.Division_I,
                    invitingPlayer = OfflinePlayerUtil.Dummy.Midciel.userId
                }
            },
            myTeamDivision = TournamentDivision.Division_I
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(TournamentApp, {
            AppId = "TournamentApp"
        }) }), p3);

    return function() -- Line: 45
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;