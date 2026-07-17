-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v5.RunService;
local TweenService = v5.TweenService;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;

return {
    MatchExpProgressionCore = v4.new(u3)(function(u6, p7) -- Line: 14
        -- upvalues: u3 (copy), SoundManager (copy), GameSound (copy), TweenService (copy), RuntimeLib (copy), u2 (copy), RunService (copy), DeviceUtil (copy), ColorUtil (copy)
        local useState = p7.useState;
        local useEffect = p7.useEffect;
        local v8, u9 = useState(u6.MatchExperienceEarned.reasons[1]);
        local u10, u11 = useState(false);
        local v12, u13 = useState(0);
        local u14, u15 = useState(u6.InitialExpProgress);
        local v16, u17 = useState(u14);
        local u18, u19 = useState(u6.LevelAfterExp);
        local u20, u21 = useState(0);
        local v22;

        if v8 == nil then
            v22 = v8;
        else
            v22 = v8.experience;
        end;

        local u23 = u14 - (v22 == nil and 0 or v22);
        local u24 = u3.createRef();
        local v25 = u3.createRef();
        local v26 = u6.Color or Color3.fromRGB(122, 255, 82);
        local u27 = u3.createRef();
        local v28 = u3.createRef();
        local v29 = u3.createRef();

        local function _() -- Line: 50
            -- upvalues: u6 (copy)
            local v30 = u6.MatchExperienceEarned.startingExperience / u6.GetExpForLevel(u6.LevelAfterExp + 1);

            return math.min(v30, 1);
        end;

        useEffect(function() -- Line: 55
            -- upvalues: u27 (copy), u18 (copy), u20 (copy), u6 (copy), u14 (copy), u19 (copy), u21 (copy), u17 (copy), SoundManager (ref), GameSound (ref), TweenService (ref), RuntimeLib (ref), u23 (copy)
            local u31 = u27:getValue();

            local function u35() -- Line: 57
                -- upvalues: u18 (ref), u20 (ref), u6 (ref), u14 (ref)
                local v32 = u18 - u20;
                local v33 = false;
                local v34 = 0;

                while true do
                    if v33 then
                        v32 = v32 + 1;
                    else
                        v33 = true;
                    end;

                    if v32 >= u18 then
                        return u14 - v34;
                    end;

                    v34 = v34 + u6.GetExpForLevel(v32);
                end;
            end;

            local function u41() -- Line: 76
                -- upvalues: u18 (ref), u20 (ref), u6 (ref), u14 (ref)
                local v36 = u18 + 1;
                local v37 = u20 + 1;
                local v38 = v36;
                local v39 = false;
                local v40 = 0;

                while true do
                    if v39 then
                        v36 = v36 - 1;
                    else
                        v39 = true;
                    end;

                    if v38 - v37 >= v36 then
                        return u14 - v40;
                    end;

                    v40 = v40 + u6.GetExpForLevel(v36);
                end;
            end;

            local function _() -- Line: 97
                -- upvalues: u6 (ref), u18 (ref), u20 (ref)
                return u6.GetExpForLevel(u18 + 1, true) - u6.GetExpForLevel(u18 - u20, true);
            end;

            local function _(p42) -- Line: 100
                -- upvalues: u19 (ref), u18 (ref), u21 (ref), u20 (ref), u17 (ref), u6 (ref), SoundManager (ref), GameSound (ref)
                u19(u18 + 1);
                u21(u20 + 1);
                u17(p42);

                if not u6.DisableSound then
                    SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_LEVEL_UP);
                end;
            end;

            local function v47() -- Line: 108
                -- upvalues: u41 (copy), TweenService (ref), u31 (copy), u19 (ref), u18 (ref), u21 (ref), u20 (ref), u17 (ref), u6 (ref), SoundManager (ref), GameSound (ref), RuntimeLib (ref)
                local v43 = u41();
                local v44 = TweenService:Create(u31, TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Size = UDim2.fromScale(1, 1)
                });
                u19(u18 + 1);
                u21(u20 + 1);
                u17(v43);

                if not u6.DisableSound then
                    SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_LEVEL_UP);
                end;

                local u45 = TweenService:Create(u31, TweenInfo.new(0.001), {
                    Size = UDim2.fromScale(0, 1)
                });
                local u46 = TweenService:Create(u31, TweenInfo.new(0.125, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
                    Size = UDim2.fromScale(v43 / u6.GetExpForLevel(u18 + 1), 1)
                });
                v44:Play();
                RuntimeLib.Promise.fromEvent(v44.Completed):andThen(function() -- Line: 124
                    -- upvalues: u45 (copy)
                    u45:Play();
                end);
                RuntimeLib.Promise.fromEvent(u45.Completed):andThen(function() -- Line: 129
                    -- upvalues: u46 (copy), u6 (ref), SoundManager (ref), GameSound (ref)
                    u46:Play();

                    if not u6.DisableSound then
                        SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_EXP_GAIN);
                    end;
                end);
            end;

            local function v54() -- Line: 137
                -- upvalues: u35 (copy), TweenService (ref), u27 (ref), u6 (ref), u18 (ref), u17 (ref), SoundManager (ref), GameSound (ref)
                local v48 = u35();
                local v49 = u27:getValue();
                local v50 = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
                local v51 = {};
                local fromScale = UDim2.fromScale;
                local v52 = v48 / u6.GetExpForLevel(u18 + 1);
                v51.Size = fromScale(math.min(v52, 1), 1);
                local v53 = TweenService:Create(v49, v50, v51);
                u17(v48);
                v53:Play();

                if not u6.DisableSound then
                    SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_EXP_GAIN);
                end;
            end;

            local v55 = u6.GetExpForLevel(u18 + 1, true) - u6.GetExpForLevel(u18 - u20, true);

            if v55 >= u14 or u23 >= v55 then
                if not u6.DisableAnimation then
                    v54();

                    return;
                end;

                local fromScale = UDim2.fromScale;
                local v56 = u14 / u6.GetExpForLevel(u18 + 1);
                u31.Size = fromScale(math.min(v56, 1), 1);
                u17(u14);

                return;
            end;

            if not u6.DisableAnimation then
                v47();

                return;
            end;

            local v57 = u41();
            u19(u18 + 1);
            u21(u20 + 1);
            u17(v57);

            if not u6.DisableSound then
                SoundManager:playSound(GameSound.BATTLE_PASS_PROGRESS_LEVEL_UP);
            end;

            u17(v57);
            u31.Size = UDim2.fromScale(v57 / u6.GetExpForLevel(u18 + 1), 1);
        end, { u14 });
        useEffect(function() -- Line: 168
            -- upvalues: u2 (ref), u14 (copy), u6 (copy), u24 (copy), u11 (copy), u13 (copy), u15 (copy), TweenService (ref), u9 (copy), u10 (copy), RunService (ref), RuntimeLib (ref)
            local u58 = u2.new();
            local u59 = true;
            local u60 = 0;
            local u61 = u14;
            local u62 = 0;
            local u63 = 0;
            local reasons = u6.MatchExperienceEarned.reasons;
            local v64 = u24:getValue();

            if not u6.DisableAnimation then
                local u65 = TweenService:Create(v64, TweenInfo.new(0.25), {
                    TextTransparency = 0,
                    Position = UDim2.fromScale(0, 0)
                });
                local u66 = TweenService:Create(v64, TweenInfo.new(0.001), {
                    TextTransparency = 1,
                    Position = UDim2.fromScale(0.1, 0)
                });

                local function u69() -- Line: 201
                    -- upvalues: u62 (ref), reasons (copy), u9 (ref), u60 (ref), u13 (ref), u61 (ref), u15 (ref), u65 (copy), u10 (ref), u11 (ref)
                    if u62 < #reasons then
                        u9(reasons[u62 + 1]);
                        u60 = u60 + reasons[u62 + 1].experience;
                        u13(u60);
                        u61 = u61 + reasons[u62 + 1].experience;
                        u15(u61);
                        local v67 = u65;

                        if v67 ~= nil then
                            v67:Play();
                        end;
                    elseif not u10 then
                        u11(true);
                        local v68 = u65;

                        if v68 ~= nil then
                            v68:Play();
                        end;
                    end;
                end;

                u58:GiveTask(RunService.Heartbeat:Connect(function(p70) -- Line: 220
                    -- upvalues: u63 (ref), u59 (ref), u69 (copy), RuntimeLib (ref), u65 (copy), u62 (ref), reasons (copy), u58 (copy), u66 (copy)
                    u63 = u63 + p70;

                    if u63 >= 1.5 and u59 then
                        u63 = u63 - 1.5;
                        u69();
                        RuntimeLib.Promise.fromEvent(u65.Completed):andThen(function() -- Line: 226
                            -- upvalues: u62 (ref), reasons (ref), u58 (ref), u66 (ref)
                            if u62 >= #reasons + 1 then
                                u58:DoCleaning();

                                return;
                            end;

                            wait(1.1);
                            local v71 = u66;

                            if v71 ~= nil then
                                v71:Play();
                            end;
                        end);
                        u62 = u62 + 1;
                    end;
                end));

                return function() -- Line: 242
                    -- upvalues: u59 (ref), u58 (copy)
                    u59 = false;
                    u58:DoCleaning();
                end;
            end;

            v64.TextTransparency = 0;
            v64.Position = UDim2.fromScale(0, 0);
            u11(true);

            local function _(p72) -- Line: 182
                -- upvalues: u60 (ref)
                u60 = u60 + p72.experience;
            end;

            for i, v in reasons do
                local _ = i - 1;
                u60 = u60 + v.experience;
            end;

            u13(u60);
            u15(u61 + u60);

            return nil;
        end, {});
        local v73 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = u6.Size,
            BackgroundTransparency = 1,
            LayoutOrder = u6.LayoutOrder,
            [u3.Ref] = v25
        };
        local v74 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(0, 10)
            }),
            LevelContainer = u3.createElement("Frame", {
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 15 or 30),
                BackgroundColor3 = ColorUtil.BLACK
            }, {
                CurrentLevel = u3.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0, 1),
                    AnchorPoint = Vector2.new(0, 1),
                    Text = "Level " .. tostring(u18),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Bottom,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextSize = DeviceUtil.isSmallScreen() and 14 or 18
                }),
                NextLevel = u3.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(1, 1),
                    BackgroundTransparency = 1,
                    Text = "Level " .. tostring(u18 + 1),
                    TextXAlignment = Enum.TextXAlignment.Right,
                    TextYAlignment = Enum.TextYAlignment.Bottom,
                    TextTransparency = 0.3,
                    TextColor3 = ColorUtil.WHITE,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextSize = DeviceUtil.isSmallScreen() and 14 or 18,
                    [u3.Ref] = v29
                }),
                ProgressionTitle = u3.createElement("TextLabel", {
                    Size = UDim2.fromScale(1, 1),
                    AnchorPoint = Vector2.new(0.5, 0),
                    Position = UDim2.fromScale(0.5, 0),
                    BackgroundTransparency = 1,
                    Text = tostring(u6.Title),
                    TextColor3 = ColorUtil.WHITE,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    TextSize = DeviceUtil.isSmallScreen() and 16 or 24,
                    [u3.Ref] = v28
                })
            })
        };
        local createElement = u3.createElement;
        local v75 = {
            BorderSizePixel = 0,
            BackgroundTransparency = 0.7,
            LayoutOrder = 2,
            Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 8 or 16),
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v76 = {};
        local createElement2 = u3.createElement;
        local v77 = {};
        local fromScale = UDim2.fromScale;
        local v78 = u6.MatchExperienceEarned.startingExperience / u6.GetExpForLevel(u6.LevelAfterExp + 1);
        v77.Size = fromScale(math.min(v78, 1), 1);
        v77.BackgroundColor3 = v26;
        v77.BorderSizePixel = 0;
        v77.BackgroundTransparency = 0;
        v77.ZIndex = 2;
        v77[u3.Ref] = u27;
        v76.CurrProgress = createElement2("Frame", v77);
        v76.TotalProgress = u3.createElement("Frame", {
            BorderSizePixel = 0,
            BackgroundTransparency = 0,
            ZIndex = 1,
            Size = UDim2.fromScale(1, 1),
            BackgroundColor3 = ColorUtil.hexColor(5132418)
        });
        v74.ProgressBar = createElement("Frame", v75, v76);
        local _ = #v74;
        local v79 = {
            BackgroundTransparency = 1,
            LayoutOrder = 3,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = ColorUtil.BLACK
        };
        local v80 = {};
        local _ = #v80;
        local v81 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0, 0)
        };
        local v82;

        if u10 then
            local v83 = ColorUtil.richTextColor(v26);
            local v84 = math.floor(v12);
            v82 = "<b><font color=\"" .. v83 .. "\">" .. tostring(v84) .. "</font> TOTAL XP EARNED</b>";
        else
            local v85;

            if v8 == nil then
                v85 = v8;
            else
                v85 = string.upper(v8.name);
            end;

            local v86 = ColorUtil.richTextColor(v26);
            local v87 = math;

            if v8 ~= nil then
                v8 = v8.experience;
            end;

            local v88 = tostring(v85);
            local v89 = v87.ceil(v8 == nil and 0 or v8);
            v82 = "<b>" .. v88 .. " <font color=\"" .. v86 .. "\">+" .. tostring(v89) .. "</font></b>";
        end;

        v81.Text = v82;
        v81.TextColor3 = ColorUtil.WHITE;
        v81.TextTransparency = 1;
        v81.RichText = true;
        v81.Font = Enum.Font.Roboto;
        v81.TextSize = DeviceUtil.isSmallScreen() and 15 or 20;
        v81[u3.Ref] = u24;
        v81.TextXAlignment = Enum.TextXAlignment.Left;
        v80.ReasonExpDisplay = u3.createElement("TextLabel", v81);
        local createElement3 = u3.createElement;
        local v90 = {
            Size = UDim2.fromScale(1, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(1, 0),
            BackgroundTransparency = 1
        };
        local v91 = math.floor(v16);
        v90.Text = "<b>" .. tostring(v91) .. " / " .. tostring(u6.GetExpForLevel(u18 + 1)) .. "</b>";
        v90.TextColor3 = ColorUtil.WHITE;
        v90.TextXAlignment = Enum.TextXAlignment.Right;
        v90.RichText = true;
        v90.Font = Enum.Font.Roboto;
        v90.TextSize = 16;
        v90[u3.Ref] = v28;
        v80.ExpProgress = createElement3("TextLabel", v90);
        v74.ExpContainer = u3.createElement("Frame", v79, v80);

        return u3.createFragment({
            ProgressionWrapper = u3.createElement("Frame", v73, v74)
        });
    end)
};