-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local StringUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").StringUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local getAuctionBidCurrencyMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-bid-currencies").getAuctionBidCurrencyMeta;
local BidErrorKind = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "auction", "auction-types").BidErrorKind;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local RewardUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "AuctionController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 24
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "AuctionController";
    p3.cooldown = {};
end;

function u1.KnitStart(p4) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.validateClanAuctionBid(p5, p6, p7, p8) -- Line: 36
    -- upvalues: Workspace (copy), ClientStore (copy), StringUtil (copy), getAuctionBidCurrencyMeta (copy)
    local v9 = p5:getBidderIdKey(p8);

    if p5.cooldown[v9] ~= nil then
        local v10 = p5.cooldown[v9];
        local v11 = (v10 == nil and 0 or v10) - Workspace:GetServerTimeNow();
        local v12 = math.round(v11);
        local v13 = math.max(0, v12);

        return {
            success = false,
            message = "You must wait " .. tostring(v13) .. " seconds before placing another bid."
        };
    end;

    local v14 = ClientStore:getState().Clans.auctionItems[p6];

    if not v14 then
        return {
            success = false,
            message = "Auction item not found."
        };
    end;

    if p7 <= 0 then
        return {
            success = false,
            message = "Bid must be greater than 0."
        };
    end;

    if p7 < v14.currentBid then
        return {
            success = false,
            message = "Bid must be greater or equal to the current bid (" .. StringUtil.formatNumberWithCommas(v14.currentBid) .. ")."
        };
    end;

    local name = getAuctionBidCurrencyMeta(v14.definition.bidCurrency).name;
    local v15 = ClientStore:getState();
    local v16 = 0;
    local bidCurrency = v14.definition.bidCurrency;

    if bidCurrency == "ClanContributionCoin" then
        local clanContributionShop = v15.Clans.clanContributionShop;

        if clanContributionShop ~= nil then
            clanContributionShop = clanContributionShop.clanContributionCoins;
        end;

        v16 = clanContributionShop == nil and 0 or clanContributionShop;
    elseif bidCurrency == "ClanWarCrystal" then
        local myClan = v15.Clans.myClan;

        if myClan ~= nil then
            myClan = myClan.clanWarCoins;
        end;

        v16 = myClan == nil and 0 or myClan;
    elseif bidCurrency == "BedCoins" then
        local bedCoins = v15.Bedwars.bedCoins;
        v16 = bedCoins == nil and 0 or bedCoins;
    end;

    local v17 = math.floor(v16);

    return v17 < p7 and {
        success = false,
        message = "Not enough " .. name .. ". You have " .. StringUtil.formatNumberWithCommas(v17) .. "."
    } or {
        success = true
    };
end;

function u1.openBidModal(u18, u19, u20, u21) -- Line: 126
    -- upvalues: ClientStore (copy), RewardUtils (copy), getAuctionBidCurrencyMeta (copy), Flamework (copy), BedwarsAppIds (copy), StringUtil (copy), BidErrorKind (copy)
    local v22 = u18:validateClanAuctionBid(u19, u20, u21);
    local u23 = u18:getBidderIdKey(u21);

    if not v22.success then
        u18:handleBidResult(v22, u23);

        return nil;
    end;

    local v24 = ClientStore:getState().Clans.auctionItems[u19];

    if not v24 then
        u18:handleBidResult({
            success = false,
            message = "Auction item not found."
        }, u23);

        return nil;
    end;

    local v25;

    if v24 == nil then
        v25 = v24;
    else
        v25 = v24.definition.reward;
    end;

    local v26 = RewardUtils.getRewardName(v25);
    local name = getAuctionBidCurrencyMeta(v24.definition.bidCurrency).name;
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CONFIRMATION_MODAL, {
        Title = "Place Bid",
        Body = "Are you sure you want to place a bid for <font color=\"" .. "#55FFFF" .. "\">" .. StringUtil.formatNumberWithCommas(u20) .. " " .. name .. "</font> for <font color=\"" .. "#55FFFF" .. "\">" .. v26 .. "</font>\n<font color=\"#AAAAAA\">[Warning] Placing this bid will deduct your bid currency immediately. You\'ll be refunded if you lose, or refunded the difference if your max bid exceeds the winning bid amount.</font>",
        TextBodyProps = {
            RichText = true,
            TextWrapped = true,
            TextScaled = false,
            TextSize = 18
        },
        SecondaryBtnProps = {
            Text = "CANCEL"
        },
        PrimaryBtnProps = {
            Text = "PLACE BID"
        },

        OnPrimaryBtnClick = function(u27) -- Line: 167, Name: OnPrimaryBtnClick
            -- upvalues: u18 (copy), u19 (copy), u20 (copy), u21 (copy), BidErrorKind (ref), u23 (copy), Flamework (ref), BedwarsAppIds (ref)
            u27(true);
            u18:requestPlaceBid(u19, u20, u21):andThen(function(p28) -- Line: 170
                -- upvalues: BidErrorKind (ref), u18 (ref), u23 (ref)
                local timeout = p28.timeout;
                local errorKind = p28.errorKind;
                local v29;

                if p28.success then
                    v29 = {
                        success = true,
                        message = "Bid Placed"
                    };
                else
                    v29 = {
                        success = false,
                        message = errorKind == BidErrorKind.BidTooLow and "Bid is under the minimum bid." or (errorKind == BidErrorKind.InsufficientFunds and "Not enough currency to place bid." or (errorKind == BidErrorKind.PlayerSpamming and "You must wait before placing another bid." or (errorKind == BidErrorKind.AlreadyOwnsItem and "You already own this item." or (errorKind == BidErrorKind.ClanMemberUnauthorized and "You are not authorized to bid on this item. Must be Clan Admin." or nil)))),
                        timeout = timeout
                    };
                end;

                u18:handleBidResult(v29, u23);
            end):catch(function() -- Line: 212
                -- upvalues: u18 (ref), u23 (ref)
                u18:handleBidResult({
                    success = false,
                    message = "Failed to place bid. Please try again.",
                    timeout = 5
                }, u23);
            end):finally(function() -- Line: 218
                -- upvalues: Flamework (ref), BedwarsAppIds (ref), u27 (copy)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CONFIRMATION_MODAL);
                u27(false);
            end);
        end,

        OnSecondaryBtnClick = function() -- Line: 223, Name: OnSecondaryBtnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CONFIRMATION_MODAL);
        end
    });
end;

function u1.requestPlaceBid(p30, p31, p32, p33) -- Line: 228
    -- upvalues: default (copy)
    return default.Client:Get("PlaceAuctionBid"):CallServerAsync(p31, p32, p33);
end;

function u1.getBidderIdKey(p34, p35) -- Line: 231
    return p35.kind .. "-" .. tostring(p35.id);
end;

function u1.handleBidResult(u36, p37, u38) -- Line: 234
    -- upvalues: Flamework (copy), Workspace (copy)
    local v39 = p37.success and p37.message;

    if v39 == "" or not v39 then
        local message = p37.message;

        if message ~= "" and message then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                message = p37.message
            });
        end;
    else
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
            message = p37.message
        });
    end;

    local timeout = p37.timeout;

    if timeout ~= 0 and (timeout == timeout and timeout) then
        u36.cooldown[u38] = Workspace:GetServerTimeNow() + p37.timeout;
        task.delay(p37.timeout, function() -- Line: 254
            -- upvalues: u36 (copy), u38 (copy)
            u36.cooldown[u38] = nil;
        end);
    end;
end;

KnitClient.CreateController(u1.new());

return nil;