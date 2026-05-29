local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u6 = v1.import(script, script.Parent, "clan-profile-invite-input").ClanProfileInviteInput
local u7 = v1.import(script, script.Parent, "clan-profile-invite-tabs").ClanProfileInviteTabs
local u8 = v1.import(script, script.Parent, "outgoing-invites", "clan-profile-invite-outgoing-invites").ClanProfileInviteOutgoingInvites
local u9 = v1.import(script, script.Parent, "players-in-server", "clan-profile-invite-players-in-server").ClanProfileInvitePlayersInServer
return {
    ["ClanProfileInviteTab"] = v4.new(u3)(function(_, p10) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u6
            [3] = u7
            [4] = u9
            [5] = u8
            [6] = u2
            [7] = u5
        --]]
        local v11, v12 = p10.useState(0)
        local v13 = {
            ["Title"] = "INVITE TO CLAN"
        }
        local v14 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 12)
            }), u3.createElement(u6, {
                ["Size"] = UDim2.new(1, 0, 0, 40)
            }), u3.createElement(u7, {
                ["AppId"] = "ClanProfileInviteTabs",
                ["subTab"] = v11,
                ["setSubTab"] = v12
            }) }
        local v15 = #v14
        local v16 = {
            ["Size"] = UDim2.new(1, 0, 1, -82)
        }
        local v17 = {}
        local v18 = #v17
        local v19
        if v11 == 0 then
            v19 = u3.createElement(u9)
        else
            v19 = false
        end
        if v19 then
            v17[v18 + 1] = v19
        end
        local v20 = #v17
        local v21
        if v11 == 1 then
            v21 = u3.createElement(u8, {
                ["AppId"] = "ClanProfileInviteOutgoingInvites"
            })
        else
            v21 = false
        end
        if v21 then
            v17[v20 + 1] = v21
        end
        v14[v15 + 1] = u3.createElement(u2, v16, v17)
        return u3.createElement(u5, v13, v14)
    end)
}