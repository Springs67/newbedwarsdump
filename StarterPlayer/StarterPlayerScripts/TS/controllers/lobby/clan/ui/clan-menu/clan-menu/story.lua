local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").ClanWarMedal
local u7 = v1.import(script, script.Parent, "clan-menu-core").ClanMenu
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u3
        [5] = u7
        [6] = u2
    --]]
    local v9 = {
        ["contribution"] = 2346,
        ["dateJoined"] = 1,
        ["offlinePlayer"] = {
            ["name"] = "oiogy",
            ["userId"] = 123,
            ["displayName"] = "Sprux"
        },
        ["rank"] = u5.LEADER
    }
    local v10 = {
        ["name"] = "Doms Clan",
        ["tag"] = "Dom",
        ["image"] = "rbxassetid://8661722623",
        ["introduction"] = "string",
        ["level"] = 1,
        ["maxMembers"] = 10,
        ["leader"] = v9,
        ["members"] = {
            ["123"] = v9
        }
    }
    local v11 = {
        ["medals"] = {
            ["CLAN_WAR_60"] = u6.GOLD
        }
    }
    v10.clanWar = v11
    local v12 = u4
    local v13 = {
        ["type"] = "ClanInviteIncoming",
        ["clanInvite"] = {
            ["clanId"] = "1",
            ["clanName"] = "DOM DOBO CLAN",
            ["clanTag"] = "DOM",
            ["inviter"] = 2149384,
            ["targetUserId"] = 29348456,
            ["time"] = os.time() - 86400
        }
    }
    v12:dispatch(v13)
    local u14 = u3("ClanMenu", u7, {}, {}, {
        ["Parent"] = p8
    })
    return function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u14
        --]]
        return u2.unmount(u14)
    end
end