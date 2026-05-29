local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = v1.import(script, script.Parent, "egg-hunt-milestone-progress").EggHuntMilestoneProgress
local u10 = v1.import(script, script.Parent, "egg-hunt-milestone-rewards-list").EggHuntMilestoneRewardsList
return {
    ["EggHuntBoardCore"] = v7.new(u6)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u5
            [4] = u3
            [5] = u4
            [6] = u10
            [7] = u9
        --]]
        local _ = p12.useState
        local v13 = u6.createElement
        local v14 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u8.backgroundSecondary
        }
        local v15 = {}
        local v16 = u6.createElement(u5, {
            ["Padding"] = {
                ["Horizontal"] = 16,
                ["Vertical"] = 10
            }
        })
        local v17 = u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 16)
        })
        local v18 = u6.createElement
        local v19 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["TextXAlignment"] = "Left",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.1)
        }
        local v20 = u3.richTextColor(u8.mcAqua)
        local v21 = p11.numEggsCollected
        v19.Text = "\240\159\165\154\240\159\144\135 EGG HUNT REWARDS: (<font color=\"" .. v20 .. "\">" .. tostring(v21) .. "</font>/" .. tostring(18) .. " eggs found)"
        v19.TextColor3 = u3.WHITE
        v19.Font = Enum.Font.GothamBlack
        __set_list(v15, 1, {v16, v17, v18("TextLabel", v19, { u6.createElement("UIStroke", {
        ["Thickness"] = 2,
        ["Color"] = u3.BLACK
    }) }), u6.createElement("ScrollingFrame", {
    ["ScrollBarThickness"] = 6,
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["Selectable"] = false,
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.new(1, 0, 0.9, -16),
    ["AutomaticCanvasSize"] = Enum.AutomaticSize.XY,
    ["ScrollingDirection"] = Enum.ScrollingDirection.X
}, { u6.createElement(u4, {
        ["Size"] = UDim2.new(1, 0, 0.95, 0)
    }, { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }), u6.createElement(u10, {
            ["AppId"] = "EasterProgressList",
            ["Milestones"] = p11.milestoneMeta,
            ["Rewards"] = p11.milestoneRewardsMeta,
            ["Progress"] = p11.numEggsCollected,
            ["Size"] = UDim2.new(1, 0, 0.9, -10)
        }), u6.createElement(u9, {
            ["LayoutOrder"] = 2,
            ["Milestones"] = p11.milestoneMeta,
            ["Progress"] = p11.numEggsCollected,
            ["Size"] = UDim2.fromScale(1, 0.1)
        }) }) })})
        return v13("Frame", v14, v15)
    end)
}