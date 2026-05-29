local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local v22 = v4.new(u3)(function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u2
    --]]
    local v8 = u6.lightBlue
    local v9 = u6.orange
    local v10 = p7.scores[1]
    local v11 = p7.scores[2]
    if p7.scoringTeam.id == "1" then
        v10 = v10 - 1
    else
        v11 = v11 - 1
    end
    local v12 = u3.createFragment
    local v13 = {}
    local v14 = u3.createElement
    local v15 = {}
    local v16 = u3.createElement
    local v17 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["Position"] = UDim2.new(0.5, 0, 0.35, 0)
    }
    local v18 = {
        ["TouchdownPlayerText"] = u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "LuckiestGuy",
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 1,
            ["Text"] = "<font color=\"" .. u2.richTextColor(p7.teamColor) .. "\">" .. p7.scoringPlayer.Name .. "</font> scored a touchdown",
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(245, 245, 220),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        })
    }
    v15.BridgeDuelTouchdownPopup = v16("Frame", v17, v18)
    local v19 = u3.createElement
    local v20 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["Position"] = UDim2.new(0.5, 0, 0.45, 0)
    }
    local v21 = {
        u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0.125)
        }),
        ["TouchdownScoresTextOne"] = u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "LuckiestGuy",
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Text"] = "<font color=\"" .. u2.richTextColor(u2.hexColor(v8)) .. "\">" .. tostring(v10) .. "</font>",
            ["Size"] = UDim2.fromScale(0.05, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(245, 245, 220),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        }),
        ["TouchdownScoresTextDash"] = u3.createElement("TextLabel", {
            ["Text"] = "-",
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "LuckiestGuy",
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.05, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(245, 245, 220),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        }),
        ["TouchdownScoresTextTwo"] = u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "LuckiestGuy",
            ["TextStrokeTransparency"] = 1,
            ["TextTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Text"] = "<font color=\"" .. u2.richTextColor(u2.hexColor(v9)) .. "\">" .. tostring(v11) .. "</font>",
            ["Size"] = UDim2.fromScale(0.05, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(245, 245, 220),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        })
    }
    v15.BridgeDuelTouchdownScoresPopup = v19("Frame", v20, v21)
    v13.BridgeDuelTouchdownPopupGui = v14("ScreenGui", {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }, v15)
    return v12(v13)
end)
return {
    ["BridgeDuelTouchdownPopupGui"] = v5.connect(function(_, p23) --[[ Line: 116 ]]
        local v24 = {}
        for v25, v26 in p23 do
            v24[v25] = v26
        end
        return v24
    end)(v22)
}