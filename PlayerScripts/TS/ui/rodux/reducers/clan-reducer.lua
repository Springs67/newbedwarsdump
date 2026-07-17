-- Decompiled with Potassium's decompiler.

local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = {
    hasClanPass = false,
    incomingClanInvites = {},
    playerToClanTag = {},
    auctions = {},
    auctionItems = {},
    winningAuctionBids = {},
    allAuctionBidIds = {}
};

return {
    ClansReducer = function(p3, p4) -- Line: 13, Name: ClansReducer
        -- upvalues: u2 (copy), u1 (copy)
        if p3 == nil then
            p3 = u2;
        end;

        if p4.type == "ClanUpdate" then
            local v5 = u1.deepCopy(p3);
            v5.myClanId = p4.myClanId;
            v5.myClan = p4.myClan;
            v5.myClanMember = p4.me;

            return v5;
        end;

        if p4.type == "ClanSetMyClanProfile" then
            p3.myClan = p4.myClanProfile;

            return p3;
        end;

        if p4.type == "ClanInviteIncoming" then
            p3.incomingClanInvites[p4.clanInvite.clanId] = p4.clanInvite;

            return p3;
        end;

        if p4.type == "ClanInviteDelete" then
            p3.incomingClanInvites[p4.clanId] = nil;

            return p3;
        end;

        if p4.type == "ClanSetClanPassPaid" then
            p3.hasClanPass = p4.paid;

            return p3;
        end;

        if p4.type == "ClanSetClanInvites" then
            p3.incomingClanInvites = p4.incomingClanInvites;

            return p3;
        end;

        if p4.type == "ClanSetShopData" then
            p3.clanContributionShop = {
                clanContributionCoins = p4.clanContributionCoins,
                weekPurchaseHistory = p4.weekPurchaseHistory
            };

            return p3;
        end;

        if p4.type == "ClanSetActiveClanWar" then
            p3.activeClanWar = p4.activeClanWar;

            return p3;
        end;

        if p4.type == "ClanSetAuctions" then
            p3.auctions = p4.auctions;

            return p3;
        end;

        if p4.type == "ClanSetAuctionItems" then
            p3.auctionItems = p4.auctionItems;

            return p3;
        end;

        if p4.type == "ClanSetWinningAuctionBids" then
            p3.winningAuctionBids = p4.winningAuctionBids;

            return p3;
        end;

        if p4.type == "ClanSetAllAuctionBidIds" then
            p3.allAuctionBidIds = p4.allAuctionBidIds;
        end;

        return p3;
    end
};