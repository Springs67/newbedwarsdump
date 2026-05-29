local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u7 = {
    ["time"] = {
        ["color"] = v6.mcRed,
        ["icon"] = v5.HUD_TIMER_ICON,
        ["textColor"] = v2.WHITE
    },
    ["bids"] = {
        ["color"] = v6.mcYellow,
        ["textColor"] = v2.BLACK
    },
    ["outbid"] = {
        ["color"] = v6.mcRed,
        ["textColor"] = v2.WHITE
    },
    ["bidding"] = {
        ["color"] = v2.darken(v6.mcGreen, 0.8),
        ["textColor"] = v2.WHITE
    }
}
return {
    ["ClanAuctionItemTagBanner"] = v4.new(u3)(function(p8) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
        --]]
        local v9 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundColor3"] = u7[p8.Type].color,
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["LayoutOrder"] = p8.LayoutOrder
        }
        local v10 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 2)
            }), u3.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 1),
                ["PaddingBottom"] = UDim.new(0, 1),
                ["PaddingLeft"] = UDim.new(0, 4),
                ["PaddingRight"] = UDim.new(0, 4)
            }) }
        local v11 = #v10
        local v12
        if u7[p8.Type].icon == nil then
            v12 = false
        else
            v12 = u3.createElement("ImageLabel", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["Image"] = u7[p8.Type].icon,
                ["Size"] = UDim2.fromOffset(14, 14),
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u3.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        if v12 then
            v10[v11 + 1] = v12
        end
        v10[#v10 + 1] = u3.createElement("TextLabel", {
            ["LayoutOrder"] = 2,
            ["TextSize"] = 12,
            ["TextWrapped"] = true,
            ["BackgroundTransparency"] = 1,
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["Text"] = p8.Text,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            ["TextColor3"] = u7[p8.Type].textColor
        })
        return u3.createFragment({
            ["ClanAuctionItemTagBanner"] = u3.createElement("Frame", v9, v10)
        })
    end)
}