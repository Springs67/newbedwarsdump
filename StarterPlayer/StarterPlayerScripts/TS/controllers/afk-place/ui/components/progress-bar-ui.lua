local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local v6 = u3.Component:extend("ProgressBarUI")
function v6.init(p7) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p7.wrapperRef = u3.createRef()
    p7.fillRef = u3.createRef()
    p7.labelRef = u3.createRef()
    p7.progress = 0
    p7.count = 0
    p7.multiplier = p7.props.multiplier
end
function v6.render(p8) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u2
    --]]
    local v9 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v10 = {}
    local v11 = u3.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Vertical,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["VerticalFlex"] = Enum.UIFlexAlignment.SpaceEvenly
    })
    local v12 = u3.createElement
    local v13 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.5)
    }
    local v14 = {}
    local v15 = u3.createElement("ImageLabel", {
        ["SizeConstraint"] = "RelativeYY",
        ["ScaleType"] = "Fit",
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.7, 0.7),
        ["Image"] = p8.props.image,
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["Position"] = UDim2.fromScale(0.35, 0.5)
    })
    local v16 = u3.createElement
    local v17 = {
        [u3.Ref] = p8.labelRef
    }
    local v18 = p8.props.startAmount
    v17.Text = " " .. tostring(v18)
    v17.AnchorPoint = Vector2.new(0.5, 0.5)
    v17.Position = UDim2.fromScale(0.7, 0.5)
    v17.Size = UDim2.fromScale(0.4, 0.6)
    v17.FontFace = Font.fromName("GothamBold", Enum.FontWeight.Bold)
    v17.BackgroundTransparency = 1
    v17.BorderSizePixel = 0
    v17.AutomaticSize = Enum.AutomaticSize.None
    v17.Font = u5.Theme.font
    v17.TextStrokeTransparency = 1
    v17.TextSize = 42
    v17.TextScaled = true
    v17.TextXAlignment = Enum.TextXAlignment.Left
    v17.TextYAlignment = "Center"
    v17.TextColor3 = u2.WHITE
    v17.SizeConstraint = "RelativeXY"
    __set_list(v14, 1, {v15, v16("TextLabel", v17)})
    __set_list(v10, 1, {v11, v12("Frame", v13, v14)})
    local v19 = #v10
    local v20 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.3)
    }
    local v21 = {}
    local _ = #v21
    local v22 = {
        [u3.Ref] = p8.wrapperRef,
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["BackgroundColor3"] = Color3.fromRGB(22, 22, 22),
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 1,
        ["Position"] = UDim2.fromScale(0.1, 0)
    }
    local v23 = { u3.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 30)
        }) }
    local _ = #v23
    local v24 = {
        [u3.Ref] = p8.fillRef,
        ["Size"] = UDim2.fromScale(p8.progress, 1),
        ["BackgroundColor3"] = Color3.fromRGB(255, 237, 0),
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 1
    }
    local v25 = { u3.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 30)
        }), u3.createElement("UIGradient", {
            ["Rotation"] = 90,
            ["Color"] = ColorSequence.new(Color3.fromRGB(255, 224, 26), Color3.fromRGB(255, 188, 80))
        }) }
    local v26 = #v25
    local v27 = p8.props[u3.Children]
    if v27 then
        for v28, v29 in v27 do
            if type(v28) == "number" then
                v25[v26 + v28] = v29
            else
                v25[v28] = v29
            end
        end
    end
    v23.BarFill = u3.createElement("Frame", v24, v25)
    v21.BarBackground = u3.createElement("Frame", v22, v23)
    v10[v19 + 1] = u3.createElement("Frame", v20, v21)
    return u3.createElement("Frame", v9, v10)
end
function v6.didMount(p30) --[[ Line: 122 ]]
    p30:setupResourceListener()
    p30.multiplier = (p30.props.isVip and 0.15 or 0) + 1 + (p30.props.isPremium and 0.15 or 0)
end
function v6.willUnmount(p31) --[[ Line: 126 ]]
    local v32 = p31.resourceHeartbeat
    if v32 ~= nil then
        v32:Disconnect()
    end
end
function v6.setupResourceListener(u33) --[[ Line: 132 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local u34 = u33.fillRef:getValue()
    local u35 = u33.labelRef:getValue()
    if not (u34 and u35) then
        return nil
    end
    local u36 = 0
    u33.resourceHeartbeat = u4.Heartbeat:Connect(function(p37) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u33
            [3] = u35
            [4] = u36
        --]]
        u34.Size = UDim2.fromScale(u33.progress, 1)
        local v38 = u35
        local v39 = u33.count + u33.props.startAmount
        v38.Text = tostring(v39)
        u36 = u36 + p37
        local v40 = u33
        local v41 = u36 * u33.props.rate * u33.multiplier / 3600
        v40.count = math.floor(v41)
        local v42 = u33
        local v43 = u36 * u33.props.rate * u33.multiplier / 3600
        local v44 = u36 * u33.props.rate * u33.multiplier / 3600
        v42.progress = v43 - math.floor(v44)
    end)
end
return {
    ["ProgressBarUI"] = v6
}