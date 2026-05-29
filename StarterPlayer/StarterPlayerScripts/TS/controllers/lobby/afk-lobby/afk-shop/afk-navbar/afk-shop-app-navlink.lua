local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["AfkShopAppNavlink"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u3
            [4] = u4
            [5] = u5
            [6] = u9
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local u14, u15 = v12(false)
        local u16 = string.lower(u10.ActivePage) == string.lower(u10.Page)
        local u17 = u6.createRef()
        v13(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u16
                [3] = u14
                [4] = u8
            --]]
            local v18 = u17:getValue()
            if v18 then
                if u16 then
                    return nil
                elseif u14 then
                    u8:Create(v18, TweenInfo.new(0.25), {
                        ["BackgroundTransparency"] = 0.75
                    }):Play()
                else
                    local v19 = {
                        ["BackgroundTransparency"] = u16 and 0.5 or 1
                    }
                    u8:Create(v18, TweenInfo.new(0.25), v19):Play()
                end
            else
                return nil
            end
        end, { u14 })
        local v20 = u6.createElement
        local v21 = {
            ["Size"] = UDim2.new(0, 70, 1, 0),
            ["Selectable"] = true,
            ["AutoButtonColor"] = false,
            ["BackgroundColor3"] = u3.BLACK,
            ["BackgroundTransparency"] = u16 and 0.5 or 1,
            ["BorderSizePixel"] = 0,
            [u6.Event.Activated] = function() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10.OnClick()
            end,
            [u6.Event.MouseEnter] = function() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15(true)
            end,
            [u6.Event.MouseLeave] = function() --[[ Line: 48 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15(false)
            end,
            [u6.Ref] = u17
        }
        local v22 = {
            ["ButtonContent"] = u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, {
                u6.createElement(u5, {
                    ["Padding"] = {
                        ["Top"] = 8,
                        ["Bottom"] = 6,
                        ["Left"] = 4,
                        ["Right"] = 4
                    }
                }),
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, 0.1)
                }),
                u6.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["ImageTransparency"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Image"] = u10.Icon,
                    ["ImageColor3"] = u10.ThemeColor or u9.textPrimary
                }),
                u6.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextTransparency"] = 0,
                    ["TextXAlignment"] = "Center",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.5),
                    ["Text"] = "<b>" .. u10.Text .. "</b>",
                    ["TextColor3"] = u10.ThemeColor or u9.textPrimary
                }, { u6.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) })
            }),
            ["BottomBorder"] = u6.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 2),
                ["Position"] = UDim2.fromScale(0, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["BackgroundColor3"] = u10.ThemeColor or u9.textPrimary,
                ["Transparency"] = u16 and 0 or 1
            })
        }
        return v20("ImageButton", v21, v22)
    end)
}