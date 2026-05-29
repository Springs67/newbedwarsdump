local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "mission-card").MissionCard
local u6 = v1.import(script, script.Parent, "missions-list-timer").MissionsListTimer
return {
    ["MissionsList"] = v4.new(u3)(function(p7, _) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u6
            [4] = u5
        --]]
        local v8 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["LayoutOrder"] = p7.LayoutOrder
        }
        local v9 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 12)
            }) }
        local v10 = #v9
        local v11 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 18)
        }
        local v12 = {}
        local v13 = #v12
        local v14
        if p7.Title == nil then
            v14 = false
        else
            v14 = u3.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextSize"] = 24,
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["Text"] = "<b>" .. p7.Title .. "</b>",
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u2.WHITE,
                ["Font"] = Enum.Font.Roboto
            })
        end
        if v14 then
            v12[v13 + 1] = v14
        end
        v12[#v12 + 1] = u3.createElement(u6, {
            ["EndTime"] = p7.EndTime,
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.fromScale(1, 1)
        })
        v9[v10 + 1] = u3.createElement("Frame", v11, v12)
        local v15 = 0
        local v16 = {}
        for v17, v18 in p7.Missions do
            local _ = v17 - 1
            local v19 = p7.PlayerLevel
            local v20 = v18.playerLevelReq
            local v21
            if v19 < (v20 == nil and 0 or v20) then
                v21 = nil
            else
                v21 = u3.createElement(u5, {
                    ["AppId"] = "Mission",
                    ["Mission"] = v18,
                    ["TicketView"] = p7.TicketView
                })
            end
            if v21 ~= nil then
                v15 = v15 + 1
                v16[v15] = v21
            end
        end
        local v22 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v23 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v24 = #v23
        for v25, v26 in v16 do
            v23[v24 + v25] = v26
        end
        v9[v10 + 2] = u3.createElement("Frame", v22, v23)
        return u3.createFragment({
            ["PassMissionLists"] = u3.createElement("Frame", v8, v9)
        })
    end)
}