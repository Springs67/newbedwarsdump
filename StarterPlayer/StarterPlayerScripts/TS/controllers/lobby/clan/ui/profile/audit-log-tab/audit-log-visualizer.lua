local u1 = nil
local function v20(p2, p3) --[[ Line: 3 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v4 = p3.data
    if v4.createClan then
        return "Clan created with name: \"" .. (v4.createClan.name .. "\", description: \"" .. v4.createClan.description .. "\",") .. " and tag \"" .. v4.createClan.tag .. "\"."
    elseif v4.infoChange then
        local v5 = v4.infoChange
        local v6 = {}
        local v7 = v5.name
        if v7 ~= "" and v7 then
            local v8 = "updated name to: \"" .. v5.name .. "\""
            table.insert(v6, v8)
        end
        local v9 = v5.tag
        if v9 ~= "" and v9 then
            local v10 = "updated tag to: \"" .. v5.tag .. "\""
            table.insert(v6, v10)
        end
        local v11 = v5.description
        if v11 ~= "" and v11 then
            local v12 = "updated description to: \"" .. v5.description .. "\""
            table.insert(v6, v12)
        end
        local v13 = v5.announcement
        if v13 ~= "" and v13 then
            local v14 = "updated announcement to: \"" .. v5.announcement .. "\""
            table.insert(v6, v14)
        end
        local v15 = table.concat(v6, ", ")
        return string.upper((string.sub(v15, 0, 1))) .. string.sub(v15, 2) .. "."
    elseif v4.joinClan then
        return u1(p2, v4.joinClan.acceptedByUserId) .. " joined clan."
    elseif v4.leaveClan then
        if v4.leaveClan.userIdLeft == p3.performedByUserId then
            return u1(p2, v4.leaveClan.userIdLeft) .. " left the clan."
        else
            return u1(p2, v4.leaveClan.userIdLeft) .. " was kicked from the clan."
        end
    elseif v4.shopPurchase then
        return "Shop item " .. v4.shopPurchase.itemId .. " purchased."
    elseif v4.upgradePurchase then
        return "Upgrade " .. v4.upgradePurchase.upgradeId .. " purchased."
    elseif v4.leadershipTransfer then
        return "Leadership transferred to " .. u1(p2, v4.leadershipTransfer.newLeaderUserId) .. "."
    elseif v4.rankChange then
        local v16 = u1(p2, v4.rankChange.targetUserId)
        local v17 = v4.rankChange.oldRank
        local v18 = " rank changed from " .. tostring(v17)
        local v19 = v4.rankChange.newRank
        return v16 .. v18 .. " to " .. tostring(v19)
    elseif v4.sendInvite then
        return "Invite sent to " .. u1(p2, v4.sendInvite.toPlayer) .. "."
    elseif v4.cancelInvite then
        if v4.cancelInvite.toPlayer == p3.performedByUserId then
            return "Invite declined by " .. u1(p2, p3.performedByUserId)
        else
            return "Canceled invite sent to " .. u1(p2, v4.cancelInvite.toPlayer) .. "."
        end
    else
        return ""
    end
end
u1 = function(p21, p22) --[[ Name: getUserDisplayName, Line 60 ]]
    local v23 = p21.Clans.myClan
    if v23 ~= nil then
        v23 = v23.members[tostring(p22)] ~= nil
    end
    if v23 then
        return p21.Clans.myClan.members[tostring(p22)].offlinePlayer.displayName
    else
        return tostring(p22)
    end
end
return {
    ["renderAuditLogDescription"] = v20,
    ["getUserDisplayName"] = u1,
    ["getAuditActionDisplay"] = function(p24) --[[ Name: getAuditActionDisplay, Line 77 ]]
        if p24 == "CreateClan" then
            return "Create Clan"
        end
        if p24 == "JoinClan" then
            return "Join Clan"
        end
        if p24 == "LeaveClan" then
            return "Leave Clan"
        end
        if p24 == "ShopPurchase" then
            return "Shop Purchase"
        end
        if p24 == "UpgradePurchase" then
            return "Upgrade Purchase"
        end
        if p24 == "InfoChange" then
            return "Info Change"
        end
        if p24 == "LeadershipTransfer" then
            return "Leadership Transfer"
        end
        if p24 == "RankChange" then
            return "Rank Change"
        end
        if p24 == "MarkDeleteClan" then
            return "Mark Delete Clan"
        end
        if p24 == "CancelMarkDeleteClan" then
            return "Cancel Mark Delete Clan"
        end
        if p24 == "SendInvite" then
            return "Send Invite"
        end
        if p24 == "CancelInvite" then
            return "Cancel Invite"
        end
        if p24 == "None" then
            return "Invalid Action"
        end
    end
}