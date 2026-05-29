local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u6)(function(p7, _) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u2
        [4] = u4
    --]]
    local v8 = p7.store.Game.myTeam
    if v8 ~= nil then
        v8 = v8.id
    end
    local v9 = v8 == p7.WinningTeamId
    if not (v9 or u5.isHoarceKat()) then
        return u6.createFragment()
    end
    local v10 = p7.store.Game.queueType
    local v11
    if v10 then
        v11 = u2.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(v10)
        if v11 ~= nil then
            v11 = v11.title
        end
    else
        v11 = nil
    end
    local v12 = u5.isHoarceKat() and "Ranked (Squads)" or v11
    local v13 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = Color3.fromRGB(61, 64, 122)
    }
    local v14 = p7.FrameProps
    if v14 then
        for v15, v16 in v14 do
            v13[v15] = v16
        end
    end
    local v17 = u6.createFragment
    local v18 = {}
    local v19 = u6.createElement
    local v20 = "Frame"
    local v21 = {}
    local v22 = u6.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.1, 0)
    })
    local v23 = u6.createElement("UIPadding", {
        ["PaddingBottom"] = UDim.new(0.05, 0),
        ["PaddingLeft"] = UDim.new(0.05, 0),
        ["PaddingRight"] = UDim.new(0.05, 0),
        ["PaddingTop"] = UDim.new(0.05, 0)
    })
    local v24 = u6.createElement("TextLabel", {
        ["Text"] = "Win Streak",
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["Position"] = UDim2.fromScale(0, 0.15),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["Size"] = UDim2.fromScale(0.5, 0.4),
        ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
        ["TextColor3"] = u4.hexColor(16759852)
    })
    local v25 = u6.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 0.85),
        ["Text"] = tostring(v12),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["Size"] = UDim2.fromScale(0.5, 0.3),
        ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
        ["TextColor3"] = Color3.fromRGB(179, 179, 179)
    })
    local v26 = u6.createElement
    local v27 = "Frame"
    local v28 = {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Size"] = UDim2.fromScale(0, 0.8),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    }
    local v29 = {}
    local v30 = u6.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 10)
    })
    local v31 = u6.createElement("ImageLabel", {
        ["Image"] = "rbxassetid://7101217258",
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["ScaleType"] = Enum.ScaleType.Fit
    })
    local v32 = u6.createElement
    local v33 = "TextLabel"
    local v34 = {
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true
    }
    local v35
    if v10 then
        local v36 = p7.store.Leaderboard.queues[v10]
        if v36 ~= nil then
            v36 = v36.currentWinStreak
        end
        v35 = v36 == nil and 0 or (not v9 and 0 or v36 + 1)
    else
        v35 = 0
    end
    local v37 = tostring(v35)
    v34.Text = string.gsub(string.reverse((string.gsub(string.reverse(v37), "%d%d%d", "%1,"))), "^,", "")
    v34.Size = UDim2.fromScale(0, 0.4)
    v34.AutomaticSize = Enum.AutomaticSize.X
    v34.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
    v34.TextColor3 = u4.hexColor(16759852)
    __set_list(v29, 1, {v30, v31, v32(v33, v34)})
    __set_list(v21, 1, {v22, v23, v24, v25, v26(v27, v28, v29)})
    v18.PostgameWinstreakSection = v19(v20, v13, v21)
    return v17(v18)
end)