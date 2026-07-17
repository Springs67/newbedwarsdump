-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ConfettiExplosion = v1.ConfettiExplosion;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local PvPArenaConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig;
local PvPArenaGameState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaGameState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PvPArenaRoundIconList = RuntimeLib.import(script, script.Parent, "pvp-arena-round-icon-list").PvPArenaRoundIconList;
local PvPArenaRoundMatchups = RuntimeLib.import(script, script.Parent, "pvp-arena-round-matchups").PvPArenaRoundMatchups;
local PvPArenaRoundMatchupsSolo = RuntimeLib.import(script, script.Parent, "pvp-arena-round-matchups-solo").PvPArenaRoundMatchupsSolo;
local v62 = v4.new(u3)(function(p7, p8) -- Line: 29
    -- upvalues: DeviceUtil (copy), Workspace (copy), PvPArenaConfig (copy), u3 (copy), KnitClient (copy), QueueType (copy), u2 (copy), TweenService (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), PvPArenaGameState (copy), Theme (copy), ConfettiExplosion (copy), PvPArenaRoundMatchupsSolo (copy), PvPArenaRoundMatchups (copy), ColorUtil (copy), Countdown (copy), Empty (copy), TimedProgressBar (copy), PvPArenaRoundIconList (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local v9, u10 = useState(0);
    local v11, u12 = useState(1);
    local v13, u14 = useState(not DeviceUtil.isHoarceKat());
    local v15, u16 = useState(false);
    local v17, u18 = useState(false);
    local u19, u20 = useState(Workspace:GetServerTimeNow() + PvPArenaConfig.getIntermissionRoundTime(PvPArenaConfig.isAugmentRound(v9)));
    local v21, u22 = useState(nil);
    local v23, u24 = useState(false);
    local u25 = u3.createRef();
    local v26 = u3.createRef();
    local v27 = KnitClient.Controllers.MatchController:getQueueType() == QueueType.PVP_ARENA_SOLO;
    useEffect(function() -- Line: 48
        -- upvalues: u25 (copy), u2 (ref), TweenService (ref), DeviceUtil (ref), default (ref), Players (ref), SoundManager (ref), GameSound (ref), u24 (copy), u22 (copy), u20 (copy), Workspace (ref), PvPArenaConfig (ref), u18 (copy), u10 (copy), u12 (copy), u16 (copy), PvPArenaGameState (ref), u14 (copy)
        local v28 = u25:getValue();

        if not v28 then
            return nil;
        end;

        local u29 = u2.new();
        local u30 = u2.new();
        local u31 = TweenService:Create(v28, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(0.5, 0)
        });
        local u32 = TweenService:Create(v28, TweenInfo.new(0.8, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
            Position = UDim2.fromScale(0.5, -0.5)
        });
        task.delay(0.2, function() -- Line: 62
            -- upvalues: u31 (copy)
            u31:Play();
        end);
        u29:GiveTask(u30);

        if not DeviceUtil.isHoarceKat() then
            u29:GiveTask(default.Client:Get("PvPArenaMatchupCompleted"):Connect(function(p33) -- Line: 67
                -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u24 (ref), u22 (ref), u30 (copy), u20 (ref), Workspace (ref), PvPArenaConfig (ref), u18 (ref)
                if table.find(p33.winningTeamMembers, Players.LocalPlayer) ~= nil or (table.find(p33.losingTeamMembers, Players.LocalPlayer) ~= nil or p33.roundEnded) then
                    local v34 = table.find(p33.winningTeamMembers, Players.LocalPlayer) ~= nil;

                    if v34 then
                        SoundManager:playSound(GameSound.PVP_ARENA_ROUND_WIN_CHEER);
                    end;

                    SoundManager:playSound(GameSound.PVP_ARENA_ROUND_END);
                    u24(v34);
                    u22(true);
                    u30:DoCleaning();
                    u20(Workspace:GetServerTimeNow() + PvPArenaConfig.ROUND_END_DELAY);
                    u18(false);
                end;
            end));
            u29:GiveTask(default.Client:Get("PvPArenaGameStateChanged"):Connect(function(p35) -- Line: 95
                -- upvalues: u10 (ref), u12 (ref), u16 (ref), PvPArenaGameState (ref), u30 (copy), u14 (ref), Workspace (ref), PvPArenaConfig (ref), u20 (ref), u18 (ref), u22 (ref), u32 (copy)
                if p35.roundNumber ~= nil then
                    u10(p35.roundNumber);
                end;

                if p35.stageNumber ~= nil then
                    u12(p35.stageNumber);

                    if (p35.stageNumber - 3) % 4 == 0 then
                        u16(true);
                    else
                        u16(false);
                    end;
                end;

                if p35.gameState == PvPArenaGameState.INTERMISSION then
                    u30:DoCleaning();
                    u14(true);
                    local v36 = Workspace:GetServerTimeNow();
                    local roundNumber = p35.roundNumber;
                    u20(v36 + PvPArenaConfig.getIntermissionRoundTime(PvPArenaConfig.isAugmentRound(roundNumber == nil and 0 or roundNumber)));
                    u18(false);
                    u22(nil);
                end;

                if p35.gameState == PvPArenaGameState.IN_PROGRESS then
                    u14(false);
                    u20(Workspace:GetServerTimeNow() + PvPArenaConfig.GRACE_PERIOD_TIME);
                    u22(false);
                    local u37 = task.delay(PvPArenaConfig.GRACE_PERIOD_TIME, function() -- Line: 125
                        -- upvalues: u20 (ref), Workspace (ref), PvPArenaConfig (ref)
                        u20(Workspace:GetServerTimeNow() + PvPArenaConfig.getMatchRoundTime());
                    end);
                    u30:GiveTask(function() -- Line: 128
                        -- upvalues: u37 (copy)
                        if u37 then
                            task.cancel(u37);
                        end;
                    end);
                    local u38 = task.delay(PvPArenaConfig.GRACE_PERIOD_TIME + PvPArenaConfig.getMatchRoundTime(), function() -- Line: 133
                        -- upvalues: u18 (ref)
                        u18(true);
                    end);
                    u30:GiveTask(function() -- Line: 136
                        -- upvalues: u38 (copy)
                        if u38 then
                            task.cancel(u38);
                        end;
                    end);
                end;

                if p35.gameState == PvPArenaGameState.POST then
                    u32:Play();
                end;
            end));
        end;

        return function() -- Line: 147
            -- upvalues: u29 (copy)
            u29:DoCleaning();
        end;
    end, {});
    useEffect(function() -- Line: 151
        -- upvalues: u19 (copy), Workspace (ref), u2 (ref), SoundManager (ref), GameSound (ref)
        local v39 = u19 - Workspace:GetServerTimeNow();
        local u40 = u2.new();
        local u41 = task.delay(v39 - 4, function() -- Line: 154
            -- upvalues: SoundManager (ref), GameSound (ref)
            SoundManager:playSound(GameSound.PVP_ARENA_COUNTDOWN);
        end);
        u40:GiveTask(function() -- Line: 157
            -- upvalues: u41 (copy)
            if u41 then
                task.cancel(u41);
            end;
        end);

        return function() -- Line: 162
            -- upvalues: u40 (copy)
            u40:DoCleaning();
        end;
    end, { u19 });
    local v42 = {
        ResetOnSpawn = false,
        DisplayOrder = 900,
        ScreenInsets = "None"
    };
    local v43 = {};
    local _ = #v43;
    local v44 = {
        [u3.Ref] = u25,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.3, 0.2),
        Position = UDim2.fromScale(0.5, -0.5),
        BackgroundTransparency = 0,
        BackgroundColor3 = Theme.backgroundPrimary
    };
    local v45 = {};
    local v46 = #v45;
    local v47;

    if v21 then
        if v23 then
            v47 = u3.createElement(ConfettiExplosion, {
                Lifetime = 5,
                Size = UDim2.fromScale(2, 2),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            v47 = v23;
        end;
    else
        v47 = v21;
    end;

    if v47 then
        v45[v46 + 1] = v47;
    end;

    local v48 = #v45;
    v45[v48 + 1] = u3.createElement("UIAspectRatioConstraint", {
        AspectRatio = 2.6
    });
    v45[v48 + 2] = u3.createElement("UICorner", {
        CornerRadius = UDim.new(0, 12)
    });
    v45[v48 + 3] = u3.createElement("UIStroke", {
        Thickness = 3,
        Transparency = 0.3,
        Color = Theme.backgroundSecondary
    });
    local v49;

    if v27 then
        v49 = u3.createElement(PvPArenaRoundMatchupsSolo);
    else
        v49 = u3.createElement(PvPArenaRoundMatchups);
    end;

    v45[v48 + 4] = v49;
    local v50 = #v45;
    local v51;

    if v13 then
        if v15 then
            v51 = u3.createFragment({
                AugmentText = u3.createElement("TextLabel", {
                    Text = "Relic",
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.24, 0.24),
                    Position = UDim2.fromScale(0.5, 0.62),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Font = Enum.Font.LuckiestGuy,
                    TextColor3 = ColorUtil.WHITE
                }, { u3.createElement("UIStroke", {
                        Thickness = 3,
                        Transparency = 0.5,
                        Color = ColorUtil.BLACK
                    }) })
            });
        else
            v51 = v15;
        end;
    else
        v51 = v13;
    end;

    if v51 then
        v45[v50 + 1] = v51;
    end;

    local v52 = #v45;
    local v53 = v13 and not v15 and u3.createFragment({
        IntermissionText = u3.createElement("TextLabel", {
            Text = "INTERMISSION",
            TextScaled = true,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.3, 0.25),
            Position = UDim2.fromScale(0.5, 0.6),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.LuckiestGuy,
            TextColor3 = ColorUtil.WHITE
        }, { u3.createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.5,
                Color = ColorUtil.BLACK
            }) })
    });

    if v53 then
        v45[v52 + 1] = v53;
    end;

    local v54 = #v45;
    local v55 = not v13 and u3.createFragment({
        RoundNumber = u3.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            Text = "Round " .. tostring(v9),
            Size = UDim2.fromScale(0.25, 0.25),
            Position = UDim2.fromScale(0.5, 0.6),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Font = Enum.Font.LuckiestGuy,
            TextColor3 = ColorUtil.WHITE
        }, { u3.createElement("UIStroke", {
                Thickness = 2,
                Transparency = 0.5,
                Color = ColorUtil.BLACK
            }) })
    });

    if v55 then
        v45[v54 + 1] = v55;
    end;

    local v56 = #v45;
    local v57;

    if v21 == true then
        v57 = false;
    else
        v57 = u3.createElement(Countdown, {
            EndTime = math.round(u19),
            TextLabel = {
                BackgroundTransparency = 1,
                RichText = false,
                ZIndex = 99,
                Size = UDim2.fromScale(0.25, 0.25),
                Position = UDim2.fromScale(0.5, 1.11),
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.fromName("LuckiestGuy", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            },
            CountdownConfig = {
                minutes = false,
                hours = false,
                days = false
            }
        }, { u3.createElement("UIStroke", {
                [u3.Ref] = v26,
                Color = ColorUtil.BLACK,
                Thickness = 3,
                Transparency = 0.5
            }) });
    end;

    if v57 then
        v45[v56 + 1] = v57;
    end;

    local v58 = #v45;

    if v17 then
        if v21 == true then
            v17 = false;
        else
            v17 = u3.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "SUDDEN\nDEATH",
                TextScaled = true,
                RichText = false,
                ZIndex = 99,
                Size = UDim2.fromScale(0.25, 0.25),
                Position = UDim2.fromScale(0.5, 1.075),
                AnchorPoint = Vector2.new(0.5, 0.5),
                FontFace = Font.fromName("LuckiestGuy", Enum.FontWeight.Bold),
                TextColor3 = ColorUtil.WHITE
            }, { u3.createElement("UIStroke", {
                    Thickness = 3,
                    Transparency = 0.5,
                    Color = ColorUtil.BLACK
                }) });
        end;
    end;

    if v17 then
        v45[v58 + 1] = v17;
    end;

    local v59 = #v45;
    local v60;

    if v21 == true then
        v60 = not v13 and u3.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            RichText = false,
            ZIndex = 99,
            Size = UDim2.fromScale(0.25, 0.25),
            Position = UDim2.fromScale(0.5, 1.075),
            AnchorPoint = Vector2.new(0.5, 0.5),
            FontFace = Font.fromName("LuckiestGuy", Enum.FontWeight.Bold),
            TextColor3 = ColorUtil.WHITE,
            Text = "ROUND " .. (v23 and "WON" or "LOSS")
        }, { u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0.5,
                Color = ColorUtil.BLACK
            }) });
    else
        v60 = false;
    end;

    if v60 then
        v45[v59 + 1] = v60;
    end;

    local v61 = #v45;
    v45[v61 + 1] = u3.createElement(Empty, {
        Size = UDim2.fromScale(0.8, 0.05),
        Position = UDim2.fromScale(0.5, 1.05),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }, { u3.createElement(TimedProgressBar, {
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            AnchorPoint = Vector2.new(0.5, 0.5),
            EndTime = u19,
            ProgressBarConfig = {
                Flip = true,
                GradientRotation = 180,
                BarGradient = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
            }
        }, { u3.createElement("UIStroke", {
                Thickness = 3,
                Transparency = 0.3,
                Color = Theme.backgroundSecondary
            }) }) });
    v45[v61 + 2] = u3.createElement(PvPArenaRoundIconList, {
        stageNumber = v11,
        roundNumber = v9
    });
    v43.PvPArenaRoundUIBackground = u3.createElement("Frame", v44, v45);

    return u3.createElement("ScreenGui", v42, v43);
end);

return {
    PvPArenaRoundUI = v5.connect(function(p63, p64) -- Line: 376
        local v65 = {};

        for i, v in p64 do
            v65[i] = v;
        end;

        return v65;
    end)(v62)
};