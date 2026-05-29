local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ButtonComponent
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.ScaleComponent
local u9 = v3.StringUtil
local u10 = v3.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "custom-match-host-panel-tabs").CustomMatchHostPanelTab
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u19 = v1.import(script, script.Parent, "auction-tab", "clan-auction-tab").ClanProfileAuctionTab
local u20 = v1.import(script, script.Parent, "audit-log-tab", "clan-audit-log-tab").ClanAuditLogTab
local u21 = v1.import(script, script.Parent, "chat-tab", "clan-profile-chat-tab").ClanProfileChatTab
local u22 = v1.import(script, script.Parent, "general-tab", "clan-profile-general-tab").ClanProfileGeneralTab
local u23 = v1.import(script, script.Parent, "invite-tab", "clan-profile-invite-tab").ClanProfileInviteTab
local u24 = v1.import(script, script.Parent, "management-tab", "clan-profile-management-tab").ClanProfileManagementTab
local u25 = v1.import(script, script.Parent, "members-tab", "clan-profile-members-tab").ClanProfileMembersTab
local u26 = v1.import(script, script.Parent, "shop-tab", "clan-profile-shop-tab").ClanProfileShopTab
local u27 = v1.import(script, script.Parent, "upgrades-tab", "clan-profile-upgrades-tab").ClanProfileUpgradesTab
local u28 = v1.import(script, script.Parent, "war-tab", "clan-war-tab").ClanWarTab
local v29 = {}
local u30 = setmetatable({}, {
    ["__index"] = v29
})
u30.GENERAL = 1
v29[1] = "GENERAL"
u30.MEMBERS = 2
v29[2] = "MEMBERS"
u30.SHOP = 3
v29[3] = "SHOP"
u30.CHAT = 4
v29[4] = "CHAT"
u30.AUCTION = 5
v29[5] = "AUCTION"
u30.UPGRADES = 6
v29[6] = "UPGRADES"
u30.WAR = 7
v29[7] = "WAR"
u30.INVITE = 8
v29[8] = "INVITE"
u30.MANAGEMENT = 9
v29[9] = "MANAGEMENT"
u30["AUDIT LOG"] = 10
v29[10] = "AUDIT LOG"
local function v101(u31, p32) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u6
        [3] = u11
        [4] = u18
        [5] = u13
        [6] = u8
        [7] = u2
        [8] = u12
        [9] = u17
        [10] = u15
        [11] = u9
        [12] = u4
        [13] = u5
        [14] = u16
        [15] = u7
        [16] = u22
        [17] = u25
        [18] = u21
        [19] = u26
        [20] = u19
        [21] = u27
        [22] = u28
        [23] = u23
        [24] = u24
        [25] = u20
        [26] = u10
    --]]
    local v33 = p32.useState
    local v34 = p32.useEffect
    local u35, u36 = v33(u31.tab or u30.GENERAL)
    local v37, u38 = v33(nil)
    local u39 = u31.store.Clans.myClanId ~= u31.ClanId
    local u40 = { u30.GENERAL, u30.MEMBERS }
    v34(function() --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u39
            [3] = u38
            [4] = u6
            [5] = u11
        --]]
        if u31.store.Clans.myClanId == u31.ClanId and not u39 then
            if u31.store.Clans.myClan then
                u38(u31.store.Clans.myClan)
                return
            end
            if not u6.isHoarceKat() then
                u11.Controllers.ClanController:getMyClanProfileData():andThen(function(p41) --[[ Line: 73 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    return u38(p41)
                end)
                return
            end
        elseif not u6.isHoarceKat() then
            u38((u11.Controllers.ClanController:fetchClanGuestDisplay(u31.ClanId)))
        end
    end, {})
    local v42 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = u18.widgetSize
    }
    local v43 = { u13.createElement(u8, {
            ["MaximumSize"] = Vector2.new(u18.widgetSize.X.Offset * 1.3, u18.widgetSize.Y.Offset * 1.3),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }) }
    local v44 = #v43
    local v45 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "Clan Profile",
        ["AppId"] = u31.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 107 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u31
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u31.AppId)
        end,
        ["ContentUIPadding"] = u13.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 0),
            ["PaddingRight"] = UDim.new(0, 0)
        })
    }
    local v46 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder"
        }) }
    local v47 = #v46
    local v48 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.2, 1),
        ["BackgroundColor3"] = u18.backgroundTertiary
    }
    local v49 = { u13.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 15),
            ["PaddingBottom"] = UDim.new(0, 15)
        }) }
    local v50 = #v49
    local v51 = u12.entries(u30)
    local function v60(p52, p53) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u40
            [3] = u30
            [4] = u31
            [5] = u17
            [6] = u13
            [7] = u15
            [8] = u9
            [9] = u35
            [10] = u36
        --]]
        local v54 = p52[1]
        local v55 = p52[2]
        if u39 and table.find(u40, v55) == nil then
            return nil
        end
        if v55 == u30.INVITE then
            local v56 = not u31.store.Clans.myClanMember
            if not v56 then
                local v57 = u31.store.Clans.myClanMember
                if v57 ~= nil then
                    v57 = v57.rank
                end
                v56 = v57 < u17.OFFICER
            end
            if v56 then
                return nil
            end
        elseif v55 == u30.MANAGEMENT then
            local v58 = not u31.store.Clans.myClanMember
            if not v58 then
                local v59 = u31.store.Clans.myClanMember
                if v59 ~= nil then
                    v59 = v59.rank
                end
                v58 = v59 < u17.ADMIN
            end
            if v58 then
                return nil
            end
        end
        return u13.createElement(u15, {
            ["Name"] = u9.capitalizeFirstLetter(string.lower(v54)),
            ["Tab"] = v55,
            ["ActiveTab"] = u35,
            ["SetTab"] = u36,
            ["LayoutOrder"] = v55,
            ["GamepadShouldAutoSelect"] = p53 == 0
        })
    end
    local v61 = 0
    local v62 = {}
    for v63, v64 in v51 do
        local v65 = v60(v64, v63 - 1, v51)
        if v65 ~= nil then
            v61 = v61 + 1
            v62[v61] = v65
        end
    end
    local v66 = {
        ["ScrollingFrameProps"] = {
            ["Name"] = "Tabs",
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.8, -5)
        }
    }
    local v67 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 10)
        }) }
    local v68 = #v67
    for v69, v70 in v62 do
        v67[v68 + v69] = v70
    end
    v49[v50 + 1] = u13.createElement(u4, v66, v67)
    local v71 = u39 and u31.store.Clans.incomingClanInvites[u31.ClanId]
    if v71 then
        v71 = u13.createElement(u5, {
            ["Text"] = "Join Clan",
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = u18.backgroundSuccess,
            ["OnClick"] = function() --[[ Name: OnClick, Line 221 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u31
                --]]
                u11.Controllers.ClanController:clanInviteDecision(u31.ClanId, true)
            end
        })
    end
    local v72 = {
        ["Size"] = UDim2.fromScale(1, 0.2),
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1)
    }
    local v73 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Bottom",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v74 = #v73
    if v71 then
        v73[v74 + 1] = v71
    end
    local v75 = #v73
    local v76 = u39 and u31.store.Clans.incomingClanInvites[u31.ClanId]
    if v76 then
        v76 = u13.createElement(u5, {
            ["Text"] = "Deny Clan",
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = u18.backgroundError,
            ["OnClick"] = function() --[[ Name: OnClick, Line 257 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u31
                --]]
                u11.Controllers.ClanController:clanInviteDecision(u31.ClanId, false)
            end
        })
    end
    if v76 then
        v73[v75 + 1] = v76
    end
    local v77 = #v73
    v73[v77 + 1] = u13.createElement(u5, {
        ["Text"] = "Search Clans",
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["BackgroundColor3"] = u18.backgroundSecondary,
        ["OnClick"] = function() --[[ Name: OnClick, Line 272 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u16
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.CLAN_MENU, {})
        end
    })
    local v78 = not u39
    if v78 then
        v78 = u13.createElement(u5, {
            ["Text"] = "Leave Clan",
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = u18.backgroundSecondary,
            ["OnClick"] = function() --[[ Name: OnClick, Line 281 ]]
                --[[
                Upvalues:
                    [1] = u11
                --]]
                u11.Controllers.ClanController:leaveClan()
            end
        })
    end
    if v78 then
        v73[v77 + 2] = v78
    end
    v49.SidebarActionButtons = u13.createElement(u7, v72, v73)
    v46.Sidebar = u13.createElement("Frame", v48, v49)
    local v79 = {
        ["LayoutOrder"] = 2,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.8, 1)
    }
    local v80 = { u13.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 15),
            ["PaddingLeft"] = UDim.new(0.06, 0),
            ["PaddingRight"] = UDim.new(0.06, 0)
        }) }
    local v81 = #v80
    local v82
    if u35 == u30.GENERAL then
        if v37 then
            v82 = u13.createElement(u22, {
                ["Clan"] = v37,
                ["GuestView"] = u39,
                ["store"] = u31.store
            })
        else
            v82 = v37
        end
    else
        v82 = false
    end
    if v82 then
        v80[v81 + 1] = v82
    end
    local v83 = #v80
    local v84
    if u35 == u30.MEMBERS then
        if v37 then
            v84 = u13.createElement(u25, {
                ["ClanId"] = u31.ClanId,
                ["Members"] = v37.members,
                ["store"] = u31.store
            })
        else
            v84 = v37
        end
    else
        v84 = false
    end
    if v84 then
        v80[v83 + 1] = v84
    end
    local v85 = #v80
    local v86
    if u35 == u30.CHAT then
        if v37 then
            v86 = u13.createElement(u21, {
                ["ClanId"] = u31.ClanId
            })
        else
            v86 = v37
        end
    else
        v86 = false
    end
    if v86 then
        v80[v85 + 1] = v86
    end
    local v87 = #v80
    local v88 = u35 == u30.SHOP and u31.store.Clans.myClanMember
    if v88 then
        v88 = u13.createElement(u26, {
            ["Clan"] = u31.store.Clans.myClan or v37,
            ["store"] = u31.store
        })
    end
    if v88 then
        v80[v87 + 1] = v88
    end
    local v89 = #v80
    local v90 = u35 == u30.AUCTION and u31.store.Clans.myClanMember
    if v90 then
        v90 = u13.createElement(u19, {
            ["Clan"] = u31.store.Clans.myClan or v37,
            ["store"] = u31.store
        })
    end
    if v90 then
        v80[v89 + 1] = v90
    end
    local v91 = #v80
    local v92 = u35 == u30.UPGRADES and u31.store.Clans.myClanMember
    if v92 then
        v92 = u13.createElement(u27, {
            ["Clan"] = u31.store.Clans.myClan or v37,
            ["store"] = u31.store
        })
    end
    if v92 then
        v80[v91 + 1] = v92
    end
    local v93 = #v80
    local v94 = u35 == u30.WAR and u31.store.Clans.myClanMember
    if v94 then
        v94 = u13.createElement(u28, {
            ["store"] = u31.store
        })
    end
    if v94 then
        v80[v93 + 1] = v94
    end
    local v95 = #v80
    local v96 = u35 == u30.INVITE and u31.store.Clans.myClanMember
    if v96 then
        v96 = u13.createElement(u23)
    end
    if v96 then
        v80[v95 + 1] = v96
    end
    local v97 = #v80
    local v98 = u35 == u30.MANAGEMENT and u31.store.Clans.myClanMember
    if v98 then
        v98 = u13.createElement(u24, {
            ["Clan"] = u31.store.Clans.myClan or v37,
            ["store"] = u31.store
        })
    end
    if v98 then
        v80[v97 + 1] = v98
    end
    local v99 = #v80
    local v100 = u35 == u30["AUDIT LOG"] and u31.store.Clans.myClanMember
    if v100 then
        if u31.store.Clans.myClanMember.rank >= 2 then
            v100 = u13.createElement(u20, {
                ["store"] = u31.store
            })
        else
            v100 = false
        end
    end
    if v100 then
        v80[v99 + 1] = v100
    end
    v46[v47 + 1] = u13.createElement(u7, v79, v80)
    v43[v44 + 1] = u13.createElement(u10, v45, v46)
    return u13.createElement("Frame", v42, v43)
end
return {
    ["ClanProfileTab"] = u30,
    ["ClanProfileCore"] = v14.new(u13)(v101)
}