-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local ScaleComponent = v1.ScaleComponent;
local StringUtil = v1.StringUtil;
local WidgetComponent = v1.WidgetComponent;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CustomMatchHostPanelTab = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "custom-match-host-panel-tabs").CustomMatchHostPanelTab;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local ClanProfileAuctionTab = RuntimeLib.import(script, script.Parent, "auction-tab", "clan-auction-tab").ClanProfileAuctionTab;
local ClanAuditLogTab = RuntimeLib.import(script, script.Parent, "audit-log-tab", "clan-audit-log-tab").ClanAuditLogTab;
local ClanProfileChatTab = RuntimeLib.import(script, script.Parent, "chat-tab", "clan-profile-chat-tab").ClanProfileChatTab;
local ClanProfileGeneralTab = RuntimeLib.import(script, script.Parent, "general-tab", "clan-profile-general-tab").ClanProfileGeneralTab;
local ClanProfileInviteTab = RuntimeLib.import(script, script.Parent, "invite-tab", "clan-profile-invite-tab").ClanProfileInviteTab;
local ClanProfileManagementTab = RuntimeLib.import(script, script.Parent, "management-tab", "clan-profile-management-tab").ClanProfileManagementTab;
local ClanProfileMembersTab = RuntimeLib.import(script, script.Parent, "members-tab", "clan-profile-members-tab").ClanProfileMembersTab;
local ClanProfileShopTab = RuntimeLib.import(script, script.Parent, "shop-tab", "clan-profile-shop-tab").ClanProfileShopTab;
local ClanProfileUpgradesTab = RuntimeLib.import(script, script.Parent, "upgrades-tab", "clan-profile-upgrades-tab").ClanProfileUpgradesTab;
local ClanWarTab = RuntimeLib.import(script, script.Parent, "war-tab", "clan-war-tab").ClanWarTab;
local v5 = {};
local u6 = setmetatable({}, {
    __index = v5
});
u6.GENERAL = 1;
v5[1] = "GENERAL";
u6.MEMBERS = 2;
v5[2] = "MEMBERS";
u6.SHOP = 3;
v5[3] = "SHOP";
u6.CHAT = 4;
v5[4] = "CHAT";
u6.AUCTION = 5;
v5[5] = "AUCTION";
u6.UPGRADES = 6;
v5[6] = "UPGRADES";
u6.WAR = 7;
v5[7] = "WAR";
u6.INVITE = 8;
v5[8] = "INVITE";
u6.MANAGEMENT = 9;
v5[9] = "MANAGEMENT";
u6["AUDIT LOG"] = 10;
v5[10] = "AUDIT LOG";

local function v66(u7, p8) -- Line: 58
    -- upvalues: u6 (ref), DeviceUtil (copy), KnitClient (copy), Theme (copy), u3 (copy), ScaleComponent (copy), Flamework (copy), u2 (copy), ClanMemberRank (copy), CustomMatchHostPanelTab (copy), StringUtil (copy), AutoCanvasScrollingFrame (copy), ButtonComponent (copy), BedwarsAppIds (copy), Empty (copy), ClanProfileGeneralTab (copy), ClanProfileMembersTab (copy), ClanProfileChatTab (copy), ClanProfileShopTab (copy), ClanProfileAuctionTab (copy), ClanProfileUpgradesTab (copy), ClanWarTab (copy), ClanProfileInviteTab (copy), ClanProfileManagementTab (copy), ClanAuditLogTab (copy), WidgetComponent (copy)
    local useState = p8.useState;
    local useEffect = p8.useEffect;
    local u9, u10 = useState(u7.tab or u6.GENERAL);
    local v11, u12 = useState(nil);
    local u13 = u7.store.Clans.myClanId ~= u7.ClanId;
    local u14 = { u6.GENERAL, u6.MEMBERS };
    useEffect(function() -- Line: 65
        -- upvalues: u7 (copy), u13 (copy), u12 (copy), DeviceUtil (ref), KnitClient (ref)
        if u7.store.Clans.myClanId == u7.ClanId and not u13 then
            if u7.store.Clans.myClan then
                u12(u7.store.Clans.myClan);

                return;
            end;

            if not DeviceUtil.isHoarceKat() then
                KnitClient.Controllers.ClanController:getMyClanProfileData():andThen(function(p15) -- Line: 73
                    -- upvalues: u12 (ref)
                    return u12(p15);
                end);
            end;
        elseif not DeviceUtil.isHoarceKat() then
            u12((KnitClient.Controllers.ClanController:fetchClanGuestDisplay(u7.ClanId)));
        end;
    end, {});
    local v16 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = Theme.widgetSize
    };
    local v17 = { u3.createElement(ScaleComponent, {
            MaximumSize = Vector2.new(Theme.widgetSize.X.Offset * 1.3, Theme.widgetSize.Y.Offset * 1.3),
            ScreenPadding = Vector2.new(24, 24)
        }) };
    local v18 = {
        ClipsDescendents = false,
        Title = "Clan Profile",
        AppId = u7.AppId,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1, 1),

        OnClose = function() -- Line: 107, Name: OnClose
            -- upvalues: Flamework (ref), u7 (copy)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u7.AppId);
        end,

        ContentUIPadding = u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 0),
            PaddingRight = UDim.new(0, 0)
        })
    };
    local v19 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            SortOrder = "LayoutOrder"
        }) };
    local v20 = {
        LayoutOrder = 1,
        BorderSizePixel = 0,
        Size = UDim2.fromScale(0.2, 1),
        BackgroundColor3 = Theme.backgroundTertiary
    };
    local v21 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15),
            PaddingBottom = UDim.new(0, 15)
        }) };
    local v22 = u2.entries(u6);

    local function v29(p23, p24) -- Line: 138
        -- upvalues: u13 (copy), u14 (copy), u6 (ref), u7 (copy), ClanMemberRank (ref), u3 (ref), CustomMatchHostPanelTab (ref), StringUtil (ref), u9 (copy), u10 (copy)
        local v25 = p23[1];
        local v26 = p23[2];

        if u13 and table.find(u14, v26) == nil then
            return nil;
        end;

        if v26 == u6.INVITE then
            local v27 = not u7.store.Clans.myClanMember;

            if not v27 then
                local myClanMember = u7.store.Clans.myClanMember;

                if myClanMember ~= nil then
                    myClanMember = myClanMember.rank;
                end;

                v27 = myClanMember < ClanMemberRank.OFFICER;
            end;

            if v27 then
                return nil;
            end;
        elseif v26 == u6.MANAGEMENT then
            local v28 = not u7.store.Clans.myClanMember;

            if not v28 then
                local myClanMember = u7.store.Clans.myClanMember;

                if myClanMember ~= nil then
                    myClanMember = myClanMember.rank;
                end;

                v28 = myClanMember < ClanMemberRank.ADMIN;
            end;

            if v28 then
                return nil;
            end;
        end;

        return u3.createElement(CustomMatchHostPanelTab, {
            Name = StringUtil.capitalizeFirstLetter(string.lower(v25)),
            Tab = v26,
            ActiveTab = u9,
            SetTab = u10,
            LayoutOrder = v26,
            GamepadShouldAutoSelect = p24 == 0
        });
    end;

    local v30 = 0;
    local v31 = {};

    for i, v in v22 do
        local v32 = v29(v, i - 1, v22);

        if v32 ~= nil then
            v30 = v30 + 1;
            v31[v30] = v32;
        end;
    end;

    local v33 = {
        ScrollingFrameProps = {
            Name = "Tabs",
            LayoutOrder = 2,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0.8, -5)
        }
    };
    local v34 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0, 10)
        }) };
    local v35 = #v34;

    for i, v in v31 do
        v34[v35 + i] = v;
    end;

    v21[#v21 + 1] = u3.createElement(AutoCanvasScrollingFrame, v33, v34);
    local v36 = u13 and u7.store.Clans.incomingClanInvites[u7.ClanId] and u3.createElement(ButtonComponent, {
        Text = "Join Clan",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Theme.backgroundSuccess,

        OnClick = function() -- Line: 221, Name: OnClick
            -- upvalues: KnitClient (ref), u7 (copy)
            KnitClient.Controllers.ClanController:clanInviteDecision(u7.ClanId, true);
        end
    });
    local v37 = {
        Size = UDim2.fromScale(1, 0.2),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.fromScale(0, 1)
    };
    local v38 = { u3.createElement("UIListLayout", {
            FillDirection = "Vertical",
            SortOrder = "LayoutOrder",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Bottom",
            Padding = UDim.new(0.05, 0)
        }) };
    local v39 = #v38;

    if v36 then
        v38[v39 + 1] = v36;
    end;

    local v40 = #v38;
    local v41 = u13 and u7.store.Clans.incomingClanInvites[u7.ClanId] and u3.createElement(ButtonComponent, {
        Text = "Deny Clan",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Theme.backgroundError,

        OnClick = function() -- Line: 257, Name: OnClick
            -- upvalues: KnitClient (ref), u7 (copy)
            KnitClient.Controllers.ClanController:clanInviteDecision(u7.ClanId, false);
        end
    });

    if v41 then
        v38[v40 + 1] = v41;
    end;

    local v42 = #v38;
    v38[v42 + 1] = u3.createElement(ButtonComponent, {
        Text = "Search Clans",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Theme.backgroundSecondary,

        OnClick = function() -- Line: 272, Name: OnClick
            -- upvalues: Flamework (ref), BedwarsAppIds (ref)
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_MENU, {});
        end
    });
    local v43 = not u13 and u3.createElement(ButtonComponent, {
        Text = "Leave Clan",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Theme.backgroundSecondary,

        OnClick = function() -- Line: 281, Name: OnClick
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.ClanController:leaveClan();
        end
    });

    if v43 then
        v38[v42 + 2] = v43;
    end;

    v21.SidebarActionButtons = u3.createElement(Empty, v37, v38);
    v19.Sidebar = u3.createElement("Frame", v20, v21);
    local v44 = {
        LayoutOrder = 2,
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(0.8, 1)
    };
    local v45 = { u3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 15),
            PaddingLeft = UDim.new(0.06, 0),
            PaddingRight = UDim.new(0.06, 0)
        }) };
    local v46 = #v45;
    local v47;

    if u9 == u6.GENERAL then
        if v11 then
            v47 = u3.createElement(ClanProfileGeneralTab, {
                Clan = v11,
                GuestView = u13,
                store = u7.store
            });
        else
            v47 = v11;
        end;
    else
        v47 = false;
    end;

    if v47 then
        v45[v46 + 1] = v47;
    end;

    local v48 = #v45;
    local v49;

    if u9 == u6.MEMBERS then
        if v11 then
            v49 = u3.createElement(ClanProfileMembersTab, {
                ClanId = u7.ClanId,
                Members = v11.members,
                store = u7.store
            });
        else
            v49 = v11;
        end;
    else
        v49 = false;
    end;

    if v49 then
        v45[v48 + 1] = v49;
    end;

    local v50 = #v45;
    local v51;

    if u9 == u6.CHAT then
        if v11 then
            v51 = u3.createElement(ClanProfileChatTab, {
                ClanId = u7.ClanId
            });
        else
            v51 = v11;
        end;
    else
        v51 = false;
    end;

    if v51 then
        v45[v50 + 1] = v51;
    end;

    local v52 = #v45;
    local v53;

    if u9 == u6.SHOP then
        v53 = u7.store.Clans.myClanMember and u3.createElement(ClanProfileShopTab, {
            Clan = u7.store.Clans.myClan or v11,
            store = u7.store
        });
    else
        v53 = false;
    end;

    if v53 then
        v45[v52 + 1] = v53;
    end;

    local v54 = #v45;
    local v55;

    if u9 == u6.AUCTION then
        v55 = u7.store.Clans.myClanMember and u3.createElement(ClanProfileAuctionTab, {
            Clan = u7.store.Clans.myClan or v11,
            store = u7.store
        });
    else
        v55 = false;
    end;

    if v55 then
        v45[v54 + 1] = v55;
    end;

    local v56 = #v45;
    local v57;

    if u9 == u6.UPGRADES then
        v57 = u7.store.Clans.myClanMember and u3.createElement(ClanProfileUpgradesTab, {
            Clan = u7.store.Clans.myClan or v11,
            store = u7.store
        });
    else
        v57 = false;
    end;

    if v57 then
        v45[v56 + 1] = v57;
    end;

    local v58 = #v45;
    local v59;

    if u9 == u6.WAR then
        v59 = u7.store.Clans.myClanMember and u3.createElement(ClanWarTab, {
            store = u7.store
        });
    else
        v59 = false;
    end;

    if v59 then
        v45[v58 + 1] = v59;
    end;

    local v60 = #v45;
    local v61;

    if u9 == u6.INVITE then
        v61 = u7.store.Clans.myClanMember and u3.createElement(ClanProfileInviteTab);
    else
        v61 = false;
    end;

    if v61 then
        v45[v60 + 1] = v61;
    end;

    local v62 = #v45;
    local v63;

    if u9 == u6.MANAGEMENT then
        v63 = u7.store.Clans.myClanMember and u3.createElement(ClanProfileManagementTab, {
            Clan = u7.store.Clans.myClan or v11,
            store = u7.store
        });
    else
        v63 = false;
    end;

    if v63 then
        v45[v62 + 1] = v63;
    end;

    local v64 = #v45;
    local v65;

    if u9 == u6["AUDIT LOG"] then
        v65 = u7.store.Clans.myClanMember;

        if v65 then
            if u7.store.Clans.myClanMember.rank >= 2 then
                v65 = u3.createElement(ClanAuditLogTab, {
                    store = u7.store
                });
            else
                v65 = false;
            end;
        end;
    else
        v65 = false;
    end;

    if v65 then
        v45[v64 + 1] = v65;
    end;

    v19[#v19 + 1] = u3.createElement(Empty, v44, v45);
    v17[#v17 + 1] = u3.createElement(WidgetComponent, v18, v19);

    return u3.createElement("Frame", v16, v17);
end;

return {
    ClanProfileTab = u6,
    ClanProfileCore = v4.new(u3)(v66)
};