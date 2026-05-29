local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v5 = u2.Component:extend("DrillBillboard")
function v5.init(p6) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    p6.billboardRef = u2.createRef()
    p6.resourceCounterRef = u2.createRef()
    p6.head = p6.props.drill:WaitForChild("Head")
    p6.image = "rbxassetid://6850538075"
end
function v5.render(p7) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u4
    --]]
    local v8 = u3(p7.props.itemtype).image
    if v8 ~= "" and v8 then
        p7.image = v8
    end
    local v9 = u2.createFragment
    local v10 = {}
    local v11 = u2.createElement
    local v12 = {
        [u2.Ref] = p7.billboardRef,
        ["Adornee"] = p7.head,
        ["ExtentsOffset"] = Vector3.new(0, 7.5, 0),
        ["Size"] = UDim2.fromScale(4, 5),
        ["MaxDistance"] = 25
    }
    local v13 = {}
    local v14 = u2.createElement
    local v15 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.6),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.8, 0.7)
    }
    local v16 = {}
    local v17 = u2.createElement
    local v18 = {
        ["BackgroundTransparency"] = 0.25,
        ["Size"] = UDim2.fromScale(1, 0.45),
        ["Position"] = UDim2.fromScale(0, 0.42),
        ["BackgroundColor3"] = u4.Gray
    }
    local v19 = {
        u2.createElement("UICorner"),
        u2.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = Color3.fromRGB(255, 255, 255)
        }),
        ["ResourceIcon"] = u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Image"] = p7.image,
            ["Size"] = UDim2.fromScale(0.4, 0.4),
            ["Position"] = UDim2.fromScale(0.225, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX
        }),
        ["Counter"] = u2.createElement("TextLabel", {
            [u2.Ref] = p7.resourceCounterRef,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Text"] = "0",
            ["Font"] = Enum.Font.Arcade,
            ["Size"] = UDim2.fromScale(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.7, 0.5),
            ["TextStrokeTransparency"] = 0,
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1
        })
    }
    v16.ResourceContainer = v17("Frame", v18, v19)
    v13.UsableArea = v14("Frame", v15, v16)
    v10.CannonBillboard = v11("BillboardGui", v12, v13)
    return v9(v10)
end
function v5.didMount(p20) --[[ Line: 73 ]]
    p20:setupResourceListener()
end
function v5.setupResourceListener(u21) --[[ Line: 76 ]]
    local u22 = u21.resourceCounterRef:getValue()
    if not u22 then
        return nil
    end
    u21.props.drill:GetAttributeChangedSignal(u21.props.itemtype):Connect(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u22
        --]]
        local v23 = u21.props.drill:GetAttribute(u21.props.itemtype)
        u22.Text = tostring(v23)
    end)
end
return {
    ["DrillBillboard"] = v5
}