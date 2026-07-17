-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local TweenService = v4.TweenService;
local AfkShopUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils;
local AfkPlaceUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ProgressBarUI = RuntimeLib.import(script, script.Parent, "components", "progress-bar-ui").ProgressBarUI;

return {
    AfkPlaceProgressBar = v3.new(u2)(function(u5, p6) -- Line: 17
        -- upvalues: BattlePassUtils (copy), u2 (copy), default (copy), AfkPlaceUtils (copy), Players (copy), TweenService (copy), u1 (copy), ColorUtil (copy), Theme (copy), AfkShopUtils (copy), ProgressBarUI (copy), BedwarsImageId (copy)
        local useState = p6.useState;
        local useEffect = p6.useEffect;
        local _, u7 = useState(0);
        local _, u8 = useState(0);
        local _, _ = useState(0.0001);
        useEffect(function() -- Line: 23
            -- upvalues: u5 (copy), BattlePassUtils (ref), u7 (copy), u8 (copy)
            if u5.BattlePassDto then
                local BattlePassDto = u5.BattlePassDto;

                if BattlePassDto ~= nil then
                    BattlePassDto = BattlePassDto.experience;
                end;

                u7(BattlePassUtils.getLevelFromExperience(BattlePassDto));
                local BattlePassDto2 = u5.BattlePassDto;

                if BattlePassDto2 ~= nil then
                    BattlePassDto2 = BattlePassDto2.experience;
                end;

                local BattlePassDto3 = u5.BattlePassDto;

                if BattlePassDto3 ~= nil then
                    BattlePassDto3 = BattlePassDto3.experience;
                end;

                u8(BattlePassUtils.getCurrExperienceProgression(BattlePassDto2, BattlePassUtils.getLevelFromExperience(BattlePassDto3)));
            end;
        end, { u5.BattlePassDto });
        local _, u9 = useState(function() -- Line: 44
            -- upvalues: u5 (copy)
            return math.floor(u5.AfkStartTime * 900 / 3600);
        end);
        local _, u10 = useState(u5.AfkCoinStart);
        local _, u11 = useState(u5.BedCoinStart);
        local _, _ = useState(0);
        local u12 = u2.createRef();
        local u13 = u2.createRef();
        local u14 = u2.createRef();
        local u15 = u2.createRef();
        local u16 = u2.createRef();
        local u17 = u2.createRef();
        local u18 = u2.createRef();
        local u19 = u2.createRef();
        local u20 = u2.createRef();
        local u21 = u2.createRef();
        local u22 = u2.createRef();
        local u23 = u2.createRef();
        local u24 = u2.createRef();
        local u25 = u2.createRef();
        local u26 = u2.createRef();
        u2.createRef();
        local u27 = u2.createRef();
        local u28 = u2.createRef();
        local u29 = u2.createRef();
        local u30 = u2.createRef();
        local u31 = u2.createRef();
        local u32 = u2.createRef();
        local u33 = u2.createRef();
        local u34 = u2.createRef();
        local v35 = nil;
        local v36 = nil;
        local u37 = 1;
        os.time();

        if v35 == nil then
            v35 = default.Client:Get("IsVip"):CallServer();
        end;

        if v35 then
            u37 = u37 + AfkPlaceUtils.vipMultiplier;
        end;

        if Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
            u37 = u37 + AfkPlaceUtils.premiumMultiplier;
            v36 = true;
        end;

        local function u39(p38) -- Line: 89
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if p38 == nil then
                return nil;
            end;

            TweenService:Create(p38, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                ImageTransparency = 1
            }):Play();
        end;

        local function _(p40, p41) -- Line: 98
            -- upvalues: TweenService (ref)
            print(p40);

            if not p40 then
                return nil;
            end;

            TweenService:Create(p40, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(p41, 1)
            }):Play();
        end;

        local function u43(p42) -- Line: 108
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if p42 == nil then
                return nil;
            end;

            TweenService:Create(p42, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                TextTransparency = 1,
                TextStrokeTransparency = 1
            }):Play();
        end;

        local function u45(p44) -- Line: 118
            -- upvalues: TweenService (ref), AfkPlaceUtils (ref)
            if p44 == nil then
                return nil;
            end;

            TweenService:Create(p44, TweenInfo.new(AfkPlaceUtils.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
                BackgroundTransparency = 1
            }):Play();
        end;

        useEffect(function() -- Line: 127
            -- upvalues: u5 (copy), u1 (ref), AfkPlaceUtils (ref), u9 (copy), u37 (ref), u10 (copy), u11 (copy)
            local u46 = nil;
            local u47 = nil;
            local u48 = nil;
            local u49 = os.time();
            local u50 = os.time() - u5.MountStartTime + u5.AfkStartTime;
            local u51 = u1.new();

            local function u52() -- Line: 135
                -- upvalues: u46 (ref), u49 (copy), u47 (ref), AfkPlaceUtils (ref), u50 (ref), u5 (ref), u9 (ref), u37 (ref), u10 (ref), u11 (ref), u48 (ref), u52 (ref)
                u46 = os.time() - u49;
                u47 = math.floor(u46 * AfkPlaceUtils.baseExperiencePerHour / 3600);
                u50 = os.time() - u5.MountStartTime + u5.AfkStartTime;
                u9((math.floor(u50 * AfkPlaceUtils.baseExperiencePerHour * u37 / 3600)));
                u10((math.floor(u50 * AfkPlaceUtils.baseAfkCoinsPerHour * u37 / 3600)));
                u11((math.floor(u50 * AfkPlaceUtils.baseAfkBedCoinsPerHour * u37 / 3600)));
                u48 = task.delay(1, u52);
            end;

            u52();

            return function() -- Line: 147
                -- upvalues: u48 (ref), u51 (copy)
                if u48 then
                    task.cancel(u48);
                end;

                u51:DoCleaning();
            end;
        end, {});
        useEffect(function() -- Line: 155
            -- upvalues: u12 (copy), u13 (copy), u25 (copy), u26 (copy), u16 (copy), u17 (copy), u18 (copy), u20 (copy), u19 (copy), u22 (copy), u21 (copy), u23 (copy), u24 (copy), u27 (copy), u28 (copy), u29 (copy), u32 (copy), u30 (copy), u33 (copy), u34 (copy), u31 (copy), u15 (copy), u14 (copy), u5 (copy), u43 (copy), u45 (copy), u39 (copy)
            local v53 = u12:getValue();
            local v54 = u13:getValue();
            local v55 = u25:getValue();
            local v56 = u26:getValue();
            local v57 = u16:getValue();
            local v58 = u17:getValue();
            local v59 = u18:getValue();
            local v60 = u20:getValue();
            local v61 = u19:getValue();
            local v62 = u22:getValue();
            local v63 = u21:getValue();
            local v64 = u23:getValue();
            local v65 = u24:getValue();
            local v66 = u27:getValue();
            local v67 = u28:getValue();
            local v68 = u29:getValue();
            local v69 = u32:getValue();
            local v70 = u30:getValue();
            local v71 = u33:getValue();
            local v72 = u34:getValue();
            local v73 = u31:getValue();
            local v74 = u15:getValue();
            local v75 = u14:getValue();

            if u5.ReturnButtonPressed then
                u43(v74);
                u43(v75);
                u45(v55);
                u45(v56);
                u45(v57);
                u43(v58);
                u39(v59);
                u43(v60);
                u43(v61);
                u45(v63);
                u43(v62);
                u39(v64);
                u43(v65);
                u45(v53);
                u45(v54);
                u45(v66);
                u43(v67);
                u43(v68);
                u43(v70);
                u43(v73);
                u45(v69);
                u45(v71);
                u45(v72);
            end;

            return function() -- Line: 204
            end;
        end, { u5.ReturnButtonPressed });
        local v76 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.6, 0.3),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = ColorUtil.WHITE,
            Position = UDim2.fromScale(0.5, 0.4),
            AnchorPoint = Vector2.new(0.5, 0)
        };
        local v77 = { u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical
            }) };
        local _ = #v77;
        local v78 = {
            [u2.Ref] = u27,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 1),
            BackgroundTransparency = 1,
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 0,
            LayoutOrder = 1
        };
        local v79 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }) };
        local _ = #v79;
        local v80 = {
            [u2.Ref] = u27,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(1, 0.6),
            BackgroundTransparency = 1,
            BackgroundColor3 = Theme.backgroundPrimary,
            BorderSizePixel = 0,
            LayoutOrder = 5
        };
        local v81 = { u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, 6)
            }) };
        local _ = #v81;
        local v82 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.5, 0.6),
            Position = UDim2.fromScale(0, 0.25),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(58, 54, 112)
        };
        local v83 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal
            }), u2.createElement("ImageLabel", {
                Size = UDim2.fromScale(0.12, 1),
                SizeConstraint = "RelativeXY",
                ScaleType = "Fit",
                Image = AfkShopUtils.currencyIcon,
                BackgroundTransparency = 0.7,
                BackgroundColor3 = ColorUtil.BLACK,
                [u2.Ref] = u18,
                LayoutOrder = 0
            }) };
        local _ = #v83;
        local v84 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v85 = {
            u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical
            }),
            CurrencyName = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.5)
            }, { u2.createElement("TextLabel", {
                    Text = AfkShopUtils.currencyName,
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(0.25, 0.75),
                    FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Font = AfkPlaceUtils.Theme.font,
                    TextStrokeTransparency = 1,
                    TextSize = 42,
                    TextScaled = true,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = ColorUtil.WHITE,
                    [u2.Ref] = u19,
                    LayoutOrder = 0,
                    Position = UDim2.fromScale(0.05, 0)
                }), u2.createElement("TextLabel", {
                    Text = "(Base + 1000/hr)",
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(0.25, 0.5),
                    FontFace = Font.fromName("GothamBold", Enum.FontWeight.Thin),
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Font = AfkPlaceUtils.Theme.font,
                    TextStrokeTransparency = 1,
                    TextSize = 42,
                    TextScaled = true,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextColor3 = Color3.fromRGB(120, 120, 120),
                    [u2.Ref] = u19,
                    LayoutOrder = 1,
                    Position = UDim2.fromScale(0.37, 0.15)
                }) })
        };
        local _ = #v85;
        local v86 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.5)
        };
        local v87 = {};
        local v88 = u2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal
        });
        local v89 = u2.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.05, 1)
        });
        local createElement = u2.createElement;
        local v90 = {
            [u2.Ref] = u17
        };
        local v91 = math.round(AfkPlaceUtils.baseAfkCoinsPerHour * u37);
        v90.Text = "+" .. tostring(v91) .. "/Hour";
        v90.AnchorPoint = Vector2.new(0.5, 0.5);
        v90.Position = UDim2.fromScale(0.5, 0.8);
        v90.Size = UDim2.fromScale(0.3, 0.5);
        v90.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular);
        v90.BackgroundTransparency = 1;
        v90.BorderSizePixel = 0;
        v90.AutomaticSize = Enum.AutomaticSize.X;
        v90.TextSize = 28;
        v90.TextStrokeTransparency = 1;
        v90.TextTransparency = 0.2;
        v90.TextScaled = true;
        v90.TextXAlignment = Enum.TextXAlignment.Center;
        v90.TextColor3 = ColorUtil.WHITE;
        v90.SizeConstraint = "RelativeYY";
        v90.LayoutOrder = 1;
        v87[1], v87[2], v87[3] = v88, v89, createElement("TextLabel", v90);
        local v92 = #v87;
        local v93;

        if v35 then
            local createElement2 = u2.createElement;
            local v94 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v95 = math.round(AfkPlaceUtils.baseAfkCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v94.Text = "(+" .. tostring(v95) .. " VIP)";
            v94.AnchorPoint = Vector2.new(0.5, 0.5);
            v94.Position = UDim2.fromScale(0.5, 0.8);
            v94.Size = UDim2.fromScale(0.3, 0.5);
            v94.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular);
            v94.AutomaticSize = Enum.AutomaticSize.X;
            v94.TextXAlignment = Enum.TextXAlignment.Center;
            v94.TextColor3 = Color3.fromRGB(48, 255, 8);
            v93 = createElement2("TextLabel", v94);
        else
            v93 = v35;
        end;

        if v93 then
            v87[v92 + 1] = v93;
        end;

        local v96 = #v87;
        local v97;

        if v36 then
            local createElement2 = u2.createElement;
            local v98 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v99 = math.round(AfkPlaceUtils.baseAfkCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v98.Text = "(+" .. tostring(v99) .. " Roblox Premium)";
            v98.AnchorPoint = Vector2.new(0.5, 0.5);
            v98.Position = UDim2.fromScale(0.5, 0.8);
            v98.Size = UDim2.fromScale(0.3, 0.5);
            v98.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular);
            v98.AutomaticSize = Enum.AutomaticSize.X;
            v98.TextXAlignment = Enum.TextXAlignment.Center;
            v98.TextColor3 = Color3.fromRGB(230, 255, 8);
            v97 = createElement2("TextLabel", v98);
        else
            v97 = v36;
        end;

        if v97 then
            v87[v96 + 1] = v97;
        end;

        v85.ActualRate = u2.createElement("Frame", v86, v87);
        v83.MiddleComponent = u2.createElement("Frame", v84, v85);
        v83.AfkAmountPill = u2.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.28, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.55,
            BorderSizePixel = 0,
            [u2.Ref] = u16,
            LayoutOrder = 2
        }, { u2.createElement(ProgressBarUI, {
                isVip = false,
                isPremium = false,
                startTime = u5.AfkStartTime,
                mountStartTime = u5.MountStartTime,
                multiplier = u37,
                image = AfkShopUtils.currencyIcon,
                rate = AfkPlaceUtils.baseAfkCoinsPerHour,
                startAmount = u5.AfkCoinStart
            }) });
        v81.AfkCurrencyContainer = u2.createElement("Frame", v82, v83);
        local v100 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            LayoutOrder = 5,
            Size = UDim2.fromScale(0.5, 0.6),
            Position = UDim2.fromScale(0, 0.25),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(58, 54, 112)
        };
        local v101 = { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal
            }), u2.createElement("ImageLabel", {
                SizeConstraint = "RelativeXY",
                ScaleType = "Fit",
                BackgroundTransparency = 0.7,
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.12, 1),
                Image = BedwarsImageId.BED_COIN_ICON,
                BackgroundColor3 = ColorUtil.BLACK
            }) };
        local _ = #v101;
        local v102 = {
            LayoutOrder = 1,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Size = UDim2.fromScale(0.6, 1)
        };
        local v103 = {
            u2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Vertical
            }),
            BedcoinCurrencyName = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 0.5)
            }, { u2.createElement("TextLabel", {
                    Text = "Bed Coins",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextStrokeTransparency = 1,
                    TextSize = 42,
                    TextScaled = true,
                    LayoutOrder = 0,
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(0.25, 0.75),
                    FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Font = AfkPlaceUtils.Theme.font,
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextColor3 = ColorUtil.WHITE,
                    Position = UDim2.fromScale(0.05, 0)
                }), u2.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    TextStrokeTransparency = 1,
                    TextSize = 42,
                    TextScaled = true,
                    LayoutOrder = 1,
                    Text = "(Base + " .. tostring(AfkPlaceUtils.baseAfkBedCoinsPerHour) .. "/hr)",
                    AnchorPoint = Vector2.new(0, 0),
                    Size = UDim2.fromScale(0.25, 0.5),
                    FontFace = Font.fromName("GothamBold", Enum.FontWeight.Thin),
                    AutomaticSize = Enum.AutomaticSize.X,
                    Font = AfkPlaceUtils.Theme.font,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextColor3 = Color3.fromRGB(120, 120, 120),
                    Position = UDim2.fromScale(0.37, 0.15)
                }) })
        };
        local _ = #v103;
        local v104 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.5)
        };
        local v105 = {};
        local v106 = u2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal
        });
        local v107 = u2.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0.05, 1)
        });
        local createElement2 = u2.createElement;
        local v108 = {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextSize = 28,
            TextStrokeTransparency = 1,
            TextTransparency = 0.2,
            TextScaled = true,
            SizeConstraint = "RelativeYY",
            LayoutOrder = 1
        };
        local v109 = math.round(AfkPlaceUtils.baseAfkBedCoinsPerHour * u37);
        v108.Text = "+" .. tostring(v109) .. "/Hour";
        v108.AnchorPoint = Vector2.new(0.5, 0.5);
        v108.Position = UDim2.fromScale(0.5, 0.8);
        v108.Size = UDim2.fromScale(0.3, 0.5);
        v108.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular);
        v108.AutomaticSize = Enum.AutomaticSize.X;
        v108.TextXAlignment = Enum.TextXAlignment.Center;
        v108.TextColor3 = ColorUtil.WHITE;
        v105[1], v105[2], v105[3] = v106, v107, createElement2("TextLabel", v108);
        local v110 = #v105;
        local v111;

        if v35 then
            local createElement3 = u2.createElement;
            local v112 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v113 = math.round(AfkPlaceUtils.baseAfkBedCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v112.Text = "(+" .. tostring(v113) .. " VIP)";
            v112.AnchorPoint = Vector2.new(0.5, 0.5);
            v112.Position = UDim2.fromScale(0.5, 0.8);
            v112.Size = UDim2.fromScale(0.3, 0.5);
            v112.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular);
            v112.AutomaticSize = Enum.AutomaticSize.X;
            v112.TextXAlignment = Enum.TextXAlignment.Center;
            v112.TextColor3 = Color3.fromRGB(48, 255, 8);
            v111 = createElement3("TextLabel", v112);
        else
            v111 = v35;
        end;

        if v111 then
            v105[v110 + 1] = v111;
        end;

        local v114 = #v105;
        local v115;

        if v36 then
            local createElement3 = u2.createElement;
            local v116 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                TextSize = 28,
                TextStrokeTransparency = 1,
                TextTransparency = 0.2,
                TextScaled = true,
                SizeConstraint = "RelativeYY",
                LayoutOrder = 2
            };
            local v117 = math.round(AfkPlaceUtils.baseAfkBedCoinsPerHour * AfkPlaceUtils.vipMultiplier);
            v116.Text = "(+" .. tostring(v117) .. " Roblox Premium)";
            v116.AnchorPoint = Vector2.new(0.5, 0.5);
            v116.Position = UDim2.fromScale(0.5, 0.8);
            v116.Size = UDim2.fromScale(0.3, 0.5);
            v116.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Regular);
            v116.AutomaticSize = Enum.AutomaticSize.X;
            v116.TextXAlignment = Enum.TextXAlignment.Center;
            v116.TextColor3 = Color3.fromRGB(230, 255, 8);
            v115 = createElement3("TextLabel", v116);
        else
            v115 = v36;
        end;

        if v115 then
            v105[v114 + 1] = v115;
        end;

        v103.BedcoinActualRate = u2.createElement("Frame", v104, v105);
        v101.BedcoinMiddleComponent = u2.createElement("Frame", v102, v103);
        local v118 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.28, 1),
            Position = UDim2.fromScale(0.5, 0.5),
            BackgroundColor3 = ColorUtil.BLACK,
            BackgroundTransparency = 0.55,
            BorderSizePixel = 0,
            [u2.Ref] = u16,
            LayoutOrder = 2
        };
        local v119 = {};
        local v120 = {
            startTime = u5.AfkStartTime,
            mountStartTime = u5.MountStartTime,
            multiplier = u37,
            image = BedwarsImageId.BED_COIN_ICON,
            rate = AfkPlaceUtils.baseAfkBedCoinsPerHour,
            startAmount = u5.BedCoinStart,
            isVip = v35
        };

        if v36 == nil then
            v36 = false;
        end;

        v120.isPremium = v36;
        v119[#v119 + 1] = u2.createElement(ProgressBarUI, v120);
        v101.BedCoinAmountPill = u2.createElement("Frame", v118, v119);
        v81.AfkBedcoinContainer = u2.createElement("Frame", v100, v101);
        v79.UpperFrame = u2.createElement("Frame", v80, v81);
        v77.BattlepassProgress = u2.createElement("Frame", v78, v79);
        v77.BattlePassTopHalfBackground = u2.createElement("Frame", {
            [u2.Ref] = u32,
            Size = UDim2.fromScale(1, 0.15),
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.X,
            BorderSizePixel = 0,
            LayoutOrder = 0,
            BackgroundColor3 = ColorUtil.BLACK,
            Position = UDim2.fromScale(0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0),
            ZIndex = 2
        }, { u2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 6)
            }), u2.createElement("TextLabel", {
                [u2.Ref] = u30,
                Size = UDim2.fromScale(1, 0.8),
                FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Text = "Rewards",
                TextColor3 = ColorUtil.WHITE,
                TextScaled = true,
                TextSize = 25,
                TextStrokeTransparency = 1,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left,
                LayoutOrder = 7,
                ZIndex = 3
            }) });

        return u2.createFragment({
            ProgressBarContainer = u2.createElement("Frame", v76, v77)
        });
    end)
};