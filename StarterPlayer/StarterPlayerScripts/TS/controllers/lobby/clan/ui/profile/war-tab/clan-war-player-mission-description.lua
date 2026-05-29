local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-definition").getClanWarMissionDescription
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "missions", "clan-war-mission-definition-converter").ClanWarMissionDefinitionConverter
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ClanWarPlayerMissionDescription"] = v4.new(u3)(function(p8, _) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u3
            [4] = u7
            [5] = u2
        --]]
        local v9 = u6.fromMissionDto(p8.mission)
        local v10
        if v9 then
            v10 = u5(v9)
        else
            v10 = p8.mission.metricType
        end
        local v11 = u3.createElement
        local v12 = {
            ["BorderSizePixel"] = 2,
            ["BackgroundTransparency"] = 0.8,
            ["Size"] = UDim2.new(0.95, 0, 0, 40),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["BackgroundColor3"] = u7.backgroundPrimary,
            ["LayoutOrder"] = p8.missionIndex
        }
        local v13 = {
            u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 6),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 6),
                ["PaddingLeft"] = UDim.new(0, 12),
                ["PaddingBottom"] = UDim.new(0, 6)
            }),
            ["MissionDescription"] = u3.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 20),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }, { u3.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["RichText"] = true,
                    ["TextSize"] = 20,
                    ["Size"] = UDim2.new(1, 0, 0, 20),
                    ["AutomaticSize"] = Enum.AutomaticSize.XY,
                    ["Text"] = "<b>" .. v10 .. "</b>",
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextColor3"] = u2.WHITE,
                    ["Font"] = Enum.Font.Roboto
                }) })
        }
        local v14 = u3.createElement
        local v15 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 20),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v16 = {}
        local v17 = u3.createElement
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 20),
            ["AutomaticSize"] = Enum.AutomaticSize.XY
        }
        local v19 = p8.mission.clanMembersRequired
        v18.Text = "Requires <b>" .. tostring(v19) .. "</b> or more clan members on your team."
        v18.TextXAlignment = Enum.TextXAlignment.Left
        v18.TextColor3 = u2.WHITE
        v18.Font = Enum.Font.Roboto
        __set_list(v16, 1, {v17("TextLabel", v18)})
        v13.MissionRequirements = v14("Frame", v15, v16)
        local v20 = u3.createElement
        local v21 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 20),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v22 = {}
        local v23 = u3.createElement
        local v24 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 20),
            ["AutomaticSize"] = Enum.AutomaticSize.XY
        }
        local v25 = p8.mission.progressValue
        local v26 = p8.mission.completionValue
        local v27 = math.min(v25, v26)
        local v28 = math.round(v27)
        local v29 = tostring(v28)
        local v30 = p8.mission.completionValue
        v24.Text = "<b>" .. v29 .. "</b> out of <b>" .. tostring(v30) .. "</b>"
        v24.TextXAlignment = Enum.TextXAlignment.Left
        v24.TextColor3 = u2.WHITE
        v24.Font = Enum.Font.Roboto
        __set_list(v22, 1, {v23("TextLabel", v24)})
        v13.MissionProgress = v20("Frame", v21, v22)
        local v31 = u3.createElement
        local v32 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0, 20),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v33 = {}
        local v34 = u3.createElement
        local v35 = {
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextSize"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 20),
            ["AutomaticSize"] = Enum.AutomaticSize.XY
        }
        local v36 = p8.mission.completionScoreWorth
        v35.Text = "Gives <b>+" .. tostring(v36) .. "</b> points towards this Clan War!"
        v35.TextXAlignment = Enum.TextXAlignment.Left
        v35.TextColor3 = u2.WHITE
        v35.Font = Enum.Font.Roboto
        v33.MissionWorth = v34("TextLabel", v35)
        v13.MissionWorth = v31("Frame", v32, v33)
        return v11("Frame", v12, v13)
    end)
}