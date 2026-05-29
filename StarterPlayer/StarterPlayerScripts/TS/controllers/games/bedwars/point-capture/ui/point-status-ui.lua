local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent, "circle-progress-bar").CircleProgressBar
local v5 = u3.Component:extend("PointStatusUI")
function v5.init(_) --[[ Line: 9 ]] end
function v5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u2
    --]]
    local v7 = {}
    local v8 = #v7
    local v9 = p6.props.points
    local function v12(p10, p11) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
        --]]
        return u3.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.2 + p11 * 0.15, 0.5),
            ["Size"] = UDim2.fromScale(0.1, 0.5),
            ["AutomaticSize"] = Enum.AutomaticSize.None,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY
        }, { u3.createElement(u4, {
                ["progress"] = 0,
                ["color"] = u2.WHITE,
                ["id"] = p10
            }) })
    end
    local v13 = table.create(#v9)
    local v14 = {
        ["ResetOnSpawn"] = false
    }
    for v15, v16 in v9 do
        v13[v15] = v12(v16, v15 - 1, v9)
    end
    local v17 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.1),
        ["Size"] = UDim2.fromScale(0.2, 0.1),
        ["AutomaticSize"] = Enum.AutomaticSize.XY,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v18 = {}
    local v19 = #v18
    for v20, v21 in v13 do
        v18[v19 + v20] = v21
    end
    v7[v8 + 1] = u3.createElement("Frame", v17, v18)
    return u3.createElement("ScreenGui", v14, v7)
end
return {
    ["PointStatusUI"] = v5
}