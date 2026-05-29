local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u10 = {
    ["progress"] = 0,
    ["id"] = "A",
    ["color"] = v2.WHITE
}
local u11 = u5.Component:extend("CircleProgressBar")
function u11.init(p12, _) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
    --]]
    p12.connectionMaid = u4.new()
    p12.leftCircleUIGradRef = u5.createRef()
    p12.rightCircleUIGradRef = u5.createRef()
    p12.idText = u5.createRef()
    p12:listenToUpdate()
end
function u11.render(p13) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.createFragment({ p13:createBar() })
end
function u11.willUnmount(p14) --[[ Line: 31 ]]
    p14.connectionMaid:DoCleaning()
end
function u11.listenToUpdate(u15) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u6
        [4] = u7
        [5] = u3
    --]]
    u9.Client:Get("ResourcePointProgressUpdate"):Connect(function(p16) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u15
            [4] = u7
            [5] = u3
        --]]
        local v17 = u8:getPlayerTeam(u6.LocalPlayer)
        if v17 ~= nil then
            v17 = v17.id
        end
        if p16.resourcePoint.id ~= u15.props.id then
            return nil
        end
        local u18 = u15.leftCircleUIGradRef:getValue()
        local u19 = u15.rightCircleUIGradRef:getValue()
        if not (u18 and u19) then
            return nil
        end
        local v20 = p16.resourcePoint.progress * 3.6
        local v21 = math.clamp(v20, 0, 360)
        local v22 = math.floor(v21)
        local v23 = u19.Rotation
        local v24 = u18.Rotation
        local v25 = Color3.fromRGB(59, 59, 59)
        local v26 = p16.resourcePoint.capturedByTeam
        if v26 == "" or not v26 then
            local v27 = p16.resourcePoint.capturingTeam
            if v27 ~= "" and v27 then
                if p16.resourcePoint.capturingTeam == v17 then
                    v25 = Color3.fromRGB(0, 255, 33)
                else
                    v25 = Color3.fromRGB(255, 0, 0)
                end
            end
        elseif p16.resourcePoint.capturedByTeam == v17 then
            v25 = Color3.fromRGB(0, 255, 33)
        else
            v25 = Color3.fromRGB(255, 0, 0)
        end
        u18.Color = ColorSequence.new(v25)
        u19.Color = ColorSequence.new(v25)
        u7(0.5, u3, function(p28) --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19.Rotation = p28
        end, v23, (math.clamp(v22, 0, 180)))
        u7(0.5, u3, function(p29) --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18.Rotation = p29
        end, v24, (math.clamp(v22, 180, 360)))
    end)
end
function u11.createLeftCircle(p30) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.createElement("Frame", {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true,
        ["Position"] = UDim2.new(1, 0, 0, 0),
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, { u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.5, 0)
        }), u5.createElement("UIGradient", {
            ["Color"] = ColorSequence.new(Color3.fromRGB(59, 59, 59)),
            ["Transparency"] = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            ["Rotation"] = 180,
            [u5.Ref] = p30.leftCircleUIGradRef
        }) })
end
function u11.createRightCircle(p31) --[[ Line: 123 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.createElement("Frame", {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true,
        ["Position"] = UDim2.new(1, 0, 0, 0),
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, { u5.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.5, 0)
        }), u5.createElement("UIGradient", {
            ["Color"] = ColorSequence.new(Color3.fromRGB(59, 59, 59)),
            ["Transparency"] = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            [u5.Ref] = p31.rightCircleUIGradRef
        }) })
end
function u11.createText(p32) --[[ Line: 146 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5.createElement("TextLabel", {
        ["Position"] = UDim2.fromScale(0.45, 0.6),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["TextColor3"] = p32.props.color,
        ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
        ["TextStrokeTransparency"] = 0,
        ["RichText"] = true,
        ["Font"] = Enum.Font.LuckiestGuy,
        ["Text"] = p32.props.id,
        ["TextScaled"] = true,
        [u5.Ref] = p32.idText
    })
end
function u11.createBar(p33) --[[ Line: 163 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v34 = UDim2.fromScale(1, 1)
    if p33.props.playerGUI then
        v34 = UDim2.fromOffset(15, 15)
    end
    return u5.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = v34,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, {
        u5.createElement("Frame", {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(94, 92, 92),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }, { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) }),
        u5.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["Position"] = UDim2.new(0, 0, 0, 0),
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0, 0)
        }, { p33:createLeftCircle() }),
        u5.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["Position"] = UDim2.new(1, 0, 0, 0),
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(1, 0)
        }, { p33:createRightCircle() }),
        u5.createElement("Frame", {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["BackgroundColor3"] = Color3.fromRGB(125, 122, 122),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }), p33:createText() })
    })
end
return {
    ["ScoreBoardWrapper"] = function() --[[ Name: ScoreBoardWrapper, Line 231 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u10
        --]]
        return u5.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u5.createElement(u11, {
                ["progress"] = u10.progress,
                ["color"] = u10.color,
                ["id"] = u10.id
            }) })
    end,
    ["CircleProgressBar"] = u11
}