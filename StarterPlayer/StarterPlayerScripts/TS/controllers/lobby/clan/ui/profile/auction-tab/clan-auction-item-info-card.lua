local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.ColorUtil
local u5 = v2.Countdown
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent, "clan-auction-item-info-card-pill").ClanAuctionInfoCardPill
return {
    ["ClanAuctionItemInfoCard"] = v11.new(u10)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u6
            [3] = u9
            [4] = u10
            [5] = u8
            [6] = u7
            [7] = u12
            [8] = u16
            [9] = u4
            [10] = u15
            [11] = u5
            [12] = u18
            [13] = u17
            [14] = u13
            [15] = u3
        --]]
        local v21 = p20.useState
        local u22 = not u19.AuctionItem and 0 or u19.AuctionItem.currentBid
        local u23, u24 = v21("")
        local v25 = u19.AuctionItem
        if v25 ~= nil then
            v25 = nil
            for v26, v27 in v25.winningBids do
                local _ = v26 - 1
                local v28
                if v27.bidderId.kind == "Player" and (u19.BidderUserId ~= nil and v27.bidderId.id == u19.BidderUserId) then
                    v28 = true
                elseif v27.bidderId.kind == "Clan" and u19.MyClanId ~= nil then
                    v28 = v27.bidderId.id == u19.MyClanId
                else
                    v28 = false
                end
                if v28 == true then
                    v25 = v27
                    break
                end
            end
        end
        local function u33() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u23
                [3] = u22
                [4] = u14
                [5] = u6
                [6] = u9
            --]]
            if not u19.AuctionItem then
                return nil
            end
            local v29
            if #u23 == 0 then
                local v30 = u22
                v29 = tostring(v30)
            else
                v29 = u23
            end
            local v31 = tonumber(v29)
            if v31 == nil then
                return nil
            end
            local v32
            if u19.AuctionItem.auctionType == u14.Clan then
                if u19.MyClanId == nil then
                    return nil
                end
                v32 = {
                    ["kind"] = "Clan",
                    ["id"] = u19.MyClanId
                }
            else
                if u19.BidderUserId == nil then
                    return nil
                end
                v32 = {
                    ["kind"] = "Player",
                    ["id"] = u19.BidderUserId
                }
            end
            if u6.isHoarceKat() then
                print("Placing bid for " .. u19.AuctionItem.id .. " with max bid " .. tostring(v31))
                return nil
            end
            u9.Controllers.AuctionController:openBidModal(u19.AuctionItem.id, v31, v32)
        end
        local v34 = {}
        for v35, v36 in u19 do
            v34[v35] = v36
        end
        v34.Auction = nil
        v34.AuctionItem = nil
        v34.MyClanId = nil
        v34.BidderUserId = nil
        local v37 = {}
        for v38, v39 in v34 do
            v37[v38] = v39
        end
        local v40 = u19.AuctionItem
        if v40 then
            local v41 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v42 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 4)
                }), u10.createElement(u8, {
                    ["Padding"] = UDim.new(0.04, 0)
                }), u10.createElement(u7, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.6)
                }, { u10.createElement(u8, {
                        ["Padding"] = UDim.new(0.05, 0)
                    }), u10.createElement(u12, {
                        ["Reward"] = u19.AuctionItem.definition.reward,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                    }, { u10.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }), u10.createElement("TextLabel", {
                            ["ZIndex"] = 10,
                            ["TextScaled"] = true,
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(1, 0.25),
                            ["Position"] = UDim2.fromScale(0.5, 1),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.8),
                            ["Text"] = u16.getRewardName(u19.AuctionItem.definition.reward),
                            ["TextColor3"] = u4.WHITE,
                            ["TextXAlignment"] = Enum.TextXAlignment.Center,
                            ["TextYAlignment"] = Enum.TextYAlignment.Center,
                            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                        }, { u10.createElement("UITextSizeConstraint", {
                                ["MinTextSize"] = 10,
                                ["MaxTextSize"] = 28
                            }) }) }) }) }
            local v43 = #v42
            local v44 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 15)
            }
            local v45 = {}
            local v46 = #v45
            local v47 = {
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v48 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 4)
                }), u10.createElement("ImageLabel", {
                    ["LayoutOrder"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u15.HUD_TIMER_ICON,
                    ["Size"] = UDim2.fromOffset(14, 14),
                    ["ScaleType"] = Enum.ScaleType.Fit
                }) }
            local v49 = #v48
            local v50 = u19.Auction
            if v50 then
                v50 = u10.createElement(u5, {
                    ["EndTime"] = u19.Auction.endEpochTime,
                    ["CountdownConfig"] = {
                        ["days"] = true,
                        ["hours"] = true,
                        ["seperator"] = ":"
                    },
                    ["TextLabel"] = {
                        ["TextScaled"] = true,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }
                })
            end
            if v50 then
                v48[v49 + 1] = v50
            end
            v45[v46 + 1] = u10.createElement(u7, v47, v48)
            local v51 = v46 + 2
            local v52 = u10.createElement
            local v53 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5)
            }
            local v54 = #u19.AuctionItem.winningBids
            local v55 = tostring(v54)
            local v56 = u19.AuctionItem.maxWinningBids
            v53.Text = v55 .. "/" .. tostring(v56) .. " Bids"
            v53.TextColor3 = u4.WHITE
            v53.TextXAlignment = Enum.TextXAlignment.Right
            v53.TextYAlignment = Enum.TextYAlignment.Center
            v53.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            v45[v51] = v52("TextLabel", v53)
            v42[v43 + 1] = u10.createElement(u7, v44, v45)
            v42[v43 + 2] = u10.createElement(u18, {
                ["BorderSizePixel"] = 0,
                ["Text"] = "Current Bid",
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 0.075),
                ["BackgroundColor3"] = u17.backgroundSecondary,
                ["Icon"] = {
                    ["image"] = u15.MONEY_BILL_TREND_UP_SHARP_SOLID_FULL,
                    ["color"] = u17.mcGold
                },
                ["Amount"] = u19.AuctionItem.currentBid,
                ["CurrencyIcon"] = u13(u19.AuctionItem.definition.bidCurrency).icon
            })
            local v57
            if v25 == nil then
                v57 = false
            else
                v57 = u10.createElement(u18, {
                    ["BorderSizePixel"] = 0,
                    ["Text"] = "Your Max Bid",
                    ["LayoutOrder"] = 4,
                    ["Size"] = UDim2.fromScale(1, 0.075),
                    ["BackgroundColor3"] = u17.backgroundSecondary,
                    ["Icon"] = {
                        ["image"] = u15.SACK_DOLLAR_SOLID_FULL,
                        ["color"] = u4.darken(u17.mcGreen, 0.8)
                    },
                    ["Amount"] = v25.maxAmount,
                    ["CurrencyIcon"] = u13(u19.AuctionItem.definition.bidCurrency).icon
                })
            end
            if v57 then
                v42[v43 + 3] = v57
            end
            local v58 = #v42
            v42[v58 + 1] = u10.createElement("Frame", {
                ["LayoutOrder"] = 6,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 3),
                ["BackgroundColor3"] = u17.backgroundSecondary
            }, { u10.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) })
            v42[v58 + 2] = u10.createElement("TextLabel", {
                ["Text"] = "Max Bid",
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 7,
                ["Size"] = UDim2.fromScale(1, 0.045),
                ["TextColor3"] = u4.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            })
            local v59 = v58 + 3
            local v60 = u10.createElement
            local v61 = u7
            local v62 = {
                ["LayoutOrder"] = 8,
                ["Size"] = UDim2.fromScale(1, 0.075)
            }
            local v63 = {}
            local v64 = u10.createElement("UIListLayout", {
                ["HorizontalFlex"] = "SpaceBetween",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            })
            local v65 = u10.createElement
            local v66 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(0.7, -2, 1, 0),
                ["BackgroundColor3"] = u17.backgroundTertiary
            }
            local v67 = {}
            local v68 = u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2),
                ["PaddingBottom"] = UDim.new(0, 2),
                ["PaddingLeft"] = UDim.new(0, 4)
            })
            local v69 = u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            })
            local v70 = u10.createElement
            local v71 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["Text"] = ""
            }
            local v72 = u19.AuctionItem.currentBid
            v71.PlaceholderText = "DEFAULT BID: " .. tostring(v72)
            v71.PlaceholderColor3 = Color3.fromRGB(166, 166, 186)
            v71.ClearTextOnFocus = false
            v71.TextColor3 = u4.WHITE
            v71.TextScaled = true
            v71.TextXAlignment = Enum.TextXAlignment.Left
            v71.TextYAlignment = Enum.TextYAlignment.Center
            v71.BackgroundTransparency = 1
            v71.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            v71[u10.Change.Text] = function(p73) --[[ Line: 290 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24(p73.Text)
            end
            __set_list(v67, 1, {v68, v69, v70("TextBox", v71)})
            __set_list(v63, 1, {v64, v65("Frame", v66, v67), u10.createElement(u3, {
    ["Text"] = "BID",
    ["Size"] = UDim2.new(0.3, -2, 1, 0),
    ["TextLabel"] = {
        ["TextScaled"] = true,
        ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    },
    ["BackgroundColor3"] = u17.backgroundSuccess,
    ["OnClick"] = function() --[[ Name: OnClick, Line 303 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33()
    end
})})
            v42[v59] = v60(v61, v62, v63)
            v40 = u10.createElement(u7, v41, v42)
        end
        local v74 = {}
        local v75 = #v74
        if v40 then
            v74[v75 + 1] = v40
        end
        return u10.createFragment({
            ["ClanAuctionItemInfoCard"] = u10.createElement("Frame", v37, v74)
        })
    end)
}