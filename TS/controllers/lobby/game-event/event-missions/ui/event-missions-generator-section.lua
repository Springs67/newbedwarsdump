-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local Empty = v1.Empty;
local ResetTime = v1.ResetTime;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CountdownComponent = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "clan", "ui", "profile", "shop-tab", "countdown-component").CountdownComponent;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local EventMissionsCard = RuntimeLib.import(script, script.Parent, "event-missions-card").EventMissionsCard;

return {
    EventMissionsGeneratorSection = v4.new(u3)(function(u5, p6) -- Line: 14
        -- upvalues: EventMeta (copy), u3 (copy), ColorUtil (copy), ResetTime (copy), CountdownComponent (copy), Empty (copy), ClientStore (copy), u2 (copy), EventMissionsCard (copy)
        local _ = p6.useState;
        local u7 = EventMeta[u5.EventType];

        local function _(p8) -- Line: 18
            -- upvalues: u5 (copy)
            return p8.id == u5.GeneratorId;
        end;

        local v9 = nil;

        for i, v in u7.missionGenerators do
            local _ = i - 1;

            if v.id == u5.GeneratorId == true then
                v9 = v;
                break;
            end;
        end;

        local v10;

        if v9 == nil then
            v10 = v9;
        else
            v10 = v9.resetTime;
        end;

        local Missions = u5.Missions;

        if not u7.disableMissionsSort then
            table.sort(Missions, function(p11, p12) -- Line: 39
                return p11.name > p12.name;
            end);
            table.sort(Missions, function(p13, p14) -- Line: 43
                return p13.rewardAmount < p14.rewardAmount;
            end);
        end;

        local v15 = {
            AutomaticSize = "Y",
            Size = UDim2.fromScale(1, 0)
        };
        local FrameProps = u5.FrameProps;

        if FrameProps then
            for i, v in FrameProps do
                v15[i] = v;
            end;
        end;

        local v16 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 6)
            }) };
        local v17 = {
            LayoutOrder = 1,
            Size = UDim2.new(0.98, 0, 0, 20)
        };
        local v18 = {};
        local v19 = #v18;
        local v20 = {
            Size = UDim2.fromScale(0.6, 1)
        };

        if v9 ~= nil then
            v9 = v9.name;
        end;

        v20.Text = "<b>" .. tostring(v9) .. " Missions</b>";
        v20.TextColor3 = ColorUtil.WHITE;
        v20.Font = "Roboto";
        v20.TextScaled = true;
        v20.RichText = true;
        v20.BackgroundTransparency = 1;
        v20.TextXAlignment = "Left";
        v18.MissionSectionName = u3.createElement("TextLabel", v20);

        if v10 then
            local v21 = {};
            local firstResetTime = v10.firstResetTime;

            if firstResetTime == nil then
                firstResetTime = u7.startDate;
            end;

            v21.EndTime = ResetTime.new(firstResetTime):getNextResetTime(v10.intervalSeconds);
            v21.PreText = "Missions reset in: ";
            v21.AutomaticSize = "None";
            v21.SizeConstraint = "RelativeXY";
            v21.Size = UDim2.fromScale(0.4, 1);
            v21.AnchorPoint = Vector2.new(1, 0);
            v21.Position = UDim2.fromScale(1, 0);
            v21.TextXAlignment = "Right";
            v10 = u3.createElement(CountdownComponent, v21);
        end;

        if v10 then
            v18[v19 + 1] = v10;
        end;

        v16[#v16 + 1] = u3.createElement(Empty, v17, v18);

        local function v38(u22, p23) -- Line: 110
            -- upvalues: u5 (copy), u7 (copy), ClientStore (ref), u2 (ref), u3 (ref), EventMissionsCard (ref)
            local PlayerMissionData = u5.PlayerMissionData;

            if PlayerMissionData ~= nil then
                PlayerMissionData = PlayerMissionData.stages[u22.id];
            end;

            local v24 = PlayerMissionData == nil and 0 or PlayerMissionData;
            local v25 = #u22.stages <= v24;
            local v26;

            if v25 then
                v26 = u22.stages[#u22.stages - 1 + 1];
            else
                v26 = u22.stages[v24 + 1];
            end;

            local PlayerMissionData2 = u5.PlayerMissionData;

            if PlayerMissionData2 ~= nil then
                PlayerMissionData2 = PlayerMissionData2.progress[u22.id];

                if PlayerMissionData2 ~= nil then
                    PlayerMissionData2 = PlayerMissionData2[v26.type];
                end;
            end;

            local v27 = PlayerMissionData2 == nil and 0 or PlayerMissionData2;
            local globalTeamConfig = u22.globalTeamConfig;

            if globalTeamConfig then
                local globalTeamConfig2 = u22.globalTeamConfig;

                if globalTeamConfig2 ~= nil then
                    globalTeamConfig2 = globalTeamConfig2.eventKey;
                end;

                globalTeamConfig = u7.globalTeamEventKey == globalTeamConfig2;
            end;

            local v28 = globalTeamConfig and ClientStore:getState().Event.globalTeamEventDataMap[u7.globalTeamEventKey];

            if v28 then
                local v29 = u2.entries(v28.globalTeams);
                table.sort(v29, function(p30, p31) -- Line: 155
                    return p30[2].score < p31[2].score;
                end);

                if not v28 then
                    return nil;
                end;

                local v32 = v29[#v29 - 1 + 1];
                local v33 = v29[1];
                local v34 = ClientStore:getState().Event.globalTeamEventTeamKey[u7.globalTeamEventKey];

                if not v34 then
                    return nil;
                end;

                if u22.globalTeamConfig.activeIf == "WINNING" then
                    if v32[1] ~= v34 then
                        return nil;
                    end;
                elseif u22.globalTeamConfig.activeIf == "LOSING" and v33[1] ~= v34 then
                    return nil;
                end;
            end;

            local v35 = {
                Mission = u22,
                EventType = u5.EventType,
                StageId = v24,
                Stage = v26
            };

            if v25 then
                v27 = v26.progress;
            end;

            v35.Progress = v27;

            local function _(p36) -- Line: 190
                -- upvalues: u22 (copy)
                return p36.missionId == u22.id;
            end;

            local v37 = nil;

            for i, v in u5.ClaimedMissions do
                local _ = i - 1;

                if v.missionId == u22.id == true then
                    v37 = v;
                    break;
                end;
            end;

            v35.Claimed = v37 ~= nil;
            local layoutOrder = u22.layoutOrder;

            if layoutOrder == nil then
                layoutOrder = p23;
            end;

            v35.LayoutOrder = layoutOrder;

            return u3.createElement(EventMissionsCard, v35);
        end;

        local v39 = 0;
        local v40 = {};

        for i, v in Missions do
            local v41 = v38(v, i - 1, Missions);

            if v41 ~= nil then
                v39 = v39 + 1;
                v40[v39] = v41;
            end;
        end;

        local v42 = {
            AutomaticSize = "Y",
            LayoutOrder = 2,
            Size = UDim2.fromScale(1, 0)
        };
        local v43 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 4)
            }) };
        local v44 = #v43;

        for i, v in v40 do
            v43[v44 + i] = v;
        end;

        v16.MissionsList = u3.createElement(Empty, v42, v43);

        return u3.createFragment({
            EventMissionsGeneratorSection = u3.createElement(Empty, v15, v16)
        });
    end)
};