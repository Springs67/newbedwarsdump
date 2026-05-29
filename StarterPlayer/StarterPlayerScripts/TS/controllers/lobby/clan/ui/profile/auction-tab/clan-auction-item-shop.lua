local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.Countdown
local u6 = v2.DropdownComponent
local u7 = v2.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u14 = v1.import(script, script.Parent, "clan-auction-completed-item-shop-card").ClanAuctionCompletedItemShopCard
local u15 = v1.import(script, script.Parent, "clan-auction-item-shop-card").ClanAuctionItemShopCard
local u16 = {
    {
        ["text"] = "Price Ascending",
        ["value"] = "PRICE_ASC"
    },
    {
        ["text"] = "Price Descending",
        ["value"] = "PRICE_DESC"
    }
}
local function u30(p17, u18) --[[ Line: 27 ]]
    local u19 = {}
    if p17 ~= nil then
        local function v27(p20) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u19
            --]]
            local v21 = p20.AuctionId
            local v22
            if v21 == "" or not v21 then
                v22 = nil
            else
                v22 = u18
                if v22 ~= nil then
                    v22 = v22[p20.AuctionId]
                end
            end
            local v23 = p20.AuctionItemIds
            if v23 == nil then
                if v22 ~= nil then
                    v22 = v22.activeItemsIds
                end
                v23 = v22 == nil and {} or v22
            end
            for v24, v25 in v23 do
                local _ = v24 - 1
                local v26 = u19
                table.insert(v26, v25)
            end
        end
        for v28, v29 in p17 do
            v27(v29, v28, p17)
        end
    end
    return u19
end
local function u42(p31, u32) --[[ Line: 70 ]]
    local u33 = {}
    if p31 == nil then
        return u33
    end
    local function v39(p34) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u33
        --]]
        if p34.AuctionId == nil then
            return nil
        end
        local v35 = u32
        if v35 ~= nil then
            v35 = v35[p34.AuctionId]
        end
        local v36 = p34.AuctionItemIds
        if v36 == nil then
            if v35 ~= nil then
                v35 = v35.activeItemsIds
            end
            v36 = v35 == nil and {} or v35
        end
        local v37 = {
            ["Name"] = p34.Name,
            ["AuctionId"] = p34.AuctionId,
            ["AuctionItemIds"] = v36,
            ["OutbidAuctionItemIds"] = p34.OutbidAuctionItemIds or {}
        }
        local v38 = u33
        table.insert(v38, v37)
    end
    for v40, v41 in p31 do
        v39(v41, v40, p31)
    end
    return u33
end
local function u52(p43, u44, u45) --[[ Line: 111 ]]
    local v46 = {}
    local v47 = #v46
    table.move(p43, 1, #p43, v47 + 1, v46)
    table.sort(v46, function(p48, p49) --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u45
        --]]
        local v50 = u44[p48]
        local v51 = u44[p49]
        if v50 == nil or v51 == nil then
            return false
        elseif u45 == "PRICE_ASC" then
            return v50.currentBid < v51.currentBid
        else
            return v50.currentBid > v51.currentBid
        end
    end)
    return v46
end
local function u59(p53, u54) --[[ Line: 131 ]]
    local v55 = {}
    local v56 = #v55
    table.move(p53, 1, #p53, v56 + 1, v55)
    table.sort(v55, function(p57, p58) --[[ Line: 136 ]]
        --[[
        Upvalues:
            [1] = u54
        --]]
        if u54 == "PRICE_ASC" then
            return p57.winningBidAmount < p58.winningBidAmount
        else
            return p57.winningBidAmount > p58.winningBidAmount
        end
    end)
    return v55
end
return {
    ["ClanAuctionItemShop"] = v9.new(u8)(function(u60, p61) --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u12
            [3] = u42
            [4] = u52
            [5] = u59
            [6] = u8
            [7] = u10
            [8] = u13
            [9] = u16
            [10] = u6
            [11] = u7
            [12] = u4
            [13] = u14
            [14] = u11
            [15] = u5
            [16] = u15
            [17] = u3
        --]]
        local v62 = p61.useState
        local v63 = p61.useEffect
        local v64 = p61.useMemo
        local u65, u66 = v62("")
        local u67, u68 = v62("PRICE_ASC")
        local u73 = v64(function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u60
            --]]
            local v69 = {}
            local v70 = u60.Auctions
            if v70 ~= nil then
                for v71, v72 in v70 do
                    local _ = v71 - 1
                    v69[v72.id] = v72
                end
            end
            return v69
        end, { u60.Auctions })
        local v89 = v64(function() --[[ Line: 164 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u30
                [3] = u73
                [4] = u12
            --]]
            local u74 = {}
            local v75 = u60.AuctionGroups
            local function v86(p76) --[[ Line: 167 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u73
                    [3] = u60
                    [4] = u12
                    [5] = u74
                --]]
                for v77, v78 in u30(p76.Kind.ActiveAuctions, u73) do
                    local _ = v77 - 1
                    local v79 = u60.AuctionItems[v78]
                    if v79 ~= nil then
                        local v80 = {
                            ["key"] = u12.getRewardName(v79.definition.reward)
                        }
                        local v81 = u74
                        table.insert(v81, v80)
                    end
                end
                for v82, v83 in p76.Kind.PastAuctions or {} do
                    local _ = v82 - 1
                    local v84 = {
                        ["key"] = u12.getRewardName(v83.reward)
                    }
                    local v85 = u74
                    table.insert(v85, v84)
                end
            end
            for v87, v88 in v75 do
                v86(v88, v87 - 1, v75)
            end
            return u74
        end, { u60.AuctionGroups, u60.AuctionItems, u73 })
        local u90, u91 = v62(nil)
        local u128 = v64(function() --[[ Line: 201 ]]
            --[[
            Upvalues:
                [1] = u65
                [2] = u60
                [3] = u42
                [4] = u73
                [5] = u90
                [6] = u12
                [7] = u52
                [8] = u67
                [9] = u59
            --]]
            local u92 = #u65 > 0
            local v93 = u60.AuctionGroups
            local function v122(p94) --[[ Line: 204 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u73
                    [3] = u60
                    [4] = u92
                    [5] = u90
                    [6] = u12
                    [7] = u52
                    [8] = u67
                    [9] = u59
                --]]
                local v95 = u42(p94.Kind.ActiveAuctions, u73)
                local function v107(p96) --[[ Line: 206 ]]
                    --[[
                    Upvalues:
                        [1] = u60
                        [2] = u92
                        [3] = u90
                        [4] = u12
                        [5] = u52
                        [6] = u67
                    --]]
                    local v97 = 0
                    local v98 = {}
                    for v99, v100 in p96.AuctionItemIds do
                        local _ = v99 - 1
                        local v101 = u60.AuctionItems[v100]
                        local v102
                        if v101 == nil then
                            v102 = false
                        elseif u92 and u90 ~= nil then
                            local v103 = u12.getRewardName(v101.definition.reward)
                            v102 = table.find(u90, v103) ~= nil
                        else
                            v102 = true
                        end
                        if v102 == true then
                            v97 = v97 + 1
                            v98[v97] = v100
                        end
                    end
                    if #v98 == 0 then
                        return nil
                    end
                    local v104 = {}
                    for v105, v106 in p96 do
                        v104[v105] = v106
                    end
                    v104.AuctionItemIds = u52(v98, u60.AuctionItems, u67)
                    return v104
                end
                local v108 = 0
                local v109 = {}
                for v110, v111 in v95 do
                    local v112 = v107(v111, v110 - 1, v95)
                    if v112 ~= nil then
                        v108 = v108 + 1
                        v109[v108] = v112
                    end
                end
                local v113 = 0
                local v114 = {}
                for v115, v116 in p94.Kind.PastAuctions or {} do
                    local _ = v115 - 1
                    local v117
                    if u92 and u90 ~= nil then
                        local v118 = u12.getRewardName(v116.reward)
                        v117 = table.find(u90, v118) ~= nil
                    else
                        v117 = true
                    end
                    if v117 == true then
                        v113 = v113 + 1
                        v114[v113] = v116
                    end
                end
                local v119 = {}
                for v120, v121 in p94 do
                    v119[v120] = v121
                end
                v119.DisplayedActiveAuctionGroups = v109
                v119.DisplayedPastAuctions = u59(v114, u67)
                return v119
            end
            local v123 = 0
            local v124 = {}
            for v125, v126 in v93 do
                local v127 = v122(v126, v125 - 1, v93)
                if v127 ~= nil then
                    v123 = v123 + 1
                    v124[v123] = v127
                end
            end
            return v124
        end, {
            u65,
            u67,
            u60.AuctionGroups,
            u60.AuctionItems,
            u73,
            u90
        })
        local u142 = v64(function() --[[ Line: 294 ]]
            --[[
            Upvalues:
                [1] = u128
            --]]
            local u129 = {}
            local function v139(p130) --[[ Line: 296 ]]
                --[[
                Upvalues:
                    [1] = u129
                --]]
                local v131 = p130.DisplayedActiveAuctionGroups
                local function v136(p132) --[[ Line: 298 ]]
                    --[[
                    Upvalues:
                        [1] = u129
                    --]]
                    for v133, v134 in p132.AuctionItemIds do
                        local _ = v133 - 1
                        local v135 = u129
                        table.insert(v135, v134)
                        local _ = #u129
                    end
                end
                for v137, v138 in v131 do
                    v136(v138, v137 - 1, v131)
                end
            end
            for v140, v141 in u128 do
                v139(v141, v140 - 1, u128)
            end
            return u129
        end, { u128 })
        local v151 = v64(function() --[[ Line: 318 ]]
            --[[
            Upvalues:
                [1] = u128
            --]]
            local u143 = 0
            local function v147(p144) --[[ Line: 320 ]]
                --[[
                Upvalues:
                    [1] = u143
                --]]
                for v145, v146 in p144.DisplayedActiveAuctionGroups do
                    local _ = v145 - 1
                    u143 = u143 + #v146.AuctionItemIds
                end
                u143 = u143 + #p144.DisplayedPastAuctions
            end
            local v148 = u143
            for v149, v150 in u128 do
                v147(v150, v149 - 1, u128)
            end
            return v148
        end, { u128 })
        v63(function() --[[ Line: 335 ]]
            --[[
            Upvalues:
                [1] = u142
                [2] = u60
            --]]
            if #u142 == 0 then
                return nil
            end
            local v152 = u60.ActiveAuctionItemId ~= nil
            if v152 then
                local v153 = u60.ActiveAuctionItemId
                v152 = table.find(u142, v153) ~= nil
            end
            if v152 then
                return nil
            end
            u60.SetActiveAuctionItemId(u142[1])
        end, { u142, u60.ActiveAuctionItemId, u60.SetActiveAuctionItemId })
        local v154 = {}
        local function v157(p155, p156) --[[ Line: 349 ]]
            --[[
            Upvalues:
                [1] = u66
                [2] = u91
            --]]
            u66(p155)
            if p155 == "" then
                u91(nil)
                return nil
            end
            u91(p156)
        end
        for v158, v159 in u60 do
            v154[v158] = v159
        end
        v154.AuctionGroups = nil
        v154.ActiveAuctionItemId = nil
        v154.SetActiveAuctionItemId = nil
        v154.MyClanId = nil
        v154.BidderUserId = nil
        v154.Auctions = nil
        v154.AuctionItems = nil
        local v160 = {}
        for v161, v162 in v154 do
            v160[v161] = v162
        end
        local v163 = { u8.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0, 6)
            }) }
        local v164 = #v163
        local v165 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v166 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["Padding"] = UDim.new(0, 6),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local _ = #v166
        local v167 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 47)
        }
        local v168 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 2)
            }) }
        local v169 = #v168
        local v170 = {
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 2,
            ["Size"] = UDim2.new(1, 0, 0, 25)
        }
        local v171 = { u8.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0, 6)
            }), u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceBetween,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }), u8.createElement(u10, {
                ["BackgroundTransparency"] = 0,
                ["PlaceHolderText"] = "Search Bids",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(0.65, 0, 1, 0),
                ["BackgroundColor3"] = u13.backgroundTertiary,
                ["Items"] = v89,
                ["InputText"] = u65,
                ["OnTextChange"] = v157
            }) }
        local v172 = #v171
        local v173 = {
            ["ButtonTransparency"] = 0,
            ["Size"] = UDim2.new(0.35, 0, 1, 0),
            ["ButtonColor"] = u13.backgroundTertiary,
            ["CornerRadius"] = UDim.new(0, 3)
        }
        local v174 = nil
        for v175, v176 in u16 do
            local _ = v175 - 1
            if v176.value == u67 == true then
                v174 = v176
                break
            end
        end
        if v174 == nil then
            v174 = u16[1]
        end
        v173.DefaultItem = v174
        v173.Items = u16
        function v173.OnItemSelected(p177) --[[ Line: 457 ]]
            --[[
            Upvalues:
                [1] = u68
            --]]
            return u68((tostring(p177)))
        end
        v173.LayoutOrder = 2
        v173.ZIndex = 20
        v171[v172 + 1] = u8.createElement(u6, v173)
        v168[v169 + 1] = u8.createElement(u7, v170, v171)
        v168.InfoBar = u8.createElement(u7, {
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 20)
        }, { u8.createElement(u7, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = Enum.AutomaticSize.X
            }, { u8.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 3),
                    ["PaddingBottom"] = UDim.new(0, 3)
                }), u8.createElement("TextLabel", {
                    ["TextTransparency"] = 0.5,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["Text"] = tostring(v151) .. " Result" .. (v151 == 1 and "" or "s"),
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                }) }) })
        v166.SearchContainer = u8.createElement(u7, v167, v168)
        local function v255(p178, u179) --[[ Line: 494 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
                [3] = u7
                [4] = u4
                [5] = u14
                [6] = u73
                [7] = u11
                [8] = u5
                [9] = u60
                [10] = u15
            --]]
            local v180 = {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }
            local v181 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v182 = #v181
            local v183 = {
                ["Size"] = UDim2.new(1, 0, 0, u179 == 0 and 20 or 28),
                ["LayoutOrder"] = u179
            }
            local v184 = { u8.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }) }
            local v185 = #v184
            local v186
            if u179 == 0 then
                v186 = false
            else
                v186 = u8.createFragment({ u8.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0, 4),
                        ["BackgroundColor3"] = u13.backgroundPrimary
                    }, { u8.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(1, 0)
                        }) }), u8.createElement(u7, {
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.new(1, 0, 0, 4)
                    }) })
            end
            if v186 then
                v184[v185 + 1] = v186
            end
            local v187 = #v184
            local v188 = p178.Name ~= nil
            if v188 then
                local v189 = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.new(1, 0, 0, 20)
                }
                local v190 = {}
                local v191 = #v190
                local v192
                if p178.Name == nil then
                    v192 = false
                else
                    v192 = u8.createElement("TextLabel", {
                        ["LayoutOrder"] = 1,
                        ["TextTransparency"] = 0.15,
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["Position"] = UDim2.fromScale(0, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["Text"] = p178.Name,
                        ["TextColor3"] = u4.WHITE,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
                    })
                end
                if v192 then
                    v190[v191 + 1] = v192
                end
                v188 = u8.createElement(u7, v189, v190)
            end
            if v188 then
                v184[v187 + 1] = v188
            end
            v181[v182 + 1] = u8.createElement(u7, v183, v184)
            local v193
            if #p178.DisplayedPastAuctions == 0 and #p178.DisplayedActiveAuctionGroups == 0 then
                v193 = u8.createElement("TextLabel", {
                    ["LayoutOrder"] = 3,
                    ["Text"] = "No auctions found.",
                    ["TextScaled"] = true,
                    ["TextTransparency"] = 0.45,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, 20),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["TextColor3"] = u4.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                })
            elseif #p178.DisplayedPastAuctions > 0 then
                local v194 = { u8.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["Padding"] = UDim.new(0, 10)
                    }) }
                local _ = #v194
                local v195 = p178.DisplayedPastAuctions
                local function v201(p196, p197) --[[ Line: 597 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u179
                        [3] = u14
                        [4] = u13
                    --]]
                    local v198 = u8.createFragment
                    local v199 = {}
                    local v200 = u179
                    v199[tostring(v200) .. "-past-" .. tostring(p197)] = u8.createElement(u14, {
                        ["LayoutOrder"] = p197,
                        ["BackgroundColor3"] = u13.backgroundTertiary,
                        ["WinningAuctionBid"] = p196
                    })
                    return v198(v199)
                end
                local v202 = table.create(#v195)
                for v203, v204 in v195 do
                    v202[v203] = v201(v204, v203 - 1, v195)
                end
                local v205 = {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["AutomaticSize"] = Enum.AutomaticSize.Y
                }
                local v206 = { u8.createElement("UIGridLayout", {
                        ["FillDirectionMaxCells"] = 2,
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["CellPadding"] = UDim2.fromOffset(8, 8),
                        ["CellSize"] = UDim2.new(0.5, -8, 0, 120)
                    }) }
                local v207 = #v206
                for v208, v209 in v202 do
                    v206[v207 + v208] = v209
                end
                v194.CompletedBidsGrid = u8.createFragment({
                    ["CompletedBidsGrid"] = u8.createElement("Frame", v205, v206)
                })
                v193 = u8.createFragment(v194)
            else
                local v210 = p178.DisplayedActiveAuctionGroups
                local function v245(u211, p212) --[[ Line: 639 ]]
                    --[[
                    Upvalues:
                        [1] = u73
                        [2] = u8
                        [3] = u4
                        [4] = u7
                        [5] = u11
                        [6] = u5
                        [7] = u60
                        [8] = u13
                        [9] = u179
                        [10] = u15
                    --]]
                    local v213 = u73[u211.AuctionId]
                    local v214 = v213 ~= nil
                    if v214 then
                        local v215 = {
                            ["LayoutOrder"] = 1,
                            ["Size"] = UDim2.new(1, 0, 0, 12)
                        }
                        local v216 = {}
                        local v217 = #v216
                        local v218
                        if u211.Name == nil then
                            v218 = false
                        else
                            v218 = u8.createElement("TextLabel", {
                                ["LayoutOrder"] = 1,
                                ["TextTransparency"] = 0.3,
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(0, 1),
                                ["Position"] = UDim2.fromScale(0, 0.5),
                                ["AnchorPoint"] = Vector2.new(0, 0.5),
                                ["AutomaticSize"] = Enum.AutomaticSize.X,
                                ["Text"] = u211.Name,
                                ["TextColor3"] = u4.WHITE,
                                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                                ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                            })
                        end
                        if v218 then
                            v216[v217 + 1] = v218
                        end
                        local _ = #v216
                        v216.CountdownTimer = u8.createElement(u7, {
                            ["LayoutOrder"] = 2,
                            ["Size"] = UDim2.fromScale(0, 1),
                            ["AutomaticSize"] = Enum.AutomaticSize.X,
                            ["Position"] = UDim2.fromScale(1, 0.5),
                            ["AnchorPoint"] = Vector2.new(1, 0.5)
                        }, { u8.createElement("UIListLayout", {
                                ["Padding"] = UDim.new(0, 6),
                                ["FillDirection"] = Enum.FillDirection.Horizontal,
                                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                                ["SortOrder"] = Enum.SortOrder.LayoutOrder
                            }), u8.createElement("ImageLabel", {
                                ["BackgroundTransparency"] = 1,
                                ["LayoutOrder"] = 1,
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["ScaleType"] = Enum.ScaleType.Fit,
                                ["Image"] = u11.HUD_TIMER_ICON
                            }, { u8.createElement("UIAspectRatioConstraint", {
                                    ["AspectRatio"] = 1
                                }) }), u8.createElement(u5, {
                                ["PostText"] = "<font transparency=\"0.3\" size=\"12\">  Auction Ends</font>",
                                ["EndTime"] = v213.endEpochTime,
                                ["CountdownConfig"] = {
                                    ["days"] = true,
                                    ["hours"] = true,
                                    ["seperator"] = ":"
                                },
                                ["TextLabel"] = {
                                    ["TextScaled"] = false,
                                    ["TextSize"] = 14,
                                    ["LayoutOrder"] = 2,
                                    ["Size"] = UDim2.fromScale(0, 1),
                                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                                    ["TextXAlignment"] = Enum.TextXAlignment.Right
                                }
                            }) })
                        v214 = u8.createElement(u7, v215, v216)
                    end
                    local v219 = {
                        ["Size"] = UDim2.fromScale(1, 0),
                        ["AutomaticSize"] = Enum.AutomaticSize.Y,
                        ["LayoutOrder"] = p212
                    }
                    local v220 = { u8.createElement("UIListLayout", {
                            ["FillDirection"] = Enum.FillDirection.Vertical,
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["Padding"] = UDim.new(0, 4)
                        }) }
                    local v221 = #v220
                    if v214 then
                        v220[v221 + 1] = v214
                    end
                    local _ = #v220
                    local v222 = u211.AuctionItemIds
                    local function v231(p223, p224) --[[ Line: 731 ]]
                        --[[
                        Upvalues:
                            [1] = u60
                            [2] = u13
                            [3] = u211
                            [4] = u8
                            [5] = u179
                            [6] = u15
                        --]]
                        local v225 = u60.AuctionItems[p223]
                        if v225 == nil then
                            return nil
                        end
                        local v226 = {
                            ["LayoutOrder"] = p224,
                            ["BackgroundColor3"] = u13.backgroundTertiary,
                            ["AuctionItem"] = v225,
                            ["MyClanId"] = u60.MyClanId,
                            ["BidderUserId"] = u60.BidderUserId
                        }
                        local v227 = u211.OutbidAuctionItemIds
                        v226.IsOutbid = table.find(v227, p223) ~= nil
                        v226.ActiveAuctionItemId = u60.ActiveAuctionItemId
                        v226.SetActiveAuctionItemId = u60.SetActiveAuctionItemId
                        local v228 = u8.createFragment
                        local v229 = {}
                        local v230 = u179
                        v229[tostring(v230) .. "-" .. u211.AuctionId .. "-" .. tostring(p224)] = u8.createElement(u15, v226)
                        return v228(v229)
                    end
                    local v232 = 0
                    local v233 = {}
                    for v234, v235 in v222 do
                        local v236 = v231(v235, v234 - 1, v222)
                        if v236 ~= nil then
                            v232 = v232 + 1
                            v233[v232] = v236
                        end
                    end
                    local v237 = {
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0),
                        ["AutomaticSize"] = Enum.AutomaticSize.Y
                    }
                    local v238 = { u8.createElement("UIGridLayout", {
                            ["FillDirectionMaxCells"] = 3,
                            ["FillDirection"] = Enum.FillDirection.Horizontal,
                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                            ["CellPadding"] = UDim2.fromOffset(8, 8),
                            ["CellSize"] = UDim2.new(0.3333333333333333, -8, 0, 120)
                        }) }
                    local v239 = #v238
                    for v240, v241 in v233 do
                        v238[v239 + v240] = v241
                    end
                    v220["ActiveBidsGrid-" .. u211.AuctionId] = u8.createElement("Frame", v237, v238)
                    local v242 = u8.createFragment
                    local v243 = {}
                    local v244 = u179
                    v243["ActiveAuctionGroup-" .. tostring(v244) .. "-" .. u211.AuctionId] = u8.createElement(u7, v219, v220)
                    return v242(v243)
                end
                local v246 = table.create(#v210)
                for v247, v248 in v210 do
                    v246[v247] = v245(v248, v247 - 1, v210)
                end
                local v249 = { u8.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["Padding"] = UDim.new(0, 10)
                    }) }
                local v250 = #v249
                for v251, v252 in v246 do
                    v249[v250 + v251] = v252
                end
                v193 = u8.createFragment(v249)
            end
            local v253 = {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0),
                ["AutomaticSize"] = Enum.AutomaticSize.Y
            }
            local v254 = {
                [#v254 + 1] = v193
            }
            v181[v182 + 2] = u8.createElement(u7, v253, v254)
            return u8.createFragment({
                ["AuctionContainer-" .. tostring(u179)] = u8.createElement(u7, v180, v181)
            })
        end
        local v256 = table.create(#u128)
        for v257, v258 in u128 do
            v256[v257] = v255(v258, v257 - 1, u128)
        end
        local v259 = {
            ["ScrollingFrameProps"] = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 1, -51)
            }
        }
        local v260 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v261 = #v260
        for v262, v263 in v256 do
            v260[v261 + v262] = v263
        end
        v166.BidsList = u8.createElement(u3, v259, v260)
        v163[v164 + 1] = u8.createElement(u7, v165, v166)
        return u8.createFragment({
            ["ClanAuctionItemList"] = u8.createElement(u7, v160, v163)
        })
    end)
}