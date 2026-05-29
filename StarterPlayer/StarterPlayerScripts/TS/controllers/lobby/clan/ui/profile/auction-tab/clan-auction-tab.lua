local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u17 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u18 = v1.import(script, script.Parent.Parent, "war-tab", "pill-counter").PillCounter
local u19 = v1.import(script, script.Parent, "clan-auction").ClanAuction
local u20 = v1.import(script, script.Parent, "clan-auction-sub-tab-button").ClanAuctionSubTabButton
local v21 = {}
local u22 = setmetatable({}, {
    ["__index"] = v21
})
u22.PERSONAL = 0
v21[0] = "PERSONAL"
u22.CLAN = 1
v21[1] = "CLAN"
u22.MY_AUCTIONS = 2
v21[2] = "MY_AUCTIONS"
local u23 = {
    [u22.PERSONAL] = {
        ["Text"] = "Personal",
        ["Icon"] = "rbxassetid://7173696651904",
        ["Index"] = 0,
        ["AuctionTabType"] = v13.ClanIndividual
    },
    [u22.CLAN] = {
        ["Text"] = "Clan",
        ["Icon"] = "rbxassetid://7173696651904",
        ["Index"] = 1,
        ["AuctionTabType"] = v13.Clan
    },
    [u22.MY_AUCTIONS] = {
        ["Text"] = "My Auctions",
        ["Icon"] = "rbxassetid://7173696651904",
        ["Index"] = 3,
        ["AuctionTabType"] = "My Auctions"
    }
}
local function v77(p24, p25) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u6
        [3] = u23
        [4] = u10
        [5] = u4
        [6] = u14
        [7] = u15
        [8] = u7
        [9] = u11
        [10] = u8
        [11] = u20
        [12] = u16
        [13] = u3
        [14] = u5
        [15] = u12
        [16] = u18
        [17] = u19
        [18] = u17
    --]]
    local v26 = p25.useState
    local v27 = p25.useMemo
    local v28 = p25.useEffect
    local u29, u30 = v26(u22.PERSONAL)
    local v34 = v27(function() --[[ Line: 61 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u23
            [3] = u29
        --]]
        local v31 = nil
        for v32, v33 in u6.values(u23) do
            local _ = v32 - 1
            if v33.Index == u29 == true then
                return v33
            end
        end
        return v31
    end, { u29 })
    v28(function() --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u4
            [3] = u14
            [4] = u15
            [5] = u7
            [6] = u11
        --]]
        if not u10:IsClient() or u4.isHoarceKat() then
            return nil
        end
        local u35 = false
        local u36 = nil
        task.defer(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u14
                [3] = u15
                [4] = u7
                [5] = u11
                [6] = u36
            --]]
            if u35 then
                return nil
            end
            local u37 = u14.getLogger("ClanAuctionTab")
            u37:Debug("Getting all auction info...")
            u15.Client:Get("GetAllAuctionInfo"):CallServerAsync():andThen(function(p38) --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u37
                    [3] = u7
                    [4] = u11
                --]]
                if u35 then
                    return nil
                end
                u37:Debug("Setting auctions", u7(p38.auctions))
                u11:dispatch({
                    ["type"] = "ClanSetAuctions",
                    ["auctions"] = p38.auctions
                })
                u37:Debug("Setting auction items", u7(p38.auctionItems))
                u11:dispatch({
                    ["type"] = "ClanSetAuctionItems",
                    ["auctionItems"] = p38.auctionItems
                })
            end)
            u15.Client:Get("GetAllAuctionBids"):CallServerAsync():andThen(function(p39) --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u37
                    [3] = u7
                    [4] = u11
                --]]
                if u35 then
                    return nil
                end
                u37:Debug("Setting winning auction bids", u7(p39))
                u11:dispatch({
                    ["type"] = "ClanSetWinningAuctionBids",
                    ["winningAuctionBids"] = p39.winningAuctionBids
                })
                u11:dispatch({
                    ["type"] = "ClanSetAllAuctionBidIds",
                    ["allAuctionBidIds"] = p39.allAuctionBidIds
                })
            end)
            u36 = u15.Client:Get("SendAuctionUpdate"):Connect(function(p40) --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u37
                    [2] = u7
                    [3] = u11
                --]]
                u37:Debug("Recieved auction update", u7(p40))
                u11:dispatch({
                    ["type"] = "ClanSetAuctions",
                    ["auctions"] = p40.updatedAuctions
                })
                local v41 = u11
                local v42 = p40.updatedAuctionItems
                local v43 = table.create(#v42)
                local v44 = {
                    ["type"] = "ClanSetAuctionItems"
                }
                for v45, v46 in v42 do
                    local _ = v45 - 1
                    v43[v45] = { v46.id, v46 }
                end
                local v47 = {}
                for _, v48 in v43 do
                    v47[v48[1]] = v48[2]
                end
                v44.auctionItems = v47
                v41:dispatch(v44)
            end)
        end)
        return function() --[[ Line: 149 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u36
                [3] = u15
                [4] = u14
            --]]
            u35 = true
            local v49 = u36
            if v49 ~= nil then
                v49:Disconnect()
            end
            task.defer(function() --[[ Line: 155 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u14
                --]]
                u15.Client:Get("UnregisterForAuctionUpdates"):CallServer()
                u14.getLogger("ClanAuctionTab"):Debug("Unregistered auction updates.")
            end)
        end
    end, {})
    local v50 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["Padding"] = UDim.new(0, 6),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local v51 = #v50
    local v52 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(1, 0, 0, 25)
    }
    local v53 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }) }
    local _ = #v53
    local v54 = table.create(4, "")
    local function v60(_, p55) --[[ Line: 183 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u23
            [3] = u8
            [4] = u20
            [5] = u16
            [6] = u3
            [7] = u29
            [8] = u30
            [9] = u5
        --]]
        local v56 = nil
        for v57, v58 in u6.values(u23) do
            local _ = v57 - 1
            if v58.Index == p55 == true then
                v56 = v58
                break
            end
        end
        local v59 = UDim2.new(0.25, -2, 1, 0)
        if v56 then
            return u8.createFragment({
                [tostring(p55)] = u8.createElement(u20, {
                    ["Size"] = v59,
                    ["Text"] = v56.Text,
                    ["BackgroundColor3"] = u16.backgroundTertiary,
                    ["TextColor3"] = u3.WHITE,
                    ["Tab"] = p55,
                    ["ActiveTab"] = u29,
                    ["SetTab"] = u30,
                    ["LayoutOrder"] = p55
                })
            })
        else
            return u8.createFragment({
                [tostring(p55)] = u8.createElement(u5, {
                    ["Size"] = v59,
                    ["LayoutOrder"] = p55
                })
            })
        end
    end
    local v61 = table.create(#v54)
    for v62, v63 in v54 do
        v61[v62] = v60(v63, v62 - 1, v54)
    end
    local v64 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.6, 1)
    }
    local v65 = { u8.createElement("UIListLayout", {
            ["HorizontalFlex"] = "SpaceBetween",
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["Padding"] = UDim.new(0, 2),
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }), u8.createElement("UIPadding", {
            ["PaddingRight"] = UDim.new(0, 6)
        }) }
    local v66 = #v65
    for v67, v68 in v61 do
        v65[v66 + v67] = v68
    end
    v53.Tabs = u8.createElement(u5, v64, v65)
    local v69 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(0.4, 0, 0, 20)
    }
    local v70 = { u8.createElement("UIListLayout", {
            ["HorizontalFlex"] = "SpaceBetween",
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
        }) }
    local v71 = #v70
    local v72 = {
        ["Icon"] = u12("ClanContributionCoin").icon
    }
    local v73 = p24.store.Clans.clanContributionShop
    if v73 ~= nil then
        v73 = v73.clanContributionCoins
    end
    v72.Amount = v73 == nil and 0 or v73
    v72.Tooltip = u12("ClanContributionCoin").name
    v72.FrameProps = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(0.48, 0, 1, 0)
    }
    v70[v71 + 1] = u8.createElement(u18, v72)
    local v74 = {
        ["Icon"] = u12("ClanWarCrystal").icon
    }
    local v75 = p24.Clan.clanWarCoins
    v74.Amount = v75 == nil and 0 or v75
    v74.Tooltip = u12("ClanWarCrystal").name
    v74.FrameProps = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(0.48, 0, 1, 0)
    }
    v70[v71 + 2] = u8.createElement(u18, v74)
    v53.Currency = u8.createElement(u5, v69, v70)
    v50.Header = u8.createElement(u5, v52, v53)
    local v76 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(1, 0, 1, -40)
    }
    if v34 ~= nil then
        v34 = v34.AuctionTabType
    end
    v76.AuctionTabType = v34
    v50[v51 + 1] = u8.createElement(u19, v76)
    return u8.createElement(u17, {}, v50)
end
return {
    ["ClanProfileAuctionTab"] = v9.new(u8)(v77)
}