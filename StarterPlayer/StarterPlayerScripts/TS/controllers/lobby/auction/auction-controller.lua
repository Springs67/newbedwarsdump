local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").BidErrorKind
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "AuctionController"
    end,
    ["__index"] = u6
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.constructor(p16)
    p16.Name = "AuctionController"
    p16.cooldown = {}
end
function u13.KnitStart(p17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6.KnitStart(p17)
end
function u13.validateClanAuctionBid(p18, p19, p20, p21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u3
        [4] = u9
    --]]
    local v22 = p18:getBidderIdKey(p21)
    if p18.cooldown[v22] ~= nil then
        local v23 = p18.cooldown[v22]
        local v24 = (v23 == nil and 0 or v23) - u5:GetServerTimeNow()
        local v25 = math.round(v24)
        local v26 = math.max(0, v25)
        return {
            ["success"] = false,
            ["message"] = "You must wait " .. tostring(v26) .. " seconds before placing another bid."
        }
    end
    local v27 = u7:getState().Clans.auctionItems[p19]
    if not v27 then
        return {
            ["success"] = false,
            ["message"] = "Auction item not found."
        }
    end
    if p20 <= 0 then
        return {
            ["success"] = false,
            ["message"] = "Bid must be greater than 0."
        }
    end
    if p20 < v27.currentBid then
        return {
            ["success"] = false,
            ["message"] = "Bid must be greater or equal to the current bid (" .. u3.formatNumberWithCommas(v27.currentBid) .. ")."
        }
    end
    local v28 = u9(v27.definition.bidCurrency).name
    local v29 = u7:getState()
    local v30 = 0
    local v31 = v27.definition.bidCurrency
    if v31 == "ClanContributionCoin" then
        local v32 = v29.Clans.clanContributionShop
        if v32 ~= nil then
            v32 = v32.clanContributionCoins
        end
        v30 = v32 == nil and 0 or v32
    elseif v31 == "ClanWarCrystal" then
        local v33 = v29.Clans.myClan
        if v33 ~= nil then
            v33 = v33.clanWarCoins
        end
        v30 = v33 == nil and 0 or v33
    elseif v31 == "BedCoins" then
        local v34 = v29.Bedwars.bedCoins
        v30 = v34 == nil and 0 or v34
    end
    local v35 = math.floor(v30)
    return v35 < p20 and {
        ["success"] = false,
        ["message"] = "Not enough " .. v28 .. ". You have " .. u3.formatNumberWithCommas(v35) .. "."
    } or {
        ["success"] = true
    }
end
function u13.openBidModal(u36, u37, u38, u39) --[[ Line: 126 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u9
        [4] = u2
        [5] = u8
        [6] = u3
        [7] = u10
    --]]
    local v40 = u36:validateClanAuctionBid(u37, u38, u39)
    local u41 = u36:getBidderIdKey(u39)
    if not v40.success then
        u36:handleBidResult(v40, u41)
        return nil
    end
    local v42 = u7:getState().Clans.auctionItems[u37]
    if not v42 then
        u36:handleBidResult({
            ["success"] = false,
            ["message"] = "Auction item not found."
        }, u41)
        return nil
    end
    local v43 = u12
    local v44
    if v42 == nil then
        v44 = v42
    else
        v44 = v42.definition.reward
    end
    local v45 = v43.getRewardName(v44)
    local v46 = u9(v42.definition.bidCurrency).name
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.CONFIRMATION_MODAL, {
        ["Title"] = "Place Bid",
        ["Body"] = "Are you sure you want to place a bid for <font color=\"" .. "#55FFFF" .. "\">" .. u3.formatNumberWithCommas(u38) .. " " .. v46 .. "</font> for <font color=\"" .. "#55FFFF" .. "\">" .. v45 .. "</font>\n<font color=\"#AAAAAA\">[Warning] Placing this bid will deduct your bid currency immediately. You\'ll be refunded if you lose, or refunded the difference if your max bid exceeds the winning bid amount.</font>",
        ["TextBodyProps"] = {
            ["RichText"] = true,
            ["TextWrapped"] = true,
            ["TextScaled"] = false,
            ["TextSize"] = 18
        },
        ["SecondaryBtnProps"] = {
            ["Text"] = "CANCEL"
        },
        ["PrimaryBtnProps"] = {
            ["Text"] = "PLACE BID"
        },
        ["OnPrimaryBtnClick"] = function(u47) --[[ Name: OnPrimaryBtnClick, Line 167 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u37
                [3] = u38
                [4] = u39
                [5] = u10
                [6] = u41
                [7] = u2
                [8] = u8
            --]]
            u47(true)
            u36:requestPlaceBid(u37, u38, u39):andThen(function(p48) --[[ Line: 170 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u36
                    [3] = u41
                --]]
                local v49 = p48.success
                local v50 = p48.timeout
                local v51 = p48.errorKind
                local v52
                if v49 then
                    v52 = {
                        ["success"] = true,
                        ["message"] = "Bid Placed"
                    }
                else
                    local v53 = v51 == u10.BidTooLow and "Bid is under the minimum bid." or (v51 == u10.InsufficientFunds and "Not enough currency to place bid." or (v51 == u10.PlayerSpamming and "You must wait before placing another bid." or (v51 == u10.AlreadyOwnsItem and "You already own this item." or (v51 == u10.ClanMemberUnauthorized and "You are not authorized to bid on this item. Must be Clan Admin." or nil))))
                    v52 = {
                        ["success"] = false,
                        ["message"] = v53,
                        ["timeout"] = v50
                    }
                end
                u36:handleBidResult(v52, u41)
            end):catch(function() --[[ Line: 212 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u41
                --]]
                u36:handleBidResult({
                    ["success"] = false,
                    ["message"] = "Failed to place bid. Please try again.",
                    ["timeout"] = 5
                }, u41)
            end):finally(function() --[[ Line: 218 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u8
                    [3] = u47
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u8.CONFIRMATION_MODAL)
                u47(false)
            end)
        end,
        ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 223 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u8
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u8.CONFIRMATION_MODAL)
        end
    })
end
function u13.requestPlaceBid(_, p54, p55, p56) --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    return u11.Client:Get("PlaceAuctionBid"):CallServerAsync(p54, p55, p56)
end
function u13.getBidderIdKey(_, p57) --[[ Line: 231 ]]
    local v58 = p57.kind
    local v59 = p57.id
    return v58 .. "-" .. tostring(v59)
end
function u13.handleBidResult(u60, p61, u62) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local v63 = p61.success
    if v63 then
        v63 = p61.message
    end
    if v63 == "" or not v63 then
        local v64 = p61.message
        if v64 ~= "" and v64 then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                ["message"] = p61.message
            })
        end
    else
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
            ["message"] = p61.message
        })
    end
    local v65 = p61.timeout
    if v65 ~= 0 and (v65 == v65 and v65) then
        u60.cooldown[u62] = u5:GetServerTimeNow() + p61.timeout
        task.delay(p61.timeout, function() --[[ Line: 254 ]]
            --[[
            Upvalues:
                [1] = u60
                [2] = u62
            --]]
            u60.cooldown[u62] = nil
        end)
    end
end
v4.CreateController(u13.new())
return nil