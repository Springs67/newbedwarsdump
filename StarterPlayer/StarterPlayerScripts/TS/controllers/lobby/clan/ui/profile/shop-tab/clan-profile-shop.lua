local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.ColorUtil
local u6 = v3.Countdown
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.Padding
local u10 = v3.SoundManager
local u11 = v3.UILayers
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "shop-item-tile").ShopItemTile
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "hq", "clan-hq-background-music-meta").getClanHqBackgroundMusicMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop").ClanShop
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "shop", "clan-shop-item-meta").ClanShopItemsMeta
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "upgrade", "clan-upgrade-meta")
local u26 = v25.ClanUpgradeMeta
local u27 = v25.ClanUpgradeTypeMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-utils").EventUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "background-music-priority").BackgroundMusicPriority
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v238 = v16.new(u15)(function(u33, p34) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u7
        [3] = u19
        [4] = u12
        [5] = u15
        [6] = u5
        [7] = u29
        [8] = u32
        [9] = u27
        [10] = u9
        [11] = u8
        [12] = u6
        [13] = u21
        [14] = u13
        [15] = u24
        [16] = u23
        [17] = u26
        [18] = u18
        [19] = u10
        [20] = u31
        [21] = u2
        [22] = u20
        [23] = u28
        [24] = u11
        [25] = u30
        [26] = u22
        [27] = u4
    --]]
    local v35 = p34.useState
    local v36 = p34.useEffect
    local v37 = p34.useMemo
    local u38, u39 = v35(nil)
    local u40 = v37(function() --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        return u14.new()
    end, {})
    v36(function() --[[ Line: 42 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u19
            [3] = u12
        --]]
        if u7.isHoarceKat() then
            return nil
        end
        if u19:getState().Clans.clanContributionShop == nil then
            u12.Controllers.ClanShopController:requestClanShopData()
        end
    end, {})
    v36(function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u40
        --]]
        return function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40:DoCleaning()
        end
    end, {})
    local u41 = u38 ~= nil
    local function u53(p42) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u5
            [3] = u29
            [4] = u32
            [5] = u27
        --]]
        local v43 = u15.createFragment
        local v44 = {}
        local v45 = u15.createElement
        local v46 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.2,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v47 = {
            u15.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.15, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }),
            u15.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.1, 0)
            }),
            ["LockedIcon"] = u15.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Image"] = u29.LOCK_SOLID
            })
        }
        local v48 = u15.createElement
        local v49 = {
            ["AutomaticSize"] = "Y",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Font"] = "Roboto",
            ["TextXAlignment"] = "Center",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v50 = u5.richTextColor(u32.mcYellow)
        local v51 = u27[p42.ItemClanUpgrade.type].name
        local v52 = p42.ItemClanUpgrade.level
        v49.Text = "<b>Unlocked with <font color=\"" .. v50 .. "\">(" .. v51 .. " Lv." .. tostring(v52) .. ")</font> upgrade</b>"
        v49.TextColor3 = u5.WHITE
        v47.LockedMessage = v48("TextLabel", v49, { u15.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        v44.ShopItemLockedOverlay = v45("Frame", v46, v47)
        return v43(v44)
    end
    local v54 = {
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }
    local v55 = u33.FrameProps
    if v55 then
        for v56, v57 in v55 do
            v54[v56] = v57
        end
    end
    local v58 = {}
    local _ = #v58
    local v59 = {
        ["ScrollingFrameProps"] = {
            ["LayoutOrder"] = 2,
            ["Selectable"] = false,
            ["Size"] = UDim2.fromScale(1, 1)
        }
    }
    local v60 = { u15.createElement(u9, {
            ["Padding"] = {
                ["Vertical"] = 2,
                ["Horizontal"] = 2
            }
        }), u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 12)
        }), u15.createElement(u8, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 18)
        }, {
            u15.createElement("TextLabel", {
                ["Text"] = "Clan Contribution Shop",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 1, 0),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            ["CountdownContainer"] = u15.createElement(u8, {
                ["AutomaticSize"] = "X",
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(0.95, 0.5),
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, { u15.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Right",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 6)
                }), u15.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.75),
                    ["Image"] = u29.HUD_TIMER_ICON
                }), u15.createElement(u6, {
                    ["PostText"] = "<font transparency=\"0.3\" size=\"12\">  Shop Refresh</font>",
                    ["EndTime"] = u21.resetTime:getNextWeeklyResetTime(),
                    ["CountdownConfig"] = {
                        ["days"] = true,
                        ["hours"] = true,
                        ["seperator"] = ":"
                    },
                    ["TextLabel"] = {
                        ["AutomaticSize"] = "X",
                        ["TextScaled"] = false,
                        ["TextSize"] = 14,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["TextXAlignment"] = Enum.TextXAlignment.Right
                    }
                }) })
        }) }
    local v61 = #v60
    local v62 = u13.entries(u24)
    table.sort(v62, function(p63, p64) --[[ Line: 198 ]]
        return p63[2].unlockedFromTier < p64[2].unlockedFromTier
    end)
    local v65 = 0
    local v66 = {}
    for v67, v68 in v62 do
        local _ = v67 - 1
        local _ = v68[1]
        if v68[2].currency == u23.ClanShopCurrency.CLAN_CONTRIBUTION_COIN == true then
            v65 = v65 + 1
            v66[v65] = v68
        end
    end
    local function v100(p69) --[[ Line: 217 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u33
            [3] = u15
            [4] = u53
            [5] = u18
            [6] = u23
            [7] = u10
            [8] = u31
            [9] = u2
            [10] = u20
            [11] = u5
            [12] = u28
            [13] = u32
            [14] = u12
            [15] = u11
            [16] = u8
        --]]
        local u70 = p69[1]
        local u71 = p69[2]
        local v72 = u26[u71.unlockedFromTier]
        local v73 = u33.ClanUpgrades
        if v73 ~= nil then
            v73 = v73[v72.type]
        end
        local v74
        if v73 then
            v74 = u26[v73]
        else
            v74 = nil
        end
        if v74 ~= nil then
            v74 = v74.level
        end
        local u75 = (v74 == nil and 0 or v74) >= v72.level
        local v76 = u33.ClanContributionCoins
        local u77 = (v76 == nil and 0 or v76) >= u71.price
        local u78 = u33.ClanContributionPurchaseHistory
        if u78 ~= nil then
            local v79 = 0
            local v80 = {}
            for v81, v82 in u78 do
                local _ = v81 - 1
                if v82.itemType == u70 == true then
                    v79 = v79 + 1
                    v80[v79] = v82
                end
            end
            u78 = #v80
        end
        local v83 = u71.maxPurchasesPerCycle
        local u84 = v83 == nil and 1 or v83
        local v85 = {}
        local v86 = #v85
        local v87 = not u75
        if v87 then
            v87 = u15.createElement(u53, {
                ["ItemClanUpgrade"] = v72
            })
        end
        if v87 then
            v85[v86 + 1] = v87
        end
        v85[#v85 + 1] = u15.createElement(u18, {
            ["Item"] = {
                ["id"] = u70,
                ["Name"] = u71.name,
                ["Image"] = u71.image
            },
            ["Currency"] = {
                ["Icon"] = u23.ClanShopCurrencyMeta[u71.currency].icon,
                ["Name"] = u23.ClanShopCurrencyMeta[u71.currency].name,
                ["Price"] = u71.price
            },
            ["CanAfford"] = u77,
            ["MaxPurchases"] = u84,
            ["TimesPurchased"] = u78,
            ["OnClick"] = function() --[[ Name: OnClick, Line 290 ]]
                --[[
                Upvalues:
                    [1] = u78
                    [2] = u84
                    [3] = u75
                    [4] = u77
                    [5] = u10
                    [6] = u31
                    [7] = u2
                    [8] = u20
                    [9] = u71
                    [10] = u5
                    [11] = u28
                    [12] = u32
                    [13] = u23
                    [14] = u70
                    [15] = u12
                    [16] = u11
                --]]
                local v88 = u78
                if u84 <= (v88 == nil and 0 or v88) then
                    return nil
                end
                if not u75 then
                    return nil
                end
                if not u77 then
                    return nil
                end
                u10:playSound(u31.UI_OPEN)
                local v89 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v90 = u20.CONFIRMATION_MODAL
                local v91 = {
                    ["Title"] = "Purchase " .. u71.name .. "?"
                }
                local v92 = u5.richTextColor(u28.getItemColorRarity(u71.price))
                local v93 = u71.name
                local v94 = u5.richTextColor(u32.mcGold)
                local v95 = u71.price
                v91.Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. v92 .. "\"><b>[" .. v93 .. "]</b></font> for <font color=\"" .. v94 .. "\"><b>" .. tostring(v95) .. " " .. u23.ClanShopCurrencyMeta[u71.currency].name .. "</b></font>?"
                local v96 = {
                    ["Text"] = u77 and "Purchase" or "Can\'t Afford"
                }
                local v97
                if u77 then
                    v97 = u32.backgroundSuccess
                else
                    v97 = u32.backgroundError
                end
                v96.BackgroundColor3 = v97
                v91.PrimaryBtnProps = v96
                v91.SecondaryBtnProps = {
                    ["Text"] = "Cancel"
                }
                function v91.OnPrimaryBtnClick(_) --[[ Line: 316 ]]
                    --[[
                    Upvalues:
                        [1] = u70
                        [2] = u12
                        [3] = u10
                        [4] = u31
                    --]]
                    local v98 = u70
                    u12.Controllers.ClanShopController:purchaseItem(v98):andThen(function(p99) --[[ Line: 318 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u31
                        --]]
                        if p99.success then
                            u10:playSound(u31.BEDWARS_UPGRADE_SUCCESS)
                        else
                            u10:playSound(u31.ERROR_NOTIFICATION)
                        end
                    end)
                end
                function v91.OnSecondaryBtnClick() --[[ Line: 327 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
                end
                v89:openApp(v90, v91)
            end,
            ["RarityColor"] = u71.rarityColor
        })
        return u15.createFragment({
            ["ShopItemTileWrapper"] = u15.createElement(u8, {}, v85)
        })
    end
    local v101 = 0
    local v102 = {}
    for v103, v104 in v66 do
        local v105 = v100(v104, v103 - 1, v66)
        if v105 ~= nil then
            v101 = v101 + 1
            v102[v101] = v105
        end
    end
    local v106 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v107 = { u15.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["FillDirectionMaxCells"] = 4,
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.new(0, 136, 0, 162),
            ["CellPadding"] = UDim2.fromOffset(8, 8)
        }) }
    local v108 = #v107
    for v109, v110 in v102 do
        v107[v108 + v109] = v110
    end
    v60[v61 + 1] = u15.createElement(u8, v106, v107)
    v60[v61 + 2] = u15.createElement("TextLabel", {
        ["Text"] = "Crystal Shop",
        ["TextXAlignment"] = "Left",
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.new(1, 0, 0, 18),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
    })
    local v111 = u13.entries(u24)
    table.sort(v111, function(p112, p113) --[[ Line: 380 ]]
        return p112[2].unlockedFromTier < p113[2].unlockedFromTier
    end)
    local v114 = 0
    local v115 = {}
    for v116, v117 in v111 do
        local _ = v116 - 1
        local _ = v117[1]
        if v117[2].currency == u23.ClanShopCurrency.CLAN_WAR_CRYSTAL == true then
            v114 = v114 + 1
            v115[v114] = v117
        end
    end
    local function v176(p118) --[[ Line: 399 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u33
            [3] = u15
            [4] = u53
            [5] = u18
            [6] = u23
            [7] = u10
            [8] = u31
            [9] = u2
            [10] = u20
            [11] = u5
            [12] = u28
            [13] = u32
            [14] = u12
            [15] = u11
            [16] = u8
            [17] = u41
            [18] = u39
            [19] = u40
            [20] = u7
            [21] = u30
            [22] = u22
            [23] = u38
            [24] = u29
        --]]
        local u119 = p118[1]
        local u120 = p118[2]
        local v121 = u26[u120.unlockedFromTier]
        local v122 = u33.ClanUpgrades
        if v122 ~= nil then
            v122 = v122[v121.type]
        end
        local v123
        if v122 then
            v123 = u26[v122]
        else
            v123 = nil
        end
        if v123 ~= nil then
            v123 = v123.level
        end
        local u124 = (v123 == nil and 0 or v123) >= v121.level
        local v125 = u33.Crystals
        local u126 = (v125 == nil and 0 or v125) >= u120.price
        local v127 = nil
        for v128, v129 in u120.items do
            local _ = v128 - 1
            if v129.clanHqSkybox ~= nil == true then
                v127 = v129
                break
            end
        end
        local u130 = nil
        for v131, v132 in u120.items do
            local _ = v131 - 1
            if v132.clanHqBackgroundMusic ~= nil == true then
                u130 = v132
                break
            end
        end
        local u133 = 0
        local v134
        if v127 == nil then
            v134 = v127
        else
            v134 = v127.clanHqSkybox
        end
        if v134 then
            local v135 = u33.OwnedClanHqSkyboxes
            if v135 ~= nil then
                local v136 = v127.clanHqSkybox
                v135 = table.find(v135, v136) ~= nil
            end
            u133 = v135 and 1 or u133
        else
            local v137
            if u130 == nil then
                v137 = u130
            else
                v137 = u130.clanHqBackgroundMusic
            end
            if v137 then
                local v138 = u33.OwnedClanHqMusic
                if v138 ~= nil then
                    local v139 = u130.clanHqBackgroundMusic
                    v138 = table.find(v138, v139) ~= nil
                end
                u133 = v138 and 1 or u133
            end
        end
        local v140 = u120.maxPurchasesPerCycle
        local u141 = v140 == nil and 1 or v140
        local v142 = {}
        local v143 = #v142
        local v144 = not u124
        if v144 then
            v144 = u15.createElement(u53, {
                ["ItemClanUpgrade"] = v121
            })
        end
        if v144 then
            v142[v143 + 1] = v144
        end
        local v145 = #v142
        v142[v145 + 1] = u15.createElement(u18, {
            ["Item"] = {
                ["id"] = u119,
                ["Name"] = u120.name,
                ["Image"] = u120.image
            },
            ["Currency"] = {
                ["Icon"] = u23.ClanShopCurrencyMeta[u120.currency].icon,
                ["Name"] = u23.ClanShopCurrencyMeta[u120.currency].name,
                ["Price"] = u120.price
            },
            ["CanAfford"] = u126,
            ["MaxPurchases"] = u141,
            ["TimesPurchased"] = u133,
            ["OnClick"] = function() --[[ Name: OnClick, Line 512 ]]
                --[[
                Upvalues:
                    [1] = u133
                    [2] = u141
                    [3] = u124
                    [4] = u126
                    [5] = u10
                    [6] = u31
                    [7] = u2
                    [8] = u20
                    [9] = u120
                    [10] = u5
                    [11] = u28
                    [12] = u32
                    [13] = u23
                    [14] = u119
                    [15] = u12
                    [16] = u11
                --]]
                local v146 = u133
                if u141 <= (v146 == nil and 0 or v146) then
                    return nil
                end
                if not u124 then
                    return nil
                end
                if not u126 then
                    return nil
                end
                u10:playSound(u31.UI_OPEN)
                local v147 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v148 = u20.CONFIRMATION_MODAL
                local v149 = {
                    ["Title"] = "Purchase " .. u120.name .. "?"
                }
                local v150 = u5.richTextColor(u28.getItemColorRarity(u120.price))
                local v151 = u120.name
                local v152 = u5.richTextColor(u32.mcGold)
                local v153 = u120.price
                v149.Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. v150 .. "\"><b>[" .. v151 .. "]</b></font> for <font color=\"" .. v152 .. "\"><b>" .. tostring(v153) .. " " .. u23.ClanShopCurrencyMeta[u120.currency].name .. "</b></font>?"
                local v154 = {
                    ["Text"] = u126 and "Purchase" or "Can\'t Afford"
                }
                local v155
                if u126 then
                    v155 = u32.backgroundSuccess
                else
                    v155 = u32.backgroundError
                end
                v154.BackgroundColor3 = v155
                v149.PrimaryBtnProps = v154
                v149.SecondaryBtnProps = {
                    ["Text"] = "Cancel"
                }
                function v149.OnPrimaryBtnClick(_) --[[ Line: 538 ]]
                    --[[
                    Upvalues:
                        [1] = u119
                        [2] = u12
                        [3] = u10
                        [4] = u31
                    --]]
                    local v156 = u119
                    u12.Controllers.ClanShopController:purchaseItem(v156):andThen(function(p157) --[[ Line: 540 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u31
                        --]]
                        if p157.success then
                            u10:playSound(u31.BEDWARS_UPGRADE_SUCCESS)
                        else
                            u10:playSound(u31.ERROR_NOTIFICATION)
                        end
                    end)
                end
                function v149.OnSecondaryBtnClick() --[[ Line: 549 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
                end
                v147:openApp(v148, v149)
            end,
            ["RarityColor"] = u120.rarityColor
        })
        if u130 then
            local v158 = u15.createElement
            local v159 = u8
            local v160 = {
                ["Size"] = UDim2.fromScale(0.65, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.325),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }
            local v161 = {}
            local v162 = u15.createElement
            local v163 = "ImageButton"
            local v165 = {
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = u32.backgroundSecondary,
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["ImageTransparency"] = 1,
                ["ScaleType"] = Enum.ScaleType.Fit,
                [u15.Event.MouseButton1Click] = function() --[[ Line: 570 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u39
                        [3] = u40
                        [4] = u7
                        [5] = u12
                        [6] = u30
                        [7] = u130
                        [8] = u22
                    --]]
                    if u41 then
                        u39(nil)
                        u40:DoCleaning()
                    else
                        local u164
                        if u7.isHoarceKat() then
                            u164 = nil
                        else
                            u164 = u12.Controllers.BackgroundMusicController:getActiveTrack()
                        end
                        if u164 ~= nil then
                            u164 = u164.SoundId
                        end
                        u40:GiveTask(function() --[[ Line: 581 ]]
                            --[[
                            Upvalues:
                                [1] = u164
                                [2] = u7
                                [3] = u12
                                [4] = u30
                            --]]
                            if u164 == "" or not u164 then
                                return nil
                            end
                            if not u7.isHoarceKat() then
                                u12.Controllers.BackgroundMusicController:startMusic(u164, u30.MENU)
                            end
                        end)
                        if u130.clanHqBackgroundMusic then
                            u39(u130.clanHqBackgroundMusic)
                            if not u7.isHoarceKat() then
                                u12.Controllers.BackgroundMusicController:startMusic(u22(u130.clanHqBackgroundMusic).soundId, u30.MENU)
                            end
                        end
                    end
                end
            }
            local v166 = {}
            local v167 = u15.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            })
            local v168 = u15.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0)
            })
            local v169 = u15.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            })
            local v170 = u15.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.05, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0)
            })
            local v171 = u15.createElement("TextLabel", {
                ["Text"] = "PREVIEW",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(0.75, 0.5),
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
            local v172 = u15.createElement
            local v173 = "ImageLabel"
            local v174 = {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.15, 1),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5)
            }
            local v175
            if u41 and u130.clanHqBackgroundMusic == u38 then
                v175 = u29.PAUSE_SOLID
            else
                v175 = u29.TRIANGLE_ARROW_RIGHT
            end
            v174.Image = v175
            __set_list(v166, 1, {v167, v168, v169, v170, v171, v172(v173, v174, { u15.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1
    }) })})
            __set_list(v161, 1, {v162(v163, v165, v166)})
            u130 = v158(v159, v160, v161)
        end
        if u130 then
            v142[v145 + 2] = u130
        end
        return u15.createFragment({
            ["ShopItemTileWrapper"] = u15.createElement(u8, {}, v142)
        })
    end
    local v177 = 0
    local v178 = {}
    for v179, v180 in v115 do
        local v181 = v176(v180, v179 - 1, v115)
        if v181 ~= nil then
            v177 = v177 + 1
            v178[v177] = v181
        end
    end
    local v182 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v183 = { u15.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["FillDirectionMaxCells"] = 4,
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.new(0, 136, 0, 162),
            ["CellPadding"] = UDim2.fromOffset(8, 8)
        }) }
    local v184 = #v183
    for v185, v186 in v178 do
        v183[v184 + v185] = v186
    end
    v60[v61 + 3] = u15.createElement(u8, v182, v183)
    v60[v61 + 4] = u15.createElement("TextLabel", {
        ["Text"] = "Clan Coin Shop",
        ["TextXAlignment"] = "Left",
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 5,
        ["Size"] = UDim2.new(1, 0, 0, 18),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
    })
    local v187 = u13.entries(u24)
    table.sort(v187, function(p188, p189) --[[ Line: 688 ]]
        return p188[2].unlockedFromTier < p189[2].unlockedFromTier
    end)
    local function v199(p190) --[[ Line: 692 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u33
        --]]
        local _ = p190[1]
        local v191 = p190[2]
        local v192 = v191.currency == u23.ClanShopCurrency.CLAN_COIN
        if v192 then
            local v193 = false
            for v194, v195 in v191.items do
                local _ = v194 - 1
                local v196 = v195.clanBorder ~= nil
                if v196 then
                    local v197 = u33.OwnedClanBorders
                    local v198 = v195.clanBorder
                    v196 = table.find(v197, v198) ~= nil
                end
                if v196 then
                    v193 = true
                    break
                end
            end
            v192 = not v193
        end
        return v192
    end
    local v200 = 0
    local v201 = {}
    for v202, v203 in v187 do
        if v199(v203, v202 - 1, v187) == true then
            v200 = v200 + 1
            v201[v200] = v203
        end
    end
    local function v227(p204) --[[ Line: 730 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u33
            [3] = u15
            [4] = u53
            [5] = u18
            [6] = u23
            [7] = u10
            [8] = u31
            [9] = u2
            [10] = u20
            [11] = u5
            [12] = u28
            [13] = u32
            [14] = u12
            [15] = u11
            [16] = u8
        --]]
        local u205 = p204[1]
        local u206 = p204[2]
        local v207 = u26[u206.unlockedFromTier]
        local v208 = u33.ClanUpgrades
        if v208 ~= nil then
            v208 = v208[v207.type]
        end
        local v209
        if v208 then
            v209 = u26[v208]
        else
            v209 = nil
        end
        if v209 ~= nil then
            v209 = v209.level
        end
        local u210 = (v209 == nil and 0 or v209) >= v207.level
        local v211 = u33.ClanCoins
        local u212 = (v211 == nil and 0 or v211) >= u206.price
        local v213 = {}
        local v214 = #v213
        local v215 = not u210
        if v215 then
            v215 = u15.createElement(u53, {
                ["ItemClanUpgrade"] = v207
            })
        end
        if v215 then
            v213[v214 + 1] = v215
        end
        v213[#v213 + 1] = u15.createElement(u18, {
            ["MaxPurchases"] = 1,
            ["Item"] = {
                ["id"] = u205,
                ["Name"] = u206.name,
                ["Image"] = u206.image
            },
            ["Currency"] = {
                ["Icon"] = u23.ClanShopCurrencyMeta[u206.currency].icon,
                ["Name"] = u23.ClanShopCurrencyMeta[u206.currency].name,
                ["Price"] = u206.price
            },
            ["CanAfford"] = u212,
            ["OnClick"] = function() --[[ Name: OnClick, Line 779 ]]
                --[[
                Upvalues:
                    [1] = u210
                    [2] = u212
                    [3] = u10
                    [4] = u31
                    [5] = u2
                    [6] = u20
                    [7] = u206
                    [8] = u5
                    [9] = u28
                    [10] = u32
                    [11] = u23
                    [12] = u205
                    [13] = u12
                    [14] = u11
                --]]
                if not u210 then
                    return nil
                end
                if not u212 then
                    return nil
                end
                u10:playSound(u31.UI_OPEN)
                local v216 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v217 = u20.CONFIRMATION_MODAL
                local v218 = {
                    ["Title"] = "Purchase " .. u206.name .. "?"
                }
                local v219 = u5.richTextColor(u28.getItemColorRarity(u206.price))
                local v220 = u206.name
                local v221 = u5.richTextColor(u32.mcGold)
                local v222 = u206.price
                v218.Body = "Are you sure you want to purchase the <font transparency=\"0\" color=\"" .. v219 .. "\"><b>[" .. v220 .. "]</b></font> for <font color=\"" .. v221 .. "\"><b>" .. tostring(v222) .. " " .. u23.ClanShopCurrencyMeta[u206.currency].name .. "</b></font>?"
                local v223 = {
                    ["Text"] = u212 and "Purchase" or "Can\'t Afford"
                }
                local v224
                if u212 then
                    v224 = u32.backgroundSuccess
                else
                    v224 = u32.backgroundError
                end
                v223.BackgroundColor3 = v224
                v218.PrimaryBtnProps = v223
                v218.SecondaryBtnProps = {
                    ["Text"] = "Cancel"
                }
                function v218.OnPrimaryBtnClick(_) --[[ Line: 797 ]]
                    --[[
                    Upvalues:
                        [1] = u205
                        [2] = u12
                        [3] = u10
                        [4] = u31
                    --]]
                    local v225 = u205
                    u12.Controllers.ClanShopController:purchaseItem(v225):andThen(function(p226) --[[ Line: 799 ]]
                        --[[
                        Upvalues:
                            [1] = u10
                            [2] = u31
                        --]]
                        if p226.success then
                            u10:playSound(u31.BEDWARS_UPGRADE_SUCCESS)
                        else
                            u10:playSound(u31.ERROR_NOTIFICATION)
                        end
                    end)
                end
                function v218.OnSecondaryBtnClick() --[[ Line: 808 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
                end
                v216:openApp(v217, v218)
            end,
            ["RarityColor"] = u206.rarityColor
        })
        return u15.createFragment({
            ["ShopItemTileWrapper"] = u15.createElement(u8, {}, v213)
        })
    end
    local v228 = 0
    local v229 = {}
    for v230, v231 in v201 do
        local v232 = v227(v231, v230 - 1, v201)
        if v232 ~= nil then
            v228 = v228 + 1
            v229[v228] = v232
        end
    end
    local v233 = {
        ["AutomaticSize"] = "Y",
        ["LayoutOrder"] = 6,
        ["Size"] = UDim2.fromScale(1, 0)
    }
    local v234 = { u15.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["FillDirectionMaxCells"] = 4,
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.new(0, 136, 0, 162),
            ["CellPadding"] = UDim2.fromOffset(8, 8)
        }) }
    local v235 = #v234
    for v236, v237 in v229 do
        v234[v235 + v236] = v237
    end
    v60[v61 + 5] = u15.createElement(u8, v233, v234)
    v58.ShopList = u15.createElement(u4, v59, v60)
    return u15.createFragment({
        ["ClanProfileShop"] = u15.createElement(u8, v54, v58)
    })
end)
return {
    ["ClanProfileShop"] = v17.connect(function(p239, p240) --[[ Line: 856 ]]
        local v241 = {}
        for v242, v243 in p240 do
            v241[v242] = v243
        end
        local v244 = p239.Clans.clanContributionShop
        if v244 ~= nil then
            v244 = v244.clanContributionCoins
        end
        v241.ClanContributionCoins = v244
        local v245 = p239.Clans.clanContributionShop
        if v245 ~= nil then
            v245 = v245.weekPurchaseHistory
        end
        v241.ClanContributionPurchaseHistory = v245
        local v246 = p239.Clans.myClan
        if v246 ~= nil then
            v246 = v246.clanWarCoins
        end
        v241.Crystals = v246
        local v247 = p239.Clans.myClan
        if v247 ~= nil then
            v247 = v247.clanHq
            if v247 ~= nil then
                v247 = v247.allSkyboxes
            end
        end
        v241.OwnedClanHqSkyboxes = v247
        local v248 = p239.Clans.myClan
        if v248 ~= nil then
            v248 = v248.clanHq
            if v248 ~= nil then
                v248 = v248.allLobbyMusic
            end
        end
        v241.OwnedClanHqMusic = v248
        local v249 = p239.Clans.myClan
        if v249 ~= nil then
            v249 = v249.borders
        end
        v241.OwnedClanBorders = v249 == nil and {} or v249
        local v250 = p239.Clans.myClan
        if v250 ~= nil then
            v250 = v250.coins
        end
        v241.ClanCoins = v250
        local v251 = p239.Clans.myClan
        if v251 ~= nil then
            v251 = v251.upgrades
        end
        v241.ClanUpgrades = v251
        return v241
    end)(v238)
}