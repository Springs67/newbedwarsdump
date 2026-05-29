local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ButtonComponent
local u6 = v3.ColorUtil
local u7 = v3.Countdown
local u8 = v3.DividerComponent
local u9 = v3.Empty
local u10 = v3.SoundManager
local u11 = v3.StringUtil
local u12 = v3.UILayers
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "gift", "ui", "gifting", "gifting-form", "text-box-character-counter").TextBoxCharacterCounter
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button").ToggleButton
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "button-group", "toggle-button-group").ToggleButtonGroup
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "settings", "setting-row").SettingRow
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-border-meta")
local u25 = v24.ClanBorderMeta
local u26 = v24.ClanBorderType
local v27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color")
local u28 = v27.ChatTagColorDefinition
local u29 = v27.ClanChatTagColorOptions
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-member").ClanMemberRank
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-privacy-setting").ClanPrivacySetting
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-skybox-meta").getClanHqSkyboxMeta
local v35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-types")
local u36 = v35.ClanHqBackgroundMusicType
local u37 = v35.ClanHqSkyboxType
local u38 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-meta").getClanPodiumBannerMeta
local u39 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-types").ClanPodiumBannerType
local u40 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u41 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u42 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u43 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u44 = v1.import(script, script.Parent.Parent, "clan-profile-page-layout").ClanProfilePageLayout
local u45 = v1.import(script, script.Parent, "clan-hq", "clan-hq-selector-type").ClanHqSelectorType
local u46 = v1.import(script, script.Parent, "clan-lobby", "clan-lobby-selector-type").ClanLobbySelectorType
local u47 = v1.import(script, script.Parent, "clan-management-emblem-upload").ClanManagementEmblemUpload
local u48 = {
    "Member",
    "Officer",
    "Admin",
    "Leader"
}
local u49 = {
    [u30.MEMBER] = "Member",
    [u30.OFFICER] = "Officer",
    [u30.ADMIN] = "Admin",
    [u30.LEADER] = "Leader"
}
local u50 = {
    ["Member"] = u30.MEMBER,
    ["Officer"] = u30.OFFICER,
    ["Admin"] = u30.ADMIN,
    ["Leader"] = u30.LEADER
}
return {
    ["ClanProfileManagementTab"] = v16.new(u15)(function(u51, p52) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u26
            [3] = u10
            [4] = u41
            [5] = u13
            [6] = u11
            [7] = u32
            [8] = u43
            [9] = u2
            [10] = u23
            [11] = u42
            [12] = u12
            [13] = u40
            [14] = u30
            [15] = u47
            [16] = u8
            [17] = u17
            [18] = u18
            [19] = u9
            [20] = u19
            [21] = u14
            [22] = u31
            [23] = u20
            [24] = u21
            [25] = u22
            [26] = u49
            [27] = u50
            [28] = u48
            [29] = u6
            [30] = u5
            [31] = u25
            [32] = u36
            [33] = u33
            [34] = u45
            [35] = u37
            [36] = u34
            [37] = u39
            [38] = u38
            [39] = u46
            [40] = u28
            [41] = u29
            [42] = u7
            [43] = u4
            [44] = u44
        --]]
        local v53 = p52.useState
        local v54 = u15.createRef()
        local v55 = u15.createRef()
        local v56 = u51.Clan.selectedBorder
        if v56 == nil then
            v56 = u26.NONE
        end
        local u57, u58 = v53(v56)
        local v59 = {}
        local v60 = u51.store.Clans.myClan
        if type(v60) == "table" then
            for v61, v62 in v60 do
                v59[v61] = v62
            end
        end
        local u63, u64 = v53(v59)
        local v65, u66 = v53(false)
        local v67, u68 = v53("")
        local function v104() --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u41
                [3] = u51
                [4] = u63
                [5] = u68
                [6] = u66
                [7] = u13
            --]]
            u10:playSound(u41.UI_CLICK)
            local v69 = u51.store.Clans.myClanId
            if v69 == "" or not v69 then
                return nil
            end
            local v70 = nil
            local v71 = u63.name
            local v72 = u51.store.Clans.myClan
            if v72 ~= nil then
                v72 = v72.name
            end
            local v73
            if v71 == v72 then
                v73 = v70
            else
                v73 = {}
                if type(v70) == "table" then
                    for v74, v75 in v70 do
                        v73[v74] = v75
                    end
                end
                v73.name = u63.name
            end
            local v76 = u63.tag
            if v76 ~= "" and v76 then
                local v77 = u63.tag
                local v78 = u51.store.Clans.myClan
                if v78 ~= nil then
                    v78 = v78.tag
                end
                v76 = v77 ~= v78
            end
            local v79
            if v76 == "" or not v76 then
                v79 = v73
            else
                if #u63.tag < 2 then
                    u68("Your clan tag must be at least 2 characters.")
                    return nil
                end
                v79 = {}
                if type(v73) == "table" then
                    for v80, v81 in v73 do
                        v79[v80] = v81
                    end
                end
                v79.tag = u63.tag
            end
            local v82 = u63.introduction
            local v83 = u51.store.Clans.myClan
            if v83 ~= nil then
                v83 = v83.introduction
            end
            local v84
            if v82 == v83 then
                v84 = v79
            else
                v84 = {}
                if type(v79) == "table" then
                    for v85, v86 in v79 do
                        v84[v85] = v86
                    end
                end
                v84.introduction = u63.introduction
            end
            local v87 = u63.announcement
            local v88 = u51.store.Clans.myClan
            if v88 ~= nil then
                v88 = v88.announcement
            end
            local v89
            if v87 == v88 then
                v89 = v84
            else
                v89 = {}
                if type(v84) == "table" then
                    for v90, v91 in v84 do
                        v89[v90] = v91
                    end
                end
                v89.announcement = u63.announcement
            end
            local v92 = u63.privacySetting
            local v93 = u51.store.Clans.myClan
            if v93 ~= nil then
                v93 = v93.privacySetting
            end
            local v94
            if v92 == v93 then
                v94 = v89
            else
                v94 = {}
                if type(v89) == "table" then
                    for v95, v96 in v89 do
                        v94[v95] = v96
                    end
                end
                v94.privacySetting = u63.privacySetting
            end
            local v97 = u63.minClanWarLeaderRankSetting
            local v98 = u51.store.Clans.myClan
            if v98 ~= nil then
                v98 = v98.minClanWarLeaderRankSetting
            end
            local v99
            if v97 == v98 then
                v99 = v94
            else
                v99 = {}
                if type(v94) == "table" then
                    for v100, v101 in v94 do
                        v99[v100] = v101
                    end
                end
                v99.minClanWarLeaderRankSetting = u63.minClanWarLeaderRankSetting
            end
            if v99 then
                u68("")
                u66(true)
                u13.Controllers.ClanController:updateClanInfo(v99, u51.store.Clans.myClanId):andThen(function(p102) --[[ Line: 190 ]]
                    --[[
                    Upvalues:
                        [1] = u66
                        [2] = u10
                        [3] = u41
                        [4] = u68
                    --]]
                    u66(false)
                    if p102.success then
                        u10:playSound(u41.ARMOR_EQUIP)
                    else
                        local v103 = p102.errorMessage
                        if v103 ~= "" and v103 then
                            u68(p102.errorMessage)
                        end
                    end
                end)
            end
        end
        local function v112() --[[ Line: 204 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u41
                [3] = u51
                [4] = u11
                [5] = u32
                [6] = u43
                [7] = u2
                [8] = u23
                [9] = u42
                [10] = u13
                [11] = u12
            --]]
            u10:playSound(u41.UI_CLICK)
            local v105 = u51.store.Clans.myClanId
            if v105 == "" or not v105 then
                return nil
            end
            local v106 = u11.fromNow(os.time() + u32.CLAN_MARKED_DELETE_GRACE_PERIOD, {
                ["weeks"] = false,
                ["seperator"] = "",
                ["seconds"] = u43.isDevTesting() and true or false
            })
            local v107 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v108 = u23.CONFIRMATION_MODAL
            local v109 = {
                ["Title"] = "Delete Clan?"
            }
            local v110 = u51.store.Clans.myClan
            if v110 ~= nil then
                v110 = v110.tag
            end
            v109.Body = "Are you sure you want to delete the <font transparency=\"0\"><b>[" .. tostring(v110) .. "]</b></font> clan?\n\t\t\t This clan will be marked for deletion and deleted after a grace period of " .. v106 .. ".\n\t\t\t You\'ll be able to cancel anytime before the grace period."
            v109.PrimaryBtnProps = {
                ["Text"] = "Delete",
                ["BackgroundColor3"] = u42.backgroundError
            }
            v109.SecondaryBtnProps = {
                ["Text"] = "Cancel"
            }
            function v109.OnPrimaryBtnClick(_) --[[ Line: 235 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u13
                --]]
                local v111 = u51.store.Clans.myClanId
                if v111 == "" or not v111 then
                    return nil
                end
                u13.Controllers.ClanController:deleteClan(u51.store.Clans.myClanId)
            end
            function v109.OnSecondaryBtnClick() --[[ Line: 242 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u12.OVERLAY)
            end
            v107:openApp(v108, v109)
        end
        local function v119() --[[ Line: 247 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u41
                [3] = u51
                [4] = u2
                [5] = u23
                [6] = u42
                [7] = u13
                [8] = u12
            --]]
            u10:playSound(u41.UI_CLICK)
            local v113 = u51.store.Clans.myClanId
            if v113 == "" or not v113 then
                return nil
            end
            local v114 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v115 = u23.CONFIRMATION_MODAL
            local v116 = {
                ["Title"] = "Cancel Delete Clan?"
            }
            local v117 = u51.store.Clans.myClan
            if v117 ~= nil then
                v117 = v117.tag
            end
            v116.Body = "Are you sure you want to cancel an in-progress delete for the <font transparency=\"0\"><b>[" .. tostring(v117) .. "]</b></font> clan? You can\'t undo this action."
            v116.PrimaryBtnProps = {
                ["Text"] = "Cancel Delete",
                ["BackgroundColor3"] = u42.backgroundSuccess
            }
            v116.SecondaryBtnProps = {
                ["Text"] = "Close"
            }
            function v116.OnPrimaryBtnClick(_) --[[ Line: 271 ]]
                --[[
                Upvalues:
                    [1] = u51
                    [2] = u13
                --]]
                local v118 = u51.store.Clans.myClanId
                if v118 == "" or not v118 then
                    return nil
                end
                u13.Controllers.ClanController:cancelDeleteClan(u51.store.Clans.myClanId)
            end
            function v116.OnSecondaryBtnClick() --[[ Line: 278 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u12.OVERLAY)
            end
            v114:openApp(v115, v116)
        end
        local function u122(u120) --[[ Line: 283 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u51
                [3] = u58
                [4] = u2
            --]]
            u40.Client:GetNamespace("Clans"):Get("SelectClanBorder"):CallServerAsync(u51.Clan.id, u120):andThen(function(p121) --[[ Line: 284 ]]
                --[[
                Upvalues:
                    [1] = u58
                    [2] = u120
                    [3] = u2
                --]]
                if p121.success then
                    u58(u120)
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                        ["message"] = p121.errorMessage
                    })
                end
            end)
        end
        local v123 = u51.store.Clans.myClanMember
        if v123 then
            local v124 = u51.store.Clans.myClanMember
            if v124 ~= nil then
                v124 = v124.rank
            end
            v123 = u30.LEADER <= v124
        end
        local v125 = {
            ["Title"] = "MANAGEMENT"
        }
        local v126 = {}
        local v127 = #v126
        local v128 = u51.store.Clans.myClanId ~= nil
        if v128 then
            local v129 = {
                ["ClanId"] = u51.store.Clans.myClanId
            }
            local v130 = u51.store.Clans.myClan
            if v130 ~= nil then
                v130 = v130.image
            end
            v129.CurrentEmblem = v130
            v128 = u15.createElement(u47, v129)
        end
        local v131 = {
            ["AdditionalSpace"] = 60,
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 2
            }
        }
        local v132 = { u15.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }), u15.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v133 = #v132
        if v128 then
            v132[v133 + 1] = v128
        end
        local v134 = #v132
        v132[v134 + 1] = u15.createElement(u8, {
            ["Direction"] = "X",
            ["LayoutOrder"] = 1.5,
            ["BarColor"] = {
                ["Transparency"] = 0.8
            }
        })
        local v135 = v134 + 2
        local v136 = u15.createElement
        local v137 = u17
        local v138 = {
            ["Name"] = "Clan Name",
            ["LayoutOrder"] = 2
        }
        local v139 = u32.CLAN_NAME_CHAR_LIMIT
        v138.Hint = "(Max " .. tostring(v139) .. " Characters)"
        v132[v135] = v136(v137, v138, { u15.createElement(u18, {
                ["PlaceholderText"] = "Your clan name",
                ["MaxCharacters"] = u32.CLAN_NAME_CHAR_LIMIT,
                ["Text"] = u63.name,
                ["OnFocusLost"] = function(p140) --[[ Name: OnFocusLost, Line 357 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u64
                    --]]
                    local v141 = {}
                    for v142, v143 in u63 do
                        v141[v142] = v143
                    end
                    v141.name = p140
                    u64(v141)
                end
            }) })
        local v144 = v134 + 3
        local v145 = u15.createElement
        local v146 = u17
        local v147 = {
            ["Name"] = "Clan Tag",
            ["LayoutOrder"] = 3
        }
        local v148 = u32.CLAN_TAG_MIN_CHAR_LIMIT
        local v149 = tostring(v148)
        local v150 = u32.CLAN_TAG_MAX_CHAR_LIMIT
        v147.Hint = "(" .. v149 .. "-" .. tostring(v150) .. " Characters)"
        v132[v144] = v145(v146, v147, { u15.createElement(u18, {
                ["PlaceholderText"] = "Your clan tag",
                ["MaxCharacters"] = u32.CLAN_TAG_MAX_CHAR_LIMIT,
                ["Text"] = u63.tag,
                ["OnFocusLost"] = function(p151) --[[ Name: OnFocusLost, Line 376 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u64
                    --]]
                    local v152 = {}
                    for v153, v154 in u63 do
                        v152[v153] = v154
                    end
                    v152.tag = p151
                    u64(v152)
                end
            }) })
        v132.ClanIntroductionWrapper = u15.createElement(u9, {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.new(1, 0, 0, 100)
        }, { u15.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }), u15.createElement(u18, {
                ["Size"] = UDim2.new(1, 0, 0.9, -14),
                ["MaxCharacters"] = u32.CLAN_INTRO_CHAR_LIMIT,
                ["Text"] = u63.introduction,
                ["PlaceholderText"] = "Please enter an introduction for non-clan-members viewing your clan.",
                ["Label"] = "Clan Introduction",
                ["OnFocusLost"] = function(p155) --[[ Name: OnFocusLost, Line 401 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u64
                    --]]
                    local v156 = {}
                    for v157, v158 in u63 do
                        v156[v157] = v158
                    end
                    v156.introduction = p155
                    u64(v156)
                end,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["MultiLine"] = true,
                [u15.Ref] = v54,
                ["LayoutOrder"] = 1
            }, {
                ["uipadding"] = u15.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 10),
                    ["PaddingBottom"] = UDim.new(0, 10),
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                }),
                u15.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                })
            }), u15.createElement(u19, {
                ["AutomaticSize"] = "Y",
                ["SizeConstraint"] = "RelativeXX",
                ["TextSize"] = 12,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 14),
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextBox"] = v54,
                ["MaxCharCount"] = u32.CLAN_INTRO_CHAR_LIMIT
            }) })
        v132.ClanAnnouncementWrapper = u15.createElement(u9, {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.new(1, 0, 0, 100)
        }, { u15.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.1, 0)
            }), u15.createElement(u18, {
                ["Size"] = UDim2.new(1, 0, 0.9, -14),
                ["MaxCharacters"] = u32.ANNOUNCEMENT_INTRO_CHAR_LIMIT,
                ["Text"] = u63.announcement,
                ["PlaceholderText"] = "Please enter an announcement for your clan members.",
                ["Label"] = "Clan Announcement",
                ["OnFocusLost"] = function(p159) --[[ Name: OnFocusLost, Line 452 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u64
                    --]]
                    local v160 = {}
                    for v161, v162 in u63 do
                        v160[v161] = v162
                    end
                    v160.announcement = p159
                    u64(v160)
                end,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Top",
                ["MultiLine"] = true,
                [u15.Ref] = v55,
                ["LayoutOrder"] = 1
            }, {
                ["uipadding"] = u15.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 10),
                    ["PaddingBottom"] = UDim.new(0, 10),
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                }),
                u15.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                })
            }), u15.createElement(u19, {
                ["TextSize"] = 12,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 14),
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextBox"] = v55,
                ["MaxCharCount"] = u32.ANNOUNCEMENT_INTRO_CHAR_LIMIT
            }) })
        local v163 = {
            ["Name"] = "Privacy Setting",
            ["Hint"] = "(\"Anyone Can Join\" will allow players to join the clan from the clan browser)",
            ["ThemeColor"] = u42.backgroundPrimary,
            ["FrameProps"] = {
                ["LayoutOrder"] = 6
            }
        }
        local v164 = {}
        local v165 = #v164
        local v166 = u14.values(u31)
        local function v168(p167) --[[ Line: 497 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u20
            --]]
            return u15.createElement(u20, {
                ["Value"] = p167,
                ["Text"] = string.upper(table.concat(string.split(p167, "_"), " "))
            })
        end
        local v169 = table.create(#v166)
        for v170, v171 in v166 do
            v169[v170] = v168(v171, v170 - 1, v166)
        end
        local v176 = {
            ["Value"] = u63.privacySetting or u31.ANYONE_CAN_JOIN,
            ["OnChange"] = function(p172) --[[ Name: OnChange, Line 511 ]]
                --[[
                Upvalues:
                    [1] = u63
                    [2] = u64
                --]]
                local v173 = {}
                for v174, v175 in u63 do
                    v173[v174] = v175
                end
                v173.privacySetting = p172
                u64(v173)
            end
        }
        local v177 = {}
        local v178 = #v177
        for v179, v180 in v169 do
            v177[v178 + v179] = v180
        end
        v164[v165 + 1] = u15.createElement(u21, v176, v177)
        v132[v134 + 4] = u15.createElement(u22, v163, v164)
        local v181 = {
            ["Name"] = "Minimum Clan War Party Leader Rank",
            ["Hint"] = "To queue for a Clan War match, the party leader must be above this rank",
            ["ThemeColor"] = u42.backgroundPrimary,
            ["FrameProps"] = {
                ["LayoutOrder"] = 7
            }
        }
        local v182 = {}
        local v183 = #v182
        local v184 = {}
        local v185 = u49
        local v186 = u63.minClanWarLeaderRankSetting
        if v186 == nil then
            v186 = u30.MEMBER
        end
        v184.Value = v185[v186]
        function v184.OnChange(p187) --[[ Line: 544 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u50
                [3] = u64
            --]]
            local v188 = {}
            for v189, v190 in u63 do
                v188[v189] = v190
            end
            v188.minClanWarLeaderRankSetting = u50[p187]
            u64(v188)
        end
        local v191 = table.create(#u48)
        for v192, v193 in u48 do
            local _ = v192 - 1
            v191[v192] = u15.createElement(u20, {
                ["Value"] = v193,
                ["Text"] = v193
            })
        end
        local v194 = {}
        local v195 = #v194
        for v196, v197 in v191 do
            v194[v195 + v196] = v197
        end
        v182[v183 + 1] = u15.createElement(u21, v184, v194)
        v132[v134 + 5] = u15.createElement(u22, v181, v182)
        local v198 = {
            ["LayoutOrder"] = 8,
            ["Size"] = UDim2.new(1, 0, 0, 35)
        }
        local v199 = { u15.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v200 = #v199
        local v201
        if v67 == "" then
            v201 = false
        else
            v201 = u15.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.7, 1),
                ["BackgroundColor3"] = u6.hexColor(16735324)
            }, { u15.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u15.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["TextYAlignment"] = "Center",
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = "<b>Error:</b> " .. v67,
                    ["TextColor3"] = u6.WHITE
                }, { u15.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) })
        end
        if v201 then
            v199[v200 + 1] = v201
        end
        v199[#v199 + 1] = u15.createElement(u5, {
            ["Text"] = "<b>Save Changes</b>",
            ["Selectable"] = false,
            ["LayoutOrder"] = 2,
            ["Position"] = UDim2.fromScale(1, 0),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Size"] = UDim2.new(0.25, 0, 0, 30),
            ["BackgroundColor3"] = u42.backgroundSuccess,
            ["OnClick"] = v65 and function() --[[ Line: 623 ]] end or v104,
            ["Loading"] = v65
        })
        v132.FormActions = u15.createElement(u9, v198, v199)
        v132[v134 + 6] = u15.createElement(u8, {
            ["Direction"] = "X",
            ["LayoutOrder"] = 9,
            ["BarColor"] = {
                ["Transparency"] = 0.8
            }
        })
        local v202 = {
            ["LayoutOrder"] = 10,
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.new(1, 0, 0, 200)
        }
        local v203 = { u15.createFragment({ u15.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 6)
                }), u15.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Text"] = "Clan Border",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                    ["TextColor3"] = u6.WHITE
                }, { u15.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) }) }
        local v204 = #v203
        local v205 = u51.Clan.borders
        local v206
        if v205 == nil then
            v206 = v205
        else
            local function v217(u207) --[[ Line: 667 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u9
                    [3] = u57
                    [4] = u42
                    [5] = u25
                    [6] = u122
                --]]
                local v208 = u15.createElement
                local v209 = u9
                local v210 = {
                    ["Size"] = UDim2.fromOffset(120, 120)
                }
                local v211 = {}
                local v212 = "SelectBorder-" .. tostring(u207)
                local v213 = u15.createElement
                local v214 = "ImageButton"
                local v215 = {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BorderSizePixel"] = u207 == u57 and 3 or 0,
                    ["BorderMode"] = "Outline"
                }
                local v216
                if u207 == u57 then
                    v216 = u42.buttonPrimary
                else
                    v216 = nil
                end
                v215.BorderColor3 = v216
                v215.BackgroundTransparency = 1
                v215.Image = u25[u207].borderImage
                v215[u15.Event.TouchTap] = function() --[[ Line: 678 ]]
                    --[[
                    Upvalues:
                        [1] = u122
                        [2] = u207
                    --]]
                    u122(u207)
                end
                v215[u15.Event.MouseButton1Click] = function() --[[ Line: 681 ]]
                    --[[
                    Upvalues:
                        [1] = u122
                        [2] = u207
                    --]]
                    u122(u207)
                end
                v211[v212] = v213(v214, v215)
                return v208(v209, v210, v211)
            end
            v206 = table.create(#v205)
            for v218, v219 in v205 do
                v206[v218] = v217(v219, v218 - 1, v205)
            end
        end
        local v220 = {
            ["AutomaticSize"] = "Y",
            ["SizeConstraint"] = "RelativeXX",
            ["Size"] = UDim2.new(1, 0, 0, 150)
        }
        local v221 = { u15.createElement("UIListLayout", {
                ["HorizontalFlex"] = "SpaceEvenly",
                ["VerticalFlex"] = "SpaceEvenly",
                ["FillDirection"] = "Horizontal",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v222 = #v221
        if v206 then
            for v223, v224 in v206 do
                v221[v222 + v223] = v224
            end
        end
        local v225 = #v221
        local v226
        if u51.Clan.borders == nil then
            v226 = u15.createElement("TextLabel", {
                ["Text"] = "No clan borders owned",
                ["BackgroundTransparency"] = 1
            })
        else
            v226 = false
        end
        if v226 then
            v221[v225 + 1] = v226
        end
        v203[v204 + 1] = u15.createElement(u9, v220, v221)
        v132.ClanBorderSelection = u15.createElement(u9, v202, v203)
        v132[v134 + 7] = u15.createElement(u8, {
            ["Direction"] = "X",
            ["LayoutOrder"] = 11,
            ["BarColor"] = {
                ["Transparency"] = 0.8
            }
        })
        local v227 = {
            ["LayoutOrder"] = 12,
            ["Size"] = UDim2.new(1, 0, 0, 100)
        }
        local v228 = { u15.createFragment({ u15.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 6)
                }), u15.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Text"] = "Clan HQ",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                    ["TextColor3"] = u6.WHITE
                }, { u15.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) }) }
        local v229 = #v228
        local v230 = {
            ["Size"] = UDim2.new(1, 0, 0, 66)
        }
        local v231 = { u15.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["Padding"] = UDim.new(0, 6)
            }) }
        local v232 = #v231
        local v233 = {
            ["Size"] = UDim2.fromScale(0.75, 1)
        }
        local v234 = u51.store.Clans.myClan
        if v234 ~= nil then
            v234 = v234.clanHq
            if v234 ~= nil then
                v234 = v234.selectedLobbyMusic
            end
        end
        if v234 == nil then
            v234 = u36.DEFAULT
        end
        v233.Text = "Currently Selected: " .. u33(v234).title
        v233.TextScaled = true
        v233.RichText = true
        v233.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
        v233.TextColor3 = u6.WHITE
        v233.BackgroundTransparency = 1
        v233.TextXAlignment = "Left"
        local v235 = {
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v236 = {
            u15.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0, 6)
            }),
            u15.createElement(u5, {
                ["Text"] = "<b>Select Music</b>",
                ["OnClick"] = function() --[[ Name: OnClick, Line 800 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u23
                        [3] = u45
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u23.CLAN_HQ_SELECTOR_APP, {
                        ["type"] = u45.BACKGROUND_MUSIC
                    })
                end,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = u42.buttonPrimary
            }),
            [#v236 + 1] = u15.createElement("TextLabel", v233, { u15.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        v231[v232 + 1] = u15.createElement(u9, v235, v236)
        local v237 = {
            ["Size"] = UDim2.fromScale(0.75, 1)
        }
        local v238 = u51.store.Clans.myClan
        if v238 ~= nil then
            v238 = v238.clanHq
            if v238 ~= nil then
                v238 = v238.selectedSykbox
            end
        end
        if v238 == nil then
            v238 = u37.DEFAULT
        end
        v237.Text = "Currently Selected: " .. u34(v238).title
        v237.TextScaled = true
        v237.RichText = true
        v237.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
        v237.TextColor3 = u6.WHITE
        v237.BackgroundTransparency = 1
        v237.TextXAlignment = "Left"
        local v239 = {
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v240 = {
            u15.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0, 6)
            }),
            u15.createElement(u5, {
                ["Text"] = "<b>Select Skybox</b>",
                ["OnClick"] = function() --[[ Name: OnClick, Line 847 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u23
                        [3] = u45
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u23.CLAN_HQ_SELECTOR_APP, {
                        ["type"] = u45.SKYBOX
                    })
                end,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = u42.buttonPrimary
            }),
            [#v240 + 1] = u15.createElement("TextLabel", v237, { u15.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        v231[v232 + 2] = u15.createElement(u9, v239, v240)
        v228[v229 + 1] = u15.createElement(u9, v230, v231)
        v132.ClanHQSettingsWrapper = u15.createElement(u9, v227, v228)
        v132[v134 + 8] = u15.createElement(u8, {
            ["Direction"] = "X",
            ["LayoutOrder"] = 13,
            ["BarColor"] = {
                ["Transparency"] = 0.8
            }
        })
        local v241 = {
            ["LayoutOrder"] = 14,
            ["Size"] = UDim2.new(1, 0, 0, 130)
        }
        local v242 = { u15.createFragment({ u15.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 6)
                }), u15.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Text"] = "Clan Settings",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family),
                    ["TextColor3"] = u6.WHITE
                }, { u15.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 18
                    }) }) }) }
        local v243 = #v242
        local v244 = {
            ["Size"] = UDim2.fromScale(0.75, 1)
        }
        local v245 = u51.store.Clans.myClan
        if v245 ~= nil then
            v245 = v245.clanLobby
            if v245 ~= nil then
                v245 = v245.selectedPodiumBanner
            end
        end
        if v245 == nil then
            v245 = u39.DEFAULT
        end
        v244.Text = "Currently Selected: " .. u38(v245).title
        v244.TextScaled = true
        v244.RichText = true
        v244.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
        v244.TextColor3 = u6.WHITE
        v244.BackgroundTransparency = 1
        v244.TextXAlignment = Enum.TextXAlignment.Left
        local v246 = {
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v247 = {
            u15.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0, 6)
            }),
            u15.createElement(u5, {
                ["Text"] = "<b>Select Podium Banner</b>",
                ["OnClick"] = function() --[[ Name: OnClick, Line 932 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u23
                        [3] = u46
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u23.CLAN_LOBBY_SELECTOR_APP, {
                        ["type"] = u46.PODIUM_BANNER
                    })
                end,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = u42.buttonPrimary
            }),
            [#v247 + 1] = u15.createElement("TextLabel", v244, { u15.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 18
                }) })
        }
        v242[v243 + 1] = u15.createElement(u9, v246, v247)
        local v248 = {
            ["Size"] = UDim2.new(1, 0, 0, 30)
        }
        local v249 = { u15.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["Padding"] = UDim.new(0, 6)
            }), u15.createElement(u5, {
                ["Text"] = "<b>Select Clan Tag Color</b>",
                ["OnClick"] = function() --[[ Name: OnClick, Line 958 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u23
                        [3] = u46
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u23.CLAN_LOBBY_SELECTOR_APP, {
                        ["type"] = u46.CLAN_TAG_COLOR
                    })
                end,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["BackgroundColor3"] = u42.buttonPrimary
            }) }
        local v250 = #v249
        local v251 = {
            ["Size"] = UDim2.fromScale(0.75, 1)
        }
        local v252 = u28
        local v253 = u51.store.Clans.myClan
        if v253 ~= nil then
            v253 = v253.selectedChatTagColor
            if v253 ~= nil then
                v253 = v253.chatTagColorOption
            end
        end
        if v253 == nil then
            v253 = u29.Default
        end
        v251.Text = "Currently Selected: " .. v252[v253].name
        v251.TextScaled = true
        v251.RichText = true
        v251.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family)
        v251.TextColor3 = u6.WHITE
        v251.BackgroundTransparency = 1
        v251.TextXAlignment = Enum.TextXAlignment.Left
        v249[v250 + 1] = u15.createElement("TextLabel", v251, { u15.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 18
            }) })
        v242[v243 + 2] = u15.createElement(u9, v248, v249)
        v132.ClanLobbySettingsWrapper = u15.createElement(u9, v241, v242)
        v132[v134 + 9] = u15.createElement(u8, {
            ["Direction"] = "X",
            ["LayoutOrder"] = 15,
            ["BarColor"] = {
                ["Transparency"] = 0.8
            }
        })
        local v254
        if v123 then
            local v255 = {
                ["Text"] = "<b>Delete Clan</b>",
                ["Selectable"] = false,
                ["LayoutOrder"] = 16,
                ["Size"] = UDim2.new(0.25, 0, 0, 30),
                ["BackgroundColor3"] = u42.backgroundError,
                ["OnClick"] = v112
            }
            local v256 = u51.Clan
            if v256 ~= nil then
                v256 = v256.timeToDelete
            end
            v255.Disabled = v256 ~= nil
            v254 = u15.createElement(u5, v255)
        else
            v254 = v123
        end
        if v254 then
            v132[v134 + 10] = v254
        end
        local v257 = #v132
        if v123 then
            local v258 = u51.Clan
            if v258 ~= nil then
                v258 = v258.timeToDelete
            end
            v123 = v258 ~= nil
            if v123 then
                v123 = u15.createFragment({
                    ["MarkedDeleteContainer"] = u15.createElement(u9, {
                        ["LayoutOrder"] = 17,
                        ["Size"] = UDim2.new(1, 0, 0, 30)
                    }, { u15.createElement("UIListLayout", {
                            ["FillDirection"] = "Horizontal",
                            ["Padding"] = UDim.new(0, 6)
                        }), u15.createElement(u5, {
                            ["Text"] = "<b>Cancel Delete Clan</b>",
                            ["Selectable"] = false,
                            ["LayoutOrder"] = 10,
                            ["Size"] = UDim2.new(0.25, 0, 1, 0),
                            ["BackgroundColor3"] = u42.backgroundError,
                            ["OnClick"] = v119
                        }), u15.createElement(u7, {
                            ["PreText"] = "Clan deleting in:\n",
                            ["OnCompleteText"] = "Clan has been deleted",
                            ["EndTime"] = u51.Clan.timeToDelete,
                            ["TextLabel"] = {
                                ["Size"] = UDim2.new(0.25, 0, 1, 0)
                            }
                        }) })
                })
            end
        end
        if v123 then
            v132[v257 + 1] = v123
        end
        v126[v127 + 1] = u15.createElement(u4, v131, v132)
        return u15.createElement(u44, v125, v126)
    end)
}