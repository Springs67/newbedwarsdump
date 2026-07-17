-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local RankDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
local LobbyControlsWrapper = RuntimeLib.import(script, script.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper;
local WinningTeamWrapper = RuntimeLib.import(script, script.Parent, "winning-team", "ui", "winning-team").WinningTeamWrapper;

return function(p2) -- Line: 10
    -- upvalues: ClientStore (copy), OfflinePlayerUtil (copy), RankDivision (copy), CreateRoduxApp (copy), WinningTeamWrapper (copy), LobbyControlsWrapper (copy), u1 (copy)
    ClientStore:dispatch({
        type = "BedwarsSetMatchExperienceEarned",
        matchExperienceEarned = {
            startingExperience = 0,
            totalExperienceEarned = 3100,
            reasons = { {
                    experience = 900,
                    name = "Victory"
                }, {
                    experience = 200,
                    name = "Game Finish"
                }, {
                    experience = 2000,
                    name = "Battle Pass XP Bonus"
                } }
        }
    });
    ClientStore:dispatch({
        type = "GameSetSpectator",
        spectating = true,
        spectatingPlayer = OfflinePlayerUtil.Dummy.SnickTrix
    });
    local _ = {
        rpDelta = 110,
        rankVisible = true,
        matchesPlayed = 10,
        demotionShieldActive = true,
        oldDivision = {
            rankPoints = 80,
            division = RankDivision.PLATINUM_3
        },
        newDivision = {
            rankPoints = 10,
            division = RankDivision.PLATINUM_3
        }
    };
    local u3 = CreateRoduxApp("WinningTeam", WinningTeamWrapper, {
        WinningTeamId = 0,
        NewLeaderboardPos = 12673,
        PreviousLeaderboardPos = 63864
    }, {}, {
        Parent = p2
    });
    local u4 = CreateRoduxApp("LobbyControls", LobbyControlsWrapper, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 72
        -- upvalues: u1 (ref), u3 (copy), u4 (copy)
        u1.unmount(u3);
        u1.unmount(u4);
    end;
end;