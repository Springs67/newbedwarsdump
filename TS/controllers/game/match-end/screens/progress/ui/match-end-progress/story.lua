-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local RankDivision = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-division").RankDivision;
local LobbyControlsWrapper = RuntimeLib.import(script, script.Parent.Parent.Parent, "lobby-controls", "ui", "lobby-controls").LobbyControlsWrapper;
local MatchEndProgressWrapper = RuntimeLib.import(script, script.Parent, "match-end-progress").MatchEndProgressWrapper;

return function(p2) -- Line: 12
    -- upvalues: ClientStore (copy), OfflinePlayerUtil (copy), RankDivision (copy), BedwarsKit (copy), ArmorTrimType (copy), CreateRoduxApp (copy), MatchEndProgressWrapper (copy), LobbyControlsWrapper (copy), u1 (copy)
    local v3 = {
        startingExperience = 5000,
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
    };
    ClientStore:dispatch({
        type = "GameSetSpectator",
        spectating = true,
        spectatingPlayer = OfflinePlayerUtil.Dummy.SnickTrix
    });
    ClientStore:dispatch({
        type = "SetMatchEndSummaryVisible",
        visible = true
    });
    local u4 = CreateRoduxApp("MatchEndProgressApp", MatchEndProgressWrapper, {
        WinningTeamId = 0,
        ClanContributionEarned = 100,
        DisableAnimation = true,
        RankChangeData = {
            rpDelta = -10,
            rankVisible = true,
            matchesPlayed = 10,
            demotionShieldActive = true,
            oldDivision = {
                rankPoints = 10,
                division = RankDivision.PLATINUM_3
            },
            newDivision = {
                rankPoints = 20,
                division = RankDivision.PLATINUM_2
            }
        },
        PlayerMatchExperienceEarned = v3,
        BattlePassMatchExperienceEarned = v3,
        BedCoinsEarned = {
            matchAmountEarned = 100,
            dailyAmountEarned = 100,
            eligible = true,
            reachedTotalCap = false
        },
        ArmorTrimXpEarned = {
            xpEarned = 400,
            kit = BedwarsKit.BARBARIAN,
            equipped = ArmorTrimType.TRIM_4
        },
        KitStatsDelta = {
            plays = 10,
            wins = 0,
            kills = 1,
            dashes = 100
        },
        EquippedKit = BedwarsKit.BARBARIAN
    }, {}, {
        Parent = p2
    });
    local u5 = CreateRoduxApp("LobbyControls", LobbyControlsWrapper, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 90
        -- upvalues: u1 (ref), u4 (copy), u5 (copy)
        u1.unmount(u4);
        u1.unmount(u5);
    end;
end;