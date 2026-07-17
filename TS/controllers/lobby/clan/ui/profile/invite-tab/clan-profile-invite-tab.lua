-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local ClanProfileInviteInput = RuntimeLib.import(script, script.Parent, "clan-profile-invite-input").ClanProfileInviteInput;
local ClanProfileInviteTabs = RuntimeLib.import(script, script.Parent, "clan-profile-invite-tabs").ClanProfileInviteTabs;
local ClanProfileInviteOutgoingInvites = RuntimeLib.import(script, script.Parent, "outgoing-invites", "clan-profile-invite-outgoing-invites").ClanProfileInviteOutgoingInvites;
local ClanProfileInvitePlayersInServer = RuntimeLib.import(script, script.Parent, "players-in-server", "clan-profile-invite-players-in-server").ClanProfileInvitePlayersInServer;

return {
    ClanProfileInviteTab = v2.new(u1)(function(p3, p4) -- Line: 11
        -- upvalues: u1 (copy), ClanProfileInviteInput (copy), ClanProfileInviteTabs (copy), ClanProfileInvitePlayersInServer (copy), ClanProfileInviteOutgoingInvites (copy), Empty (copy), ClanProfilePageLayout (copy)
        local v5, v6 = p4.useState(0);
        local v7 = {
            Title = "INVITE TO CLAN"
        };
        local v8 = { u1.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 12)
            }), u1.createElement(ClanProfileInviteInput, {
                Size = UDim2.new(1, 0, 0, 40)
            }), u1.createElement(ClanProfileInviteTabs, {
                AppId = "ClanProfileInviteTabs",
                subTab = v5,
                setSubTab = v6
            }) };
        local v9 = {
            Size = UDim2.new(1, 0, 1, -82)
        };
        local v10 = {};
        local v11 = #v10;
        local v12;

        if v5 == 0 then
            v12 = u1.createElement(ClanProfileInvitePlayersInServer);
        else
            v12 = false;
        end;

        if v12 then
            v10[v11 + 1] = v12;
        end;

        local v13 = #v10;
        local v14;

        if v5 == 1 then
            v14 = u1.createElement(ClanProfileInviteOutgoingInvites, {
                AppId = "ClanProfileInviteOutgoingInvites"
            });
        else
            v14 = false;
        end;

        if v14 then
            v10[v13 + 1] = v14;
        end;

        v8[#v8 + 1] = u1.createElement(Empty, v9, v10);

        return u1.createElement(ClanProfilePageLayout, v7, v8);
    end)
};