local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.NumberSpinner
local u5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = u5.Component:extend("LeaderboardPosition")
function v6.init(p7, _) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    p7.rankRef = u5.createRef()
    local v8 = p7.props.NewLeaderboardPos
    local v9 = p7.props.PreviousLeaderboardPos
    local v10 = math
    local v11 = ((v8 == 0 or (v8 ~= v8 or not v8)) and 0 or v8) - ((v9 == 0 or (v9 ~= v9 or not v9)) and 0 or v9)
    p7.changeDiff = v10.abs(v11)
    local v12
    if v8 == nil or v9 == nil then
        v12 = false
    else
        v12 = p7.changeDiff ~= 0
    end
    p7.shouldDisplayChange = v12
end
function v6.didMount(p13) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u1
    --]]
    if not p13.shouldDisplayChange then
        return nil
    end
    local v14 = p13.rankRef:getValue()
    local u15 = u4.fromGuiObject(v14)
    local u16 = p13.props.NewLeaderboardPos
    local v17 = p13.props.PreviousLeaderboardPos
    u15.Commas = true
    u15.Decimals = 0
    u15.Duration = 0
    u15.Prefix = ""
    u15.Value = v17
    u1.Promise.delay(1):andThen(function() --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u16
        --]]
        u15.Duration = 1.5
        u15.Value = u16
    end)
    v14.Visible = false
end
function v6.render(p18) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
    --]]
    local v19 = p18.props.NewLeaderboardPos
    local v20 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["BackgroundColor3"] = Color3.fromRGB(61, 64, 122)
    }
    local v21 = p18.props.FrameProps
    if v21 then
        for v22, v23 in v21 do
            v20[v22] = v23
        end
    end
    local v24 = u5.createFragment
    local v25 = {}
    local v26 = u5.createElement
    local v27 = {}
    local v28 = u5.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.1, 0)
    })
    local v29 = u5.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Position"] = UDim2.fromScale(0.05, 0.15),
        ["Size"] = UDim2.fromScale(0, 0.4),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    }, { u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 4)
        }), u5.createElement("TextLabel", {
            ["Text"] = "Rank",
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["TextColor3"] = u3.hexColor(7470896)
        }), u5.createElement("TextLabel", {
            ["Text"] = tostring(v19),
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["BackgroundTransparency"] = 1,
            ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
            ["TextColor3"] = u3.hexColor(7470896),
            ["TextScaled"] = true,
            ["TextSize"] = 12,
            [u5.Ref] = p18.rankRef
        }) })
    local v30 = u5.createElement("TextLabel", {
        ["Text"] = "MONTHLY WINS",
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0.05, 0.85),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["Size"] = UDim2.fromScale(0.5, 0.3),
        ["FontFace"] = Font.new("RobotoMono", Enum.FontWeight.Bold),
        ["TextColor3"] = Color3.fromRGB(179, 179, 179)
    })
    local v31 = u5.createElement
    local v32 = {
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["AnchorPoint"] = Vector2.new(1, 0.5),
        ["Position"] = UDim2.fromScale(0.95, 0.5)
    }
    local v33 = p18.changeDiff
    local v34 = tostring(v33)
    v32.Text = "+ " .. string.gsub(string.reverse((string.gsub(string.reverse(v34), "%d%d%d", "%1,"))), "^,", "")
    v32.TextXAlignment = Enum.TextXAlignment.Right
    v32.Size = UDim2.fromScale(0.5, 0.4)
    v32.FontFace = Font.new("RobotoMono", Enum.FontWeight.Bold)
    v32.TextColor3 = u3.hexColor(7470896)
    __set_list(v27, 1, {v28, v29, v30, v31("TextLabel", v32)})
    v25.PostgameLeaderboardSection = v26("Frame", v20, v27)
    return v24(v25)
end
return {
    ["LeaderboardPosition"] = v6
}