-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DarkBackground = v1.DarkBackground;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local TimedProgressBar = v1.TimedProgressBar;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local Workspace = v6.Workspace;
local u7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tableutil");
local MatchDraftPlayerRow = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "game", "pregame", "draft", "ui", "match-draft-player-row").MatchDraftPlayerRow;
local CircleCountdown = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown").CircleCountdown;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KitPoolFrame = RuntimeLib.import(script, script.Parent, "kit-pool-frame").KitPoolFrame;
local v80 = v4.new(u3)(function(u8, p9) -- Line: 28
    -- upvalues: u3 (copy), DeviceUtil (copy), default (copy), Flamework (copy), SoundManager (copy), GameSound (copy), u7 (copy), BedwarsKit (copy), DarkBackground (copy), Empty (copy), ColorUtil (copy), TimedProgressBar (copy), Workspace (copy), CircleCountdown (copy), u2 (copy), Players (copy), MatchDraftPlayerRow (copy), KitPoolFrame (copy), ButtonComponent (copy), Padding (copy)
    local _ = p9.useEffect;
    local _ = p9.useState;
    local _ = p9.useValue;
    local useMemo = p9.useMemo;
    local myTeam = u8.store.Game.myTeam;

    local function _(p10) -- Line: 35
        -- upvalues: myTeam (copy)
        local v11 = myTeam;

        if v11 ~= nil then
            v11 = v11.id;
        end;

        return p10.id ~= v11;
    end;

    local v12 = nil;

    for i, v in u8.store.Game.teams do
        local _ = i - 1;
        local v13;

        if myTeam == nil then
            v13 = myTeam;
        else
            v13 = myTeam.id;
        end;

        if v.id ~= v13 == true then
            v12 = v;
        end;
    end;

    if not (myTeam and v12) then
        return u3.createFragment();
    end;

    local v14 = u3.createRef();
    local v15 = u3.createRef();
    local v16 = u3.createRef();

    local function u19(p17) -- Line: 59
        -- upvalues: DeviceUtil (ref), default (ref), Flamework (ref), SoundManager (ref), GameSound (ref)
        if not p17 then
            return nil;
        end;

        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local v18 = default.Client:Get("SwapKit"):CallServer(p17);

        if not v18.success then
            local message = v18.message;

            if message == "" or not message then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = v18.message
            });

            return nil;
        end;

        SoundManager:playSound(GameSound.UI_CLICK);
    end;

    local function u21() -- Line: 79
        -- upvalues: DeviceUtil (ref), default (ref), Flamework (ref), SoundManager (ref), GameSound (ref)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local v20 = default.Client:Get("RerollKit"):CallServer();

        if not v20.success then
            local message = v20.message;

            if message == "" or not message then
                return nil;
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = v20.message
            });

            return nil;
        end;

        SoundManager:playSound(GameSound.UI_CLICK);
    end;

    local v22 = u7.Reverse(u8.store.ARKDraft.kitPool);
    local v23 = #v22;
    local v24 = false;
    local v25 = 0;

    while true do
        if v24 then
            v25 = v25 + 1;
        else
            v24 = true;
        end;

        if v25 >= 8 - v23 then
            local v26 = {
                DisplayOrder = 1500,
                IgnoreGuiInset = true
            };
            local v27 = { u3.createElement(DarkBackground, {
                    AppId = u8.AppId
                }) };
            local _ = #v27;
            local v28 = {
                AutoButtonColor = false,
                Image = "rbxassetid://71356717298935",
                Modal = true,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Crop
            };
            local v29 = {
                ARKSDraftAppBackgroundTint = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 1)
                }, {
                    HeaderPane = u3.createElement("Frame", {
                        Transparency = 0.2,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(1, 0.25),
                        BackgroundColor3 = ColorUtil.BLACK
                    }),
                    LeftPane = u3.createElement("Frame", {
                        Transparency = 0.2,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(0.25, 0.75),
                        Position = UDim2.fromScale(0, 0.25),
                        BackgroundColor3 = ColorUtil.BLACK
                    }),
                    RightPane = u3.createElement("Frame", {
                        Transparency = 0.2,
                        BorderSizePixel = 0,
                        Size = UDim2.fromScale(0.25, 0.75),
                        Position = UDim2.fromScale(1, 0.25),
                        AnchorPoint = Vector2.new(1, 0),
                        BackgroundColor3 = ColorUtil.BLACK
                    }),
                    CenterBodyPane = u3.createElement("Frame", {
                        Transparency = 0.2,
                        BorderSizePixel = 0,
                        ZIndex = 1,
                        Size = UDim2.fromScale(0.5, 0.75),
                        Position = UDim2.fromScale(0.5, 0.25),
                        AnchorPoint = Vector2.new(0.5, 0),
                        BackgroundColor3 = ColorUtil.BLACK
                    })
                }),
                BackgroundGradient = u3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.BLACK,
                    [u3.Ref] = v14
                }, { u3.createElement("UIGradient", {
                        Rotation = 90,
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.625, 1), NumberSequenceKeypoint.new(1, 0.3) }),
                        Color = ColorSequence.new(ColorUtil.WHITE)
                    }) }),
                HeaderContainer = u3.createElement(Empty, {
                    Size = UDim2.fromScale(1, 0.25),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0)
                }, { u3.createElement(Empty, {
                        Size = UDim2.fromScale(0.5, 1),
                        Position = UDim2.fromScale(0.5, 0.5),
                        AnchorPoint = Vector2.new(0.5, 0.5)
                    }, {
                        PhaseTitleContainer = u3.createElement(Empty, {
                            Size = UDim2.fromScale(1, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0),
                            Position = UDim2.fromScale(0.5, 0),
                            [u3.Ref] = v15
                        }),
                        useMemo(function() -- Line: 198
                            -- upvalues: u3 (ref), Empty (ref), TimedProgressBar (ref), Workspace (ref), u8 (copy), CircleCountdown (ref), GameSound (ref)
                            return u3.createFragment({
                                CountdownSection = u3.createElement(Empty, {
                                    Size = UDim2.fromScale(1, 0.5),
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.68)
                                }, { u3.createElement(Empty, {
                                        Size = UDim2.new(0.45, 0, 0.15, 0),
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        Position = UDim2.fromScale(0, 0.5)
                                    }, { u3.createElement("UIPadding", {
                                            PaddingRight = UDim.new(0.1, 0),
                                            PaddingLeft = UDim.new(0.1, 0)
                                        }), u3.createElement(TimedProgressBar, {
                                            Rotation = 180,
                                            Size = UDim2.fromScale(1, 1),
                                            StartTime = Workspace:GetServerTimeNow(),
                                            EndTime = u8.store.Game.startTime,
                                            BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                                            ProgressBarConfig = {
                                                GradientRotation = 180,
                                                Flip = true,
                                                BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                                            }
                                        }) }), u3.createElement(CircleCountdown, {
                                        OnlyPlaySoundLastNSec = 10,
                                        EndTime = u8.store.Game.startTime,
                                        FrameProps = {
                                            ZIndex = 3,
                                            Size = UDim2.fromScale(0.2, 0.9),
                                            Position = UDim2.fromScale(0.5, 0.5),
                                            AnchorPoint = Vector2.new(0.5, 0.5)
                                        },
                                        PlayCustomSoundAtTime = {
                                            timeLeftSec = 3,
                                            sound = GameSound.LTM_GOAL_MOVING_SOUND
                                        }
                                    }), u3.createElement(Empty, {
                                        Size = UDim2.new(0.45, 0, 0.15, 0),
                                        AnchorPoint = Vector2.new(1, 0.5),
                                        Position = UDim2.fromScale(1, 0.5)
                                    }, { u3.createElement("UIPadding", {
                                            PaddingRight = UDim.new(0.1, 0),
                                            PaddingLeft = UDim.new(0.1, 0)
                                        }), u3.createElement(TimedProgressBar, {
                                            Size = UDim2.fromScale(1, 1),
                                            StartTime = Workspace:GetServerTimeNow(),
                                            EndTime = u8.store.Game.startTime,
                                            BackgroundColor3 = Color3.fromRGB(64, 5, 5),
                                            ProgressBarConfig = {
                                                GradientRotation = 180,
                                                Flip = true,
                                                BarGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 56, 56)) })
                                            }
                                        }) }) })
                            });
                        end, { u8.store.Game.startTime })
                    }) })
            };
            local _ = #v29;
            local v30 = {
                Size = UDim2.fromScale(1, 0.75),
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.25)
            };
            local v31 = { u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 0),
                    PaddingBottom = UDim.new(0.04, 0),
                    PaddingLeft = UDim.new(0.04, 0),
                    PaddingRight = UDim.new(0.04, 0)
                }) };
            local _ = #v31;
            local v32;

            if myTeam == nil then
                v32 = myTeam;
            else
                v32 = myTeam.members;
            end;

            local v33 = u2.values(v32);

            local function v39(p34) -- Line: 289
                -- upvalues: DeviceUtil (ref), Players (ref), u8 (copy), myTeam (copy), u3 (ref), MatchDraftPlayerRow (ref)
                local v35 = DeviceUtil.isHoarceKat() and true or p34.userId == Players.LocalPlayer.UserId;
                local v36 = {};
                local v37 = {
                    KitLockedIn = true,
                    Player = p34,
                    Kit = u8.store.ARKDraft.kitSelection[tostring(p34.userId)]
                };
                local v38 = myTeam;

                if v38 ~= nil then
                    v38 = v38.color;
                end;

                v37.TeamColor = v38;
                v36.CardData = v37;
                v36.LayoutOrder = v35 and 0 or 1;
                v36.HideBanBox = true;

                return u3.createElement(MatchDraftPlayerRow, v36);
            end;

            local v40 = table.create(#v33);

            for i, v in v33 do
                v40[i] = v39(v, i - 1, v33);
            end;

            local v41 = {
                Size = UDim2.fromScale(0.22, 1),
                Position = UDim2.fromScale(0, 0),
                AnchorPoint = Vector2.new(0, 0)
            };
            local v42 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0.02, 0),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v43 = #v42;

            for i, v in v40 do
                v42[v43 + i] = v;
            end;

            v31.Team1Column = u3.createElement(Empty, v41, v42);
            local v44 = {
                Size = UDim2.fromScale(0.5, 1),
                Position = UDim2.fromScale(0.5, 0),
                AnchorPoint = Vector2.new(0.5, 0),
                [u3.Ref] = v16
            };
            local v45 = { u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Center",
                    VerticalAlignment = "Top",
                    Padding = UDim.new(0.01, 0),
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v46 = {
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.9)
            };
            local v47 = { u3.createElement("TextLabel", {
                    Text = "Available Kits",
                    RichText = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextStrokeTransparency = 1,
                    TextWrapped = true,
                    TextScaled = true,
                    Size = UDim2.fromScale(1, 0.1),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0.1),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold),
                    TextXAlignment = Enum.TextXAlignment.Center,
                    TextYAlignment = Enum.TextYAlignment.Center,
                    TextColor3 = ColorUtil.WHITE
                }) };
            local _ = #v47;

            local function _(p48, p49) -- Line: 373
                return p49 < 4;
            end;

            local v50 = 0;
            local v51 = {};

            for i, v in v22 do
                if i - 1 < 4 == true then
                    v50 = v50 + 1;
                    v51[v50] = v;
                end;
            end;

            local function v58(u52, p53) -- Line: 386
                -- upvalues: BedwarsKit (ref), u19 (copy), Players (ref), u3 (ref), KitPoolFrame (ref)
                local v54 = {};
                local v55;

                if u52.kit == BedwarsKit.NONE then
                    v55 = nil;
                else
                    v55 = u52.kit;
                end;

                v54.Kit = v55;
                v54.FrameProps = {
                    Size = UDim2.fromScale(0.25, 1),
                    Position = UDim2.fromScale(0.25 * p53, 0),
                    AnchorPoint = Vector2.new(0, 0)
                };

                function v54.OnClick() -- Line: 394
                    -- upvalues: u19 (ref), u52 (copy)
                    return u19(u52.kit);
                end;

                local v56;

                if u52 == nil then
                    v56 = u52;
                else
                    v56 = u52.prevSelectionUser;
                end;

                local v57;

                if v56 == Players.LocalPlayer.UserId then
                    v57 = u52.prevSelectionUserCooldownExpireTime;
                else
                    v57 = u52.othersCooldownExpireTime;
                end;

                v54.CooldownExpireTime = v57;

                return u3.createElement(KitPoolFrame, v54);
            end;

            local v59 = table.create(#v51);

            for i, v in v51 do
                v59[i] = v58(v, i - 1, v51);
            end;

            local v60 = {
                Size = UDim2.fromScale(1, 0.3),
                Position = UDim2.fromScale(0, 0.2)
            };
            local v61 = {};
            local v62 = #v61;

            for i, v in v59 do
                v61[v62 + i] = v;
            end;

            v47.UpperContainer = u3.createElement(Empty, v60, v61);

            local function _(p63, p64) -- Line: 421
                return p64 >= 4;
            end;

            local v65 = 0;
            local v66 = {};

            for i, v in v22 do
                if i - 1 >= 4 == true then
                    v65 = v65 + 1;
                    v66[v65] = v;
                end;
            end;

            local function v73(u67, p68) -- Line: 434
                -- upvalues: BedwarsKit (ref), u19 (copy), Players (ref), u3 (ref), KitPoolFrame (ref)
                local v69 = {};
                local v70;

                if u67.kit == BedwarsKit.NONE then
                    v70 = nil;
                else
                    v70 = u67.kit;
                end;

                v69.Kit = v70;
                v69.FrameProps = {
                    Size = UDim2.fromScale(0.25, 1),
                    Position = UDim2.fromScale(0.25 * p68, 0),
                    AnchorPoint = Vector2.new(0, 0)
                };

                function v69.OnClick() -- Line: 444
                    -- upvalues: u19 (ref), u67 (copy)
                    return u19(u67.kit);
                end;

                local v71;

                if u67 == nil then
                    v71 = u67;
                else
                    v71 = u67.prevSelectionUser;
                end;

                local v72;

                if v71 == Players.LocalPlayer.UserId then
                    v72 = u67.prevSelectionUserCooldownExpireTime;
                else
                    v72 = u67.othersCooldownExpireTime;
                end;

                v69.CooldownExpireTime = v72;

                return u3.createElement(KitPoolFrame, v69);
            end;

            local v74 = table.create(#v66);

            for i, v in v66 do
                v74[i] = v73(v, i - 1, v66);
            end;

            local v75 = {
                Size = UDim2.fromScale(1, 0.3),
                Position = UDim2.fromScale(0, 0.5)
            };
            local v76 = {};
            local v77 = #v76;

            for i, v in v74 do
                v76[v77 + i] = v;
            end;

            v47.BottomContainer = u3.createElement(Empty, v75, v76);
            v45.KitSelectionListContainer = u3.createElement(Empty, v46, v47);
            local v78 = {
                Size = UDim2.fromScale(0.4, 0.1)
            };
            local v79 = DeviceUtil.isHoarceKat() and 0 or u8.store.ARKDraft.playerRerolls[tostring(Players.LocalPlayer.UserId)];
            v78.Text = "Reroll (" .. tostring(v79) .. "/2)";
            v78.BackgroundColor3 = ColorUtil.WHITE;
            v78.BackgroundTransparency = 0.5;

            function v78.OnClick() -- Line: 487
                -- upvalues: u21 (copy)
                return u21();
            end;

            v78.TextScaled = true;
            v78.LayoutOrder = 1;
            v45[#v45 + 1] = u3.createElement(ButtonComponent, v78, { u3.createElement(Padding, {
                    Padding = UDim.new(0.15, 0)
                }) });
            v31.KitSelection = u3.createElement(Empty, v44, v45);
            v29.BodyContainer = u3.createElement(Empty, v30, v31);
            v27.ARKSDraftAppBackground = u3.createElement("ImageButton", v28, v29);

            return u3.createElement("ScreenGui", v26, v27);
        end;

        table.insert(v22, {
            othersCooldownExpireTime = -1,
            prevSelectionUserCooldownExpireTime = -1,
            prevSelectionUser = -1,
            kit = BedwarsKit.NONE
        });
    end;
end);

return {
    AllRandomKitDraftApp = v5.connect(function(p81, p82) -- Line: 503
        local v83 = {};

        for i, v in p82 do
            v83[i] = v;
        end;

        v83.store = p81;

        return v83;
    end)(v80)
};