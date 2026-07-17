-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local DeviceUtil = v1.DeviceUtil;
local DividerComponent = v1.DividerComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local MissionIntervalType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType;
local BattlepassMissionsStore = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "missions-generator", "battlepass-missions-generator").BattlepassMissionsStore;
local BedCoinMissionsStore = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "missions-generator", "bed-coin-missions-generator").BedCoinMissionsStore;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local MissionAppTab = RuntimeLib.import(script, script.Parent, "mission-app-consts").MissionAppTab;
local MissionsList = RuntimeLib.import(script, script.Parent, "mission", "missions-list").MissionsList;

return {
    MissionsListContainer = v3.new(u2)(function(u4, p5) -- Line: 16
        -- upvalues: u2 (copy), DeviceUtil (copy), KnitClient (copy), MissionAppTab (copy), Theme (copy), BattlepassMissionsStore (copy), MissionIntervalType (copy), BedCoinMissionsStore (copy), MissionsList (copy), DividerComponent (copy), AutoCanvasScrollingFrame (copy)
        local useState = p5.useState;
        local useEffect = p5.useEffect;
        local useValue = p5.useValue;
        local u6, u7 = useState(nil);
        local v8, u9 = useState(nil);
        local u10 = useValue(u2.createRef());
        useEffect(function() -- Line: 23
            -- upvalues: DeviceUtil (ref), KnitClient (ref), u7 (copy)
            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.MissionsController:getMissionData():andThen(function(p11) -- Line: 26
                    -- upvalues: u7 (ref)
                    u7(p11);
                end);
            end;
        end, {});
        useEffect(function() -- Line: 32
            -- upvalues: u10 (copy), u4 (copy), MissionAppTab (ref)
            local v12 = u10.value:getValue();

            if v12 then
                if u4.Tab == MissionAppTab.DAILY then
                    v12.CanvasPosition = Vector2.new(0, 0);

                    return;
                end;

                if u4.Tab == MissionAppTab.WEEKLY then
                    v12.CanvasPosition = Vector2.new(0, v12.AbsoluteSize.Y);
                end;
            end;
        end, { u4.Tab });
        useEffect(function() -- Line: 42
            -- upvalues: u6 (copy), Theme (ref), BattlepassMissionsStore (ref), MissionIntervalType (ref), BedCoinMissionsStore (ref), u9 (copy)
            local function u23(p13, p14) -- Line: 43
                -- upvalues: u6 (ref), Theme (ref)
                local id = p13.id;
                local v15 = u6;

                if v15 ~= nil then
                    v15 = v15.stages[id];
                end;

                local v16 = v15 == nil and 0 or v15;
                local v17 = #p13.stages <= v16;
                local v18;

                if v17 then
                    v18 = p13.stages[#p13.stages - 1 + 1];
                else
                    v18 = p13.stages[v16 + 1];
                end;

                local v19 = u6;

                if v19 ~= nil then
                    v19 = v19.progress[id];

                    if v19 ~= nil then
                        v19 = v19[v18.type];
                    end;
                end;

                local v20 = v19 == nil and 0 or v19;
                local v21 = {};

                for i, v in p13 do
                    v21[i] = v;
                end;

                local name = p13.name;
                local v22 = "<font color=\"" .. Theme.textPrimaryRichText .. "\">" .. tostring(v18.progress) .. "</font>";
                v21.description = string.format(name, v22);

                if v17 then
                    v20 = v18.progress;
                end;

                v21.currProgress = v20;
                v21.goalProgress = v18.progress;
                v21.intervalType = p14;

                return v21;
            end;

            local v24 = {};
            local v25 = #v24;
            local v26 = BattlepassMissionsStore:getDailyMissions();

            local function _(p27) -- Line: 86
                -- upvalues: u23 (copy), MissionIntervalType (ref)
                return u23(p27, MissionIntervalType.DAILY);
            end;

            local v28 = table.create(#v26);

            for i, v in v26 do
                local _ = i - 1;
                v28[i] = u23(v, MissionIntervalType.DAILY);
            end;

            local v29 = #v28;
            table.move(v28, 1, v29, v25 + 1, v24);
            local v30 = BedCoinMissionsStore:getDailyMissions();

            local function _(p31) -- Line: 99
                -- upvalues: u23 (copy), MissionIntervalType (ref)
                return u23(p31, MissionIntervalType.DAILY);
            end;

            local v32 = table.create(#v30);

            for i, v in v30 do
                local _ = i - 1;
                v32[i] = u23(v, MissionIntervalType.DAILY);
            end;

            table.move(v32, 1, #v32, v25 + v29 + 1, v24);
            local v33 = {};
            local v34 = #v33;
            local v35 = BattlepassMissionsStore:getWeeklyMissions();

            local function _(p36) -- Line: 113
                -- upvalues: u23 (copy), MissionIntervalType (ref)
                return u23(p36, MissionIntervalType.WEEKLY);
            end;

            local v37 = table.create(#v35);

            for i, v in v35 do
                local _ = i - 1;
                v37[i] = u23(v, MissionIntervalType.WEEKLY);
            end;

            local v38 = #v37;
            table.move(v37, 1, v38, v34 + 1, v33);
            local v39 = BedCoinMissionsStore:getWeeklyMissions();

            local function _(p40) -- Line: 126
                -- upvalues: u23 (copy), MissionIntervalType (ref)
                return u23(p40, MissionIntervalType.WEEKLY);
            end;

            local v41 = table.create(#v39);

            for i, v in v39 do
                local _ = i - 1;
                v41[i] = u23(v, MissionIntervalType.WEEKLY);
            end;

            table.move(v41, 1, #v41, v34 + v38 + 1, v33);
            u9({
                dailyMissions = v24,
                weeklyMissions = v33
            });
        end, { u6 });
        local v42 = BattlepassMissionsStore.startingResetTime.UnixTimestamp + BattlepassMissionsStore:getDay() * 86400;
        local v43 = BattlepassMissionsStore.startingResetTime.UnixTimestamp + BattlepassMissionsStore:getWeek() * 604800;
        local v44;

        if v8 == nil then
            v44 = v8;
        else
            v44 = v8.dailyMissions;
        end;

        if v44 then
            local v45 = {};
            local v46;

            if v8 == nil then
                v46 = v8;
            else
                v46 = v8.dailyMissions;
            end;

            v45.Missions = v46;
            v45.TicketView = u4.TicketView;
            v45.Title = "Daily Missions";
            v45.EndTime = v42;
            v45.PlayerLevel = u4.PlayerLevel;
            v45.LayoutOrder = 1;
            v44 = u2.createElement(MissionsList, v45);
        end;

        local v47 = {
            ScrollingFrameProps = {
                LayoutOrder = 1,
                Size = u4.Size
            },
            ScrollingFrameRef = u10.value
        };
        local v48 = { u2.createElement("UIPadding", {
                PaddingRight = UDim.new(0.04, 0)
            }), u2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder
            }) };
        local v49 = #v48;

        if v44 then
            v48[v49 + 1] = v44;
        end;

        local v50 = #v48;
        v48[v50 + 1] = u2.createElement(DividerComponent, {
            LengthScale = 1,
            LayoutOrder = 2,
            BarPosition = {
                AnchorPoint = Vector2.new(0, 0),
                Position = UDim2.new(0, 0, 0, 0)
            }
        });
        local v51;

        if v8 == nil then
            v51 = v8;
        else
            v51 = v8.dailyMissions;
        end;

        if v51 then
            local v52 = {};

            if v8 ~= nil then
                v8 = v8.weeklyMissions;
            end;

            v52.Missions = v8;
            v52.TicketView = u4.TicketView;
            v52.Title = "Weekly Missions";
            v52.EndTime = v43;
            v52.PlayerLevel = u4.PlayerLevel;
            v52.LayoutOrder = 3;
            v51 = u2.createElement(MissionsList, v52);
        end;

        if v51 then
            v48[v50 + 2] = v51;
        end;

        return u2.createFragment({
            MissionsList = u2.createElement(AutoCanvasScrollingFrame, v47, v48)
        });
    end)
};