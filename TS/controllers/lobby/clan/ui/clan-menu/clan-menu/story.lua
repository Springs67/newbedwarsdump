-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanWarMedal = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-war", "clan-war-medals").ClanWarMedal;
local ClanMenu = RuntimeLib.import(script, script.Parent, "clan-menu-core").ClanMenu;

return function(p2) -- Line: 9
    -- upvalues: ClanMemberRank (copy), ClanWarMedal (copy), ClientStore (copy), CreateRoduxApp (copy), ClanMenu (copy), u1 (copy)
    local v3 = {
        contribution = 2346,
        dateJoined = 1,
        offlinePlayer = {
            name = "oiogy",
            userId = 123,
            displayName = "Sprux"
        },
        rank = ClanMemberRank.LEADER
    };
    ({
        name = "Doms Clan",
        tag = "Dom",
        image = "rbxassetid://8661722623",
        introduction = "string",
        level = 1,
        maxMembers = 10,
        leader = v3,
        members = {
            ["123"] = v3
        }
    }).clanWar = {
        medals = {
            CLAN_WAR_60 = ClanWarMedal.GOLD
        }
    };
    ClientStore:dispatch({
        type = "ClanInviteIncoming",
        clanInvite = {
            clanId = "1",
            clanName = "DOM DOBO CLAN",
            clanTag = "DOM",
            inviter = 2149384,
            targetUserId = 29348456,
            time = os.time() - 86400
        }
    });
    local u4 = CreateRoduxApp("ClanMenu", ClanMenu, {}, {}, {
        Parent = p2
    });

    return function() -- Line: 52
        -- upvalues: u1 (ref), u4 (copy)
        return u1.unmount(u4);
    end;
end;