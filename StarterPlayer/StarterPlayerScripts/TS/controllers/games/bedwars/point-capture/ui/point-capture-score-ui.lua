local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "domination-balance").DominationBalance
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent, "circle-progress-bar").CircleProgressBar
local u12 = {
    ["yourScore"] = 0,
    ["enemyScore"] = 0,
    ["points"] = {}
}
local u13 = u7.Component:extend("PointCaptureScoreUI")
function u13.init(p14, _) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    p14.enemyColor = Color3.fromRGB(255, 0, 0)
    p14.allyColor = Color3.fromRGB(0, 255, 56)
    p14.connectionMaid = u6.new()
    p14:listenToScoreUpdate()
end
function u13.render(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    return u7.createFragment({ p15:createYourScore() })
end
function u13.willUnmount(p16) --[[ Line: 32 ]]
    p16.connectionMaid:DoCleaning()
end
function u13.listenToScoreUpdate(u17) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u10
        [3] = u8
    --]]
    local u18 = 0
    local u19 = 0
    if not u5.Controllers.TeamScoreController:getTeamScores() then
        return nil
    end
    u10.Client:Get("TeamScoreUpdate"):Connect(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u18
            [4] = u19
            [5] = u17
        --]]
        local v20 = u5.Controllers.TeamController:getPlayerTeam(u8.LocalPlayer)
        if not v20 then
            return nil
        end
        local v21 = u5.Controllers.TeamScoreController:getTeamScores()
        if not v21 then
            return nil
        end
        for _, v22 in v21 do
            if v22.Name == v20.id then
                u18 = v22:GetAttribute("Score")
            else
                u19 = v22:GetAttribute("Score")
            end
        end
        u17.props.yourScore = u18
        u17.props.enemyScore = u19
        u17:setState({
            ["yourScore"] = u17.props.yourScore,
            ["enemyScore"] = u17.props.enemyScore
        })
    end)
end
function u13.createYourScore(p23) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u9
        [4] = u3
        [5] = u11
    --]]
    local v24 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.1),
        ["Size"] = UDim2.fromScale(0.6, 0.2),
        ["AutomaticSize"] = Enum.AutomaticSize.Y,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v25 = {}
    local v26 = u7.createElement
    local v27 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.3, 0.5),
        ["Size"] = UDim2.fromScale(0.4, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.Y,
        ["AnchorPoint"] = Vector2.new(0.9, 0.5)
    }
    local v28 = {}
    local v29 = u7.createElement(u4, {
        ["AcceptZero"] = true,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Progress"] = p23.props.yourScore / u9.WIN_CONDITIONS,
        ["Size"] = UDim2.fromScale(0.7, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BarGradient"] = ColorSequence.new(p23.allyColor, u3.hexColor(16777215))
    })
    local v30 = u7.createElement
    local v31 = {
        ["BackgroundTransparency"] = 1,
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = false,
        ["TextScaled"] = true,
        ["LayoutOrder"] = 5,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255),
        ["Font"] = Enum.Font.Arial
    }
    local v32 = p23.props.yourScore
    local v33 = tostring(v32)
    local v34 = u9.WIN_CONDITIONS
    v31.Text = v33 .. "/" .. tostring(v34)
    v31.AnchorPoint = Vector2.new(0.5, 0.5)
    __set_list(v28, 1, {v29, v30("TextLabel", v31)})
    __set_list(v25, 1, {v26("Frame", v27, v28)})
    local v35 = #v25
    local v36 = p23.props.points
    local function v39(p37, p38) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
            [3] = u3
        --]]
        return u7.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.2 + p38 * 0.15, 0.5),
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
        }, { u7.createElement(u11, {
                ["progress"] = 0,
                ["playerGUI"] = true,
                ["color"] = u3.WHITE,
                ["id"] = p37
            }) })
    end
    local v40 = table.create(#v36)
    for v41, v42 in v36 do
        v40[v41] = v39(v42, v41 - 1, v36)
    end
    local v43 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.4, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.XY,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v44 = {}
    local v45 = #v44
    for v46, v47 in v40 do
        v44[v45 + v46] = v47
    end
    v25[v35 + 1] = u7.createElement("Frame", v43, v44)
    local v48 = v35 + 2
    local v49 = u7.createElement
    local v50 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.7, 0.5),
        ["Size"] = UDim2.fromScale(0.4, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.XY,
        ["AnchorPoint"] = Vector2.new(0.1, 0.5)
    }
    local v51 = {}
    local v52 = u7.createElement(u4, {
        ["AcceptZero"] = true,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Progress"] = p23.props.enemyScore / u9.WIN_CONDITIONS,
        ["Size"] = UDim2.fromScale(0.7, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BarGradient"] = ColorSequence.new(p23.enemyColor, u3.hexColor(16777215))
    })
    local v53 = u7.createElement
    local v54 = {
        ["BackgroundTransparency"] = 1,
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = false,
        ["TextScaled"] = true,
        ["LayoutOrder"] = 5,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255),
        ["Font"] = Enum.Font.Arial
    }
    local v55 = p23.props.enemyScore
    local v56 = tostring(v55)
    local v57 = u9.WIN_CONDITIONS
    v54.Text = v56 .. "/" .. tostring(v57)
    v54.AnchorPoint = Vector2.new(0.5, 0.5)
    __set_list(v51, 1, {v52, v53("TextLabel", v54)})
    v25[v48] = v49("Frame", v50, v51)
    return u7.createElement("Frame", v24, v25)
end
function u13.getEnemyColor(p58) --[[ Line: 181 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v59 = u8.LocalPlayer.Team
    if v59 ~= nil then
        v59 = v59.Name
    end
    if v59 == "Blue" then
        p58.enemyColor = Color3.fromRGB(255, 237, 0)
    else
        p58.enemyColor = Color3.fromRGB(0, 194, 255)
    end
end
return {
    ["ScoreBoardWrapper"] = function() --[[ Name: ScoreBoardWrapper, Line 193 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
            [3] = u12
        --]]
        return u7.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u7.createElement(u13, {
                ["yourScore"] = u12.yourScore,
                ["enemyScore"] = u12.enemyScore,
                ["points"] = {}
            }) })
    end,
    ["PointCaptureScoreUI"] = u13
}