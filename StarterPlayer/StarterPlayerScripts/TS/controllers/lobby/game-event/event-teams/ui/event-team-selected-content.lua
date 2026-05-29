local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata")
local u10 = v9.EventCurrencyType
local u11 = v9.EventType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamEventKey
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v40 = v7.new(u6)(function(u14, p15) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u13
        [3] = u5
        [4] = u3
        [5] = u4
    --]]
    local v16 = p15.useState
    local v17 = p15.useEffect
    local _, u18 = v16(nil)
    local _, u19 = v16(true)
    v17(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u19
            [3] = u18
        --]]
        if u14.globalTeamEventData then
            u19(false)
            u18(u14.globalTeamEventData.globalTeams)
        end
    end, { u14.localTeamKey, u14.globalTeamEventData })
    local v20 = u6.createFragment
    local v21 = {}
    local v22 = u6.createElement
    local v23 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.9, 0.9)
    }
    local v24 = {
        u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }),
        ["TeamProgressContainer"] = u6.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["BackgroundColor3"] = u13.backgroundTertiary
        })
    }
    local v25 = u6.createElement
    local v26 = u5
    local v27 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.25)
    }
    local v28 = {}
    local v29 = u6.createElement
    local v30 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["Size"] = UDim2.fromScale(0.25, 1)
    }
    local v31 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), (u6.createElement(u3, {
            ["Text"] = "SHELL CONTRIBUTIONS:",
            ["TextSize"] = 14,
            ["LayoutOrder"] = 1,
            ["Limits"] = Vector2.new(1000, 40),
            ["Font"] = Enum.Font.GothamBold,
            ["TextColor3"] = u4.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })) }
    local v32 = u6.createElement
    local v33 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v34 = {}
    local v35 = u6.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 2)
    })
    local v36 = u6.createElement("ImageLabel", {
        ["ImageTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Image"] = u14.ContributionCurrencyImage,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["ScaleType"] = Enum.ScaleType.Fit
    })
    local v37 = u6.createElement
    local v38 = {
        ["TextSize"] = 14,
        ["RichText"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2
    }
    local v39 = u14.CoinsCollected
    v38.Text = "<b>" .. tostring(v39) .. "</b>"
    v38.AnchorPoint = Vector2.new(0.5, 0.5)
    v38.Position = UDim2.fromScale(0.5, 0.5)
    v38.Size = UDim2.fromScale(0.05, 1)
    v38.Font = Enum.Font.GothamBold
    v38.TextColor3 = u4.WHITE
    v38.TextXAlignment = Enum.TextXAlignment.Left
    __set_list(v34, 1, {v35, v36, v37("TextLabel", v38)})
    v31.CurrencyPills = v32("Frame", v33, v34)
    v28.ContributionCount = v29("Frame", v30, v31)
    __set_list(v28, 1, {u6.createElement("Frame", {
    ["LayoutOrder"] = 2,
    ["BackgroundTransparency"] = 1,
    ["Size"] = UDim2.fromScale(0.35, 1.5),
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Position"] = UDim2.fromScale(0.5, 0.5),
    ["BackgroundColor3"] = Color3.fromHex("#0a8230")
}, { u6.createElement("TextLabel", {
        ["Text"] = "\240\159\148\1652x shell bonus active!\240\159\148\165",
        ["RichText"] = true,
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["TextWrap"] = false,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["Font"] = Enum.Font.GothamBold,
        ["TextColor3"] = Color3.fromHex("#ffff15"),
        ["TextXAlignment"] = Enum.TextXAlignment.Center
    }) })})
    __set_list(v24, 2, {v25(v26, v27, v28)})
    v21.EventTeamSelectedContent = v22("Frame", v23, v24)
    return v20(v21)
end)
return {
    ["EventTeamSelectedContent"] = v8.connect(function(p41, p42) --[[ Line: 140 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u10
            [3] = u12
        --]]
        local v43 = {}
        for v44, v45 in p42 do
            v43[v44] = v45
        end
        local v46 = p41.Event.profileData.events[u11.SUMMER_2024]
        if v46 ~= nil then
            v46 = v46.globalTeamKey
        end
        v43.localTeamKey = v46
        v43.summerEventProfileData = p41.Event.profileData.events[u11.SUMMER_2024]
        v43.summerEventCurrencyData = p41.Event.profileData.currencies[u10.SUMMER_2024_CURRENCY]
        v43.globalTeamEventData = p41.Event.globalTeamEventDataMap[u12.SUMMER_2024]
        return v43
    end)(v40)
}