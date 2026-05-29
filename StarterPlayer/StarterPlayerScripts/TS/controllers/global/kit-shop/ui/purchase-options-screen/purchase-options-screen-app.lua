local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.SlideIn
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu").FullScreenMenu
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "full-screen-menu", "full-screen-menu-background-presets").FullScreenMenuBackgroundPresets
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v35 = v8.new(u7)(function(p13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u11
        [4] = u7
        [5] = u3
        [6] = u4
        [7] = u5
        [8] = u10
    --]]
    local _ = p14.useState
    p14.useEffect(function() --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
        --]]
        u6:playSound(u12.UI_OPEN_2)
        return function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u12
            --]]
            u6:playSound(u12.UI_CLOSE_2)
        end
    end, {})
    local v15 = {}
    local v16 = {}
    for v17, v18 in p13.OnBack and {
        ["OnClick"] = p13.OnBack
    } or {} do
        v15[v17] = v18
    end
    for v19, v20 in u11.BACKGROUND_BLUR_PRESET do
        v15[v19] = v20
    end
    v16.Background = v15
    v16.ExitButton = p13.OnExit and {
        ["OnClick"] = p13.OnExit
    } or nil
    v16.BackButton = p13.OnBack and {
        ["OnClick"] = p13.OnBack
    } or nil
    v16.EnableButtonBackgroundPanel = true
    local v21 = {}
    local v22 = #v21
    local v23 = { u7.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.025, 0)
        }) }
    local v24 = #v23
    local v25 = {
        ["BackgroundTransparency"] = 0.5,
        ["Size"] = UDim2.fromScale(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u3.BLACK
    }
    local v26 = { u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.05, 0)
        }), u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v27 = #v26
    local v28
    if p13.Image == nil then
        v28 = false
    else
        v28 = u7.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.3, 0.3),
            ["Image"] = p13.Image,
            ["ScaleType"] = Enum.ScaleType.Fit
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    if v28 then
        v26[v27 + 1] = v28
    end
    local v29 = #v26
    v26[v29 + 1] = u7.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["TextTransparency"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.1),
        ["Text"] = p13.Title,
        ["TextColor3"] = u3.WHITE,
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
        ["TextXAlignment"] = Enum.TextXAlignment.Center,
        ["TextYAlignment"] = Enum.TextYAlignment.Center
    }, { u7.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 40,
            ["MinTextSize"] = 12
        }) })
    v26[v29 + 2] = u7.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["TextScaled"] = true,
        ["TextTransparency"] = 0.5,
        ["Size"] = UDim2.fromScale(1, 0.2),
        ["Text"] = p13.Description,
        ["TextColor3"] = u3.WHITE,
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
        ["TextXAlignment"] = Enum.TextXAlignment.Center,
        ["TextYAlignment"] = Enum.TextYAlignment.Top
    }, { u7.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 28,
            ["MinTextSize"] = 8
        }) })
    local v30 = {
        ["Size"] = UDim2.fromScale(1, 0.1)
    }
    local v31 = { u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v32 = #v31
    for v33, v34 in p13.Buttons do
        v31[v32 + v33] = v34
    end
    v26[v29 + 3] = u7.createElement(u4, v30, v31)
    v23[v24 + 1] = u7.createElement("Frame", v25, v26)
    v21[v22 + 1] = u7.createElement(u5, {}, v23)
    return u7.createElement(u10, v16, v21)
end)
return {
    ["PurchaseOptionsScreenApp"] = v9.connect(function(p36, p37) --[[ Line: 136 ]]
        local v38 = {
            ["store"] = p36
        }
        for v39, v40 in p37 do
            v38[v39] = v40
        end
        return v38
    end)(v35)
}