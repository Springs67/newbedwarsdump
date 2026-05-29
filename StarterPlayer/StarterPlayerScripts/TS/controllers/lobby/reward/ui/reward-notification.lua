local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, script.Parent, "reward-notification-tile").RewardNotificationTile
local v31 = v6.new(u5)(function(p9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u8
        [4] = u4
    --]]
    local _ = p10.useState
    local _ = p10.useEffect
    local v11 = {
        ["DisplayOrder"] = 10,
        ["ResetOnSpawn"] = false
    }
    local v12 = {}
    local v13 = #v12
    local v14 = p9.RewardsToDisplay
    if v14 ~= nil then
        v14 = #v14 == 0
    end
    local v15 = not v14
    if v15 then
        local v16 = u5.createFragment
        local v17 = {
            ["NewRewardsText"] = u5.createElement("TextLabel", {
                ["Text"] = "New Rewards!",
                ["TextSize"] = 14,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.fromOffset(200, 25),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u3.WHITE
            }, {
                u5.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Transparency"] = 0.6,
                    ["Color"] = Color3.fromRGB(0, 0, 0)
                }),
                ["NewRewardsTextBackground"] = u5.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 0,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u3.WHITE
                }, { u5.createElement("UIGradient", {
                        ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1) }),
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u3.WHITE), ColorSequenceKeypoint.new(0.5, Color3.new(1, 0.93, 0)), ColorSequenceKeypoint.new(1, u3.WHITE) })
                    }) })
            })
        }
        v15 = v16(v17)
    end
    local v18 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.8)
    }
    local v19 = { u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v20 = #v19
    if v15 then
        v19[v20 + 1] = v15
    end
    local _ = #v19
    local v21 = p9.RewardsToDisplay
    local v22
    if v21 == nil then
        v22 = v21
    else
        v22 = table.create(#v21)
        for v23, v24 in v21 do
            local v25 = {
                ["Reward"] = v24,
                ["Index"] = v23 - 1
            }
            v22[v23] = u5.createElement(u8, v25)
        end
    end
    local v26 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.Y
    }
    local v27 = { u5.createElement("UIGridLayout", {
            ["FillDirectionMaxCells"] = 6,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["CellSize"] = UDim2.new(0, 60, 0, 60),
            ["CellPadding"] = UDim2.new(0, 8, 0, 8),
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v28 = #v27
    for v29, v30 in v22 do
        v27[v28 + v29] = v30
    end
    v19.RewardNotificationGrid = u5.createElement(u4, v26, v27)
    v12[v13 + 1] = u5.createElement("Frame", v18, v19)
    return u5.createFragment({
        ["RewardNotification"] = u5.createElement("ScreenGui", v11, v12)
    })
end)
return {
    ["RewardNotification"] = v7.connect(function(p32, p33) --[[ Line: 116 ]]
        local v34 = {}
        for v35, v36 in p33 do
            v34[v35] = v36
        end
        v34.RewardsToDisplay = p32.Lobby.rewardsToDisplay
        return v34
    end)(v31)
}