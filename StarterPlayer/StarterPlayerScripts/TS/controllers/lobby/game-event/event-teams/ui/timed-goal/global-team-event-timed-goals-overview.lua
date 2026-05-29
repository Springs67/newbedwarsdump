local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Countdown
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "number-counter").NumberCounter
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GlobalTeamEventGoalsOverview"] = v6.new(u5)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u5
            [3] = u3
            [4] = u4
            [5] = u7
        --]]
        local _ = p10.useState
        local v11 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["Position"] = UDim2.fromScale(0.025, 0.05),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["BackgroundColor3"] = u8.backgroundTertiary
        }
        local v12 = p9.FrameProps
        if v12 then
            for v13, v14 in v12 do
                v11[v13] = v14
            end
        end
        local v15 = { u5.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.1, 0),
                ["PaddingRight"] = UDim.new(0.1, 0),
                ["PaddingTop"] = UDim.new(0.075, 0),
                ["PaddingBottom"] = UDim.new(0.075, 0)
            }), u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u5.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.025, 0)
            }) }
        local v16 = #v15
        local v17 = {
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v18 = p9.CurrentTimedGoalData
        if v18 ~= nil then
            v18 = v18.timedGoal.name
        end
        v17.Text = v18
        v17.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v17.TextColor3 = Color3.fromRGB(255, 255, 255)
        v17.TextXAlignment = Enum.TextXAlignment.Left
        v17.TextYAlignment = Enum.TextYAlignment.Center
        v17.TextScaled = true
        v17.BackgroundTransparency = 1
        v17.LayoutOrder = 1
        v15.TimeGoalTrackName = u5.createElement("TextLabel", v17)
        local v19 = {
            ["Size"] = UDim2.fromScale(1, 0.1)
        }
        local v20 = os
        local v21 = p9.CurrentTimedGoalData
        if v21 ~= nil then
            v21 = v21.timedGoal.startTime
        end
        local v22 = v20.date("%b %d", v21)
        local v23 = os
        local v24 = p9.CurrentTimedGoalData
        if v24 ~= nil then
            v24 = v24.timedGoal.endTime
        end
        v19.Text = v22 .. " - " .. v23.date("%b %d", v24)
        v19.TextColor3 = Color3.fromRGB(255, 255, 255)
        v19.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
        v19.TextXAlignment = Enum.TextXAlignment.Left
        v19.TextYAlignment = Enum.TextYAlignment.Center
        v19.TextScaled = true
        v19.TextTransparency = 0.3
        v19.BackgroundTransparency = 1
        v19.LayoutOrder = 2
        v15.TimedGoalDates = u5.createElement("TextLabel", v19)
        local v25 = p9.CurrentTimedGoalData
        if v25 then
            local v26 = {}
            local v27 = p9.CurrentTimedGoalData
            if v27 ~= nil then
                v27 = v27.timedGoal.endTime
            end
            v26.EndTime = v27
            local v28 = p9.CurrentTimedGoalData
            if v28 ~= nil then
                v28 = v28.timedGoal.startTime
            end
            local v29 = v28 <= os.time()
            if v29 then
                local v30 = p9.CurrentTimedGoalData
                if v30 ~= nil then
                    v30 = v30.timedGoal.endTime
                end
                v29 = os.time() < v30
            end
            v26.PreText = v29 and "Ends: " or "Starts: "
            v26.TextLabel = {
                ["RichText"] = false,
                ["LayoutOrder"] = 3,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
            }
            v25 = u5.createElement(u3, v26)
        end
        if v25 then
            v15[v16 + 1] = v25
        end
        local v31 = #v15
        v15[v31 + 1] = u5.createElement(u4, {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0)
        })
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v33 = p9.CurrentTimedGoalData
        if v33 ~= nil then
            v33 = v33.timedGoal.description
        end
        v32.Text = v33
        v32.TextColor3 = Color3.fromRGB(255, 255, 255)
        v32.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v32.TextXAlignment = Enum.TextXAlignment.Left
        v32.TextYAlignment = Enum.TextYAlignment.Center
        v32.TextScaled = true
        v32.BackgroundTransparency = 1
        v32.LayoutOrder = 5
        v15.TimedGoalDescription = u5.createElement("TextLabel", v32)
        local v34 = p9.CurrentTimedGoalData
        if v34 then
            v34 = u5.createFragment({
                ["Count"] = u5.createElement(u7, {
                    ["Value"] = p9.CurrentTimedGoalData.score,
                    ["TextLabelProps"] = {
                        ["TextScaled"] = true,
                        ["RichText"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 6,
                        ["AnchorPoint"] = Vector2.new(1, 0),
                        ["Position"] = UDim2.fromScale(1, 0),
                        ["Size"] = UDim2.fromScale(1, 0.25),
                        ["TextColor3"] = Color3.fromRGB(255, 235, 77),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    }
                })
            })
        end
        if v34 then
            v15[v31 + 2] = v34
        end
        return u5.createFragment({
            ["TimedGoalsOverviewCard"] = u5.createElement("Frame", v11, v15)
        })
    end)
}