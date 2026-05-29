local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v2.OfflinePlayerUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionTypeMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, script.Parent, "clan-auction-item-info-card").ClanAuctionItemInfoCard
local u13 = v1.import(script, script.Parent, "clan-auction-item-shop").ClanAuctionItemShop
local v80 = v7.new(u6)(function(u14, p15) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u9
        [4] = u10
        [5] = u6
        [6] = u13
        [7] = u11
        [8] = u12
        [9] = u4
    --]]
    local v16 = p15.useState
    local v17 = p15.useMemo
    local u18
    if u3.isHoarceKat() then
        u18 = u5.Dummy.Bryan3838.userId
    else
        u18 = u9.LocalPlayer
        if u18 ~= nil then
            u18 = u18.UserId
        end
    end
    local u51 = v17(function() --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u18
            [3] = u10
        --]]
        local v19 = {}
        local v20 = #v19
        local v21 = u14.AllAuctionBidIds or {}
        local v22 = #v21
        table.move(v21, 1, v22, v20 + 1, v19)
        local v23 = v20 + v22
        local v24 = u14.ClanAllAuctionBidIds or {}
        table.move(v24, 1, #v24, v23 + 1, v19)
        local u25 = {}
        local u26 = {}
        for _, v27 in v19 do
            u25[v27] = true
        end
        local function u33(p28) --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u14
            --]]
            local v29 = nil
            for v30, v31 in p28.winningBids do
                local _ = v30 - 1
                local v32
                if v31.bidderId.kind == "Player" and (u18 ~= nil and v31.bidderId.id == u18) then
                    v32 = true
                elseif v31.bidderId.kind == "Clan" then
                    v32 = v31.bidderId.id == u14.MyClanId
                else
                    v32 = false
                end
                if v32 == true then
                    return v31
                end
            end
            return v29
        end
        local v34 = u14.Auctions
        if v34 ~= nil then
            local function v48(p35) --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u33
                    [3] = u25
                    [4] = u10
                    [5] = u26
                --]]
                if u14.AuctionTabType == nil then
                    return nil
                end
                if u14.AuctionTabType ~= "My Auctions" and p35.auctionType ~= u14.AuctionTabType then
                    return nil
                end
                local u36 = {}
                local u37 = {}
                local v38 = p35.activeItemsIds
                local function v45(p39) --[[ Line: 72 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u33
                        [3] = u25
                        [4] = u36
                        [5] = u37
                    --]]
                    local v40 = u14.AuctionItems
                    if v40 ~= nil then
                        v40 = v40[p39]
                    end
                    if v40 == nil then
                        return nil
                    end
                    local v41 = u33(v40) ~= nil
                    local v42 = u25[v40.id] ~= nil
                    if u14.AuctionTabType == "My Auctions" and not (v41 or v42) then
                        return nil
                    end
                    local v43 = u36
                    table.insert(v43, p39)
                    if u14.AuctionTabType == "My Auctions" and (v42 and not v41) then
                        local v44 = u37
                        table.insert(v44, p39)
                    end
                end
                for v46, v47 in v38 do
                    v45(v47, v46 - 1, v38)
                end
                if #u36 > 0 then
                    u26[p35.id] = {
                        ["Name"] = u10[p35.auctionType].name .. " Auctions",
                        ["AuctionId"] = p35.id,
                        ["AuctionItemIds"] = u36,
                        ["OutbidAuctionItemIds"] = u37
                    }
                end
            end
            for v49, v50 in v34 do
                v48(v50, v49 - 1, v34)
            end
        end
        return u26
    end, {
        u14.Auctions,
        u14.AuctionItems,
        u14.AuctionTabType,
        u14.MyClanId,
        u14.AllAuctionBidIds,
        u14.ClanAllAuctionBidIds,
        u18
    })
    local u52, v53 = v16(nil)
    local v54 = v17(function() --[[ Line: 116 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        return u14.Auctions or {}
    end, { u14.Auctions })
    local v55 = v17(function() --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        return u14.AuctionItems or {}
    end, { u14.AuctionItems })
    local v60 = v17(function() --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u51
        --]]
        if u52 == nil then
            return nil
        else
            local v56 = nil
            local v57 = v56
            for _, v58 in u51 do
                if v57 == nil then
                    local v59 = v58.AuctionItemIds
                    if v59 ~= nil then
                        v59 = table.find(v59, u52) ~= nil
                    end
                    if v59 then
                        v56 = v58
                        v57 = v56
                    end
                end
            end
            if v57 == nil then
                return nil
            else
                return v57
            end
        end
    end, { u52, u51 })
    local v64 = v17(function() --[[ Line: 147 ]]
        --[[
        Upvalues:
            [1] = u51
            [2] = u14
        --]]
        local v61 = {}
        local v62 = {
            ["Name"] = "Active Auctions",
            ["Kind"] = {
                ["ActiveAuctions"] = u51
            }
        }
        __set_list(v61, 1, {v62})
        if u14.AuctionTabType == "My Auctions" then
            local v63 = {
                ["Name"] = "Winning Auctions",
                ["Kind"] = {
                    ["PastAuctions"] = u14.WinningAuctionBids
                }
            }
            table.insert(v61, v63)
        end
        return v61
    end, { u14.AuctionTabType, u14.WinningAuctionBids, u51 })
    local v65 = {}
    for v66, v67 in u14 do
        v65[v66] = v67
    end
    v65.MyClanId = nil
    v65.ClanCoins = nil
    v65.ClanContributionCoins = nil
    v65.WinningAuctionBids = nil
    v65.AllAuctionBidIds = nil
    v65.ClanAllAuctionBidIds = nil
    v65.AuctionTabType = nil
    v65.Auctions = nil
    v65.AuctionItems = nil
    local v68 = {}
    for v69, v70 in v65 do
        v68[v69] = v70
    end
    local v71 = { u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), u6.createElement(u13, {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1),
            ["AuctionGroups"] = v64,
            ["ActiveAuctionItemId"] = u52,
            ["SetActiveAuctionItemId"] = v53,
            ["MyClanId"] = u14.MyClanId,
            ["BidderUserId"] = u18,
            ["Auctions"] = v54,
            ["AuctionItems"] = v55
        }) }
    local v72 = #v71
    local v73 = {
        ["BackgroundTransparency"] = 0.3,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.4, 1),
        ["BackgroundColor3"] = u11.backgroundPrimary,
        ["MyClanId"] = u14.MyClanId,
        ["BidderUserId"] = u18
    }
    local v74 = u14.Auctions
    if v74 ~= nil then
        v74 = nil
        for v75, v76 in v74 do
            local _ = v75 - 1
            local v77 = v76.id
            local v78
            if v60 == nil then
                v78 = v60
            else
                v78 = v60.AuctionId
            end
            if v77 == v78 == true then
                v74 = v76
                break
            end
        end
    end
    v73.Auction = v74
    local v79 = u14.AuctionItems
    if v79 ~= nil then
        v79 = v79[u52]
    end
    v73.AuctionItem = v79
    v71[v72 + 1] = u6.createElement(u12, v73)
    return u6.createFragment({
        ["ClanAuction"] = u6.createElement(u4, v68, v71)
    })
end)
return {
    ["ClanAuction"] = v8.connect(function(p81, p82) --[[ Line: 245 ]]
        local v83 = {}
        for v84, v85 in p82 do
            v83[v84] = v85
        end
        v83.MyClanId = p81.Clans.myClanId
        local v86 = p81.Clans.myClan
        if v86 ~= nil then
            v86 = v86.coins
        end
        v83.ClanCoins = v86
        local v87 = p81.Clans.clanContributionShop
        if v87 ~= nil then
            v87 = v87.clanContributionCoins
        end
        v83.ClanContributionCoins = v87
        v83.WinningAuctionBids = p81.Clans.winningAuctionBids
        v83.AllAuctionBidIds = p81.Clans.allAuctionBidIds
        local v88 = p81.Clans.myClan
        if v88 ~= nil then
            v88 = v88.placeAuctionBids
        end
        v83.ClanAllAuctionBidIds = v88
        v83.Auctions = p81.Clans.auctions
        v83.AuctionItems = p81.Clans.auctionItems
        return v83
    end)(v80)
}