local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyStaffUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
({
    ["progress"] = 0
}).color = Color3.fromRGB(0, 0, 0)
local v10 = u4.Component:extend("FrostedCircleProgressBar")
function v10.init(p11, _) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    p11.connectionMaid = u3.new()
    p11.leftCircleUIGradRef = u4.createRef()
    p11.rightCircleUIGradRef = u4.createRef()
    p11.idImage = u4.createRef()
    p11:listenToUpdate()
end
function v10.render(p12) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.createFragment({ p12:createBar() })
end
function v10.willUnmount(p13) --[[ Line: 31 ]]
    p13.connectionMaid:DoCleaning()
end
function v10.listenToUpdate(u14) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u8
        [3] = u9
        [4] = u7
        [5] = u5
        [6] = u2
    --]]
    u6.StatusEffectChanged:connect(function(p15) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u8
            [3] = u9
            [4] = u7
            [5] = u5
            [6] = u2
        --]]
        if p15.entityInstance ~= u14.props.entityInstance then
            return nil
        end
        if p15.statusEffect ~= u8.COLD then
            return nil
        end
        local v16 = u9:getActive(p15.entityInstance, u8.COLD)
        if not v16 then
            return nil
        end
        local u17 = u14.leftCircleUIGradRef:getValue()
        local u18 = u14.rightCircleUIGradRef:getValue()
        if not (u17 and u18) then
            return nil
        end
        local v19 = v16.stacks * 100 / u7.MAX_COLD_STACK
        local v20 = v19 * 3.6
        local v21 = math.clamp(v20, 0, 360)
        local v22 = math.floor(v21)
        local v23 = u18.Rotation
        local v24 = u17.Rotation
        local v25 = u14.idImage:getValue()
        if v19 == 100 and v25 then
            v25.ImageColor3 = Color3.fromRGB(44, 111, 255)
        elseif v25 then
            v25.ImageColor3 = Color3.fromRGB(255, 255, 255)
        end
        u5(0.2, u2, function(p26) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u18
            --]]
            u18.Rotation = p26
        end, v23, (math.clamp(v22, 0, 180)))
        u5(0.2, u2, function(p27) --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            u17.Rotation = p27
        end, v24, (math.clamp(v22, 180, 360)))
    end)
end
function v10.createLeftCircle(p28) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v29 = p28.props.progress * 3.6
    local v30 = math.clamp(v29, 0, 360)
    local v31 = math.floor(v30)
    return u4.createElement("Frame", {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true,
        ["Position"] = UDim2.new(1, 0, 0, 0),
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, { u4.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.5, 0)
        }), u4.createElement("UIGradient", {
            ["Color"] = ColorSequence.new(Color3.fromRGB(28, 176, 255)),
            ["Transparency"] = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            ["Rotation"] = math.clamp(v31, 180, 360),
            [u4.Ref] = p28.leftCircleUIGradRef
        }) })
end
function v10.createRightCircle(p32) --[[ Line: 94 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v33 = p32.props.progress * 3.6
    local v34 = math.clamp(v33, 0, 360)
    local v35 = math.floor(v34)
    return u4.createElement("Frame", {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["ClipsDescendants"] = true,
        ["Position"] = UDim2.new(1, 0, 0, 0),
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, { u4.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.5, 0)
        }), u4.createElement("UIGradient", {
            ["Color"] = ColorSequence.new(Color3.fromRGB(28, 176, 255)),
            ["Transparency"] = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 0.5),
                NumberSequenceKeypoint.new(1, 0.5)
            }),
            ["Rotation"] = math.clamp(v35, 0, 180),
            [u4.Ref] = p32.rightCircleUIGradRef
        }) })
end
function v10.createImage(p36) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    return u4.createElement("ImageLabel", {
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.8, 0.8),
        ["Image"] = "rbxassetid://11611911951",
        [u4.Ref] = p36.idImage
    })
end
function v10.createBar(p37) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v38 = UDim2.fromScale(1, 1)
    if p37.props.playerGUI then
        v38 = UDim2.fromOffset(15, 15)
    end
    return u4.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = v38,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["AutomaticSize"] = Enum.AutomaticSize.None,
        ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
    }, {
        u4.createElement("Frame", {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(94, 92, 92),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0.5, 0)
        }, { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) }),
        u4.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["Position"] = UDim2.new(0, 0, 0, 0),
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0, 0)
        }, { p37:createLeftCircle() }),
        u4.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["Position"] = UDim2.new(1, 0, 0, 0),
            ["Size"] = UDim2.new(0.5, 0, 1, 0),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(1, 0)
        }, { p37:createRightCircle() }),
        u4.createElement("Frame", {
            ["BackgroundTransparency"] = 0.75,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["BackgroundColor3"] = Color3.fromRGB(125, 122, 122),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }), p37:createImage() })
    })
end
return {
    ["FrostedCircleProgressBar"] = v10
}