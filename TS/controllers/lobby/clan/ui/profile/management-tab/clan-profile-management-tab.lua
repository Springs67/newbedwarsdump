-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AutoCanvasScrollingFrame = v1.AutoCanvasScrollingFrame;
local ButtonComponent = v1.ButtonComponent;
local ColorUtil = v1.ColorUtil;
local Countdown = v1.Countdown;
local DividerComponent = v1.DividerComponent;
local Empty = v1.Empty;
local SoundManager = v1.SoundManager;
local StringUtil = v1.StringUtil;
local UILayers = v1.UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local HostPanelSetting = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting;
local HostPanelTextBox = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox;
local TextBoxCharacterCounter = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "gift", "ui", "gifting", "gifting-form", "text-box-character-counter").TextBoxCharacterCounter;
local ToggleButton = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton;
local ToggleButtonGroup = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup;
local SettingRow = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta");
local ClanBorderMeta = v5.ClanBorderMeta;
local ClanBorderType = v5.ClanBorderType;
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color");
local ChatTagColorDefinition = v6.ChatTagColorDefinition;
local ClanChatTagColorOptions = v6.ClanChatTagColorOptions;
local ClanMemberRank = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank;
local ClanPrivacySetting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting;
local ClanUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil;
local getClanHqBackgroundMusicMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta;
local getClanHqSkyboxMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-skybox-meta").getClanHqSkyboxMeta;
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types");
local ClanHqBackgroundMusicType = v7.ClanHqBackgroundMusicType;
local ClanHqSkyboxType = v7.ClanHqSkyboxType;
local getClanPodiumBannerMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-meta").getClanPodiumBannerMeta;
local ClanPodiumBannerType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local ClanProfilePageLayout = RuntimeLib.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout;
local ClanHqSelectorType = RuntimeLib.import(script, script.Parent, "clan-hq", "clan-hq-selector-type").ClanHqSelectorType;
local ClanLobbySelectorType = RuntimeLib.import(script, script.Parent, "clan-lobby", "clan-lobby-selector-type").ClanLobbySelectorType;
local ClanManagementEmblemUpload = RuntimeLib.import(script, script.Parent, "clan-management-emblem-upload").ClanManagementEmblemUpload;
local u8 = { "Member", "Officer", "Admin", "Leader" };
local u9 = {
    [ClanMemberRank.MEMBER] = "Member",
    [ClanMemberRank.OFFICER] = "Officer",
    [ClanMemberRank.ADMIN] = "Admin",
    [ClanMemberRank.LEADER] = "Leader"
};
local u10 = {
    Member = ClanMemberRank.MEMBER,
    Officer = ClanMemberRank.OFFICER,
    Admin = ClanMemberRank.ADMIN,
    Leader = ClanMemberRank.LEADER
};

return {
    ClanProfileManagementTab = v4.new(u3)(function(u11, p12) -- Line: 62
        -- upvalues: u3 (copy), ClanBorderType (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), StringUtil (copy), ClanUtil (copy), PlaceUtil (copy), Flamework (copy), BedwarsAppIds (copy), Theme (copy), UILayers (copy), default (copy), ClanMemberRank (copy), ClanManagementEmblemUpload (copy), DividerComponent (copy), HostPanelSetting (copy), HostPanelTextBox (copy), Empty (copy), TextBoxCharacterCounter (copy), u2 (copy), ClanPrivacySetting (copy), ToggleButton (copy), ToggleButtonGroup (copy), SettingRow (copy), u9 (copy), u10 (copy), u8 (copy), ColorUtil (copy), ButtonComponent (copy), ClanBorderMeta (copy), ClanHqBackgroundMusicType (copy), getClanHqBackgroundMusicMeta (copy), ClanHqSelectorType (copy), ClanHqSkyboxType (copy), getClanHqSkyboxMeta (copy), ClanPodiumBannerType (copy), getClanPodiumBannerMeta (copy), ClanLobbySelectorType (copy), ChatTagColorDefinition (copy), ClanChatTagColorOptions (copy), Countdown (copy), AutoCanvasScrollingFrame (copy), ClanProfilePageLayout (copy)
        local useState = p12.useState;
        local v13 = u3.createRef();
        local v14 = u3.createRef();
        local selectedBorder = u11.Clan.selectedBorder;

        if selectedBorder == nil then
            selectedBorder = ClanBorderType.NONE;
        end;

        local u15, u16 = useState(selectedBorder);
        local v17 = {};
        local myClan = u11.store.Clans.myClan;

        if type(myClan) == "table" then
            for i, v in myClan do
                v17[i] = v;
            end;
        end;

        local u18, u19 = useState(v17);
        local v20, u21 = useState(false);
        local v22, u23 = useState("");

        local function v32() -- Line: 81
            -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy), u18 (copy), u23 (copy), u21 (copy), KnitClient (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local myClanId = u11.store.Clans.myClanId;

            if myClanId == "" or not myClanId then
                return nil;
            end;

            local v24 = nil;
            local myClan2 = u11.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.name;
            end;

            local v25;

            if u18.name == myClan2 then
                v25 = v24;
            else
                v25 = {};

                if type(v24) == "table" then
                    for i, v in v24 do
                        v25[i] = v;
                    end;
                end;

                v25.name = u18.name;
            end;

            local tag = u18.tag;

            if tag ~= "" and tag then
                local myClan3 = u11.store.Clans.myClan;

                if myClan3 ~= nil then
                    myClan3 = myClan3.tag;
                end;

                tag = u18.tag ~= myClan3;
            end;

            local v26;

            if tag == "" or not tag then
                v26 = v25;
            else
                if #u18.tag < 2 then
                    u23("Your clan tag must be at least 2 characters.");

                    return nil;
                end;

                v26 = {};

                if type(v25) == "table" then
                    for i, v in v25 do
                        v26[i] = v;
                    end;
                end;

                v26.tag = u18.tag;
            end;

            local myClan3 = u11.store.Clans.myClan;

            if myClan3 ~= nil then
                myClan3 = myClan3.introduction;
            end;

            local v27;

            if u18.introduction == myClan3 then
                v27 = v26;
            else
                v27 = {};

                if type(v26) == "table" then
                    for i, v in v26 do
                        v27[i] = v;
                    end;
                end;

                v27.introduction = u18.introduction;
            end;

            local myClan4 = u11.store.Clans.myClan;

            if myClan4 ~= nil then
                myClan4 = myClan4.announcement;
            end;

            local v28;

            if u18.announcement == myClan4 then
                v28 = v27;
            else
                v28 = {};

                if type(v27) == "table" then
                    for i, v in v27 do
                        v28[i] = v;
                    end;
                end;

                v28.announcement = u18.announcement;
            end;

            local myClan5 = u11.store.Clans.myClan;

            if myClan5 ~= nil then
                myClan5 = myClan5.privacySetting;
            end;

            local v29;

            if u18.privacySetting == myClan5 then
                v29 = v28;
            else
                v29 = {};

                if type(v28) == "table" then
                    for i, v in v28 do
                        v29[i] = v;
                    end;
                end;

                v29.privacySetting = u18.privacySetting;
            end;

            local myClan6 = u11.store.Clans.myClan;

            if myClan6 ~= nil then
                myClan6 = myClan6.minClanWarLeaderRankSetting;
            end;

            local v30;

            if u18.minClanWarLeaderRankSetting == myClan6 then
                v30 = v29;
            else
                v30 = {};

                if type(v29) == "table" then
                    for i, v in v29 do
                        v30[i] = v;
                    end;
                end;

                v30.minClanWarLeaderRankSetting = u18.minClanWarLeaderRankSetting;
            end;

            if v30 then
                u23("");
                u21(true);
                KnitClient.Controllers.ClanController:updateClanInfo(v30, u11.store.Clans.myClanId):andThen(function(p31) -- Line: 190
                    -- upvalues: u21 (ref), SoundManager (ref), GameSound (ref), u23 (ref)
                    u21(false);

                    if p31.success then
                        SoundManager:playSound(GameSound.ARMOR_EQUIP);

                        return;
                    end;

                    local errorMessage = p31.errorMessage;

                    if errorMessage ~= "" and errorMessage then
                        u23(p31.errorMessage);
                    end;
                end);
            end;
        end;

        local function v37() -- Line: 204
            -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy), StringUtil (ref), ClanUtil (ref), PlaceUtil (ref), Flamework (ref), BedwarsAppIds (ref), Theme (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local myClanId = u11.store.Clans.myClanId;

            if myClanId == "" or not myClanId then
                return nil;
            end;

            local v33 = StringUtil.fromNow(os.time() + ClanUtil.CLAN_MARKED_DELETE_GRACE_PERIOD, {
                weeks = false,
                seperator = "",
                seconds = PlaceUtil.isDevTesting() and true or false
            });
            local v34 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
            local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
            local v35 = {
                Title = "Delete Clan?"
            };
            local myClan2 = u11.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.tag;
            end;

            v35.Body = "Are you sure you want to delete the <font transparency=\"0\"><b>[" .. tostring(myClan2) .. "]</b></font> clan?\n\t\t\t This clan will be marked for deletion and deleted after a grace period of " .. v33 .. ".\n\t\t\t You\'ll be able to cancel anytime before the grace period.";
            v35.PrimaryBtnProps = {
                Text = "Delete",
                BackgroundColor3 = Theme.backgroundError
            };
            v35.SecondaryBtnProps = {
                Text = "Cancel"
            };

            function v35.OnPrimaryBtnClick(p36) -- Line: 235
                -- upvalues: u11 (ref), KnitClient (ref)
                local myClanId2 = u11.store.Clans.myClanId;

                if myClanId2 == "" or not myClanId2 then
                    return nil;
                end;

                KnitClient.Controllers.ClanController:deleteClan(u11.store.Clans.myClanId);
            end;

            function v35.OnSecondaryBtnClick() -- Line: 242
                -- upvalues: Flamework (ref), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
            end;

            v34:openApp(CONFIRMATION_MODAL, v35);
        end;

        local function v41() -- Line: 247
            -- upvalues: SoundManager (ref), GameSound (ref), u11 (copy), Flamework (ref), BedwarsAppIds (ref), Theme (ref), KnitClient (ref), UILayers (ref)
            SoundManager:playSound(GameSound.UI_CLICK);
            local myClanId = u11.store.Clans.myClanId;

            if myClanId == "" or not myClanId then
                return nil;
            end;

            local v38 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
            local CONFIRMATION_MODAL = BedwarsAppIds.CONFIRMATION_MODAL;
            local v39 = {
                Title = "Cancel Delete Clan?"
            };
            local myClan2 = u11.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.tag;
            end;

            v39.Body = "Are you sure you want to cancel an in-progress delete for the <font transparency=\"0\"><b>[" .. tostring(myClan2) .. "]</b></font> clan? You can\'t undo this action.";
            v39.PrimaryBtnProps = {
                Text = "Cancel Delete",
                BackgroundColor3 = Theme.backgroundSuccess
            };
            v39.SecondaryBtnProps = {
                Text = "Close"
            };

            function v39.OnPrimaryBtnClick(p40) -- Line: 271
                -- upvalues: u11 (ref), KnitClient (ref)
                local myClanId2 = u11.store.Clans.myClanId;

                if myClanId2 == "" or not myClanId2 then
                    return nil;
                end;

                KnitClient.Controllers.ClanController:cancelDeleteClan(u11.store.Clans.myClanId);
            end;

            function v39.OnSecondaryBtnClick() -- Line: 278
                -- upvalues: Flamework (ref), UILayers (ref)
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(UILayers.OVERLAY);
            end;

            v38:openApp(CONFIRMATION_MODAL, v39);
        end;

        local function u44(u42) -- Line: 283
            -- upvalues: default (ref), u11 (copy), u16 (copy), Flamework (ref)
            default.Client:GetNamespace("Clans"):Get("SelectClanBorder"):CallServerAsync(u11.Clan.id, u42):andThen(function(p43) -- Line: 284
                -- upvalues: u16 (ref), u42 (copy), Flamework (ref)
                if p43.success then
                    u16(u42);

                    return;
                end;

                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = p43.errorMessage
                });
            end);
        end;

        local myClanMember = u11.store.Clans.myClanMember;

        if myClanMember then
            local myClanMember2 = u11.store.Clans.myClanMember;

            if myClanMember2 ~= nil then
                myClanMember2 = myClanMember2.rank;
            end;

            myClanMember = ClanMemberRank.LEADER <= myClanMember2;
        end;

        local v45 = {
            Title = "MANAGEMENT"
        };
        local v46 = {};
        local v47 = u11.store.Clans.myClanId ~= nil;

        if v47 then
            local v48 = {
                ClanId = u11.store.Clans.myClanId
            };
            local myClan2 = u11.store.Clans.myClan;

            if myClan2 ~= nil then
                myClan2 = myClan2.image;
            end;

            v48.CurrentEmblem = myClan2;
            v47 = u3.createElement(ClanManagementEmblemUpload, v48);
        end;

        local v49 = {
            AdditionalSpace = 60,
            ScrollingFrameProps = {
                LayoutOrder = 2
            }
        };
        local v50 = { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0, 10)
            }), u3.createElement("UIPadding", {
                PaddingRight = UDim.new(0.05, 0)
            }) };
        local v51 = #v50;

        if v47 then
            v50[v51 + 1] = v47;
        end;

        local v52 = #v50;
        v50[v52 + 1] = u3.createElement(DividerComponent, {
            Direction = "X",
            LayoutOrder = 1.5,
            BarColor = {
                Transparency = 0.8
            }
        });
        v50[v52 + 2] = u3.createElement(HostPanelSetting, {
            Name = "Clan Name",
            LayoutOrder = 2,
            Hint = "(Max " .. tostring(ClanUtil.CLAN_NAME_CHAR_LIMIT) .. " Characters)"
        }, { u3.createElement(HostPanelTextBox, {
                PlaceholderText = "Your clan name",
                MaxCharacters = ClanUtil.CLAN_NAME_CHAR_LIMIT,
                Text = u18.name,

                OnFocusLost = function(p53) -- Line: 357, Name: OnFocusLost
                    -- upvalues: u18 (copy), u19 (copy)
                    local v54 = {};

                    for i, v in u18 do
                        v54[i] = v;
                    end;

                    v54.name = p53;
                    u19(v54);
                end
            }) });
        v50[v52 + 3] = u3.createElement(HostPanelSetting, {
            Name = "Clan Tag",
            LayoutOrder = 3,
            Hint = "(" .. tostring(ClanUtil.CLAN_TAG_MIN_CHAR_LIMIT) .. "-" .. tostring(ClanUtil.CLAN_TAG_MAX_CHAR_LIMIT) .. " Characters)"
        }, { u3.createElement(HostPanelTextBox, {
                PlaceholderText = "Your clan tag",
                MaxCharacters = ClanUtil.CLAN_TAG_MAX_CHAR_LIMIT,
                Text = u18.tag,

                OnFocusLost = function(p55) -- Line: 376, Name: OnFocusLost
                    -- upvalues: u18 (copy), u19 (copy)
                    local v56 = {};

                    for i, v in u18 do
                        v56[i] = v;
                    end;

                    v56.tag = p55;
                    u19(v56);
                end
            }) });
        v50.ClanIntroductionWrapper = u3.createElement(Empty, {
            LayoutOrder = 4,
            Size = UDim2.new(1, 0, 0, 100)
        }, { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }), u3.createElement(HostPanelTextBox, {
                Size = UDim2.new(1, 0, 0.9, -14),
                MaxCharacters = ClanUtil.CLAN_INTRO_CHAR_LIMIT,
                Text = u18.introduction,
                PlaceholderText = "Please enter an introduction for non-clan-members viewing your clan.",
                Label = "Clan Introduction",

                OnFocusLost = function(p57) -- Line: 401, Name: OnFocusLost
                    -- upvalues: u18 (copy), u19 (copy)
                    local v58 = {};

                    for i, v in u18 do
                        v58[i] = v;
                    end;

                    v58.introduction = p57;
                    u19(v58);
                end,

                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                MultiLine = true,
                [u3.Ref] = v13,
                LayoutOrder = 1
            }, {
                uipadding = u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                })
            }), u3.createElement(TextBoxCharacterCounter, {
                AutomaticSize = "Y",
                SizeConstraint = "RelativeXX",
                TextSize = 12,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 14),
                TextXAlignment = Enum.TextXAlignment.Right,
                TextBox = v13,
                MaxCharCount = ClanUtil.CLAN_INTRO_CHAR_LIMIT
            }) });
        v50.ClanAnnouncementWrapper = u3.createElement(Empty, {
            LayoutOrder = 5,
            Size = UDim2.new(1, 0, 0, 100)
        }, { u3.createElement("UIListLayout", {
                FillDirection = "Vertical",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.1, 0)
            }), u3.createElement(HostPanelTextBox, {
                Size = UDim2.new(1, 0, 0.9, -14),
                MaxCharacters = ClanUtil.ANNOUNCEMENT_INTRO_CHAR_LIMIT,
                Text = u18.announcement,
                PlaceholderText = "Please enter an announcement for your clan members.",
                Label = "Clan Announcement",

                OnFocusLost = function(p59) -- Line: 452, Name: OnFocusLost
                    -- upvalues: u18 (copy), u19 (copy)
                    local v60 = {};

                    for i, v in u18 do
                        v60[i] = v;
                    end;

                    v60.announcement = p59;
                    u19(v60);
                end,

                Font = "Roboto",
                TextXAlignment = "Left",
                TextYAlignment = "Top",
                MultiLine = true,
                [u3.Ref] = v14,
                LayoutOrder = 1
            }, {
                uipadding = u3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 10),
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10)
                }),
                u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                })
            }), u3.createElement(TextBoxCharacterCounter, {
                TextSize = 12,
                LayoutOrder = 2,
                Size = UDim2.new(1, 0, 0, 14),
                TextXAlignment = Enum.TextXAlignment.Right,
                TextBox = v14,
                MaxCharCount = ClanUtil.ANNOUNCEMENT_INTRO_CHAR_LIMIT
            }) });
        local v61 = {
            Name = "Privacy Setting",
            Hint = "(\"Anyone Can Join\" will allow players to join the clan from the clan browser)",
            ThemeColor = Theme.backgroundPrimary,
            FrameProps = {
                LayoutOrder = 6
            }
        };
        local v62 = {};
        local v63 = u2.values(ClanPrivacySetting);

        local function v65(p64) -- Line: 497
            -- upvalues: u3 (ref), ToggleButton (ref)
            return u3.createElement(ToggleButton, {
                Value = p64,
                Text = string.upper(table.concat(string.split(p64, "_"), " "))
            });
        end;

        local v66 = table.create(#v63);

        for i, v in v63 do
            v66[i] = v65(v, i - 1, v63);
        end;

        local v69 = {
            Value = u18.privacySetting or ClanPrivacySetting.ANYONE_CAN_JOIN,

            OnChange = function(p67) -- Line: 511, Name: OnChange
                -- upvalues: u18 (copy), u19 (copy)
                local v68 = {};

                for i, v in u18 do
                    v68[i] = v;
                end;

                v68.privacySetting = p67;
                u19(v68);
            end
        };
        local v70 = {};
        local v71 = #v70;

        for i, v in v66 do
            v70[v71 + i] = v;
        end;

        v62[#v62 + 1] = u3.createElement(ToggleButtonGroup, v69, v70);
        v50[v52 + 4] = u3.createElement(SettingRow, v61, v62);
        local v72 = {
            Name = "Minimum Clan War Party Leader Rank",
            Hint = "To queue for a Clan War match, the party leader must be above this rank",
            ThemeColor = Theme.backgroundPrimary,
            FrameProps = {
                LayoutOrder = 7
            }
        };
        local v73 = {};
        local v74 = {};
        local minClanWarLeaderRankSetting = u18.minClanWarLeaderRankSetting;

        if minClanWarLeaderRankSetting == nil then
            minClanWarLeaderRankSetting = ClanMemberRank.MEMBER;
        end;

        v74.Value = u9[minClanWarLeaderRankSetting];

        function v74.OnChange(p75) -- Line: 544
            -- upvalues: u18 (copy), u10 (ref), u19 (copy)
            local v76 = {};

            for i, v in u18 do
                v76[i] = v;
            end;

            v76.minClanWarLeaderRankSetting = u10[p75];
            u19(v76);
        end;

        local function _(p77) -- Line: 552
            -- upvalues: u3 (ref), ToggleButton (ref)
            return u3.createElement(ToggleButton, {
                Value = p77,
                Text = p77
            });
        end;

        local v78 = table.create(#u8);

        for i, v in u8 do
            local _ = i - 1;
            v78[i] = u3.createElement(ToggleButton, {
                Value = v,
                Text = v
            });
        end;

        local v79 = {};
        local v80 = #v79;

        for i, v in v78 do
            v79[v80 + i] = v;
        end;

        v73[#v73 + 1] = u3.createElement(ToggleButtonGroup, v74, v79);
        v50[v52 + 5] = u3.createElement(SettingRow, v72, v73);
        local v81 = {
            LayoutOrder = 8,
            Size = UDim2.new(1, 0, 0, 35)
        };
        local v82 = { u3.createElement("UIListLayout", {
                FillDirection = "Horizontal",
                HorizontalAlignment = "Right",
                VerticalAlignment = "Center",
                SortOrder = "LayoutOrder",
                Padding = UDim.new(0.05, 0)
            }) };
        local v83 = #v82;
        local v84;

        if v22 == "" then
            v84 = false;
        else
            v84 = u3.createElement("Frame", {
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.7, 1),
                BackgroundColor3 = ColorUtil.hexColor(16735324)
            }, { u3.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 6)
                }), u3.createElement("TextLabel", {
                    TextScaled = true,
                    RichText = true,
                    Font = "Roboto",
                    BackgroundTransparency = 1,
                    TextXAlignment = "Center",
                    TextYAlignment = "Center",
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Text = "<b>Error:</b> " .. v22,
                    TextColor3 = ColorUtil.WHITE
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) });
        end;

        if v84 then
            v82[v83 + 1] = v84;
        end;

        v82[#v82 + 1] = u3.createElement(ButtonComponent, {
            Text = "<b>Save Changes</b>",
            Selectable = false,
            LayoutOrder = 2,
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.new(0.25, 0, 0, 30),
            BackgroundColor3 = Theme.backgroundSuccess,
            OnClick = v20 and function() -- Line: 623
            end or v32,
            Loading = v20
        });
        v50.FormActions = u3.createElement(Empty, v81, v82);
        v50[v52 + 6] = u3.createElement(DividerComponent, {
            Direction = "X",
            LayoutOrder = 9,
            BarColor = {
                Transparency = 0.8
            }
        });
        local v85 = {
            LayoutOrder = 10,
            AutomaticSize = "Y",
            Size = UDim2.new(1, 0, 0, 200)
        };
        local v86 = { u3.createFragment({ u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 6)
                }), u3.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Text = "Clan Border",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    Size = UDim2.fromScale(1, 0),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                    TextColor3 = ColorUtil.WHITE
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) }) };
        local borders = u11.Clan.borders;
        local v87;

        if borders == nil then
            v87 = borders;
        else
            local function v94(u88) -- Line: 667
                -- upvalues: u3 (ref), Empty (ref), u15 (copy), Theme (ref), ClanBorderMeta (ref), u44 (copy)
                local createElement = u3.createElement;
                local v89 = {
                    Size = UDim2.fromOffset(120, 120)
                };
                local v90 = {};
                local v91 = "SelectBorder-" .. tostring(u88);
                local createElement2 = u3.createElement;
                local v92 = {
                    Size = UDim2.fromScale(1, 1),
                    BorderSizePixel = u88 == u15 and 3 or 0,
                    BorderMode = "Outline"
                };
                local v93;

                if u88 == u15 then
                    v93 = Theme.buttonPrimary;
                else
                    v93 = nil;
                end;

                v92.BorderColor3 = v93;
                v92.BackgroundTransparency = 1;
                v92.Image = ClanBorderMeta[u88].borderImage;

                v92[u3.Event.TouchTap] = function() -- Line: 678
                    -- upvalues: u44 (ref), u88 (copy)
                    u44(u88);
                end;

                v92[u3.Event.MouseButton1Click] = function() -- Line: 681
                    -- upvalues: u44 (ref), u88 (copy)
                    u44(u88);
                end;

                v90[v91] = createElement2("ImageButton", v92);

                return createElement(Empty, v89, v90);
            end;

            v87 = table.create(#borders);

            for i, v in borders do
                v87[i] = v94(v, i - 1, borders);
            end;
        end;

        local v95 = {
            AutomaticSize = "Y",
            SizeConstraint = "RelativeXX",
            Size = UDim2.new(1, 0, 0, 150)
        };
        local v96 = { u3.createElement("UIListLayout", {
                HorizontalFlex = "SpaceEvenly",
                VerticalFlex = "SpaceEvenly",
                FillDirection = "Horizontal",
                Padding = UDim.new(0, 6)
            }) };
        local v97 = #v96;

        if v87 then
            for i, v in v87 do
                v96[v97 + i] = v;
            end;
        end;

        local v98 = #v96;
        local v99;

        if u11.Clan.borders == nil then
            v99 = u3.createElement("TextLabel", {
                Text = "No clan borders owned",
                BackgroundTransparency = 1
            });
        else
            v99 = false;
        end;

        if v99 then
            v96[v98 + 1] = v99;
        end;

        v86[#v86 + 1] = u3.createElement(Empty, v95, v96);
        v50.ClanBorderSelection = u3.createElement(Empty, v85, v86);
        v50[v52 + 7] = u3.createElement(DividerComponent, {
            Direction = "X",
            LayoutOrder = 11,
            BarColor = {
                Transparency = 0.8
            }
        });
        local v100 = {
            LayoutOrder = 12,
            Size = UDim2.new(1, 0, 0, 100)
        };
        local v101 = { u3.createFragment({ u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 6)
                }), u3.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Text = "Clan HQ",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    Size = UDim2.fromScale(1, 0),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                    TextColor3 = ColorUtil.WHITE
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) }) };
        local v102 = {
            Size = UDim2.new(1, 0, 0, 66)
        };
        local v103 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                Padding = UDim.new(0, 6)
            }) };
        local v104 = #v103;
        local v105 = {
            Size = UDim2.fromScale(0.75, 1)
        };
        local myClan2 = u11.store.Clans.myClan;

        if myClan2 ~= nil then
            myClan2 = myClan2.clanHq;

            if myClan2 ~= nil then
                myClan2 = myClan2.selectedLobbyMusic;
            end;
        end;

        if myClan2 == nil then
            myClan2 = ClanHqBackgroundMusicType.DEFAULT;
        end;

        v105.Text = "Currently Selected: " .. getClanHqBackgroundMusicMeta(myClan2).title;
        v105.TextScaled = true;
        v105.RichText = true;
        v105.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family);
        v105.TextColor3 = ColorUtil.WHITE;
        v105.BackgroundTransparency = 1;
        v105.TextXAlignment = "Left";
        local v106 = {
            Size = UDim2.new(1, 0, 0, 30)
        };
        local v107 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6)
            }),
            u3.createElement(ButtonComponent, {
                Text = "<b>Select Music</b>",

                OnClick = function() -- Line: 800, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClanHqSelectorType (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_HQ_SELECTOR_APP, {
                        type = ClanHqSelectorType.BACKGROUND_MUSIC
                    });
                end,

                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Theme.buttonPrimary
            }),
            [#v107 + 1] = u3.createElement("TextLabel", v105, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        v103[v104 + 1] = u3.createElement(Empty, v106, v107);
        local v108 = {
            Size = UDim2.fromScale(0.75, 1)
        };
        local myClan3 = u11.store.Clans.myClan;

        if myClan3 ~= nil then
            myClan3 = myClan3.clanHq;

            if myClan3 ~= nil then
                myClan3 = myClan3.selectedSykbox;
            end;
        end;

        if myClan3 == nil then
            myClan3 = ClanHqSkyboxType.DEFAULT;
        end;

        v108.Text = "Currently Selected: " .. getClanHqSkyboxMeta(myClan3).title;
        v108.TextScaled = true;
        v108.RichText = true;
        v108.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family);
        v108.TextColor3 = ColorUtil.WHITE;
        v108.BackgroundTransparency = 1;
        v108.TextXAlignment = "Left";
        local v109 = {
            Size = UDim2.new(1, 0, 0, 30)
        };
        local v110 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6)
            }),
            u3.createElement(ButtonComponent, {
                Text = "<b>Select Skybox</b>",

                OnClick = function() -- Line: 847, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClanHqSelectorType (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_HQ_SELECTOR_APP, {
                        type = ClanHqSelectorType.SKYBOX
                    });
                end,

                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Theme.buttonPrimary
            }),
            [#v110 + 1] = u3.createElement("TextLabel", v108, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        v103[v104 + 2] = u3.createElement(Empty, v109, v110);
        v101[#v101 + 1] = u3.createElement(Empty, v102, v103);
        v50.ClanHQSettingsWrapper = u3.createElement(Empty, v100, v101);
        v50[v52 + 8] = u3.createElement(DividerComponent, {
            Direction = "X",
            LayoutOrder = 13,
            BarColor = {
                Transparency = 0.8
            }
        });
        local v111 = {
            LayoutOrder = 14,
            Size = UDim2.new(1, 0, 0, 130)
        };
        local v112 = { u3.createFragment({ u3.createElement("UIListLayout", {
                    FillDirection = "Vertical",
                    Padding = UDim.new(0, 6)
                }), u3.createElement("TextLabel", {
                    AutomaticSize = "Y",
                    SizeConstraint = "RelativeXX",
                    Text = "Clan Settings",
                    TextScaled = true,
                    RichText = true,
                    BackgroundTransparency = 1,
                    TextXAlignment = "Left",
                    Size = UDim2.fromScale(1, 0),
                    FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                    TextColor3 = ColorUtil.WHITE
                }, { u3.createElement("UITextSizeConstraint", {
                        MaxTextSize = 18
                    }) }) }) };
        local v113 = #v112;
        local v114 = {
            Size = UDim2.fromScale(0.75, 1)
        };
        local myClan4 = u11.store.Clans.myClan;

        if myClan4 ~= nil then
            myClan4 = myClan4.clanLobby;

            if myClan4 ~= nil then
                myClan4 = myClan4.selectedPodiumBanner;
            end;
        end;

        if myClan4 == nil then
            myClan4 = ClanPodiumBannerType.DEFAULT;
        end;

        v114.Text = "Currently Selected: " .. getClanPodiumBannerMeta(myClan4).title;
        v114.TextScaled = true;
        v114.RichText = true;
        v114.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family);
        v114.TextColor3 = ColorUtil.WHITE;
        v114.BackgroundTransparency = 1;
        v114.TextXAlignment = Enum.TextXAlignment.Left;
        local v115 = {
            Size = UDim2.new(1, 0, 0, 30)
        };
        local v116 = {
            u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6)
            }),
            u3.createElement(ButtonComponent, {
                Text = "<b>Select Podium Banner</b>",

                OnClick = function() -- Line: 932, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClanLobbySelectorType (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_LOBBY_SELECTOR_APP, {
                        type = ClanLobbySelectorType.PODIUM_BANNER
                    });
                end,

                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Theme.buttonPrimary
            }),
            [#v116 + 1] = u3.createElement("TextLabel", v114, { u3.createElement("UITextSizeConstraint", {
                    MaxTextSize = 18
                }) })
        };
        v112[v113 + 1] = u3.createElement(Empty, v115, v116);
        local v117 = {
            Size = UDim2.new(1, 0, 0, 30)
        };
        local v118 = { u3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 6)
            }), u3.createElement(ButtonComponent, {
                Text = "<b>Select Clan Tag Color</b>",

                OnClick = function() -- Line: 958, Name: OnClick
                    -- upvalues: Flamework (ref), BedwarsAppIds (ref), ClanLobbySelectorType (ref)
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.CLAN_LOBBY_SELECTOR_APP, {
                        type = ClanLobbySelectorType.CLAN_TAG_COLOR
                    });
                end,

                Size = UDim2.fromScale(0.25, 1),
                BackgroundColor3 = Theme.buttonPrimary
            }) };
        local v119 = {
            Size = UDim2.fromScale(0.75, 1)
        };
        local myClan5 = u11.store.Clans.myClan;

        if myClan5 ~= nil then
            myClan5 = myClan5.selectedChatTagColor;

            if myClan5 ~= nil then
                myClan5 = myClan5.chatTagColorOption;
            end;
        end;

        if myClan5 == nil then
            myClan5 = ClanChatTagColorOptions.Default;
        end;

        v119.Text = "Currently Selected: " .. ChatTagColorDefinition[myClan5].name;
        v119.TextScaled = true;
        v119.RichText = true;
        v119.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family);
        v119.TextColor3 = ColorUtil.WHITE;
        v119.BackgroundTransparency = 1;
        v119.TextXAlignment = Enum.TextXAlignment.Left;
        v118[#v118 + 1] = u3.createElement("TextLabel", v119, { u3.createElement("UITextSizeConstraint", {
                MaxTextSize = 18
            }) });
        v112[v113 + 2] = u3.createElement(Empty, v117, v118);
        v50.ClanLobbySettingsWrapper = u3.createElement(Empty, v111, v112);
        v50[v52 + 9] = u3.createElement(DividerComponent, {
            Direction = "X",
            LayoutOrder = 15,
            BarColor = {
                Transparency = 0.8
            }
        });
        local v120;

        if myClanMember then
            local v121 = {
                Text = "<b>Delete Clan</b>",
                Selectable = false,
                LayoutOrder = 16,
                Size = UDim2.new(0.25, 0, 0, 30),
                BackgroundColor3 = Theme.backgroundError,
                OnClick = v37
            };
            local Clan = u11.Clan;

            if Clan ~= nil then
                Clan = Clan.timeToDelete;
            end;

            v121.Disabled = Clan ~= nil;
            v120 = u3.createElement(ButtonComponent, v121);
        else
            v120 = myClanMember;
        end;

        if v120 then
            v50[v52 + 10] = v120;
        end;

        local v122 = #v50;

        if myClanMember then
            local Clan = u11.Clan;

            if Clan ~= nil then
                Clan = Clan.timeToDelete;
            end;

            myClanMember = Clan ~= nil and u3.createFragment({
                MarkedDeleteContainer = u3.createElement(Empty, {
                    LayoutOrder = 17,
                    Size = UDim2.new(1, 0, 0, 30)
                }, { u3.createElement("UIListLayout", {
                        FillDirection = "Horizontal",
                        Padding = UDim.new(0, 6)
                    }), u3.createElement(ButtonComponent, {
                        Text = "<b>Cancel Delete Clan</b>",
                        Selectable = false,
                        LayoutOrder = 10,
                        Size = UDim2.new(0.25, 0, 1, 0),
                        BackgroundColor3 = Theme.backgroundError,
                        OnClick = v41
                    }), u3.createElement(Countdown, {
                        PreText = "Clan deleting in:\n",
                        OnCompleteText = "Clan has been deleted",
                        EndTime = u11.Clan.timeToDelete,
                        TextLabel = {
                            Size = UDim2.new(0.25, 0, 1, 0)
                        }
                    }) })
            });
        end;

        if myClanMember then
            v50[v122 + 1] = myClanMember;
        end;

        v46[#v46 + 1] = u3.createElement(AutoCanvasScrollingFrame, v49, v50);

        return u3.createElement(ClanProfilePageLayout, v45, v46);
    end)
};