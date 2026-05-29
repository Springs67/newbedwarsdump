local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, script.Parent, "lasso-wars-tutorial-bullet-text").LassoWarsTutorialBulletText
local v28 = v8.new(u7)(function(p12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u5
        [3] = u2
        [4] = u10
        [5] = u6
        [6] = u4
        [7] = u11
    --]]
    local _ = p13.useState
    local _ = p13.useEffect
    local v14 = u7.createFragment
    local v15 = {}
    local v16 = u7.createElement
    local v17 = {}
    local v18 = u7.createElement(u5, {
        ["AppId"] = p12.AppId,
        ["ImageButtonProps"] = {
            ["ZIndex"] = -99
        },
        ["OnClick"] = function() --[[ Name: OnClick, Line 25 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u10
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u10.LASSO_WARS_TUTORIAL_APP)
            return false
        end
    })
    local v19 = u7.createElement
    local v20 = u6
    local v21 = {}
    local v22 = u7.createElement
    local v23 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.5, 0.7),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v24 = {}
    local v25 = u7.createElement
    local v26 = {
        ["BackgroundTransparency"] = 0,
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = Color3.fromHex("#AC714A"),
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v27 = {
        u7.createElement("UIStroke", {
            ["Thickness"] = 3,
            ["Color"] = Color3.fromHex("#3A160E")
        }),
        u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 10)
        }),
        ["InnerBackground"] = u7.createElement("Frame", {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromHex("#C3976A"),
            ["Size"] = UDim2.fromScale(0.95, 0.95)
        }, {
            u7.createElement("UIStroke", {
                ["Thickness"] = 3,
                ["Color"] = Color3.fromHex("#924A36")
            }),
            u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u7.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "Lasso Wars Info",
                ["TextScaled"] = true,
                ["TextStrokeTransparency"] = 0.2,
                ["LayoutOrder"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.1),
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }),
            u7.createElement(u11, {
                ["text"] = "First team to 30 kills wins"
            }),
            u7.createElement(u11, {
                ["text"] = "You can lasso your teammates"
            }),
            u7.createElement(u11, {
                ["text"] = "Grapple to hooks with your lasso"
            }),
            u7.createElement(u11, {
                ["text"] = "If you and a teammate pull an enemy from opposite sides simultaneously something cool will happen"
            })
        })
    }
    v24.OuterBackground = v25("Frame", v26, v27)
    __set_list(v21, 1, {v22("ImageButton", v23, v24)})
    __set_list(v17, 1, {v18, v19(v20, {}, v21)})
    v15.LassoWarsTutorialApp = v16("ScreenGui", {
        ["DisplayOrder"] = 11
    }, v17)
    return v14(v15)
end)
return {
    ["LassoWarsTutorialApp"] = v9.connect(function(_, p29) --[[ Line: 109 ]]
        local v30 = {}
        for v31, v32 in p29 do
            v30[v31] = v32
        end
        return v30
    end)(v28)
}