-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local ConfettiExplosion = v1.ConfettiExplosion;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local ResetTime = v1.ResetTime;
local ShineEffect = v1.ShineEffect;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local getCheckInSystemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-system-meta").getCheckInSystemMeta;
local CheckInUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "checkin-system", "checkin-util").CheckInUtil;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local v66 = v3.new(u2)(function(u5, p6) -- Line: 29
    -- upvalues: EventMeta (copy), getCheckInSystemMeta (copy), CheckInUtil (copy), ResetTime (copy), DeviceUtil (copy), KnitClient (copy), u2 (copy), Theme (copy), ColorUtil (copy), BedwarsImageId (copy), ConfettiExplosion (copy), RewardShowcase (copy), Padding (copy), AutoCanvasScrollingFrame (copy), Empty (copy), Countdown (copy), EventUtil (copy), SoundManager (copy), GameSound (copy), ShineEffect (copy), ButtonComponent (copy), Flamework (copy), default (copy)
    local useEffect = p6.useEffect;
    local u7, u8 = p6.useState(false);
    local v9 = EventMeta[u5.EventType];
    local v10 = getCheckInSystemMeta(u5.CheckInSystem);
    local u11;

    if u5.checkInData then
        u11 = CheckInUtil.hasCheckedIn(u5.checkInData, u5.CheckInSystem);
    else
        u11 = false;
    end;

    local v12 = math;
    local v13 = os.time();
    local timePeriod = v10.timePeriod;

    if timePeriod ~= nil then
        timePeriod = timePeriod.startTime;
    end;

    if timePeriod == nil then
        timePeriod = v9.startDate;
    end;

    local v14 = v12.ceil((v13 - timePeriod) / 86400);
    local checkInData = u5.checkInData;
    local v15 = checkInData ~= nil and #checkInData.checkIns or checkInData;
    local u16 = v14 - (v15 == nil and 0 or v15);
    local v17 = ResetTime.new(v9.startDate):getNextDailyResetTime();
    useEffect(function() -- Line: 59
        -- upvalues: u5 (copy), DeviceUtil (ref), KnitClient (ref)
        if not (u5.checkInData or DeviceUtil.isHoarceKat()) then
            KnitClient.Controllers.CheckinController:requestCheckInData(u5.CheckInSystem);
        end;
    end, {});
    local v18 = {
        Size = UDim2.fromScale(1, 1)
    };
    local v19 = { u2.createElement("UIListLayout", {
            FillDirection = "Vertical",
            HorizontalAlignment = "Left",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0.01, 0)
        }), u2.createElement("UIPadding", {
            PaddingTop = UDim.new(0.02, 0),
            PaddingBottom = UDim.new(0.02, 0),
            PaddingLeft = UDim.new(0.02, 0),
            PaddingRight = UDim.new(0.02, 0)
        }) };
    local v20 = #v19;
    local v21 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(1, 0.875)
    };
    local v22 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            SortOrder = "LayoutOrder",
            Padding = UDim.new(0, 0)
        }) };
    local _ = #v22;
    local rewards = v10.rewards;
    local v23;

    if rewards == nil then
        v23 = rewards;
    else
        local function v42(p24, p25) -- Line: 97
            -- upvalues: u5 (copy), Theme (ref), u2 (ref), ColorUtil (ref), BedwarsImageId (ref), u7 (copy), ConfettiExplosion (ref), RewardShowcase (ref)
            local checkInData2 = u5.checkInData;
            local v26 = checkInData2 ~= nil and #checkInData2.checkIns or checkInData2;
            local v27 = v26 == nil and 0 or v26;
            local v28 = p25 < v27;
            local v29 = v27 == p25;
            local v30;

            if p25 >= 0 then
                v30 = p25 == v27 - 1;
            else
                v30 = false;
            end;

            local v31 = {
                Size = UDim2.fromScale(1, 1),
                BackgroundColor3 = Theme.backgroundPrimary
            };
            local v32 = {};
            local v33 = u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            });
            local createElement = u2.createElement;
            local v34 = {
                Thickness = 2
            };
            local v35;

            if v29 then
                v35 = Color3.fromRGB(155, 202, 240);
            else
                v35 = Color3.fromRGB(155, 159, 240);
            end;

            v34.Color = v35;
            v34.Transparency = v28 and 1 or 0;
            local v36 = createElement("UIStroke", v34);
            local createElement2 = u2.createElement;
            local v37 = {
                BorderSizePixel = 0,
                ZIndex = 3,
                Size = UDim2.fromScale(1, 0.15)
            };
            local v38;

            if v29 then
                v38 = Color3.fromRGB(155, 202, 240);
            else
                v38 = Color3.fromRGB(155, 159, 240);
            end;

            v37.BackgroundColor3 = v38;
            v32[1], v32[2], v32[3] = v33, v36, createElement2("Frame", v37, { u2.createElement("TextLabel", {
        TextScaled = true,
        BackgroundTransparency = 1,
        TextYAlignment = "Center",
        TextXAlignment = "Center",
        ZIndex = 3,
        Size = UDim2.fromScale(1, 0.8),
        Text = tostring(p25 + 1),
        TextColor3 = ColorUtil.WHITE,
        Font = Enum.Font.SourceSansBold
    }) });
            local v39 = #v32;

            if v28 then
                v28 = u2.createFragment({
                    Background = u2.createElement("Frame", {
                        BorderSizePixel = 0,
                        BackgroundTransparency = 0.3,
                        ZIndex = 4,
                        Size = UDim2.fromScale(1, 1),
                        BackgroundColor3 = ColorUtil.BLACK
                    }, { u2.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 3)
                        }), u2.createElement("ImageLabel", {
                            BackgroundTransparency = 1,
                            ZIndex = 4,
                            Size = UDim2.fromScale(0.4, 0.4),
                            Position = UDim2.fromScale(0.5, 0.5),
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Image = BedwarsImageId.CIRCLE_CHECK_SOLID,
                            ScaleType = Enum.ScaleType.Fit
                        }) })
                });
            end;

            if v28 then
                v32[v39 + 1] = v28;
            end;

            local v40 = #v32;
            local v41 = v30 and u7 and u2.createElement(ConfettiExplosion, {
                Lifetime = 1.45,
                ZIndex = 100,
                Size = UDim2.fromScale(7, 7),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5)
            });

            if v41 then
                v32[v40 + 1] = v41;
            end;

            v32[#v32 + 1] = u2.createElement(RewardShowcase, {
                ZIndex = 3,
                Size = UDim2.fromScale(0.67, 0.67),
                Reward = p24,
                Position = UDim2.fromScale(0.5, 0.6),
                AnchorPoint = Vector2.new(0.5, 0.5)
            });
            v32.GradientGlow = u2.createElement("Frame", {
                BorderSizePixel = 0,
                ZIndex = 1,
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, ColorUtil.BLACK), ColorSequenceKeypoint.new(1, Color3.fromRGB(95, 202, 255)) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.65) })
                }) });

            return u2.createFragment({
                RewardCard = u2.createElement("Frame", v31, v32)
            });
        end;

        v23 = table.create(#rewards);

        for i, v in rewards do
            v23[i] = v42(v, i - 1, rewards);
        end;
    end;

    local v43 = {
        ScrollingFrameProps = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 1)
        }
    };
    local v44 = { u2.createElement(Padding, {
            Padding = {
                Vertical = 2,
                Horizontal = 2
            }
        }), u2.createElement("UIGridLayout", {
            FillDirection = "Horizontal",
            FillDirectionMaxCells = 5,
            HorizontalAlignment = "Left",
            VerticalAlignment = "Top",
            CellSize = UDim2.new(0, 112.52, 0, 93.12),
            CellPadding = UDim2.fromOffset(16, 16)
        }) };
    local v45 = #v44;

    for i, v in v23 do
        v44[v45 + i] = v;
    end;

    v22.RewardList = u2.createElement(AutoCanvasScrollingFrame, v43, v44);
    v19[v20 + 1] = u2.createElement(Empty, v21, v22);
    local v46 = {
        LayoutOrder = 3,
        Size = UDim2.fromScale(0.95, 0.1)
    };
    local v47 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.025, 0)
        }) };
    local v48 = #v47;
    local v49 = {
        LayoutOrder = 1,
        Size = UDim2.fromScale(0.7, 1)
    };
    local v50 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Left",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.025, 0)
        }) };
    local v51 = #v50;
    local v52;

    if u11 then
        v52 = u2.createElement(Countdown, {
            EndTime = v17,
            TextLabel = {
                LayoutOrder = 3,
                RichText = false,
                Size = UDim2.fromScale(0.3, 1)
            }
        });
    else
        v52 = u11;
    end;

    if v52 then
        v50[v51 + 1] = v52;
    end;

    local _ = #v50;
    local v53 = {
        BackgroundTransparency = 0,
        LayoutOrder = 3,
        Selectable = true,
        Size = UDim2.fromScale(0.4, 1),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.fromScale(1, 0.5),
        Text = EventUtil.isEventRunning(u5.EventType) and (u11 and "CHECKED IN" or "CHECK IN") or "Event Ended"
    };
    local v54;

    if u11 then
        v54 = ColorUtil.darken(Theme.backgroundSuccess, 0.75);
    else
        v54 = Theme.backgroundSuccess;
    end;

    v53.BackgroundColor3 = v54;

    function v53.OnClick(p55, p56) -- Line: 282
        -- upvalues: EventUtil (ref), u5 (copy), KnitClient (ref), SoundManager (ref), GameSound (ref), u8 (copy)
        if not EventUtil.isEventRunning(u5.EventType) then
            return nil;
        end;

        KnitClient.Controllers.CheckinController:recordCheckIn(u5.CheckInSystem):andThen(function(p57) -- Line: 287
            -- upvalues: SoundManager (ref), GameSound (ref), u8 (ref)
            if p57 then
                task.spawn(function() -- Line: 289
                    -- upvalues: SoundManager (ref), GameSound (ref)
                    SoundManager:playSound(GameSound.TEAM_UPGRADE_PURCHASE);
                end);
                u8(true);
            end;
        end);
    end;

    v53.TextColor3 = ColorUtil.WHITE;
    v53.TextTransparency = u11 and 0.3 or 0;
    v53.Disabled = u11 or not EventUtil.isEventRunning(u5.EventType);
    v53.CornerRadius = UDim.new(0, 3);
    local v58 = {};
    local v59 = #v58;
    local v60 = not u11 and u2.createElement(ShineEffect);

    if v60 then
        v58[v59 + 1] = v60;
    end;

    local v61 = #v58;
    local v62 = not u11 and u2.createFragment({
        CustomButtonStroke = u2.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }), u2.createElement("UIStroke", {
                Thickness = 2,
                Color = ColorUtil.WHITE
            }, { u2.createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5DFF4F")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5DFF4F")) }),
                    Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
                }) }) })
    });

    if v62 then
        v58[v61 + 1] = v62;
    end;

    v50.CheckInButton = u2.createElement(ButtonComponent, v53, v58);
    v50.CheckInDesc = u2.createElement("TextLabel", {
        Text = "(Automatically checks in when you play a match)",
        RichText = true,
        TextScaled = true,
        Font = "GothamBlack",
        BackgroundTransparency = 1,
        TextXAlignment = "Left",
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.3, 1),
        TextColor3 = ColorUtil.WHITE
    });
    v47[v48 + 1] = u2.createElement(Empty, v49, v50);
    v47[v48 + 2] = u2.createElement(Empty, {
        LayoutOrder = 2,
        Size = UDim2.fromScale(0.3, 1)
    }, { u2.createElement("Frame", {
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.8, 1),
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = Theme.backgroundPrimary
        }, {
            u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 3)
            }),
            u2.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                VerticalAlignment = "Center",
                HorizontalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }),
            u2.createElement("Frame", {
                LayoutOrder = 1,
                BorderSizePixel = 0,
                Size = UDim2.fromScale(0.35, 0.7),
                BackgroundColor3 = Theme.backgroundTertiary
            }, { u2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 3)
                }), u2.createElement("TextLabel", {
                    TextScaled = true,
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(0.8, 0.7),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = tostring(u16),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }) }),
            CatchUpDayButton = u2.createElement(ButtonComponent, {
                Text = "CATCH UP",
                BackgroundTransparency = 0,
                LayoutOrder = 2,
                Selectable = true,
                Size = UDim2.fromScale(0.45, 0.7),
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5),
                BackgroundColor3 = Theme.mcGold,

                OnClick = function(p63, p64) -- Line: 395, Name: OnClick
                    -- upvalues: EventUtil (ref), u5 (copy), u11 (copy), Flamework (ref), u16 (copy), default (ref), SoundManager (ref), GameSound (ref)
                    if not EventUtil.isEventRunning(u5.EventType) then
                        return nil;
                    end;

                    if not u11 then
                        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                            message = "Check In First!"
                        });

                        return nil;
                    end;

                    if u16 > 0 then
                        default.Client:Get("CatchUpMissedCheckIn"):CallServerAsync(u5.CheckInSystem):andThen(function(p65) -- Line: 407
                            -- upvalues: SoundManager (ref), GameSound (ref)
                            if p65 then
                                SoundManager:playSound(GameSound.TEAM_UPGRADE_PURCHASE);
                            end;
                        end);

                        return;
                    end;

                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                        message = "You haven\'t missed any days!"
                    });
                end,

                Disabled = not EventUtil.isEventRunning(u5.EventType),
                TextColor3 = ColorUtil.WHITE,
                CornerRadius = UDim.new(0, 3)
            })
        }) });
    v19[v20 + 2] = u2.createElement(Empty, v46, v47);

    return u2.createFragment({
        CheckInpage = u2.createElement(Empty, v18, v19)
    });
end);

return {
    EventCheckinPage = v4.connect(function(p67, p68) -- Line: 434
        local v69 = {};

        for i, v in p68 do
            v69[i] = v;
        end;

        v69.checkInData = p67.Lobby.checkInData[p68.CheckInSystem];

        return v69;
    end)(v66)
};