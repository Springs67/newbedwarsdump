local u1 = {
    ["profileData"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil.makeStarterEventData(),
    ["activeMissions"] = {},
    ["currencyGuiLocations"] = {},
    ["globalTeamEventDataMap"] = {},
    ["globalTeamEventTeamKey"] = {}
}
return {
    ["EventReducer"] = function(p2, p3) --[[ Name: EventReducer, Line 11 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        if p2 == nil then
            p2 = u1
        end
        if p3.type == "SetEventDataAll" then
            local v4 = {}
            for v5, v6 in p2 do
                v4[v5] = v6
            end
            v4.profileData = p3.eventData
            return v4
        end
        if p3.type == "SetSpecificEventData" then
            local v7 = {}
            for v8, v9 in p2 do
                v7[v8] = v9
            end
            local v10 = {}
            for v11, v12 in p2.profileData do
                v10[v11] = v12
            end
            local v13 = {}
            for v14, v15 in p2.profileData.events do
                v13[v14] = v15
            end
            v13[p3.eventType] = p3.data
            v10.events = v13
            v7.profileData = v10
            return v7
        end
        if p3.type == "SetSpecificEventCurrency" then
            local v16 = {}
            for v17, v18 in p2 do
                v16[v17] = v18
            end
            local v19 = {}
            for v20, v21 in p2.profileData do
                v19[v20] = v21
            end
            local v22 = {}
            for v23, v24 in p2.profileData.currencies do
                v22[v23] = v24
            end
            v22[p3.currencyType] = p3.data
            v19.currencies = v22
            v16.profileData = v19
            return v16
        end
        if p3.type == "SetEventPartial" then
            local v25 = {}
            for v26, v27 in p2 do
                v25[v26] = v27
            end
            for v28, v29 in p3.data do
                v25[v28] = v29
            end
            return v25
        end
        if p3.type == "SetEventGlobalTeamDataAll" then
            p2.globalTeamEventDataMap = p3.data
            local v30 = {}
            for v31, v32 in p2 do
                v30[v31] = v32
            end
            return v30
        end
        if p3.type == "SetEventGlobalTeamDataSingle" then
            p2.globalTeamEventDataMap[p3.key] = p3.data
            local v33 = {}
            for v34, v35 in p2 do
                v33[v34] = v35
            end
            return v33
        end
        if p3.type == "SetEventGlobalTeamKeyAll" then
            p2.globalTeamEventTeamKey = p3.data
            local v36 = {}
            for v37, v38 in p2 do
                v36[v37] = v38
            end
            return v36
        end
        if p3.type == "SetEventGlobalTeamKeySingle" then
            p2.globalTeamEventTeamKey[p3.key] = p3.data
            local v39 = {}
            for v40, v41 in p2 do
                v39[v40] = v41
            end
            return v39
        end
        if p3.type ~= "SetSummer2025EventRiddleCompleted" then
            return p2
        end
        local v42 = p2.profileData.events.summer_2025
        local v43
        if v42 == nil then
            v43 = v42
        else
            v43 = v42.riddlesCompleted
        end
        if v43 then
            local v44 = p2.profileData.events.summer_2025
            if v44 ~= nil then
                local v45 = v44.riddlesCompleted
                if v45 ~= nil then
                    v45[p3.riddle] = true
                end
            end
        elseif v42 then
            v42.riddlesCompleted = {
                [p3.riddle] = true
            }
        end
        local v46 = {}
        for v47, v48 in p2 do
            v46[v47] = v48
        end
        return v46
    end
}