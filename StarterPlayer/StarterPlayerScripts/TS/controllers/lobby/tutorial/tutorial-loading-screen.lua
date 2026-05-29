local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DarkBackground
local u5 = v2.ImageId
local u6 = v2.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v32 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u7)(function(_, p12) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u9
        [3] = u10
        [4] = u4
        [5] = u6
        [6] = u11
        [7] = u3
        [8] = u5
    --]]
    local _ = p12.useState
    local v13 = p12.useEffect
    local u14 = u7.createRef()
    local u15 = u7.createRef()
    local u16 = nil
    local u17 = nil
    local u18 = nil
    v13(function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u15
            [3] = u16
            [4] = u17
            [5] = u18
        --]]
        local u19 = false
        local u20 = u14:getValue()
        local u21 = u15:getValue()
        task.delay(0.9, function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u16
                [3] = u20
                [4] = u17
                [5] = u18
                [6] = u21
            --]]
            if not u19 then
                u16(u20)
                u17(u20)
                u18(u21)
            end
        end)
        return function() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            u19 = true
        end
    end, {})
    u16 = function(p22) --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
        --]]
        if not p22 then
            return nil
        end
        u9:Create(p22, TweenInfo.new(u10.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["ImageTransparency"] = 0
        }):Play()
    end
    u18 = function(p23) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
        --]]
        if not p23 then
            return nil
        end
        u9:Create(p23, TweenInfo.new(u10.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["TextTransparency"] = 0
        }):Play()
    end
    u17 = function(p24) --[[ Line: 56 ]]
        --[[
        Upvalues:
            [1] = u9
        --]]
        if not p24 then
            return nil
        end
        u9:Create(p24, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
            ["Rotation"] = 360
        }):Play()
    end
    local v25 = u7.createElement
    local v26 = {}
    local v27 = u7.createElement(u4, {
        ["AppId"] = "LoadingPlaceDarkBackground",
        ["DisableCloseOnClick"] = true,
        ["BackgroundTransparency"] = 1
    })
    local v28 = u7.createElement
    local v29 = u6
    local v30 = {
        ["TweenInfo"] = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
        ["StartPosition"] = UDim2.fromScale(0, 1)
    }
    local v31 = {
        ["LoadingScreenBackground"] = u7.createElement("ImageLabel", {
            ["ImageTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 5,
            ["ZIndex"] = 2,
            ["Position"] = UDim2.fromScale(0, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["ScaleType"] = Enum.ScaleType.Fit,
            ["BackgroundColor3"] = u11.backgroundSecondary
        })
    }
    __set_list(v26, 1, {v27, v28(v29, v30, v31), u7.createElement("TextLabel", {
    [u7.Ref] = u15,
    ["Text"] = "<b>Teleporting to BedWars Tutorial</b>",
    ["AnchorPoint"] = Vector2.new(0.5, 0),
    ["Position"] = UDim2.fromScale(0.5, 0.62),
    ["Size"] = u10.Theme.headingThreeSize,
    ["TextColor3"] = u3.WHITE,
    ["RichText"] = true,
    ["TextScaled"] = true,
    ["TextStrokeTransparency"] = 1,
    ["TextTransparency"] = 1,
    ["TextYAlignment"] = "Center",
    ["Font"] = u10.Theme.font,
    ["BackgroundTransparency"] = 1,
    ["ZIndex"] = 7
}), u7.createElement("ImageLabel", {
    [u7.Ref] = u14,
    ["Image"] = u5.LOADING_SPINNER,
    ["BackgroundTransparency"] = 1,
    ["Position"] = UDim2.fromScale(0.5, 0.5),
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Size"] = UDim2.fromScale(0.15, 0.15),
    ["ImageTransparency"] = 1,
    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
    ["ZIndex"] = 8
})})
    return v25("ScreenGui", {
        ["DisplayOrder"] = 100,
        ["IgnoreGuiInset"] = true
    }, v26)
end)
return {
    ["TutorialLoadingScreen"] = v8.connect(function(_, p33) --[[ Line: 120 ]]
        local v34 = {}
        for v35, v36 in p33 do
            v34[v35] = v36
        end
        return v34
    end)(v32)
}