local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.RunService
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = u8.Component:extend("FlagScoreUI")
function u15.init(p16, _) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
    --]]
    p16.enemyColor = Color3.fromRGB(255, 0, 0)
    p16.teamColor = Color3.fromRGB(255, 0, 0)
    p16.connectionMaid = u7.new()
    p16.flagStatusMessage = ""
    p16.teamFlagPosition = 0
    if not u4.isHoarceKat() then
        p16:getEnemyColor()
        p16:listenToScoreUpdate()
        p16:listenToFlagUpdate()
    end
end
function u15.render(p17) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8.createFragment({ p17:createYourScore() })
end
function u15.willUnmount(p18) --[[ Line: 45 ]]
    p18.connectionMaid:DoCleaning()
end
function u15.listenToFlagUpdate(u19) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
        [3] = u11
        [4] = u6
    --]]
    local v22 = u14.Client:WaitFor("FlagHolderUpdate"):expect():Connect(function(p20) --[[ Line: 49 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u19
        --]]
        local v21 = u10.LocalPlayer.Team
        if v21 ~= nil then
            v21 = v21.Name
        end
        if p20.teamColor == v21 then
            if p20.teamFlag == false then
                u19.flagStatusMessage = "Your Flag Has Been Taken!"
            else
                u19.flagStatusMessage = ""
            end
            u19.props.yourFlag = p20.teamFlag
            u19:setState({
                ["yourFlag"] = p20.teamFlag
            })
        elseif p20.teamColor ~= "Neutral" then
            u19.props.enemyFlag = p20.teamFlag
            u19:setState({
                ["enemyFlag"] = p20.teamFlag
            })
        end
    end)
    u19.connectionMaid:GiveTask(v22)
    local v26 = u11.Heartbeat:Connect(function(_) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u19
        --]]
        local v23 = u6.Controllers.FlagCaptureController:getFlagPositions().team
        local v24 = u6.Controllers.FlagCaptureController:getFlagPositions().enemy
        local v25 = u6.Controllers.FlagCaptureController:getFlagPositions().neutralFlag
        if v23 == u19.props.teamFlagPosition and (v24 == u19.props.enemyFlagPosition and v25 == u19.props.neutralFlagPosition) then
            return nil
        end
        u19.props.teamFlagPosition = v23
        u19.props.enemyFlagPosition = v24
        u19.props.neutralFlagPosition = v25
        u19:setState({
            ["teamFlagPosition"] = v23,
            ["enemyFlagPosition"] = v24,
            ["neutralFlagPosition"] = v25
        })
    end)
    u19.connectionMaid:GiveTask(v26)
end
function u15.listenToScoreUpdate(u27) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u10
    --]]
    local u28 = 0
    local u29 = 0
    local v32 = u14.Client:WaitFor("FlagScoreUpdate"):expect():Connect(function(p30) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u28
            [3] = u29
            [4] = u27
        --]]
        local v31 = u10.LocalPlayer.Team
        if v31 ~= nil then
            v31 = v31.Name
        end
        if p30.teamOneColor == v31 then
            u28 = p30.teamOneScore
            u29 = p30.teamTwoScore
        else
            u29 = p30.teamOneScore
            u28 = p30.teamTwoScore
        end
        u27.props.yourScore = u28
        u27.props.enemyScore = u29
        u27:setState({
            ["yourScore"] = u28,
            ["enemyScore"] = u29
        })
    end)
    u27.connectionMaid:GiveTask(v32)
end
function u15.createYourScore(p33) --[[ Line: 120 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u3
        [3] = u13
        [4] = u4
        [5] = u12
        [6] = u10
        [7] = u5
    --]]
    local v34 = {
        ["Position"] = UDim2.fromScale(0.5, 0.075),
        ["Size"] = UDim2.fromScale(0.3, 0.04),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v35 = {}
    local v36 = u8.createElement
    local v37 = {
        ["BackgroundTransparency"] = 1,
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = true,
        ["TextScaled"] = true
    }
    local v38 = p33.props.yourScore
    v37.Text = tostring(v38) .. "<font transparency=\".3\">/3</font>"
    v37.Position = UDim2.fromScale(0, 0)
    v37.Size = UDim2.fromScale(0.1, 1)
    v37.TextColor3 = u3.WHITE
    v37.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v37.FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold)
    v35.YourScore = v36("TextLabel", v37, { u8.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 28,
            ["MinTextSize"] = 18
        }) })
    local _ = #v35
    local v39 = {
        ["BackgroundTransparency"] = 0.45,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["Size"] = UDim2.fromScale(0.7, 1),
        ["BackgroundColor3"] = u3.BLACK,
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v40 = {}
    local v41 = #v40
    local v42 = {
        ["ScaleType"] = "Fit",
        ["Size"] = UDim2.fromScale(0.75, 0.75),
        ["Position"] = UDim2.fromScale(p33.props.teamFlagPosition + 0.005, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Image"] = u13.FLAG_ICON
    }
    local v43
    if u4.isHoarceKat() then
        v43 = u3.hexColor(u12.lightBlue)
    else
        v43 = u10.LocalPlayer.Team
        if v43 ~= nil then
            v43 = v43.TeamColor.Color
        end
    end
    v42.ImageColor3 = v43
    v42.BackgroundTransparency = 1
    v42.ZIndex = 10
    v40.YourTeamFlag = u8.createElement("ImageLabel", v42, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    local v44 = {
        ["BackgroundTransparency"] = 0.3,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5)
    }
    local v45 = u3
    local v46
    if u4.isHoarceKat() then
        v46 = u3.hexColor(u12.lightBlue)
    else
        v46 = u10.LocalPlayer.Team
        if v46 ~= nil then
            v46 = v46.TeamColor.Color
        end
        if v46 == nil then
            v46 = u3.hexColor(u12.lightBlue)
        end
    end
    v44.BackgroundColor3 = v45.darken(v46, 0.4)
    v44.ZIndex = 9
    v40.YourTeamFlagHome = u8.createElement("Frame", v44, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v40[v41 + 1] = u8.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0, 0),
        ["Size"] = UDim2.fromScale(1, 1),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    })
    v40.EnemyTeamFlagHome = u8.createElement("Frame", {
        ["BackgroundTransparency"] = 0.5,
        ["ZIndex"] = 10,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["BackgroundColor3"] = u3.darken(p33.enemyColor, 0.4)
    }, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    local v47 = p33:getNeutralFlag()
    if v47 then
        v40[v41 + 2] = v47
    end
    local _ = #v40
    v40.EnemyTeamFlag = u8.createElement("ImageLabel", {
        ["ScaleType"] = "Fit",
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 10,
        ["Size"] = UDim2.fromScale(0.75, 0.75),
        ["Position"] = UDim2.fromScale(p33.props.enemyFlagPosition + 0.01, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Image"] = u13.FLAG_ICON,
        ["ImageColor3"] = p33.enemyColor
    }, { u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    v35.BackgroundBar = u8.createElement("Frame", v39, v40)
    local v48 = u8.createElement
    local v49 = {
        ["BackgroundTransparency"] = 1,
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = true,
        ["TextScaled"] = true
    }
    local v50 = p33.props.enemyScore
    v49.Text = tostring(v50) .. "<font transparency=\".3\">/3</font>"
    v49.Position = UDim2.fromScale(0.9, 0)
    v49.Size = UDim2.fromScale(0.1, 1)
    v49.TextColor3 = u3.WHITE
    v49.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    v49.FontFace = Font.fromName("RobotoMono", Enum.FontWeight.Bold)
    v35.EnemyScore = v48("TextLabel", v49, { u8.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 28,
            ["MinTextSize"] = 18
        }) })
    return u8.createElement(u5, v34, v35)
end
function u15.displayFlagStatus(p51, p52, p53) --[[ Line: 269 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
    --]]
    if p52 and not p51.props.enemyFlag then
        return u8.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(0.2, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = u13.FLAG_ICON,
            ["ImageColor3"] = p53
        })
    elseif p52 or p51.props.yourFlag then
        return u8.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(0.2, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    else
        return u8.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 0,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(0.2, 0.8),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["ImageColor3"] = p53,
            ["BorderColor3"] = Color3.fromRGB(255, 0, 0),
            ["Image"] = u13.FLAG_ICON,
            ["BackgroundColor3"] = Color3.fromRGB(255, 0, 0)
        })
    end
end
function u15.getEnemyColor(p54) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v55 = u10.LocalPlayer.Team
    if v55 ~= nil then
        v55 = v55.Name
    end
    if v55 == "Blue" then
        p54.enemyColor = Color3.fromRGB(255, 237, 0)
        p54.teamColor = Color3.fromRGB(0, 194, 255)
    else
        p54.enemyColor = Color3.fromRGB(0, 194, 255)
        p54.teamColor = Color3.fromRGB(255, 237, 0)
    end
end
function u15.getNeutralFlag(p56) --[[ Line: 317 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u13
    --]]
    if p56.props.neutralFlagPosition == nil then
        return nil
    else
        return u8.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(p56.props.neutralFlagPosition, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["AnchorPoint"] = Vector2.new(0, 0)
        }, { u8.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Image"] = u13.FLAG_ICON,
                ["ImageColor3"] = Color3.fromRGB(204, 0, 255)
            }), u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
end
return {
    ["ScoreBoardWrapper"] = function() --[[ Name: ScoreBoardWrapper, Line 345 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u15
        --]]
        return u8.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u8.createElement(u15, {
                ["yourScore"] = 0,
                ["enemyScore"] = 0,
                ["yourFlag"] = true,
                ["enemyFlag"] = true,
                ["teamFlagPosition"] = 0,
                ["enemyFlagPosition"] = 0,
                ["neutralFlagPosition"] = nil
            }) })
    end,
    ["FlagScoreUI"] = u15
}