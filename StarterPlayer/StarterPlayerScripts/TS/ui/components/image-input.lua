local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Empty
local u4 = v2.TextInputComponent
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["ImageInput"] = v6.new(u5)(function(u9, p10) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u5
            [3] = u8
            [4] = u4
            [5] = u3
        --]]
        local v11 = p10.useState
        local _ = p10.useValue
        local v12, u13 = v11("")
        local v14 = u9.StartingValue
        if v14 == nil then
            v14 = string.lower(v12)
        end
        local v15 = not u7.startsWith(v14, "rbxassetid://")
        if v15 then
            v15 = tonumber(v14)
        end
        if v15 ~= 0 and (v15 == v15 and v15) then
            v14 = "rbxassetid://" .. v14
        end
        local v16 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v17 = u9.ContainerProps
        if v17 then
            for v18, v19 in v17 do
                v16[v18] = v19
            end
        end
        local v20 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v21 = #v20
        local v22 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(0.5, 0, 0, 60),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Image"] = v14,
            ["ScaleType"] = Enum.ScaleType.Crop,
            ["BackgroundColor3"] = u8.backgroundTertiary
        }
        local v23 = { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }), u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local v24 = #v23
        local v25
        if v14 == "" then
            v25 = u5.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["Text"] = "NO IMAGE",
                ["TextTransparency"] = 0.1,
                ["TextSize"] = 12,
                ["Size"] = UDim2.new(1, 0, 0, 12),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextColor3"] = Color3.new(1, 1, 1),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            })
        else
            v25 = false
        end
        if v25 then
            v23[v24 + 1] = v25
        end
        v20[v21 + 1] = u5.createElement("ImageLabel", v22, v23)
        local v26 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.5, 0, 0, 46)
        }
        local v27 = {}
        local v28 = #v27
        local v29 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 12)
        }
        local v30 = u9.InputBoxLabel
        v29.Text = v30 == nil and "Image Asset Id" or v30
        v29.TextXAlignment = Enum.TextXAlignment.Left
        v29.TextColor3 = Color3.new(1, 1, 1)
        v29.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v29.TextTransparency = 0.1
        v29.TextSize = 12
        v27[v28 + 1] = u5.createElement("TextLabel", v29)
        local v31 = {}
        local v32 = {
            ["Position"] = UDim2.fromOffset(0, 18),
            ["Size"] = UDim2.new(1, 0, 0, 28)
        }
        local v33 = u9.StartingValue
        v32.Text = v33 == nil and "" or v33
        v32.PlaceholderText = "rbxassetid://12345"
        v32.ClearTextOnFocus = false
        v32.TextXAlignment = Enum.TextXAlignment.Left
        v31.TextBox = v32
        function v31.OnFocusLost(p34) --[[ Line: 120 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u13
            --]]
            u9.OnInput(p34)
            u13(p34)
        end
        v31.MaxCharacters = 30
        v27[v28 + 2] = u5.createElement(u4, v31, { u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) })
        v20[v21 + 2] = u5.createElement(u3, v26, v27)
        return u5.createFragment({
            ["ImageInputContainer"] = u5.createElement(u3, v16, v20)
        })
    end)
}