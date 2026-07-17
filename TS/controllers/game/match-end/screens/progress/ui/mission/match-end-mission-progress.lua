-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local MathExtras = v1.MathExtras;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local LabelledText = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "labelled-text", "labelled-text").LabelledText;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventType;
local MissionIntervalType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType;
local MissionContext = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-context").MissionContext;
local MissionGenerator = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission-generator-type").MissionGenerator;
local u5 = nil;
local u6 = nil;

local function v55(u7, p8) -- Line: 19
    -- upvalues: u2 (copy), MissionContext (copy), MissionGenerator (copy), DeviceUtil (copy), MissionIntervalType (copy), EventType (copy), RunService (copy), MathExtras (copy), ColorUtil (copy), u5 (ref), u6 (ref), LabelledText (copy), Empty (copy)
    local useEffect = p8.useEffect;
    local v9, u10 = p8.useState(nil);
    local v11 = u2.createRef();
    useEffect(function() -- Line: 24
        -- upvalues: u7 (copy), MissionContext (ref), MissionGenerator (ref), DeviceUtil (ref), MissionIntervalType (ref), EventType (ref), u10 (copy), RunService (ref), MathExtras (ref)
        local u12 = {};
        local Missions = u7.Missions;

        local function v17(p13) -- Line: 27
            -- upvalues: MissionContext (ref), u12 (copy), MissionGenerator (ref)
            local v14 = MissionContext.getMission(p13.missionId);
            local v15 = {
                id = p13.missionId,
                description = p13.description,
                currProgress = p13.startProgress,
                goalProgress = p13.goalProgress
            };
            local v16;

            if v14 == nil then
                v16 = v14;
            else
                v16 = v14.rewardAmount;
            end;

            v15.rewardAmount = v16 == nil and 1 or v16;
            v15.intervalType = p13.intervalType;

            if v14 ~= nil then
                v14 = v14.playerLevelReq;
            end;

            v15.playerLevelReq = v14 == nil and 0 or v14;
            v15.tempStartProgress = p13.startProgress;
            v15.tempEndProgress = p13.currentProgress;
            v15.event = p13.event;
            v15.generator = MissionGenerator.BATTLEPASS;
            table.insert(u12, v15);
        end;

        for i, v in Missions do
            v17(v, i - 1, Missions);
        end;

        if DeviceUtil.isHoarceKat() then
            local v18 = false;
            local v19 = 0;

            while true do
                if true then
                    if v18 then
                        v19 = v19 + 1;
                    else
                        v18 = true;
                    end;
                end;

                if v19 >= 1 then
                    break;
                end;

                table.insert(u12, {
                    id = "1",
                    description = "Win 5 games",
                    currProgress = 0,
                    goalProgress = 5,
                    rewardAmount = 1,
                    playerLevelReq = 0,
                    tempStartProgress = 0,
                    tempEndProgress = 3,
                    intervalType = MissionIntervalType.DAILY,
                    generator = MissionGenerator.BATTLEPASS
                });
            end;

            local v20 = false;
            local v21 = 0;

            while true do
                if true then
                    if v20 then
                        v21 = v21 + 1;
                    else
                        v20 = true;
                    end;
                end;

                if v21 >= 2 then
                    break;
                end;

                table.insert(u12, {
                    id = "1",
                    description = "Deal 800 damage",
                    currProgress = 200,
                    goalProgress = 800,
                    rewardAmount = 1,
                    playerLevelReq = 0,
                    tempStartProgress = 200,
                    tempEndProgress = 400,
                    intervalType = MissionIntervalType.WEEKLY,
                    generator = MissionGenerator.BATTLEPASS
                });
            end;

            table.insert(u12, {
                id = "1",
                description = "Win 5 games",
                currProgress = 0,
                goalProgress = 5,
                rewardAmount = 1,
                playerLevelReq = 0,
                tempStartProgress = 0,
                tempEndProgress = 3,
                intervalType = MissionIntervalType.DAILY,
                event = EventType.EGG_HUNT_2025,
                generator = MissionGenerator.BATTLEPASS
            });
        end;

        u10(u12);
        local u22 = 0;
        local u23 = nil;
        u23 = RunService.Heartbeat:Connect(function(p24) -- Line: 142
            -- upvalues: u22 (ref), u23 (ref), u12 (copy), MathExtras (ref), u10 (ref)
            u22 = u22 + p24 / 2;

            if u22 >= 1 then
                u22 = 1;
                u23:Disconnect();
            end;

            local function _(p25) -- Line: 149
                -- upvalues: MathExtras (ref), u22 (ref), u10 (ref), u12 (ref)
                if p25.currProgress < p25.goalProgress then
                    p25.currProgress = MathExtras:lerp(p25.tempStartProgress, p25.tempEndProgress, u22);
                end;

                u10(u12);
            end;

            for i, v in u12 do
                local _ = i - 1;

                if v.currProgress < v.goalProgress then
                    v.currProgress = MathExtras:lerp(v.tempStartProgress, v.tempEndProgress, u22);
                end;

                u10(u12);
            end;
        end);
    end, {});
    local v26 = {
        Size = u7.Size,
        [u2.Ref] = v11,
        LayoutOrder = u7.LayoutOrder,
        BackgroundColor3 = ColorUtil.BLACK,
        BackgroundTransparency = 0.7,
        BorderSizePixel = 0
    };
    local FrameProps = u7.FrameProps;

    if FrameProps then
        for i, v in FrameProps do
            v26[i] = v;
        end;
    end;

    local v27 = { u2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 6)
        }) };
    local v28 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1)
    };
    local v29 = {};
    local v30 = {
        Text = "No mission progress to display.",
        TextSize = 25,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.9, 0.9),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        TextColor3 = Color3.fromRGB(158, 158, 158),
        FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
    };
    local v31 = v9 ~= nil and #v9 or v9;
    v30.Visible = (v31 == nil and 0 or v31) <= 0;
    v29[#v29 + 1] = u2.createElement("TextLabel", v30);
    v27.NoMissionFrame = u2.createElement("Frame", v28, v29);
    local v32 = {
        Size = UDim2.fromScale(1, 1) - UDim2.fromOffset(0, 20),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        AutomaticCanvasSize = Enum.AutomaticSize.X
    };
    local v33 = UDim2;
    local v34 = DeviceUtil.isSmallScreen() and 53 or 85;
    local v35 = v9 ~= nil and #v9 or v9;
    v32.CanvasSize = v33.fromOffset(0, v34 * (v35 == nil and 0 or v35));
    v32.BackgroundTransparency = 1;
    v32.BorderSizePixel = 0;
    v32.ScrollingDirection = Enum.ScrollingDirection.Y;
    v32.ScrollBarThickness = 4;
    v32.ScrollBarImageTransparency = 0.3;
    v32.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255);
    local v36;

    if v9 == nil then
        v36 = v9;
    else
        local function v52(p37) -- Line: 234
            -- upvalues: u5 (ref), u6 (ref), DeviceUtil (ref), u2 (ref), ColorUtil (ref), LabelledText (ref), Empty (ref)
            local v38 = u5(p37);
            local v39 = u6(p37);
            local v40 = {
                BackgroundTransparency = 1,
                Size = UDim2.new(0.95, 0, 0, DeviceUtil.isSmallScreen() and 30 or 60),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5)
            };
            local v41 = { u2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Top,
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) };
            local v42 = #v41;
            local v43 = {
                BackgroundTransparency = 1,
                LayoutOrder = 0,
                Size = UDim2.fromScale(1, 0.4),
                Position = UDim2.fromScale(0, 1),
                AnchorPoint = Vector2.new(0, 1),
                BackgroundColor3 = ColorUtil.BLACK
            };
            local v44 = {
                MissionDescription = u2.createElement(LabelledText, {
                    FrameProps = {
                        Size = UDim2.fromScale(0, 1),
                        AutomaticSize = Enum.AutomaticSize.X
                    },
                    Image = v38,
                    ImageLeft = v38 ~= nil,
                    Text = "<b>" .. p37.description .. "</b>",
                    TextProps = {
                        TextScaled = false,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextSize = DeviceUtil.isSmallScreen() and 13 or 16
                    },
                    Padding = UDim.new(0, 5)
                })
            };
            local _ = #v44;
            local v45 = {
                BackgroundTransparency = 1,
                Size = UDim2.fromScale(1, 1)
            };

            if v39 ~= nil then
                v39 = string.upper(v39);
            end;

            v45.Text = tostring(v39);
            v45.TextXAlignment = Enum.TextXAlignment.Right;
            v45.TextTransparency = 0.2;
            v45.TextColor3 = ColorUtil.WHITE;
            v45.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
            v45.TextSize = DeviceUtil.isSmallScreen() and 12 or 15;
            v44.MissionType = u2.createElement("TextLabel", v45);
            v41.MissionTopContainer = u2.createElement("Frame", v43, v44);
            v41[v42 + 1] = u2.createElement(Empty, {
                LayoutOrder = 1,
                Size = UDim2.new(1, 0, 0, 5)
            });
            v41.ProgressBar = u2.createElement("Frame", {
                BorderSizePixel = 0,
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, DeviceUtil.isSmallScreen() and 8 or 16)
            }, {
                CurrProgress = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 2,
                    Size = UDim2.fromScale(math.clamp(p37.currProgress / p37.goalProgress, 0, 1), 1),
                    BackgroundColor3 = ColorUtil.hexColor(12172543)
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }) }),
                TotalProgress = u2.createElement("Frame", {
                    BorderSizePixel = 0,
                    ZIndex = 1,
                    Size = UDim2.fromScale(1, 1),
                    BackgroundColor3 = ColorUtil.hexColor(6580135)
                }, { u2.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 6)
                    }) })
            });
            v41[v42 + 2] = u2.createElement(Empty, {
                LayoutOrder = 3,
                Size = UDim2.new(1, 0, 0, 10)
            });
            local createElement = u2.createElement;
            local v46 = {
                BackgroundTransparency = 1,
                LayoutOrder = 4,
                Size = UDim2.fromScale(1, 0.2),
                BackgroundColor3 = ColorUtil.BLACK
            };
            local v47 = {};
            local createElement2 = u2.createElement;
            local v48 = {
                BackgroundTransparency = 1,
                TextTransparency = 0.2,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.fromScale(0, 0)
            };
            local v49 = math.floor(p37.currProgress / p37.goalProgress * 100);
            v48.Text = tostring(v49) .. "%";
            v48.TextColor3 = ColorUtil.WHITE;
            v48.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
            v48.TextSize = DeviceUtil.isSmallScreen() and 12 or 16;
            v48.TextXAlignment = Enum.TextXAlignment.Left;
            v47.MissionPercentProgress = createElement2("TextLabel", v48);
            local createElement3 = u2.createElement;
            local v50 = {
                BackgroundTransparency = 1,
                TextTransparency = 0.2,
                Size = UDim2.fromScale(1, 1),
                AnchorPoint = Vector2.new(1, 0),
                Position = UDim2.fromScale(1, 0)
            };
            local v51 = math.floor(p37.currProgress);
            v50.Text = tostring(v51) .. "/" .. tostring(p37.goalProgress);
            v50.TextColor3 = ColorUtil.WHITE;
            v50.TextXAlignment = Enum.TextXAlignment.Right;
            v50.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold);
            v50.TextSize = DeviceUtil.isSmallScreen() and 12 or 16;
            v47.MissionGoalProgress = createElement3("TextLabel", v50);
            v41.MissionBottomContainer = createElement("Frame", v46, v47);

            return u2.createFragment({
                MissionWrapper = u2.createElement("Frame", v40, v41)
            });
        end;

        v36 = table.create(#v9);

        for i, v in v9 do
            v36[i] = v52(v, i - 1, v9);
        end;
    end;

    local v53 = { u2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 25)
        }) };
    local v54 = #v53;

    if v36 then
        for i, v in v36 do
            v53[v54 + i] = v;
        end;
    end;

    v27[#v27 + 1] = u2.createElement("ScrollingFrame", v32, v53);

    return u2.createElement("Frame", v26, v27);
end;

u5 = function(p56) -- Line: 390, Name: getMissionIcon
    -- upvalues: EventMeta (copy), MissionContext (copy)
    if p56.event == nil then
        local v57 = MissionContext.getMissionGeneratorClass(p56.generator);

        if v57 ~= nil then
            v57 = v57:getConfig().icon;
        end;

        return v57;
    end;

    local lobbyButtonConfig = EventMeta[p56.event].lobbyButtonConfig;

    if lobbyButtonConfig ~= nil then
        lobbyButtonConfig = lobbyButtonConfig.icon;
    end;

    return lobbyButtonConfig;
end;

u6 = function(p58) -- Line: 405, Name: getMissionType
    -- upvalues: MissionIntervalType (copy)
    if p58.event ~= nil then
        return "EVENT";
    end;

    if p58.intervalType == MissionIntervalType.DAILY then
        return "DAILY";
    end;

    if p58.intervalType == MissionIntervalType.WEEKLY then
        return "WEEKLY";
    end;
end;

local v59 = v3.new(u2)(v55);

return {
    MatchEndMissionProgress = v4.connect(function(p60, p61) -- Line: 417
        local v62 = {};

        for i, v in p61 do
            v62[i] = v;
        end;

        return v62;
    end)(v59)
};