local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v2.UIUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u9 = nil
local function v23(p10) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u8
        [3] = u6
        [4] = u9
        [5] = u4
        [6] = u3
    --]]
    local v11 = p10.store.Kit.voidDragonProgress
    local v12 = v11 == nil and 0 or v11
    local v13 = math.max(0.01, v12)
    local v14 = math.min(1, v13)
    local v15 = v14 >= 1
    if v15 then
        local v16 = u7.LocalPlayer:GetAttribute("VoidDragon")
        if v16 == 0 or v16 ~= v16 then
            v16 = false
        elseif v16 == "" then
            v16 = false
        end
        v15 = not v16
    end
    if not v15 then
        return u6.createElement(u4, {
            ["Size"] = u8.actionBarProgressBarSize,
            ["Progress"] = v14,
            ["BarGradient"] = ColorSequence.new(u3.hexColor(14363435), u3.hexColor(14573407))
        })
    end
    local v17 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Size"] = u8.actionBarButtonSize
    }
    local v18 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v19 = #v18
    local v20 = {}
    for v21, v22 in p10 do
        v20[v21] = v22
    end
    v18[v19 + 1] = u6.createElement(u9, v20)
    return u6.createElement("Frame", v17, v18)
end
u9 = function(p24) --[[ Name: ActiveButton, Line 57 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
    --]]
    local u25 = p24.VoidDragonActive
    return u6.createElement("ImageButton", {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = u5:getActionBarPosition(),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
        ["BackgroundTransparency"] = 0.6,
        ["BorderSizePixel"] = 0,
        [u6.Event.Activated] = function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25()
        end
    }, { u6.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4.675675675675675
        }), u6.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Text"] = "Transform [v]",
            ["Font"] = "Roboto",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(0.8, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        }) })
end
return {
    ["VoidDragonUi"] = v23
}