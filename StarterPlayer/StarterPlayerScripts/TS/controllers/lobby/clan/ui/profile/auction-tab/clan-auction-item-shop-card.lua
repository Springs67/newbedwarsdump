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
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "clan-auction-item-tag-banner").ClanAuctionItemTagBanner
return {
    ["ClanAuctionItemShopCard"] = v8.new(u7)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u14
            [3] = u4
            [4] = u5
            [5] = u9
            [6] = u12
            [7] = u3
            [8] = u13
            [9] = u11
            [10] = u6
            [11] = u10
        --]]
        local v17 = p16.useMemo
        local v18 = v17(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            return u15.ActiveAuctionItemId == u15.AuctionItem.id
        end, { u15.ActiveAuctionItemId, u15.AuctionItem })
        local v23 = v17(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            local v19 = nil
            for v20, v21 in u15.AuctionItem.winningBids do
                local _ = v20 - 1
                local v22
                if v21.bidderId.kind == "Player" and (u15.BidderUserId ~= nil and v21.bidderId.id == u15.BidderUserId) then
                    v22 = true
                elseif v21.bidderId.kind == "Clan" and u15.MyClanId ~= nil then
                    v22 = v21.bidderId.id == u15.MyClanId
                else
                    v22 = false
                end
                if v22 == true then
                    return v21
                end
            end
            return v19
        end, { u15.AuctionItem, u15.MyClanId, u15.BidderUserId })
        local v24 = {}
        for v25, v26 in u15 do
            v24[v25] = v26
        end
        local v27 = u15.Size
        v24.Size = nil
        v24.AuctionItem = nil
        v24.ActiveAuctionItemId = nil
        v24.SetActiveAuctionItemId = nil
        v24.MyClanId = nil
        v24.BidderUserId = nil
        v24.IsOutbid = nil
        local v28 = {
            ["Size"] = v27,
            ["ImageTransparency"] = 1,
            ["BackgroundTransparency"] = 1,
            [u7.Event.Activated] = function() --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15.SetActiveAuctionItemId(u15.AuctionItem.id)
            end
        }
        local v29 = {}
        local v30 = #v29
        local v31 = {}
        for v32, v33 in v24 do
            v31[v32] = v33
        end
        v31.Size = UDim2.new(1, -2, 1, -2)
        v31.AnchorPoint = Vector2.new(0.5, 0.5)
        v31.Position = UDim2.fromScale(0.5, 0.5)
        v31.ClipsDescendants = true
        local v34 = {}
        local v35 = #v34
        local v36 = {
            ["ZIndex"] = 1000,
            ["Size"] = UDim2.fromScale(1, 0.84)
        }
        local v37 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }), u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0)
            }) }
        local v38 = #v37
        local v39 = u15.IsOutbid
        if v39 then
            v39 = u7.createElement(u14, {
                ["Type"] = "outbid",
                ["LayoutOrder"] = 1,
                ["Text"] = "OUTBIDDED"
            })
        end
        if v39 then
            v37[v38 + 1] = v39
        end
        local v40 = #v37
        local v41
        if v23 == nil then
            v41 = false
        else
            v41 = u7.createElement(u14, {
                ["Type"] = "bidding",
                ["LayoutOrder"] = 1,
                ["Text"] = "BIDDING"
            })
        end
        if v41 then
            v37[v40 + 1] = v41
        end
        local v42 = #v37 + 1
        local v43 = u7.createElement
        local v44 = u14
        local v45 = {
            ["Type"] = "bids",
            ["LayoutOrder"] = 2
        }
        local v46 = #u15.AuctionItem.winningBids
        local v47 = tostring(v46)
        local v48 = u15.AuctionItem.maxWinningBids
        v45.Text = v47 .. "/" .. tostring(v48)
        v37[v42] = v43(v44, v45)
        v34[v35 + 1] = u7.createElement(u4, v36, v37)
        v34[v35 + 2] = u7.createElement(u4, {
            ["Size"] = UDim2.fromScale(1, 0.84)
        }, { u7.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 1)
            }, { u7.createElement(u5, {
                    ["Padding"] = UDim.new(0.05, 0)
                }), u7.createElement(u9, {
                    ["Reward"] = u15.AuctionItem.definition.reward,
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
                ["Text"] = u12.getRewardName(u15.AuctionItem.definition.reward),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                ["TextColor3"] = u3.WHITE
            }, { u7.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = 10,
                    ["MaxTextSize"] = 18
                }) }) })
        v34[v35 + 3] = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        })
        if v18 then
            v18 = u7.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u13.mcGold
            })
        end
        if v18 then
            v34[v35 + 4] = v18
        end
        local v49 = #v34
        local v50 = {
            ["Size"] = UDim2.fromScale(1, 0.16),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = u3.WHITE
        }
        local v51 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }) }
        local v52 = #v51
        local v53 = {
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.new(1, -20, 1, 0),
            ["Position"] = UDim2.fromScale(0, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v54 = {}
        local v55 = u7.createElement("UIListLayout", {
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 2)
        })
        local v56 = u7.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 2),
            ["PaddingRight"] = UDim.new(0, 2)
        })
        local v57 = u7.createElement
        local v58 = u4
        local v59 = {
            ["LayoutOrder"] = 1
        }
        local v60
        if v23 == nil then
            v60 = UDim2.fromScale(1, 1)
        else
            v60 = UDim2.fromScale(0.5, 1)
        end
        v59.Size = v60
        __set_list(v54, 1, {v55, v56, v57(v58, v59, { u7.createElement("UIListLayout", {
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 1)
    }), u7.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromOffset(12, 12),
        ["Image"] = u11.MONEY_BILL_TREND_UP_SHARP_SOLID_FULL,
        ["ImageColor3"] = u13.mcGold
    }, { u7.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) }), u7.createElement("TextLabel", {
        ["LayoutOrder"] = 2,
        ["TextScaled"] = true,
        ["TextTransparency"] = 0.2,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, -13, 1, 0),
        ["Text"] = u6.formatNumberShorthand(u15.AuctionItem.currentBid),
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["TextYAlignment"] = Enum.TextYAlignment.Center,
        ["Font"] = Enum.Font.Roboto,
        ["TextColor3"] = u3.BLACK,
        ["TextTruncate"] = Enum.TextTruncate.AtEnd
    }, { u7.createElement("UITextSizeConstraint", {
            ["MinTextSize"] = 6,
            ["MaxTextSize"] = 22
        }) }) })})
        local v61 = #v54
        local v62
        if v23 == nil then
            v62 = false
        else
            v62 = u7.createElement(u4, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, { u7.createElement("UIListLayout", {
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 1)
                }), u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromOffset(12, 12),
                    ["Image"] = u11.SACK_DOLLAR_SOLID_FULL,
                    ["ImageColor3"] = u3.darken(u13.mcGreen, 0.8)
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }), u7.createElement("TextLabel", {
                    ["LayoutOrder"] = 2,
                    ["TextScaled"] = true,
                    ["TextTransparency"] = 0.2,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(1, -13, 1, 0),
                    ["Text"] = u6.formatNumberShorthand(v23.maxAmount),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["Font"] = Enum.Font.Roboto,
                    ["TextColor3"] = u3.BLACK,
                    ["TextTruncate"] = Enum.TextTruncate.AtEnd
                }, { u7.createElement("UITextSizeConstraint", {
                        ["MinTextSize"] = 6,
                        ["MaxTextSize"] = 22
                    }) }) })
        end
        if v62 then
            v54[v61 + 1] = v62
        end
        v51[v52 + 1] = u7.createElement(u4, v53, v54)
        v51[v52 + 2] = u7.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, -4, 1, -4),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Image"] = u10(u15.AuctionItem.definition.bidCurrency).icon
        }, { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v34[v49 + 1] = u7.createElement("Frame", v50, v51)
        v29[v30 + 1] = u7.createElement("Frame", v31, v34)
        return u7.createFragment({
            ["ClanAuctionItemShopCard"] = u7.createElement("ImageButton", v28, v29)
        })
    end)
}