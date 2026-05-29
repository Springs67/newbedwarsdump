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
    ["EventAppNavlink"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u3
            [4] = u5
            [5] = u9
            [6] = u4
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local u14, u15 = v12(false)
        local u16, u17 = v12(false)
        local u18, _ = v12(u6.createRef())
        local u19, u20 = v12(true)
        v13(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u16
                [3] = u17
            --]]
            if u16 ~= (string.lower(u10.ActivePage) == string.lower(u10.Page)) then
                u17(string.lower(u10.ActivePage) == string.lower(u10.Page))
            end
        end, { u10.ActivePage })
        v13(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u18
                [3] = u16
                [4] = u14
                [5] = u8
                [6] = u20
            --]]
            if u19 then
                return nil
            end
            local v21 = u18:getValue()
            if not v21 then
                return nil
            end
            if u16 then
                return nil
            end
            if u14 then
                u8:Create(v21, TweenInfo.new(0.25), {
                    ["BackgroundTransparency"] = 0.75
                }):Play()
            else
                local v22 = {
                    ["BackgroundTransparency"] = u16 and 0.5 or 1
                }
                u8:Create(v21, TweenInfo.new(0.25), v22):Play()
            end
            u20(false)
        end, { u14 })
        local v23 = {
            ["Selectable"] = true,
            ["AutoButtonColor"] = false,
            ["Size"] = UDim2.new(0, 70, 1, 0),
            ["BackgroundColor3"] = u3.BLACK
        }
        local v24
        if u16 then
            v24 = 0.5
        else
            local v25 = u10.InActiveBackgroundTransparency
            v24 = v25 == nil and 1 or v25
        end
        v23.BackgroundTransparency = v24
        v23.BorderSizePixel = 0
        v23[u6.Event.Activated] = function() --[[ Line: 64 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.OnClick()
        end
        v23[u6.Event.MouseEnter] = function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15(true)
        end
        v23[u6.Event.MouseLeave] = function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15(false)
        end
        v23[u6.Ref] = u18
        local v26 = u10.ImageButtonProps
        if v26 then
            for v27, v28 in v26 do
                v23[v27] = v28
            end
        end
        local v29 = {}
        local _ = #v29
        local v30 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v31 = { u6.createElement(u5, {
                ["Padding"] = {
                    ["Top"] = 8,
                    ["Bottom"] = 6,
                    ["Left"] = 4,
                    ["Right"] = 4
                }
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 0.1)
            }) }
        local v32 = #v31
        local v33
        if u10.Icon == nil then
            v33 = false
        else
            v33 = u6.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["ImageTransparency"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.4),
                ["Image"] = u10.Icon,
                ["ImageColor3"] = u10.ThemeColor or u9.textPrimary
            })
        end
        if v33 then
            v31[v32 + 1] = v33
        end
        local v34 = #v31
        local v35 = {}
        local v36 = UDim2
        local v37 = u10.Icon
        v35.Size = v36.fromScale(0.9, (v37 == "" or not v37) and 0.55 or 0.5)
        v35.Text = u10.Text
        v35.TextColor3 = u10.ThemeColor or u9.textPrimary
        v35.TextScaled = true
        v35.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v35.TextTransparency = 0
        v35.TextXAlignment = "Center"
        v35.BackgroundTransparency = 1
        v31[v34 + 1] = u6.createElement("TextLabel", v35, { u6.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        local v38 = u10.SubText ~= nil
        if v38 then
            local v39 = {}
            local v40 = UDim2
            local v41 = u10.Icon
            v39.Size = v40.fromScale(0.9, (v41 == "" or not v41) and 0.45 or 0.3)
            v39.Text = u10.SubText
            v39.TextColor3 = Color3.fromRGB(255, 255, 255)
            v39.TextScaled = true
            v39.FontFace = Font.fromName("Roboto", Enum.FontWeight.SemiBold)
            v39.TextTransparency = 0.3
            v39.TextXAlignment = "Center"
            v39.BackgroundTransparency = 1
            v38 = u6.createElement("TextLabel", v39, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        end
        if v38 then
            v31[v34 + 2] = v38
        end
        v29.ButtonContent = u6.createElement(u4, v30, v31)
        v29.BottomBorder = u6.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, 2),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u10.ThemeColor or u9.textPrimary,
            ["Transparency"] = u16 and 0 or 1
        })
        return u6.createElement("ImageButton", v23, v29)
    end)
}