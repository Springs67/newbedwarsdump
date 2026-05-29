local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-missions", "base-event-missions")
local u2 = v1.Base_Event_DailyMissions
local u3 = v1.Base_Event_WeeklyMissions
return {
    ["EventMissionsUtil"] = {
        ["convertMissionsToDataStore"] = function(u4, p5, u6, p7) --[[ Name: convertMissionsToDataStore, Line 10 ]]
            local u8 = p7 == nil and "0" or p7
            if #p5 == 0 then
                return {}
            end
            local v9 = table.create(#p5)
            local function v15(p10) --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u6
                    [3] = u8
                --]]
                local v11 = "EVENT_" .. u4 .. "_" .. string.upper(u6) .. "_" .. u8 .. "_MISSION_" .. p10.metaId
                local v12 = {}
                for v13, v14 in p10 do
                    v12[v13] = v14
                end
                v12.id = v11
                v12.generator = u4
                return v12
            end
            for v16, v17 in p5 do
                v9[v16] = v15(v17, v16 - 1, p5)
            end
            return v9
        end,
        ["generateMissions"] = function(p18, p19) --[[ Name: generateMissions, Line 42 ]]
            local v20 = table.create(#p18)
            for v21, v22 in p18 do
                local v23 = {}
                local v24 = v21 - 1 + 1
                v23.metaId = tostring(v24)
                v23.currencyReward = p19
                for v25, v26 in v22 do
                    v23[v25] = v26
                end
                v20[v21] = v23
            end
            return v20
        end,
        ["generateBaseDailyMissions"] = function(u27, p28, u29) --[[ Name: generateBaseDailyMissions, Line 65 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            local u30 = table.create(#u2)
            for v31, v32 in u2 do
                local v33 = v31 - 1
                local v34 = {}
                for v35, v36 in v32 do
                    v34[v35] = v36
                end
                local v37 = v33 + 1
                v34.metaId = tostring(v37)
                v34.currencyReward = u27
                local v38
                if u29 == nil then
                    v38 = v32.rewardAmount
                else
                    v38 = u29
                end
                v34.rewardAmount = v38
                u30[v31] = v34
            end
            if p28 then
                local function v47(p39, p40) --[[ Line: 91 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u27
                        [3] = u29
                    --]]
                    local v41 = {}
                    for v42, v43 in p39 do
                        v41[v42] = v43
                    end
                    local v44 = p40 + 1 + #u30
                    v41.metaId = tostring(v44)
                    v41.currencyReward = u27
                    local v45 = u29
                    if v45 == nil then
                        v45 = p39.rewardAmount
                    end
                    v41.rewardAmount = v45
                    local v46 = u30
                    table.insert(v46, v41)
                end
                for v48, v49 in p28 do
                    v47(v49, v48 - 1, p28)
                end
            end
            return u30
        end,
        ["generateBaseWeeklyMissions"] = function(p50) --[[ Name: generateBaseWeeklyMissions, Line 115 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            local v51 = table.create(#u3)
            for v52, v53 in u3 do
                local v54 = {}
                local v55 = v52 - 1 + 1
                v54.metaId = tostring(v55)
                v54.currencyReward = p50
                for v56, v57 in v53 do
                    v54[v56] = v57
                end
                v51[v52] = v54
            end
            return v51
        end
    }
}