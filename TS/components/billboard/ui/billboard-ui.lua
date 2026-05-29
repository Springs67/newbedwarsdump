local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local function u9(p2) --[[ Line: 4 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v3 = {
        ["BackgroundTransparency"] = 0.6,
        ["BorderSizePixel"] = 0,
        ["TextScaled"] = true,
        ["RichText"] = true
    }
    local v4
    if p2.AutomaticSize then
        v4 = UDim2.new(0, 0, p2.LabelSize.Y.Scale, p2.LabelSize.Y.Offset)
    else
        v4 = p2.LabelSize
    end
    v3.Size = v4
    v3.Position = p2.Position
    v3.AnchorPoint = Vector2.new(0.5, 0)
    v3.BackgroundColor3 = Color3.new(0.01, 0.01, 0.01)
    v3.Font = Enum.Font.Arcade
    v3.TextColor3 = p2.TextColor
    v3.Text = p2.Text
    local v5
    if p2.AutomaticSize then
        v5 = Enum.AutomaticSize.X
    else
        v5 = Enum.AutomaticSize.None
    end
    v3.AutomaticSize = v5
    local v6 = {}
    local v7 = #v6
    local v8 = p2.AutomaticSize
    if v8 then
        v8 = u1.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 8),
            ["PaddingRight"] = UDim.new(0, 8)
        })
    end
    if v8 then
        v6[v7 + 1] = v8
    end
    return u1.createElement("TextLabel", v3, v6)
end
local v10 = u1.Component:extend("BillboardUI")
function v10.init(_) --[[ Line: 33 ]] end
function v10.render(u11) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u9
    --]]
    local u12 = 0
    local v13 = u11.props.Texts
    local function v21(p14, p15) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u11
            [3] = u1
            [4] = u9
        --]]
        local v16 = u12
        local v17 = {}
        for v18, v19 in p14 do
            v17[v18] = v19
        end
        v17.Position = UDim2.new(0.5, 0, p15 * v16, p15 * (p14.LabelSize.Y.Offset + u11.props.ItemPadding.Offset))
        v17.AutomaticSize = u11.props.AutomaticSize
        local v20 = u1.createElement(u9, v17)
        u12 = u12 + (p14.LabelSize.Y.Scale + u11.props.ItemPadding.Scale)
        return v20
    end
    local v22 = table.create(#v13)
    for v23, v24 in v13 do
        v22[v23] = v21(v24, v23 - 1, v13)
    end
    local v25 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v26 = { u1.createElement("UISizeConstraint", {
            ["MaxSize"] = u11.props.MaxSize or Vector2.new((1 / 0), (1 / 0))
        }) }
    local v27 = #v26
    for v28, v29 in v22 do
        v26[v27 + v28] = v29
    end
    return u1.createElement("Frame", v25, v26)
end
return {
    ["BillboardUI"] = v10
}