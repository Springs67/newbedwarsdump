local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, script.Parent, "clan-auction-item-tag-banner").ClanAuctionItemTagBanner
return {
    ["ClanAuctionCompletedItemShopCard"] = v8.new(u7)(function(p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u13
            [4] = u5
            [5] = u9
            [6] = u11
            [7] = u3
            [8] = u12
            [9] = u6
            [10] = u10
        --]]
        local v15 = {}
        for v16, v17 in p14 do
            v15[v16] = v17
        end
        local v18 = p14.Size
        local v19 = os.date("!%x", p14.WinningAuctionBid.auctionEndTime)
        v15.Size = nil
        v15.WinningAuctionBid = nil
        local v20 = {}
        local v21 = #v20
        local v22 = {}
        local v23 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = v18
        }
        for v24, v25 in v15 do
            v22[v24] = v25
        end
        v22.Size = UDim2.new(1, -2, 1, -2)
        v22.AnchorPoint = Vector2.new(0.5, 0.5)
        v22.Position = UDim2.fromScale(0.5, 0.5)
        v22.ClipsDescendants = true
        local v26 = v21 + 1
        local v27 = u7.createElement
        local v28 = {}
        local v29 = u7.createElement
        local v30 = u4
        local v31 = {
            ["ZIndex"] = 1000,
            ["Size"] = UDim2.fromScale(1, 0.84)
        }
        local v32 = {}
        local v33 = u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v34 = u7.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0)
        })
        local v35 = u7.createElement(u13, {
            ["Type"] = "time",
            ["LayoutOrder"] = 1,
            ["Text"] = "Ended " .. v19
        })
        local v36 = u7.createElement
        local v37 = u13
        local v38 = {
            ["Type"] = "bids",
            ["LayoutOrder"] = 2
        }
        local v39 = p14.WinningAuctionBid.numberOfWinningBids
        v38.Text = tostring(v39) .. " Won"
        __set_list(v32, 1, {v33, v34, v35, v36(v37, v38)})
        __set_list(v28, 1, {v29(v30, v31, v32), u7.createElement(u4, {
    ["Size"] = UDim2.fromScale(1, 0.84)
}, { u7.createElement(u4, {
        ["Size"] = UDim2.fromScale(1, 1)
    }, { u7.createElement(u5, {
            ["Padding"] = UDim.new(0.05, 0)
        }), u7.createElement(u9, {
            ["Reward"] = p14.WinningAuctionBid.reward,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }) }), u7.createElement("TextLabel", {
        ["TextScaled"] = true,
        ["TextWrapped"] = true,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.25),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Text"] = u11.getRewardName(p14.WinningAuctionBid.reward),
        ["TextXAlignment"] = Enum.TextXAlignment.Center,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        ["TextColor3"] = u3.WHITE
    }, { u7.createElement("UITextSizeConstraint", {
            ["MinTextSize"] = 10,
            ["MaxTextSize"] = 18
        }) }) }), u7.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(0, 3)
}), u7.createElement("Frame", {
    ["BorderSizePixel"] = 0,
    ["Size"] = UDim2.fromScale(1, 0.18),
    ["AnchorPoint"] = Vector2.new(0.5, 1),
    ["Position"] = UDim2.fromScale(0.5, 1),
    ["BackgroundColor3"] = u12.backgroundPrimary
}, {
    u7.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 3)
    }),
    u7.createElement("UIPadding", {
        ["PaddingLeft"] = UDim.new(0, 6),
        ["PaddingRight"] = UDim.new(0, 6),
        ["PaddingTop"] = UDim.new(0, 3),
        ["PaddingBottom"] = UDim.new(0, 3)
    }),
    u7.createElement("TextLabel", {
        ["Text"] = "Sold For",
        ["TextScaled"] = true,
        ["TextTransparency"] = 0.1,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.3, 1),
        ["Position"] = UDim2.fromScale(0, 0.5),
        ["AnchorPoint"] = Vector2.new(0, 0.5),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        ["TextColor3"] = u3.WHITE
    }),
    u7.createElement(u4, {
        ["Size"] = UDim2.fromScale(0.7, 1),
        ["Position"] = UDim2.fromScale(1, 0.5),
        ["AnchorPoint"] = Vector2.new(1, 0.5)
    }, { u7.createElement("UIListLayout", {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 4)
        }), u7.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, -18, 1, 0),
            ["Text"] = u6.formatNumberWithCommas(p14.WinningAuctionBid.winningBidAmount),
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            ["TextColor3"] = u3.WHITE
        }), u7.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromOffset(14, 14),
            ["Image"] = u10(p14.WinningAuctionBid.currency).icon
        }) })
})})
        v20[v26] = v27("Frame", v22, v28)
        return u7.createFragment({
            ["ClanAuctionCompletedItemShopCard"] = u7.createElement("Frame", v23, v20)
        })
    end)
}