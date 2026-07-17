-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local TopBarCard = v1.TopBarCard;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local v30 = v5.new(u4)(function(u7, p8) -- Line: 16
    -- upvalues: u3 (copy), MatchState (copy), DeviceUtil (copy), Workspace (copy), ColorUtil (copy), u2 (copy), u4 (copy), TopBarCard (copy), Empty (copy), Countdown (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9, u10 = useState({});
    local u11, _ = useState(u3.new());
    local u12 = nil;
    useEffect(function() -- Line: 25
        -- upvalues: u7 (copy), MatchState (ref), u11 (copy), u12 (ref)
        if u7.MatchStartTime == nil then
            return nil;
        end;

        if u7.MatchState == MatchState.POST then
            u11:DoCleaning();

            return nil;
        end;

        if u7.MatchState ~= MatchState.RUNNING then
            return nil;
        end;

        local u13 = true;
        task.spawn(function() -- Line: 38
            -- upvalues: u13 (ref), u12 (ref)
            while u13 do
                u12();
                task.wait(0.5);
            end;
        end);
        u11:GiveTask(function() -- Line: 44
            -- upvalues: u13 (ref)
            u13 = false;
        end);

        return function() -- Line: 47
            -- upvalues: u13 (ref)
            u13 = false;
        end;
    end, { u7.MatchState, u7.MatchStartTime, u7.MatchEvents });

    u12 = function() -- Line: 52
        -- upvalues: DeviceUtil (ref), Workspace (ref), u9 (copy), u7 (copy), ColorUtil (ref), u10 (copy)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u14 = Workspace:GetServerTimeNow();
        local u15 = {};

        for i, v in u9 do
            u15[i] = v;
        end;

        local MatchEvents = u7.MatchEvents;

        local function v19(p16, p17) -- Line: 63
            -- upvalues: u14 (copy), u15 (copy), ColorUtil (ref), u10 (ref)
            local v18 = p16.time - u14;

            if (p16.isOnTopHud.permanentDisplay or v18 < 60) and v18 >= 0 then
                p16.isOnTopHud.shouldDisplay = true;
                u15[p17] = true;

                if v18 < 10 then
                    p16.textColor = Color3.fromRGB(255, 0, 0);
                elseif v18 < 30 then
                    p16.textColor = Color3.fromRGB(255, 204, 0);
                else
                    p16.textColor = ColorUtil.WHITE;
                end;
            else
                p16.isOnTopHud.shouldDisplay = false;
                u15[p17] = false;
            end;

            if math.floor(v18) == 9 or math.floor(v18) == 29 then
                u15[p17] = false;
                u10(u15);
                u15[p17] = true;
            end;
        end;

        for i, v in MatchEvents do
            v19(v, i, MatchEvents);
        end;

        u10(u15);
    end;

    local v20 = not DeviceUtil.isSmallScreen() and not DeviceUtil.isHoarceKat();

    if v20 then
        local v21 = u2.values(u7.MatchEvents);

        local function v24(p22) -- Line: 95
            -- upvalues: u9 (copy), u4 (ref), TopBarCard (ref), u7 (copy), Empty (ref), Countdown (ref)
            local v23 = u9[p22.id] and p22.isOnTopHud.shouldDisplay and u4.createElement(TopBarCard, {
                LayoutOrder = u7.LayoutOrder,
                Size = UDim2.new(0, 100, 0, 32),
                AutomaticSize = Enum.AutomaticSize.None
            }, { u4.createElement("ImageLabel", {
                    SizeConstraint = "RelativeYY",
                    ScaleType = "Fit",
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Size = UDim2.fromScale(1.2, 1.2),
                    Image = p22.image
                }), u4.createElement(Empty, {
                    AutomaticSize = "X",
                    LayoutOrder = 1,
                    Size = UDim2.new(0.5, 0, 1, 0)
                }, {
                    u4.createElement("UIListLayout", {
                        FillDirection = "Vertical",
                        SortOrder = "LayoutOrder",
                        VerticalAlignment = "Center",
                        HorizontalAlignment = "Left",
                        Padding = UDim.new(0, 0.15)
                    }),
                    Title = u4.createElement("TextLabel", {
                        AutomaticSize = "X",
                        Font = "GothamBold",
                        TextScaled = false,
                        RichText = false,
                        TextXAlignment = "Left",
                        BackgroundTransparency = 1,
                        TextTransparency = 0.3,
                        LayoutOrder = 2,
                        TextSize = 9,
                        Size = UDim2.fromScale(0, 0.5),
                        Text = p22.name,
                        TextColor3 = Color3.fromRGB(255, 212, 13)
                    }),
                    u4.createElement(Countdown, {
                        EndTime = p22.time,
                        CountdownConfig = {
                            days = false,
                            hours = false
                        },
                        TextLabel = {
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            TextSize = 16,
                            RichText = true,
                            LayoutOrder = 3,
                            TextScaled = false,
                            Size = UDim2.fromScale(0, 1),
                            TextTransparency = p22.textTransparency,
                            AutomaticSize = Enum.AutomaticSize.X,
                            Font = Enum.Font.Roboto,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextColor3 = p22.textColor
                        }
                    }, { u4.createElement("UIStroke", {
                            Thickness = 2,
                            Color = Color3.fromRGB(0, 0, 0)
                        }) })
                }) });

            return v23;
        end;

        local v25 = table.create(#v21);

        for i, v in v21 do
            v25[i] = v24(v, i - 1, v21);
        end;

        local v26 = {};
        local v27 = #v26;

        for i, v in v25 do
            v26[v27 + i] = v;
        end;

        v20 = u4.createFragment(v26);
    end;

    local v28 = {};
    local v29 = #v28;

    if v20 then
        v28[v29 + 1] = v20;
    end;

    return u4.createFragment(v28);
end);

return {
    HudEventTimer = v6.connect(function(p31, p32) -- Line: 185
        local v33 = {};

        for i, v in p32 do
            v33[i] = v;
        end;

        v33.MatchEvents = p31.Game.matchEvents;
        v33.MatchState = p31.Game.matchState;
        v33.MatchStartTime = p31.Game.startTime;

        return v33;
    end)(v30)
};