-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local NumberSpinner = v1.NumberSpinner;
local SoundManager = v1.SoundManager;
local Promise = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").Promise;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RankMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-meta").RankMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    RankedProgressBarCore = v3.new(u2)(function(u4, p5) -- Line: 18
        -- upvalues: RankMeta (copy), NumberSpinner (copy), TweenService (copy), SoundManager (copy), GameSound (copy), Promise (copy), u2 (copy), Empty (copy), ColorUtil (copy), BedwarsImageId (copy)
        local useEffect = p5.useEffect;
        local RankChangeData = u4.RankChangeData;
        local u6, u7 = p5.useState(RankMeta[RankChangeData.oldDivision.division]);
        local u8 = u4.RankChangeData.matchesPlayed == 5;
        local u9 = nil;
        local u10 = nil;
        local u11 = nil;
        local u12 = nil;
        local u13 = nil;
        local u14 = nil;
        local u15 = nil;
        useEffect(function() -- Line: 25
            -- upvalues: u6 (copy), RankChangeData (copy), u9 (ref), u10 (ref), u11 (ref), u12 (ref), u13 (ref), u14 (ref), u15 (ref), NumberSpinner (ref), TweenService (ref), SoundManager (ref), GameSound (ref), u4 (copy), u7 (copy), RankMeta (ref), u8 (copy), Promise (ref)
            local u16 = true;
            local u17 = u6;
            local rankPoints = RankChangeData.oldDivision.rankPoints;
            local rpDelta = RankChangeData.rpDelta;
            local u18 = rpDelta > 0;
            local u19 = rpDelta < 0;
            local u20 = u9:getValue();
            local v21 = u10:getValue();
            local u22 = u11:getValue();
            local u23 = u12:getValue();
            local u24 = u13:getValue();
            local u25 = u14:getValue();
            local u26 = u15:getValue();
            local u27 = NumberSpinner.fromGuiObject(v21);
            u27.Decimals = 0;
            u27.Prefix = "";
            u27.Suffix = "/ " .. tostring(100);
            u27.Value = rankPoints;

            local function u31(p28, p29, p30) -- Line: 48
                -- upvalues: u27 (copy), TweenService (ref), u22 (copy), SoundManager (ref), GameSound (ref)
                u27.Duration = p28;
                u27.Value = p29;
                TweenService:Create(u22, TweenInfo.new(p28, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Size = UDim2.fromScale(math.min(p29 / 100, 1), 1)
                }):Play();

                if p30 ~= false then
                    SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_EXP_GAIN);
                end;
            end;

            local function u47(p32) -- Line: 61
                -- upvalues: u4 (ref), u18 (copy), rankPoints (ref), u31 (copy), SoundManager (ref), GameSound (ref), u17 (ref), u19 (copy), TweenService (ref), u23 (copy), u24 (copy), u25 (copy), u7 (ref), RankMeta (ref), u8 (ref)
                local division = u4.RankChangeData.oldDivision.division;
                local u33 = false;
                local u34 = nil;

                if u18 then
                    rankPoints = 0;
                    u31(0.03, rankPoints, false);
                    SoundManager:playSound(GameSound.PROMOTION_INDICATION);
                    division = u17.nextRank;
                elseif u19 then
                    rankPoints = 100;
                    u31(0.03, rankPoints, false);
                    division = u17.prevRank;
                end;

                local v35 = TweenService:Create(u23, TweenInfo.new(0.25), {
                    ImageTransparency = 1
                });
                local u36 = TweenService:Create(u24, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ImageTransparency = 0.3,
                    Size = UDim2.fromScale(1.4, 1.4)
                });
                local u37 = TweenService:Create(u24, TweenInfo.new(50, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1), {
                    Rotation = 360
                });
                local v38 = TweenService:Create(u24, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    ImageTransparency = 1,
                    Size = UDim2.fromScale(1, 1)
                });
                local u39 = TweenService:Create(u25, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Visible = true,
                    Position = UDim2.fromScale(0.5, 0)
                });
                local PromotionCongratulationsMessage = u25:FindFirstChild("PromotionCongratulationsMessage");

                if p32 == "" or not p32 then
                    PromotionCongratulationsMessage.Text = u18 and "<b>YOU HAVE BEEN PROMOTED</b>" or "<b>YOU HAVE BEEN DEMOTED</b>";
                else
                    PromotionCongratulationsMessage.Text = p32;
                end;

                local PromotionRankMessage = u25:FindFirstChild("PromotionRankMessage");
                local v40 = TweenService:Create(PromotionCongratulationsMessage, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    TextTransparency = 1
                });
                local v41 = TweenService:Create(PromotionRankMessage, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    TextTransparency = 1
                });
                local u42 = TweenService:Create(u23, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    Size = UDim2.fromScale(1, 1)
                });
                local u43 = TweenService:Create(u23, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                    ImageTransparency = 0
                });
                v35:Play();
                local u44 = v35.Completed:Connect(function() -- Line: 117
                    -- upvalues: u7 (ref), RankMeta (ref), division (ref), u17 (ref), u39 (copy), SoundManager (ref), GameSound (ref), u23 (ref), u42 (copy), u43 (copy)
                    u7(RankMeta[division]);
                    u17 = RankMeta[division];
                    u39:Play();
                    SoundManager:playSound(GameSound.PROMOTION_RANKUP);
                    u23.Size = UDim2.fromScale(1.7, 1.7);
                    u42:Play();
                    u43:Play();
                end);
                local u45 = u43.Completed:Connect(function() -- Line: 126
                    -- upvalues: u33 (ref), u19 (ref), u36 (copy), u37 (copy), u34 (ref), SoundManager (ref), GameSound (ref)
                    u33 = true;

                    if u19 then
                        return nil;
                    end;

                    u36:Play();
                    u36.Completed:Connect(function() -- Line: 132
                        -- upvalues: u37 (ref), u34 (ref), SoundManager (ref), GameSound (ref)
                        u37:Play();
                        u34 = SoundManager:playSound(GameSound.PROMOTION_SHINE_LOOP, {
                            looped = true
                        });
                    end);
                end);

                local function _() -- Line: 140
                    -- upvalues: u44 (copy), u45 (copy), PromotionCongratulationsMessage (copy), PromotionRankMessage (copy), u25 (ref)
                    u44:Disconnect();
                    u45:Disconnect();
                    PromotionCongratulationsMessage.TextTransparency = 0;
                    PromotionRankMessage.TextTransparency = 0;
                    u25.Visible = false;
                    u25.Position = UDim2.fromScale(0.5, 0.5);
                end;

                while true do
                    local v46 = not u33 and task.wait();

                    if v46 == 0 or (v46 ~= v46 or not v46) then
                        if u8 then
                            return nil;
                        end;

                        task.wait(3);
                        v41:Play();
                        v40:Play();

                        if u34 then
                            u34:Stop();
                            u34:Destroy();
                        end;

                        v38:Play();
                        u37:Destroy();
                        v41.Completed:Connect(function() -- Line: 166
                            -- upvalues: u44 (copy), u45 (copy), PromotionCongratulationsMessage (copy), PromotionRankMessage (copy), u25 (ref)
                            u44:Disconnect();
                            u45:Disconnect();
                            PromotionCongratulationsMessage.TextTransparency = 0;
                            PromotionRankMessage.TextTransparency = 0;
                            u25.Visible = false;
                            u25.Position = UDim2.fromScale(0.5, 0.5);
                        end);

                        return;
                    end;
                end;
            end;

            local function _(p48) -- Line: 170
                -- upvalues: u16 (ref), rankPoints (ref), rpDelta (ref), u31 (copy)
                if not u16 or p48 == 0 then
                    return nil;
                end;

                rankPoints = rankPoints + p48;
                rpDelta = rpDelta - p48;
                u31(0.5, rankPoints);
                task.wait(0.5);
            end;

            local u49 = nil;
            local u50 = nil;

            local function u53() -- Line: 181
                -- upvalues: NumberSpinner (ref), u26 (copy), u18 (copy), rpDelta (ref), rankPoints (ref), Promise (ref), u16 (ref), u17 (ref), u47 (copy), u49 (ref), u50 (ref)
                local u51 = NumberSpinner.fromGuiObject(u26);
                u51.Duration = 0;
                u51.Decimals = 0;
                u51.Prefix = "";
                u51.Suffix = "  " .. (u18 and "+" or "") .. " " .. tostring(rpDelta) .. " RP";
                u51.Value = rankPoints;
                Promise.defer(function() -- Line: 188
                    -- upvalues: u51 (copy), rpDelta (ref), u16 (ref), rankPoints (ref), u17 (ref), u47 (ref), u49 (ref), u50 (ref)
                    task.wait(1);
                    u51.Duration = 2;

                    while true do
                        local v52 = rpDelta;

                        if v52 ~= 0 and (v52 == v52 and v52) then
                            v52 = u16;
                        end;

                        if v52 == 0 or (v52 ~= v52 or not v52) then
                            wait(4);
                            u50();

                            return;
                        end;

                        if rankPoints + rpDelta < 0 and not u17.noInstantDemote then
                            u51.Value = 0;
                            rpDelta = rpDelta - rankPoints;
                            u47();
                            u49();

                            return nil;
                        end;

                        u51.Value = rankPoints + rpDelta;
                        rankPoints = rankPoints + rpDelta;
                        rpDelta = 0;
                    end;
                end);
            end;

            u49 = function() -- Line: 216
                -- upvalues: Promise (ref), rpDelta (ref), u16 (ref), u17 (ref), u18 (copy), rankPoints (ref), u31 (copy), u47 (copy), u53 (copy), u50 (ref)
                Promise.defer(function() -- Line: 217
                    -- upvalues: rpDelta (ref), u16 (ref), u17 (ref), u18 (ref), rankPoints (ref), u31 (ref), u47 (ref), u53 (ref), u50 (ref)
                    task.wait(1);

                    while true do
                        local v54 = rpDelta;

                        if v54 ~= 0 and (v54 == v54 and v54) then
                            v54 = u16 and not u17.noRPLimit;
                        end;

                        if v54 == 0 or (v54 ~= v54 or not v54) then
                            local v55 = rpDelta;

                            if v55 ~= 0 and (v55 == v55 and v55) then
                                v55 = u17.noRPLimit;
                            end;

                            if v55 ~= 0 and (v55 == v55 and v55) then
                                rankPoints = 0;
                                u53();

                                return nil;
                            end;

                            wait(4);
                            u50();

                            return;
                        end;

                        local v56, v57;

                        if u18 then
                            v56 = 100 - rankPoints;
                            v57 = math.min(rpDelta, v56);
                        else
                            v56 = -rankPoints;
                            v57 = math.max(rpDelta, v56);
                        end;

                        if u16 and v57 ~= 0 then
                            rankPoints = rankPoints + v57;
                            rpDelta = rpDelta - v57;
                            u31(0.5, rankPoints);
                            task.wait(0.5);
                        end;

                        if u18 and (rankPoints == 100 or v56 <= rpDelta) then
                            u47();
                        elseif not u18 and rpDelta < v56 then
                            u47();
                        end;
                    end;
                end);
            end;

            if u8 then
                Promise.defer(function() -- Line: 261
                    -- upvalues: u47 (copy)
                    u47("YOU HAVE PLACED INTO");
                end);
            elseif u17.noRPLimit then
                u53();
            elseif not u17.noRPLimit then
                u49();
            end;

            u50 = function() -- Line: 269
                -- upvalues: TweenService (ref), u20 (copy)
                TweenService:Create(u20, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Transparency = 1,
                    Position = UDim2.fromScale(0.5, 2)
                }):Play();
            end;

            return function() -- Line: 276
                -- upvalues: u16 (ref)
                u16 = false;
            end;
        end, {});
        u9 = u2.createRef();
        u12 = u2.createRef();
        u13 = u2.createRef();
        u14 = u2.createRef();
        u10 = u2.createRef();
        u11 = u2.createRef();
        u15 = u2.createRef();
        local v58 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.45),
            Size = UDim2.fromScale(0.6, 0.6),
            BackgroundTransparency = 1,
            [u2.Ref] = u9
        };
        local FrameProps = u4.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v58[i] = v;
            end;
        end;

        local v59 = {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.03, 0)
            }),
            TextAndRankImage = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0.57, 0)
            }, { u2.createElement(Empty, {
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.new(0.6, 0, 0.25, 0),
                    [u2.Ref] = u14,
                    Visible = false
                }, {
                    u2.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        HorizontalAlignment = "Center",
                        VerticalAlignment = "Center",
                        SortOrder = "LayoutOrder",
                        Padding = UDim.new(0, 0.05)
                    }),
                    PromotionCongratulationsMessage = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        Text = "<b>YOU HAVE BEEN PROMOTED</b>",
                        LayoutOrder = 1,
                        Size = UDim2.new(1, 0, 0.375, 0),
                        TextColor3 = ColorUtil.WHITE
                    }),
                    PromotionRankMessage = u2.createElement("TextLabel", {
                        TextScaled = true,
                        RichText = true,
                        BackgroundTransparency = 1,
                        Font = "GothamBold",
                        LayoutOrder = 2,
                        Size = UDim2.new(1, 0, 0.575, 0),
                        Text = "<b>" .. string.upper(u6.name) .. "</b>",
                        TextColor3 = u6.color
                    })
                }), u2.createElement(Empty, {
                    AnchorPoint = Vector2.new(0.5, 1),
                    Position = UDim2.fromScale(0.5, 1),
                    Size = UDim2.new(1, 0, 0.75, 0)
                }, {
                    RankIcon = u2.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = u6.imageSize,
                        Image = u6.image,
                        BackgroundTransparency = 1,
                        ImageTransparency = u8 and 1 or 0,
                        ScaleType = "Fit",
                        [u2.Ref] = u12,
                        ZIndex = 2
                    }),
                    u2.createElement("ImageLabel", {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.new(1, 0, 1, 0),
                        Image = BedwarsImageId.SHINING_SPINNER,
                        BackgroundTransparency = 1,
                        ImageTransparency = 1,
                        ImageColor3 = u6.color,
                        ScaleType = "Fit",
                        [u2.Ref] = u13,
                        ZIndex = 1
                    })
                }) })
        };
        local v60 = {
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0.22, 0),
            Visible = not u6.noRPLimit or u8
        };
        local v61 = { u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                Padding = UDim.new(0, 8)
            }) };
        local v62 = {
            Size = UDim2.new(1, 0, 0.3, 0)
        };
        local v63 = {
            CurrentRank = u2.createElement("TextLabel", {
                Font = "Roboto",
                TextXAlignment = "Left",
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                Size = UDim2.new(0.5, 0, 1, 0),
                Text = "<b>" .. u6.name .. "</b>",
                TextColor3 = ColorUtil.WHITE
            })
        };
        local v64 = #v63;
        local v65;

        if u6.nextRank == nil then
            v65 = false;
        else
            v65 = u2.createFragment({
                NextRank = u2.createElement("TextLabel", {
                    Font = "Roboto",
                    TextXAlignment = "Right",
                    TextScaled = true,
                    RichText = true,
                    TextTransparency = 0.4,
                    BackgroundTransparency = 1,
                    Size = UDim2.new(0.5, 0, 1, 0),
                    AnchorPoint = Vector2.new(1, 0),
                    Position = UDim2.fromScale(1, 0),
                    Text = "<b>" .. RankMeta[u6.nextRank].name .. "</b>",
                    TextColor3 = ColorUtil.WHITE
                })
            });
        end;

        if v65 then
            v63[v64 + 1] = v65;
        end;

        v61[#v61 + 1] = u2.createElement(Empty, v62, v63);
        v61.ProgressBarBackground = u2.createElement("Frame", {
            BackgroundTransparency = 0.3,
            BorderSizePixel = 0,
            Size = UDim2.new(1, 0, 0.4, 0),
            BackgroundColor3 = ColorUtil.BLACK
        }, {
            ProgressBar = u2.createElement("Frame", {
                Size = UDim2.new(RankChangeData.oldDivision.rankPoints / 100, 0, 1, 0),
                BackgroundColor3 = ColorUtil.WHITE,
                BorderSizePixel = 0,
                [u2.Ref] = u11
            }, { u2.createElement("UIGradient", {
                    Rotation = -90,
                    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, u6.color), ColorSequenceKeypoint.new(1, ColorUtil.brighten(u6.color, 0.5)) })
                }) })
        });
        v61.ProgressNumber = u2.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0.3, 0),
            Text = "<b>" .. tostring(RankChangeData.oldDivision.rankPoints) .. " / 100</b>",
            TextColor3 = ColorUtil.WHITE,
            Font = "Roboto",
            TextXAlignment = "Right",
            TextScaled = false,
            RichText = true,
            BackgroundTransparency = 1,
            [u2.Ref] = u10
        });
        v59.ProgressContainer = u2.createElement(Empty, v60, v61);
        v59[#v59 + 1] = u2.createElement(Empty, {
            LayoutOrder = 3,
            Size = UDim2.new(1, 0, 0.15, 0),
            Visible = not u8
        }, {
            u2.createElement("UIListLayout", {
                FillDirection = "Vertical",
                HorizontalAlignment = "Center",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 8)
            }),
            EloGainedCount = u2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0.6, 0),
                Text = RankChangeData.demotionShieldActive and "DEMOTION SHIELD ACTIVE" or "<b>" .. (RankChangeData.rpDelta > 0 and "+" or "") .. " " .. tostring(RankChangeData.rpDelta) .. " <font color=\"#ffffff\">RP</font></b>",
                TextColor3 = ColorUtil.hexColor(16773227),
                Font = "Roboto",
                TextScaled = true,
                TextSize = 24,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ZIndex = 2,
                [u2.Ref] = u15
            }),
            MetricDescription = u2.createElement("TextLabel", {
                Text = "<b>RANK POINTS</b>",
                Font = "Roboto",
                TextTransparency = 0.4,
                TextScaled = true,
                RichText = true,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ZIndex = 2,
                Size = UDim2.new(1, 0, 0.4, 0),
                TextColor3 = ColorUtil.WHITE
            })
        });

        return u2.createElement(Empty, v58, v59);
    end)
};