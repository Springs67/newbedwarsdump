-- Decompiled with Potassium's decompiler.

local u1 = {
    profileData = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil.makeStarterEventData(),
    activeMissions = {},
    currencyGuiLocations = {},
    globalTeamEventDataMap = {},
    globalTeamEventTeamKey = {}
};

return {
    EventReducer = function(p2, p3) -- Line: 11, Name: EventReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        if p3.type == "SetEventDataAll" then
            local v4 = {};

            for i, v in p2 do
                v4[i] = v;
            end;

            v4.profileData = p3.eventData;

            return v4;
        end;

        if p3.type == "SetSpecificEventData" then
            local v5 = {};

            for i, v in p2 do
                v5[i] = v;
            end;

            local v6 = {};

            for i, v in p2.profileData do
                v6[i] = v;
            end;

            local v7 = {};

            for i, v in p2.profileData.events do
                v7[i] = v;
            end;

            v7[p3.eventType] = p3.data;
            v6.events = v7;
            v5.profileData = v6;

            return v5;
        end;

        if p3.type == "SetSpecificEventCurrency" then
            local v8 = {};

            for i, v in p2 do
                v8[i] = v;
            end;

            local v9 = {};

            for i, v in p2.profileData do
                v9[i] = v;
            end;

            local v10 = {};

            for i, v in p2.profileData.currencies do
                v10[i] = v;
            end;

            v10[p3.currencyType] = p3.data;
            v9.currencies = v10;
            v8.profileData = v9;

            return v8;
        end;

        if p3.type == "SetEventPartial" then
            local v11 = {};

            for i, v in p2 do
                v11[i] = v;
            end;

            for i, v in p3.data do
                v11[i] = v;
            end;

            return v11;
        end;

        if p3.type == "SetEventGlobalTeamDataAll" then
            p2.globalTeamEventDataMap = p3.data;
            local v12 = {};

            for i, v in p2 do
                v12[i] = v;
            end;

            return v12;
        end;

        if p3.type == "SetEventGlobalTeamDataSingle" then
            p2.globalTeamEventDataMap[p3.key] = p3.data;
            local v13 = {};

            for i, v in p2 do
                v13[i] = v;
            end;

            return v13;
        end;

        if p3.type == "SetEventGlobalTeamKeyAll" then
            p2.globalTeamEventTeamKey = p3.data;
            local v14 = {};

            for i, v in p2 do
                v14[i] = v;
            end;

            return v14;
        end;

        if p3.type == "SetEventGlobalTeamKeySingle" then
            p2.globalTeamEventTeamKey[p3.key] = p3.data;
            local v15 = {};

            for i, v in p2 do
                v15[i] = v;
            end;

            return v15;
        end;

        if p3.type ~= "SetSummer2025EventRiddleCompleted" then
            return p2;
        end;

        local summer_2025 = p2.profileData.events.summer_2025;
        local v16;

        if summer_2025 == nil then
            v16 = summer_2025;
        else
            v16 = summer_2025.riddlesCompleted;
        end;

        if v16 then
            local summer_20252 = p2.profileData.events.summer_2025;

            if summer_20252 ~= nil then
                local riddlesCompleted = summer_20252.riddlesCompleted;

                if riddlesCompleted ~= nil then
                    riddlesCompleted[p3.riddle] = true;
                end;
            end;
        elseif summer_2025 then
            summer_2025.riddlesCompleted = {
                [p3.riddle] = true
            };
        end;

        local v17 = {};

        for i, v in p2 do
            v17[i] = v;
        end;

        return v17;
    end
};