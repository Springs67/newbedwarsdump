local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "milestones", "milestones").MilestoneRewards
local u8 = v1.import(script, script.Parent, "milestones-reward").MilestonesReward
return {
    ["MilestonesRewardsContainer"] = v6.new(u5)(function(p9, _) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u7
            [4] = u3
            [5] = u4
        --]]
        local v10 = {
            ["Size"] = p9.Size
        }
        local v11 = {}
        local _ = #v11
        local v12 = table.create(#u7)
        for v13, v14 in u7 do
            local _ = v13 - 1
            v12[v13] = u5.createElement(u8, {
                ["store"] = p9.store,
                ["MilestoneRewardData"] = v14
            })
        end
        local v15 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BackgroundColor3"] = u3.WHITE,
            ["LayoutOrder"] = p9.LayoutOrder
        }
        local v16 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v17 = #v16
        for v18, v19 in v12 do
            v16[v17 + v18] = v19
        end
        v11.MilestonesRewardsContainer = u5.createElement("Frame", v15, v16)
        return u5.createElement(u4, v10, v11)
    end)
}