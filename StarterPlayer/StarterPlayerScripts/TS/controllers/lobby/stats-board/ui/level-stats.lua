local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.StringUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player-level", "player-level-util").PlayerLevelUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v25 = v7.new(u6)(function(p11, _) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u6
        [3] = u4
        [4] = u3
        [5] = u10
        [6] = u5
    --]]
    local v12 = u9.levelSystem:getCurrExperienceProgression(p11.playerLevelTotalExperience, p11.playerLevel)
    local v13 = u9.levelSystem:getTotalExperienceForLevel(p11.playerLevel + 1) - u9.levelSystem:getTotalExperienceForLevel(p11.playerLevel)
    local v14 = u6.createElement
    local v15 = u4
    local v16 = {
        ["Size"] = UDim2.new(1, 0, 0, 50)
    }
    local v17 = {}
    local v18 = u6.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Vertical,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 8)
    })
    local v19 = u6.createElement
    local v20 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["TextSize"] = 18,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.Y,
        ["TextColor3"] = u9.getLevelColor(p11.playerLevel),
        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
        ["TextXAlignment"] = Enum.TextXAlignment.Left
    }
    local v21 = p11.playerLevel
    v20.Text = "Player Level " .. tostring(v21)
    __set_list(v17, 1, {v18, (v19("TextLabel", v20))})
    local v22 = u6.createElement
    local v23 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0.7,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.2),
        ["BackgroundColor3"] = u3.BLACK
    }
    local v24 = {
        ["CurrProgress"] = u6.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.fromScale(v12 / v13, 1),
            ["BackgroundColor3"] = u10.mcGold
        }),
        ["TotalProgress"] = u6.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.7,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u3.BLACK
        })
    }
    v17.ProgressBar = v22("Frame", v23, v24)
    __set_list(v17, 3, {u6.createElement("TextLabel", {
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["TextSize"] = 15,
    ["LayoutOrder"] = 3,
    ["Size"] = UDim2.fromScale(1, 0),
    ["AutomaticSize"] = Enum.AutomaticSize.Y,
    ["TextColor3"] = u3.WHITE,
    ["Font"] = Enum.Font.Roboto,
    ["TextXAlignment"] = Enum.TextXAlignment.Right,
    ["Text"] = u5.roundNumber(v12, 0) .. " / " .. tostring(v13)
})})
    return v14(v15, v16, v17)
end)
return {
    ["LevelStats"] = v8.connect(function(p26, p27) --[[ Line: 74 ]]
        local v28 = {}
        for v29, v30 in p27 do
            v28[v29] = v30
        end
        v28.playerLevel = p26.Bedwars.playerLevel
        v28.playerLevelTotalExperience = p26.Bedwars.playerLevelTotalExperience
        return v28
    end)(v25)
}