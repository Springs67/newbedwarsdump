local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ClanChatTagColorOptions
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").AuctionType
local v5 = {}
local v6 = u4.Clan
local v7 = {
    ["startEpochTime"] = 1775253600,
    ["resetInterval"] = 604800
}
local v8 = {}
local v9 = {
    ["bidCurrency"] = "ClanWarCrystal",
    ["maxWinningBids"] = 1,
    ["startingBid"] = 5000,
    ["reward"] = {
        ["duration"] = 1209600,
        ["clanTagChatColor"] = v2.Electric
    }
}
local v10 = {
    ["bidCurrency"] = "ClanWarCrystal",
    ["maxWinningBids"] = 1,
    ["startingBid"] = 5000,
    ["reward"] = {
        ["duration"] = 1209600,
        ["clanTagChatColor"] = v2.RedBlack
    }
}
local v11 = {
    ["bidCurrency"] = "ClanWarCrystal",
    ["maxWinningBids"] = 3,
    ["startingBid"] = 2000,
    ["reward"] = {
        ["duration"] = 1209600,
        ["clanTagChatColor"] = v2.SolidVoid
    }
}
local v12 = {
    ["bidCurrency"] = "ClanWarCrystal",
    ["maxWinningBids"] = 3,
    ["startingBid"] = 2000,
    ["reward"] = {
        ["duration"] = 1209600,
        ["clanTagChatColor"] = v2.SolidForest
    }
}
local v13 = {
    ["bidCurrency"] = "ClanWarCrystal",
    ["maxWinningBids"] = 2,
    ["startingBid"] = 5000,
    ["reward"] = {
        ["clanPodiumBanner"] = v3.BLOODFANG
    }
}
__set_list(v8, 1, {v9, v10, v11, v12, v13})
v7.auctionItems = v8
v5[v6] = v7
v5[u4.ClanIndividual] = {
    ["startEpochTime"] = 1775253600,
    ["resetInterval"] = 604800,
    ["auctionItems"] = {}
}
return {
    ["isDefinitionValid"] = function(p14, p15) --[[ Name: isDefinitionValid, Line 57 ]]
        --[[
        Upvalues:
            [1] = u4
        --]]
        local v16 = true
        local v17 = p14 == u4.Clan and "ClanWarCrystal" or "ClanContributionCoin"
        if v16 then
            v16 = true
            for v18, v19 in p15.auctionItems do
                local _ = v18 - 1
                if v19.bidCurrency ~= v17 then
                    v16 = false
                    break
                end
            end
        end
        if v16 then
            v16 = true
            for v20, v21 in p15.auctionItems do
                local _ = v20 - 1
                local v22
                if v21.startingBid >= 0 then
                    v22 = v21.maxWinningBids > 0
                else
                    v22 = false
                end
                if not v22 then
                    v16 = false
                    break
                end
            end
        end
        return v16
    end,
    ["AuctionDefinition"] = v5
}