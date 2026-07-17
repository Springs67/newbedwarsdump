-- Decompiled with Potassium's decompiler.

local u1 = nil;

local function renderAuditLogDescription(p2, p3) -- Line: 3
    -- upvalues: u1 (ref)
    local data = p3.data;

    if data.createClan then
        return "Clan created with name: \"" .. (data.createClan.name .. "\", description: \"" .. data.createClan.description .. "\",") .. " and tag \"" .. data.createClan.tag .. "\".";
    end;

    if not data.infoChange then
        if data.joinClan then
            return u1(p2, data.joinClan.acceptedByUserId) .. " joined clan.";
        end;

        if data.leaveClan then
            if data.leaveClan.userIdLeft == p3.performedByUserId then
                return u1(p2, data.leaveClan.userIdLeft) .. " left the clan.";
            end;

            return u1(p2, data.leaveClan.userIdLeft) .. " was kicked from the clan.";
        end;

        if data.shopPurchase then
            return "Shop item " .. data.shopPurchase.itemId .. " purchased.";
        end;

        if data.upgradePurchase then
            return "Upgrade " .. data.upgradePurchase.upgradeId .. " purchased.";
        end;

        if data.leadershipTransfer then
            return "Leadership transferred to " .. u1(p2, data.leadershipTransfer.newLeaderUserId) .. ".";
        end;

        if data.rankChange then
            return u1(p2, data.rankChange.targetUserId) .. (" rank changed from " .. tostring(data.rankChange.oldRank)) .. " to " .. tostring(data.rankChange.newRank);
        end;

        if data.sendInvite then
            return "Invite sent to " .. u1(p2, data.sendInvite.toPlayer) .. ".";
        end;

        if not data.cancelInvite then
            return "";
        end;

        if data.cancelInvite.toPlayer == p3.performedByUserId then
            return "Invite declined by " .. u1(p2, p3.performedByUserId);
        end;

        return "Canceled invite sent to " .. u1(p2, data.cancelInvite.toPlayer) .. ".";
    end;

    local infoChange = data.infoChange;
    local v4 = {};
    local name = infoChange.name;

    if name ~= "" and name then
        table.insert(v4, "updated name to: \"" .. infoChange.name .. "\"");
    end;

    local tag = infoChange.tag;

    if tag ~= "" and tag then
        table.insert(v4, "updated tag to: \"" .. infoChange.tag .. "\"");
    end;

    local description = infoChange.description;

    if description ~= "" and description then
        table.insert(v4, "updated description to: \"" .. infoChange.description .. "\"");
    end;

    local announcement = infoChange.announcement;

    if announcement ~= "" and announcement then
        table.insert(v4, "updated announcement to: \"" .. infoChange.announcement .. "\"");
    end;

    local v5 = table.concat(v4, ", ");

    return string.upper((string.sub(v5, 0, 1))) .. string.sub(v5, 2) .. ".";
end;

u1 = function(p6, p7) -- Line: 60, Name: getUserDisplayName
    local myClan = p6.Clans.myClan;

    if myClan ~= nil then
        myClan = myClan.members[tostring(p7)] ~= nil;
    end;

    if myClan then
        return p6.Clans.myClan.members[tostring(p7)].offlinePlayer.displayName;
    end;

    return tostring(p7);
end;

return {
    renderAuditLogDescription = renderAuditLogDescription,
    getUserDisplayName = u1,

    getAuditActionDisplay = function(p8) -- Line: 77, Name: getAuditActionDisplay
        if p8 == "CreateClan" then
            return "Create Clan";
        end;

        if p8 == "JoinClan" then
            return "Join Clan";
        end;

        if p8 == "LeaveClan" then
            return "Leave Clan";
        end;

        if p8 == "ShopPurchase" then
            return "Shop Purchase";
        end;

        if p8 == "UpgradePurchase" then
            return "Upgrade Purchase";
        end;

        if p8 == "InfoChange" then
            return "Info Change";
        end;

        if p8 == "LeadershipTransfer" then
            return "Leadership Transfer";
        end;

        if p8 == "RankChange" then
            return "Rank Change";
        end;

        if p8 == "MarkDeleteClan" then
            return "Mark Delete Clan";
        end;

        if p8 == "CancelMarkDeleteClan" then
            return "Cancel Mark Delete Clan";
        end;

        if p8 == "SendInvite" then
            return "Send Invite";
        end;

        if p8 == "CancelInvite" then
            return "Cancel Invite";
        end;

        if p8 == "None" then
            return "Invalid Action";
        end;
    end
};