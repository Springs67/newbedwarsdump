local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.ResetTime
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "clan", "ui", "profile", "shop-tab", "countdown-component").CountdownComponent
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u12 = v1.import(script, script.Parent, "event-missions-card").EventMissionsCard
return {
    ["EventMissionsGeneratorSection"] = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u3
            [4] = u5
            [5] = u9
            [6] = u4
            [7] = u10
            [8] = u6
            [9] = u12
        --]]
        local _ = p14.useState
        local u15 = u11[u13.EventType]
        local v16 = nil
        for v17, v18 in u15.missionGenerators do
            local _ = v17 - 1
            if v18.id == u13.GeneratorId == true then
                v16 = v18
                break
            end
        end
        local v19
        if v16 == nil then
            v19 = v16
        else
            v19 = v16.resetTime
        end
        local v20 = u13.Missions
        if not u15.disableMissionsSort then
            table.sort(v20, function(p21, p22) --[[ Line: 39 ]]
                return p21.name > p22.name
            end)
            table.sort(v20, function(p23, p24) --[[ Line: 43 ]]
                return p23.rewardAmount < p24.rewardAmount
            end)
        end
        local v25 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v26 = u13.FrameProps
        if v26 then
            for v27, v28 in v26 do
                v25[v27] = v28
            end
        end
        local v29 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v30 = #v29
        local v31 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.98, 0, 0, 20)
        }
        local v32 = {}
        local v33 = #v32
        local v34 = {
            ["Size"] = UDim2.fromScale(0.6, 1)
        }
        if v16 ~= nil then
            v16 = v16.name
        end
        v34.Text = "<b>" .. tostring(v16) .. " Missions</b>"
        v34.TextColor3 = u3.WHITE
        v34.Font = "Roboto"
        v34.TextScaled = true
        v34.RichText = true
        v34.BackgroundTransparency = 1
        v34.TextXAlignment = "Left"
        v32.MissionSectionName = u7.createElement("TextLabel", v34)
        if v19 then
            local v35 = {}
            local v36 = v19.firstResetTime
            if v36 == nil then
                v36 = u15.startDate
            end
            v35.EndTime = u5.new(v36):getNextResetTime(v19.intervalSeconds)
            v35.PreText = "Missions reset in: "
            v35.AutomaticSize = "None"
            v35.SizeConstraint = "RelativeXY"
            v35.Size = UDim2.fromScale(0.4, 1)
            v35.AnchorPoint = Vector2.new(1, 0)
            v35.Position = UDim2.fromScale(1, 0)
            v35.TextXAlignment = "Right"
            v19 = u7.createElement(u9, v35)
        end
        if v19 then
            v32[v33 + 1] = v19
        end
        v29[v30 + 1] = u7.createElement(u4, v31, v32)
        local function v60(p37, p38) --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u15
                [3] = u10
                [4] = u6
                [5] = u7
                [6] = u12
            --]]
            local v39 = u13.PlayerMissionData
            if v39 ~= nil then
                v39 = v39.stages[p37.id]
            end
            local v40 = v39 == nil and 0 or v39
            local v41 = #p37.stages <= v40
            local v42
            if v41 then
                v42 = p37.stages[#p37.stages - 1 + 1]
            else
                v42 = p37.stages[v40 + 1]
            end
            local v43 = u13.PlayerMissionData
            if v43 ~= nil then
                v43 = v43.progress[p37.id]
                if v43 ~= nil then
                    v43 = v43[v42.type]
                end
            end
            local v44 = v43 == nil and 0 or v43
            local v45 = p37.globalTeamConfig
            if v45 then
                local v46 = u15.globalTeamEventKey
                local v47 = p37.globalTeamConfig
                if v47 ~= nil then
                    v47 = v47.eventKey
                end
                v45 = v46 == v47
            end
            local v48 = v45 and u10:getState().Event.globalTeamEventDataMap[u15.globalTeamEventKey]
            if v48 then
                local v49 = u6.entries(v48.globalTeams)
                table.sort(v49, function(p50, p51) --[[ Line: 155 ]]
                    return p50[2].score < p51[2].score
                end)
                if not v48 then
                    return nil
                end
                local v52 = v49[#v49 - 1 + 1]
                local v53 = v49[1]
                local v54 = u10:getState().Event.globalTeamEventTeamKey[u15.globalTeamEventKey]
                if not v54 then
                    return nil
                end
                if p37.globalTeamConfig.activeIf == "WINNING" then
                    if v52[1] ~= v54 then
                        return nil
                    end
                elseif p37.globalTeamConfig.activeIf == "LOSING" and v53[1] ~= v54 then
                    return nil
                end
            end
            local v55 = {
                ["Mission"] = p37,
                ["EventType"] = u13.EventType,
                ["StageId"] = v40,
                ["Stage"] = v42
            }
            if v41 then
                v44 = v42.progress
            end
            v55.Progress = v44
            local v56 = nil
            for v57, v58 in u13.ClaimedMissions do
                local _ = v57 - 1
                if v58.missionId == p37.id == true then
                    v56 = v58
                    break
                end
            end
            v55.Claimed = v56 ~= nil
            local v59 = p37.layoutOrder
            if v59 == nil then
                v59 = p38
            end
            v55.LayoutOrder = v59
            return u7.createElement(u12, v55)
        end
        local v61 = 0
        local v62 = {}
        for v63, v64 in v20 do
            local v65 = v60(v64, v63 - 1, v20)
            if v65 ~= nil then
                v61 = v61 + 1
                v62[v61] = v65
            end
        end
        local v66 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v67 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 4)
            }) }
        local v68 = #v67
        for v69, v70 in v62 do
            v67[v68 + v69] = v70
        end
        v29.MissionsList = u7.createElement(u4, v66, v67)
        return u7.createFragment({
            ["EventMissionsGeneratorSection"] = u7.createElement(u4, v25, v29)
        })
    end)
}