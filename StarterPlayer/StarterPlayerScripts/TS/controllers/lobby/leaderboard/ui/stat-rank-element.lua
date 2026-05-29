local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["StatRankElement"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
        --]]
        local _ = p5.useState
        local v6 = {
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["LayoutOrder"] = p4.LayoutOrder
        }
        local v7 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v8 = #v7
        local v9
        if p4.StatRank.image == nil then
            v9 = false
        else
            v9 = u3.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(0, 24, 0, 24),
                ["Image"] = p4.StatRank.image
            })
        end
        if v9 then
            v7[v8 + 1] = v9
        end
        v7[#v7 + 1] = u3.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextSize"] = 14,
            ["LayoutOrder"] = 1,
            ["Text"] = p4.StatRank.rankName,
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
        return u3.createElement(u2, v6, v7)
    end)
}