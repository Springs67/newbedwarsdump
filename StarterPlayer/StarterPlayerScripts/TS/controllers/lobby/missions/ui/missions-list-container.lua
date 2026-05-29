local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.DividerComponent
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "missions-generator", "battlepass-missions-generator").BattlepassMissionsStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "missions-generator", "bed-coin-missions-generator").BedCoinMissionsStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, script.Parent, "mission-app-consts").MissionAppTab
local u14 = v1.import(script, script.Parent, "mission", "missions-list").MissionsList
return {
    ["MissionsListContainer"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u6
            [4] = u13
            [5] = u12
            [6] = u10
            [7] = u9
            [8] = u11
            [9] = u14
            [10] = u5
            [11] = u3
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local v19 = p16.useValue
        local u20, u21 = v17(nil)
        local v22, u23 = v17(nil)
        local u24 = v19(u7.createRef())
        v18(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u6
                [3] = u21
            --]]
            if not u4.isHoarceKat() then
                u6.Controllers.MissionsController:getMissionData():andThen(function(p25) --[[ Line: 26 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                    --]]
                    u21(p25)
                end)
            end
        end, {})
        v18(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u15
                [3] = u13
            --]]
            local v26 = u24.value:getValue()
            if v26 then
                if u15.Tab == u13.DAILY then
                    v26.CanvasPosition = Vector2.new(0, 0)
                    return
                end
                if u15.Tab == u13.WEEKLY then
                    v26.CanvasPosition = Vector2.new(0, v26.AbsoluteSize.Y)
                end
            end
        end, { u15.Tab })
        v18(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u12
                [3] = u10
                [4] = u9
                [5] = u11
                [6] = u23
            --]]
            local function v43(p27, p28) --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u12
                --]]
                local v29 = p27.id
                local v30 = u20
                if v30 ~= nil then
                    v30 = v30.stages[v29]
                end
                local v31 = v30 == nil and 0 or v30
                local v32 = #p27.stages <= v31
                local v33
                if v32 then
                    v33 = p27.stages[#p27.stages - 1 + 1]
                else
                    v33 = p27.stages[v31 + 1]
                end
                local v34 = u20
                if v34 ~= nil then
                    v34 = v34.progress[v29]
                    if v34 ~= nil then
                        v34 = v34[v33.type]
                    end
                end
                local v35 = v34 == nil and 0 or v34
                local v36 = {}
                for v37, v38 in p27 do
                    v36[v37] = v38
                end
                local v39 = p27.name
                local v40 = u12.textPrimaryRichText
                local v41 = v33.progress
                local v42 = "<font color=\"" .. v40 .. "\">" .. tostring(v41) .. "</font>"
                v36.description = string.format(v39, v42)
                if v32 then
                    v35 = v33.progress
                end
                v36.currProgress = v35
                v36.goalProgress = v33.progress
                v36.intervalType = p28
                return v36
            end
            local v44 = {}
            local v45 = #v44
            local v46 = u10:getDailyMissions()
            local v47 = table.create(#v46)
            for v48, v49 in v46 do
                local _ = v48 - 1
                v47[v48] = v43(v49, u9.DAILY)
            end
            local v50 = #v47
            table.move(v47, 1, v50, v45 + 1, v44)
            local v51 = v45 + v50
            local v52 = u11:getDailyMissions()
            local v53 = table.create(#v52)
            for v54, v55 in v52 do
                local _ = v54 - 1
                v53[v54] = v43(v55, u9.DAILY)
            end
            table.move(v53, 1, #v53, v51 + 1, v44)
            local v56 = {}
            local v57 = #v56
            local v58 = u10:getWeeklyMissions()
            local v59 = table.create(#v58)
            for v60, v61 in v58 do
                local _ = v60 - 1
                v59[v60] = v43(v61, u9.WEEKLY)
            end
            local v62 = #v59
            table.move(v59, 1, v62, v57 + 1, v56)
            local v63 = v57 + v62
            local v64 = u11:getWeeklyMissions()
            local v65 = table.create(#v64)
            for v66, v67 in v64 do
                local _ = v66 - 1
                v65[v66] = v43(v67, u9.WEEKLY)
            end
            table.move(v65, 1, #v65, v63 + 1, v56)
            u23({
                ["dailyMissions"] = v44,
                ["weeklyMissions"] = v56
            })
        end, { u20 })
        local v68 = u10.startingResetTime.UnixTimestamp + u10:getDay() * 86400
        local v69 = u10.startingResetTime.UnixTimestamp + u10:getWeek() * 604800
        local v70
        if v22 == nil then
            v70 = v22
        else
            v70 = v22.dailyMissions
        end
        if v70 then
            local v71 = {}
            local v72
            if v22 == nil then
                v72 = v22
            else
                v72 = v22.dailyMissions
            end
            v71.Missions = v72
            v71.TicketView = u15.TicketView
            v71.Title = "Daily Missions"
            v71.EndTime = v68
            v71.PlayerLevel = u15.PlayerLevel
            v71.LayoutOrder = 1
            v70 = u7.createElement(u14, v71)
        end
        local v73 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 1,
                ["Size"] = u15.Size
            },
            ["ScrollingFrameRef"] = u24.value
        }
        local v74 = { u7.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.04, 0)
            }), u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v75 = #v74
        if v70 then
            v74[v75 + 1] = v70
        end
        local v76 = #v74
        v74[v76 + 1] = u7.createElement(u5, {
            ["LengthScale"] = 1,
            ["LayoutOrder"] = 2,
            ["BarPosition"] = {
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.new(0, 0, 0, 0)
            }
        })
        local v77
        if v22 == nil then
            v77 = v22
        else
            v77 = v22.dailyMissions
        end
        if v77 then
            local v78 = {}
            if v22 ~= nil then
                v22 = v22.weeklyMissions
            end
            v78.Missions = v22
            v78.TicketView = u15.TicketView
            v78.Title = "Weekly Missions"
            v78.EndTime = v69
            v78.PlayerLevel = u15.PlayerLevel
            v78.LayoutOrder = 3
            v77 = u7.createElement(u14, v78)
        end
        if v77 then
            v74[v76 + 2] = v77
        end
        return u7.createFragment({
            ["MissionsList"] = u7.createElement(u3, v73, v74)
        })
    end)
}