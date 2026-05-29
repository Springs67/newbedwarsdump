local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "stat-card").StatCardComponent
local u4 = u2.Component:extend("PlayerHighlights")
function u4.init(_) --[[ Line: 8 ]] end
function u4.render(p5) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    if not p5.props.cards then
        return nil
    end
    local v6 = p5.props.cards
    local v7 = table.create(#v6)
    for v8, v9 in v6 do
        local v10 = v8 - 1
        v7[v8] = u2.createElement(u3, {
            ["card"] = v9,
            ["index"] = v10 + 1,
            ["DisableAnimation"] = p5.props.DisableAnimation
        })
    end
    local v11 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Visible"] = p5.props.Visible
    }
    local v12 = { u2.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 0),
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        }) }
    local v13 = #v12
    for v14, v15 in v7 do
        v12[v13 + v14] = v15
    end
    return u2.createFragment({
        ["PlayerHighlights"] = u2.createElement("Frame", v11, v12)
    })
end
return {
    ["PlayerHighlightsWrapper"] = function(p16) --[[ Name: PlayerHighlightsWrapper, Line 53 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        return u2.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 101
        }, { u2.createElement(u4, {
                ["cards"] = p16.cards,
                ["Visible"] = p16.Visible,
                ["DisableAnimation"] = p16.DisableAnimation
            }) })
    end,
    ["PlayerHighlights"] = u4
}