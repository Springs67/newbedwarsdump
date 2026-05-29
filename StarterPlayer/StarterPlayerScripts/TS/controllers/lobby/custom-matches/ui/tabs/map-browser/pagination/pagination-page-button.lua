local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Padding
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["PaginationPageButton"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(u6, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
        --]]
        local _ = p7.useState
        local v8 = u5.createFragment
        local v9 = {}
        local v10 = u5.createElement
        local v11 = "TextButton"
        local v12 = {}
        local v13 = u6.Page
        v12.Text = tostring(v13)
        v12.Size = UDim2.new(0.125, 0, 1, 0)
        v12.TextColor3 = u3.WHITE
        v12.TextScaled = true
        v12.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
        local v14
        if u6.CurrentPage == u6.Page then
            v14 = Color3.fromRGB(94, 98, 186)
        else
            v14 = Color3.fromRGB(21, 21, 38)
        end
        v12.BackgroundColor3 = v14
        v12.BorderSizePixel = 0
        v12[u5.Event.Activated] = function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6.SetPage(u6.Page)
        end
        v12.LayoutOrder = u6.Page + 1
        v9.Page = v10(v11, v12, { u5.createElement(u4, {
                ["Padding"] = {
                    ["Horizontal"] = 6,
                    ["Vertical"] = 6
                }
            }), u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.2, 0)
            }), u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.75
            }) })
        return v8(v9)
    end)
}