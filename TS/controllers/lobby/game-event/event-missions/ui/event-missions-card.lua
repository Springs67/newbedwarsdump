-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoSizedText = v1.AutoSizedText;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local Padding = v1.Padding;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local TooltipContainer = v1.TooltipContainer;
local UIUtil = v1.UIUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local RewardShowcase = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta;
local EventCurrencyType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventCurrencyType;
local EventUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;

return {
    EventMissionsCard = v3.new(u2)(function(u4, p5) -- Line: 25
        -- upvalues: u2 (copy), StringUtil (copy), DeviceUtil (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), ClientStore (copy), EventUtil (copy), EventCurrencyType (copy), UserInputService (copy), UIUtil (copy), ColorUtil (copy), Padding (copy), Empty (copy), EventCurrencyMeta (copy), AutoSizedText (copy), TooltipContainer (copy), RewardShowcase (copy), Theme (copy), ButtonComponent (copy)
        local _ = p5.useState;
        local useEffect = p5.useEffect;
        local u6 = u4.Progress >= u4.Stage.progress;
        local u7 = u2.createRef();
        local u8 = u2.createRef();
        local u9 = false;
        local u10 = "";
        local reward = u4.Mission.reward;

        if reward ~= nil then
            local rewards = reward.rewards;

            if rewards ~= nil then
                local function _(p11) -- Line: 37
                    -- upvalues: u9 (ref), u10 (ref), StringUtil (ref)
                    if p11.globalTeamCurrency then
                        u9 = true;
                        u10 = StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(p11.globalTeamCurrency.amount, 0))));
                    end;
                end;

                for i, v in rewards do
                    local _ = i - 1;

                    if v.globalTeamCurrency then
                        u9 = true;
                        u10 = StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(v.globalTeamCurrency.amount, 0))));
                    end;
                end;
            end;
        end;

        local function _() -- Line: 48
            -- upvalues: u6 (copy), u4 (copy), StringUtil (ref)
            return u6 and not u4.Claimed and "CLAIM REWARD" or (u4.Claimed and "CLAIMED" or StringUtil.formatPercentage(u4.Progress, u4.Stage.progress, 1) .. " COMPLETE");
        end;

        local function u21(p12, p13, p14) -- Line: 57
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u4 (copy), SoundManager (ref), GameSound (ref), u7 (copy), u8 (copy), ClientStore (ref), EventUtil (ref), EventCurrencyType (ref)
            if not DeviceUtil.isHoarceKat() then
                if not KnitClient.Controllers.EventMissionsController:claimMission(u4.Mission, u4.EventType) then
                    return nil;
                end;

                SoundManager:playSound(GameSound.UI_REWARD);
            end;

            if u7:getValue() and (u8:getValue() and (u4.Mission.reward and DeviceUtil.isHoarceKat())) then
                local v15 = {};
                local v16 = {};
                local v17 = {
                    type = "SetEventPartial"
                };

                for i, v in EventUtil.makeStarterEventData() do
                    v15[i] = v;
                end;

                local v18 = {};
                local DOUBLOONS = EventCurrencyType.DOUBLOONS;
                local v19 = {};
                local v20 = ClientStore:getState().Event.profileData.currencies[EventCurrencyType.DOUBLOONS];

                if v20 ~= nil then
                    v20 = v20.currAmount;
                end;

                v19.currAmount = (v20 == nil and 0 or v20) + 300;
                v19.amountEarned = 0;
                v19.amountSpent = 0;
                v18[DOUBLOONS] = v19;
                v15.currencies = v18;
                v16.profileData = v15;
                v17.data = v16;
                ClientStore:dispatch(v17);
            end;
        end;

        useEffect(function() -- Line: 106
            -- upvalues: UserInputService (ref), UIUtil (ref), u7 (copy)
            if UserInputService.GamepadEnabled then
                UIUtil:selectGui(u7:getValue());
            end;
        end, {});
        local v22 = StringUtil.formatNumberWithCommas((tonumber(StringUtil.roundNumber(u4.Mission.rewardAmount, 0))));
        local v23 = {
            Size = UDim2.new(0.98, 0, 0, 80),
            BackgroundColor3 = Color3.fromHex("#6B6EB5"),
            BorderSizePixel = 0,
            LayoutOrder = u4.LayoutOrder,
            [u2.Ref] = u8
        };
        local v24 = { (u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            })) };
        local createElement = u2.createElement;
        local v25 = {
            BorderSizePixel = 0,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 1)
        };
        local v26 = {};
        local createElement2 = u2.createElement;
        local v27 = {
            Rotation = 180
        };
        local new = ColorSequence.new;
        local v28 = {};
        local v29 = ColorSequenceKeypoint.new(0, ColorUtil.BLACK);
        local new2 = ColorSequenceKeypoint.new;
        local v30;

        if u6 or u4.Claimed then
            v30 = Color3.fromHex("#FFDF38");
        else
            v30 = Color3.fromHex("#3894FF");
        end;

        v28[1], v28[2] = v29, new2(1, v30);
        v27.Color = new(v28);
        v27.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.4) });
        v26[1] = createElement2("UIGradient", v27);
        v24.GradientGlow = createElement("Frame", v25, v26);
        local _ = #v24;
        local v31 = {
            ZIndex = 2,
            Size = UDim2.fromScale(1, 1)
        };
        local v32 = {
            u2.createElement(Padding, {
                Padding = {
                    Top = 10,
                    Bottom = 20,
                    Left = 14,
                    Right = 14
                }
            }),
            MissionInfoContainer = u2.createElement(Empty, {
                LayoutOrder = 1,
                ZIndex = 2,
                Size = UDim2.fromScale(0.5, 1)
            }, {
                u2.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    HorizontalAlignment = "Left",
                    VerticalAlignment = "Center",
                    SortOrder = "LayoutOrder",
                    Padding = UDim.new(0.15, 0)
                }),
                MissionTask = u2.createElement("TextLabel", {
                    TextXAlignment = "Left",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = 1,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 0.5),
                    Text = "<b>" .. u4.Mission.name .. "</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }, { u2.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }),
                Progress = u2.createElement("TextLabel", {
                    TextXAlignment = "Left",
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    LayoutOrder = 2,
                    ZIndex = 2,
                    Size = UDim2.fromScale(1, 0.3),
                    Text = (u6 or u4.Claimed) and "<b><font transparency=\".3\">Completed</font></b>" or "<b><font transparency=\".3\">Progress:</font> (" .. StringUtil.roundNumber(u4.Progress, 1) .. " / <font transparency=\".3\">" .. tostring(u4.Mission.stages[1].progress) .. "</font>)</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                })
            })
        };
        local _ = #v32;
        local currencyReward = u4.Mission.currencyReward;

        if currencyReward then
            local v33 = {
                LayoutOrder = 1,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5)
            };
            local v34 = {};
            local v35 = {
                SizeConstraint = "RelativeYY",
                Size = UDim2.new(1, 0, 0.9, 0)
            };
            local reward2 = u4.Mission.reward;

            if reward2 ~= nil then
                reward2 = reward2.icon;
            end;

            local v36;

            if reward2 == "" or not reward2 then
                v36 = not u4.Mission.currencyReward and "" or EventCurrencyMeta[u4.Mission.currencyReward].icon;
            else
                v36 = u4.Mission.reward;

                if v36 ~= nil then
                    v36 = v36.icon;
                end;
            end;

            v35.Image = v36;
            v35.ScaleType = "Fit";
            v35.BackgroundTransparency = 1;
            v35.LayoutOrder = -1;
            v35.ZIndex = 2;
            v35.Position = UDim2.new(0.5, 0, 0.5, 0);
            v35.AnchorPoint = Vector2.new(0.5, 0.5);
            local v37 = { u2.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 1
                }) };
            local v38 = {};
            local v39 = {};
            local reward3 = u4.Mission.reward;

            if reward3 ~= nil then
                reward3 = reward3.name;
            end;

            local v40;

            if reward3 == "" or not reward3 then
                v40 = not u4.Mission.currencyReward and "" or EventCurrencyMeta[u4.Mission.currencyReward].name;
            else
                v40 = u4.Mission.reward;

                if v40 ~= nil then
                    v40 = v40.name;
                end;
            end;

            v39.Text = v40;
            v39.Font = Enum.Font.SourceSansBold;
            v39.TextSize = 16;
            v39.Limits = Vector2.new(300, 60);
            v38[#v38 + 1] = u2.createElement(AutoSizedText, v39);
            v37[#v37 + 1] = u2.createElement(TooltipContainer, {}, v38);
            v34.CurrencyIcon = u2.createElement("ImageLabel", v35, v37);
            local createElement3 = u2.createElement;
            local v41 = {
                TextSize = 15,
                BackgroundTransparency = 1,
                ZIndex = 2,
                LayoutOrder = 2,
                AnchorPoint = Vector2.new(1, 0.5),
                Position = UDim2.fromScale(1, 0.5)
            };
            local v42;

            if u9 then
                v42 = u10;
            else
                v42 = v22 == "0" and "" or v22;
            end;

            v41.Text = v42;
            v41.Font = Enum.Font.SourceSansBold;
            v41.TextColor3 = ColorUtil.WHITE;
            v41.TextYAlignment = Enum.TextYAlignment.Top;
            v41.TextXAlignment = Enum.TextXAlignment.Left;
            v34[#v34 + 1] = createElement3(AutoSizedText, v41);
            currencyReward = u2.createFragment({
                CurrencyContainer = u2.createElement(Empty, v33, v34)
            });
        end;

        local v43 = {
            LayoutOrder = 2,
            Size = UDim2.fromScale(0.2, 1.4),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.7749999999999999, 0.5)
        };
        local v44 = { u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v45 = #v44;

        if currencyReward then
            v44[v45 + 1] = currencyReward;
        end;

        local v46 = #v44;
        local reward2 = u4.Mission.reward;

        if reward2 then
            local reward3 = u4.Mission.reward;

            if reward3 ~= nil then
                local rewards = reward3.rewards;

                if rewards == nil then
                    reward3 = rewards;
                else
                    local function v49(p47) -- Line: 297
                        -- upvalues: u4 (copy), u2 (ref), RewardShowcase (ref)
                        local v48 = {};
                        local reward4 = u4.Mission.reward;

                        if reward4 ~= nil then
                            local rewards2 = reward4.rewards;
                            reward4 = rewards2 ~= nil and #rewards2 or rewards2;
                        end;

                        v48.Size = UDim2.fromScale(1 / (reward4 == nil and 1 or reward4), 1);
                        v48.Reward = p47;

                        return u2.createElement(RewardShowcase, v48);
                    end;

                    reward3 = table.create(#rewards);

                    for i, v in rewards do
                        reward3[i] = v49(v, i - 1, rewards);
                    end;
                end;
            end;

            local v50 = {
                LayoutOrder = 2,
                Size = UDim2.fromScale(1, 0.5),
                AnchorPoint = Vector2.new(1, 0.5)
            };
            local v51 = { u2.createElement("UIListLayout", {
                    FillDirection = "Horizontal",
                    VerticalAlignment = "Center",
                    HorizontalAlignment = "Right",
                    Padding = UDim.new(0, 3)
                }) };
            local v52 = #v51;

            if reward3 then
                for i, v in reward3 do
                    v51[v52 + i] = v;
                end;
            end;

            local v53 = #v51;
            local reward4 = u4.Mission.reward;

            if reward4 ~= nil then
                reward4 = reward4.icon;
            end;

            local v54 = reward4 ~= nil;

            if v54 then
                local v55 = {};
                local v56 = {
                    SizeConstraint = "RelativeYY",
                    Size = UDim2.new(1, 0, 0.8, 0)
                };
                local reward5 = u4.Mission.reward;

                if reward5 ~= nil then
                    reward5 = reward5.icon;
                end;

                v56.Image = reward5;
                v56.ScaleType = "Fit";
                v56.BackgroundTransparency = 1;
                v56.LayoutOrder = -1;
                v56.ZIndex = 2;
                v56.Position = UDim2.new(0.5, 0, 0.5, 0);
                v56.AnchorPoint = Vector2.new(0.5, 0.5);
                local v57 = {};
                local v58 = {};
                local v59 = {};
                local reward6 = u4.Mission.reward;

                if reward6 ~= nil then
                    reward6 = reward6.name;
                end;

                v59.Text = reward6 == nil and "" or reward6;
                v59.Font = Enum.Font.SourceSansBold;
                v59.TextSize = 16;
                v59.Limits = Vector2.new(300, 60);
                v58[#v58 + 1] = u2.createElement(AutoSizedText, v59);
                v57[#v57 + 1] = u2.createElement(TooltipContainer, {}, v58);
                v55.Icon = u2.createFragment({
                    Icon = u2.createElement("ImageLabel", v56, v57)
                });
                local createElement3 = u2.createElement;
                local v60 = {
                    TextSize = 15,
                    BackgroundTransparency = 1,
                    ZIndex = 2,
                    LayoutOrder = 2,
                    AnchorPoint = Vector2.new(1, 0.5),
                    Position = UDim2.fromScale(1, 0.5)
                };

                if not u9 then
                    u10 = v22 == "0" and "" or v22;
                end;

                v60.Text = u10;
                v60.Font = Enum.Font.SourceSansBold;
                v60.TextColor3 = ColorUtil.WHITE;
                v60.TextYAlignment = Enum.TextYAlignment.Top;
                v60.TextXAlignment = Enum.TextXAlignment.Left;
                v55[#v55 + 1] = createElement3(AutoSizedText, v60);
                v54 = u2.createFragment(v55);
            end;

            if v54 then
                v51[v53 + 1] = v54;
            end;

            reward2 = u2.createFragment({
                RewardsContainer = u2.createElement(Empty, v50, v51)
            });
        end;

        if reward2 then
            v44[v46 + 1] = reward2;
        end;

        v32.RewardContainer = u2.createElement(Empty, v43, v44);
        local v61 = {
            Size = UDim2.fromScale(0.175, 0.8),
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(1, 0.5),
            Text = u6 and not u4.Claimed and "CLAIM REWARD" or (u4.Claimed and "CLAIMED" or StringUtil.formatPercentage(u4.Progress, u4.Stage.progress, 1) .. " COMPLETE")
        };
        local v62;

        if u6 and not u4.Claimed then
            v62 = Theme.backgroundSuccess;
        else
            v62 = Color3.fromHex("#525585");
        end;

        v61.BackgroundColor3 = v62;

        function v61.OnClick(p63, p64) -- Line: 421
            -- upvalues: u4 (copy), ClientStore (ref), u21 (copy)
            local v65;

            if u4.Mission.currencyReward then
                v65 = {};
                local v66 = ClientStore:getState().Event.currencyGuiLocations[u4.Mission.currencyReward];

                if v66 == nil then
                    v66 = Vector2.new(0, 0);
                end;

                v65.endPos = v66;
            else
                v65 = nil;
            end;

            u21(p63, p64, v65);
        end;

        local v67;

        if u4.Claimed then
            v67 = Color3.fromHex("#FFDF38");
        else
            v67 = ColorUtil.WHITE;
        end;

        v61.TextColor3 = v67;
        v61.BackgroundTransparency = u4.Claimed and 1 or 0;
        v61.Disabled = not u6 or u4.Claimed;
        v61.LayoutOrder = 3;
        v61.Selectable = true;
        v61[u2.Ref] = u7;
        local v68 = {};
        local v69 = #v68;
        local v70 = u6 and not u4.Claimed and u2.createFragment({
            CompletedButtonStroke = u2.createElement("Frame", {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1)
            }, { u2.createElement("UICorner"), u2.createElement("UIStroke", {
                    Thickness = 2,
                    Color = ColorUtil.WHITE
                }, { u2.createElement("UIGradient", {
                        Rotation = 90,
                        Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5DFF4F")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5DFF4F")) }),
                        Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
                    }) }) })
        });

        if v70 then
            v68[v69 + 1] = v70;
        end;

        v32.ClaimRewardButton = u2.createElement(ButtonComponent, v61, v68);
        v24.Content = u2.createElement(Empty, v31, v32);
        local createElement3 = u2.createElement;
        local v71 = {
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.new(1, 0, 0, 10),
            Position = UDim2.fromScale(0, 1),
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromHex("#787EC8")
        };
        local v72 = { (u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            })) };
        local createElement4 = u2.createElement;
        local v73 = {
            BorderSizePixel = 0,
            ZIndex = 2,
            Size = UDim2.fromScale(math.clamp(u4.Progress / u4.Stage.progress, 0, 1), 1)
        };
        local v74;

        if u6 then
            v74 = Color3.fromHex("#FFDF38");
        else
            v74 = Theme.textPrimary;
        end;

        v73.BackgroundColor3 = v74;
        v72.ProgressBar = createElement4("Frame", v73, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 10)
            }) });
        v24.ProgressBarContainer = createElement3("Frame", v71, v72);

        return u2.createElement("Frame", v23, v24);
    end)
};