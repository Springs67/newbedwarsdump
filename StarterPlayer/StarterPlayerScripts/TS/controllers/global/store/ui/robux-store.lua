local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.Countdown
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "bedcoin-purchase-button").BedcoinPurchaseButton
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-devproducts").BedCoinDevProductInfoList
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game-reset", "game-reset").GameReset
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta")
local u23 = v22.BedwarsKitSkinMeta
local u24 = v22.MAX_NEW_SKIN_AGE
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "robux-daily-store", "robux-daily-store-items").getDailyStoreItemMetadata
local v34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts")
local u35 = v34.RobuxProductType
local u36 = v34.StoreCurrency
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u38 = v1.import(script, script.Parent, "new-player-bundle-util-client").NewPlayerBundleClientUtil
local u39 = v1.import(script, script.Parent, "robux-store-banner-card").RobuxStoreBannerCard
local u40 = v1.import(script, script.Parent, "robux-store-item-reward-card").RobuxStoreItemRewardCard
local u41 = v1.import(script, script.Parent, "robux-store-item-showcase-card").RobuxStoreItemShowcaseCard
local v219 = v11.new(u10)(function(u42, p43) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u9
        [3] = u19
        [4] = u20
        [5] = u6
        [6] = u14
        [7] = u15
        [8] = u35
        [9] = u10
        [10] = u39
        [11] = u25
        [12] = u24
        [13] = u2
        [14] = u17
        [15] = u23
        [16] = u41
        [17] = u8
        [18] = u32
        [19] = u30
        [20] = u33
        [21] = u36
        [22] = u7
        [23] = u5
        [24] = u21
        [25] = u16
        [26] = u40
        [27] = u26
        [28] = u31
        [29] = u28
        [30] = u27
        [31] = u4
        [32] = u37
        [33] = u29
        [34] = u18
    --]]
    local v44 = p43.useState
    local v45 = p43.useEffect
    local u46, u47 = v44(u38.shouldShowNewPlayerBundle())
    local u48, u49 = v44(nil)
    v45(function() --[[ Line: 48 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u19
            [3] = u20
            [4] = u6
            [5] = u14
            [6] = u15
            [7] = u35
            [8] = u46
            [9] = u10
            [10] = u39
            [11] = u25
            [12] = u24
            [13] = u2
            [14] = u17
            [15] = u23
            [16] = u41
            [17] = u42
            [18] = u49
        --]]
        local v50 = os.time()
        local v51 = u9.entries(u19)
        table.sort(v51, function(p52, p53) --[[ Line: 51 ]]
            local v54 = p52[2].storeUI
            if v54 ~= nil then
                v54 = v54.displayOrder
            end
            local v55 = v54 == nil and 1000 or v54
            local v56 = p53[2].storeUI
            if v56 ~= nil then
                v56 = v56.displayOrder
            end
            return v55 < (v56 == nil and 1000 or v56)
        end)
        local function v75(p57, p58) --[[ Line: 71 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u6
                [3] = u14
                [4] = u15
                [5] = u35
                [6] = u46
                [7] = u10
                [8] = u39
            --]]
            local v59 = p57[1]
            local v60 = p57[2]
            if v60.disabled then
                return nil
            end
            local v61 = v60.storeUI
            if v61 ~= nil then
                v61 = v61.disableDisplay
            end
            if v61 then
                return nil
            end
            if v59 == u20.NEW_PLAYER_BUNDLE then
                return nil
            end
            local v62 = v60.devProductId
            if v62 == nil then
                v62 = v60.gamepassId
            end
            if v62 == nil then
                return nil
            end
            local v63
            if u6.isHoarceKat() then
                v63 = false
            else
                v63 = u14.LocalPlayer:GetAttribute("Purchased" .. v59)
            end
            if v60.limitedTimeEndTime ~= nil and u15:GetServerTimeNow() > v60.limitedTimeEndTime then
                return nil
            end
            local v64 = {
                ["Title"] = v60.name
            }
            local v65 = {}
            local v66 = v60.image
            v65.Image = v66 == nil and "" or v66
            v64.BackgroundImage = v65
            local v67 = v60.storeUI
            if v67 ~= nil then
                v67 = v67.backgroundGradient
            end
            v64.BackgroundGradient = v67
            local v68 = {
                ["Price"] = v60.price,
                ["ProductId"] = v62
            }
            local v69 = v60.devProductId
            local v70
            if v69 == 0 or (v69 ~= v69 or not v69) then
                v70 = u35.GamePass
            else
                v70 = u35.DevProduct
            end
            v68.ProductType = v70
            v68.GiftType = v59
            v64.Product = v68
            v64.Contents = {
                ["Rewards"] = v60.rewards
            }
            v64.IsOwned = v63
            local v71 = v60.originalPrice
            v64.Discount = v71 ~= 0 and (v71 == v71 and v71) and {
                ["OriginalPrice"] = v60.originalPrice
            } or nil
            local v72 = {}
            local v73 = v60.storeUI
            if v73 ~= nil then
                v73 = v73.rippleEffect
            end
            if v73 == nil then
                v73 = false
            end
            v72.Ripple = v73
            v64.Effects = v72
            v64.EndTime = v60.limitedTimeEndTime
            v64.LayoutOrder = 1
            local v74 = not u46
            if v74 then
                v74 = p58 == 0
            end
            v64.GamepadShouldAutoSelect = v74
            return u10.createElement(u39, v64)
        end
        local v76 = 0
        local u77 = {}
        for v78, v79 in v51 do
            local v80 = v75(v79, v78 - 1, v51)
            if v80 ~= nil then
                v76 = v76 + 1
                u77[v76] = v80
            end
        end
        local v81 = 0
        local v82 = {}
        for v83, v84 in u9.entries(u25) do
            local _ = v83 - 1
            local v85 = v84[2].releaseTime
            if v50 - (v85 == nil and 0 or v85) <= u24 == true then
                v81 = v81 + 1
                v82[v81] = v84
            end
        end
        table.sort(v82, function(p86, p87) --[[ Line: 181 ]]
            local v88 = p86[2].name
            local v89 = v88 == nil and "" or v88
            local v90 = p87[2].name
            return v89 < (v90 == nil and "" or v90)
        end)
        local function v105(p91, p92) --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u35
                [2] = u2
                [3] = u17
                [4] = u46
                [5] = u77
                [6] = u10
                [7] = u39
            --]]
            local u93 = p91[1]
            local v94 = p91[2]
            local v95 = v94.gamepassId
            if v95 == 0 or (v95 ~= v95 or not v95) then
                v95 = v94.devProductId
            end
            local v96 = v94.priceRobux
            if v96 == 0 then
                v96 = false
            elseif v96 ~= v96 then
                v96 = false
            end
            local v97 = not v96
            if not v97 then
                local v98
                if v95 == 0 then
                    v98 = false
                elseif v95 == v95 then
                    v98 = v95
                else
                    v98 = false
                end
                v97 = not v98
            end
            if v97 then
                return nil
            end
            local v99 = {
                ["Title"] = v94.name .. " Kit"
            }
            local v100 = {
                ["Price"] = v94.priceRobux,
                ["GiftType"] = u93,
                ["ProductId"] = v95
            }
            local v101 = v94.gamepassId
            local v102
            if v101 == 0 or (v101 ~= v101 or not v101) then
                v102 = u35.DevProduct
            else
                v102 = u35.GamePass
            end
            v100.ProductType = v102
            v99.Product = v100
            v99.BackgroundImage = {
                ["Image"] = ""
            }
            v99.Contents = {
                ["Description"] = { v94.description },
                ["Rewards"] = {
                    {
                        ["kit"] = u93
                    }
                }
            }
            function v99.OnClick() --[[ Line: 230 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u17
                    [3] = u93
                --]]
                local v103 = {
                    ["SelectedKit"] = u93
                }
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u17.KIT_DETAILS_APP, v103)
            end
            v99.LayoutOrder = 9
            v99.Effects = {
                ["DisableBGGradientAnim"] = true
            }
            local v104 = not u46
            if v104 then
                if #u77 == 0 then
                    v104 = p92 == 0
                else
                    v104 = false
                end
            end
            v99.GamepadShouldAutoSelect = v104
            return u10.createElement(u39, v99, {
                ["BackgroundImage"] = u10.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1.45, 1.45),
                    ["Position"] = UDim2.fromScale(1.5, 0.65),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Image"] = v94.renderImage,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            })
        end
        local v106 = 0
        local u107 = {}
        for v108, v109 in v82 do
            local v110 = v105(v109, v108 - 1, v82)
            if v110 ~= nil then
                v106 = v106 + 1
                u107[v106] = v110
            end
        end
        local v111 = 0
        local v112 = {}
        for v113, v114 in u9.entries(u23) do
            local _ = v113 - 1
            local v115 = v114[2].releaseTime
            if v50 - (v115 == nil and 0 or v115) <= u24 == true then
                v111 = v111 + 1
                v112[v111] = v114
            end
        end
        table.sort(v112, function(p116, p117) --[[ Line: 282 ]]
            return (p116[2].kit or "") < (p117[2].kit or "")
        end)
        local function v126(p118, p119) --[[ Line: 286 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u41
                [3] = u35
                [4] = u42
                [5] = u2
                [6] = u17
                [7] = u46
                [8] = u77
                [9] = u107
            --]]
            local u120 = p118[1]
            local u121 = p118[2]
            if not u121.product then
                return nil
            end
            local v122 = u10.createElement
            local v123 = u41
            local v124 = {
                ["AspectRatio"] = 0.74,
                ["New"] = true,
                ["Title"] = u121.name,
                ["Image"] = u121.renderImage,
                ["Product"] = {
                    ["Price"] = u121.product.priceRobux,
                    ["ProductId"] = u121.product.devProductId,
                    ["GiftType"] = u120,
                    ["ProductType"] = u35.DevProduct
                },
                ["IsOwned"] = table.find(u42.OwnedKitSkins, u120) ~= nil,
                ["OnClick"] = function() --[[ Name: OnClick, Line 304 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u17
                        [3] = u121
                        [4] = u120
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u17.KIT_DETAILS_APP, {
                        ["SelectedKit"] = u121.kit,
                        ["SelectedKitSkin"] = u120
                    })
                end
            }
            local v125 = not u46
            if v125 then
                if #u77 == 0 and #u107 == 0 then
                    v125 = p119 == 0
                else
                    v125 = false
                end
            end
            v124.GamepadShouldAutoSelect = v125
            return v122(v123, v124)
        end
        local v127 = 0
        local v128 = {}
        for v129, v130 in v112 do
            local v131 = v126(v130, v129 - 1, v112)
            if v131 ~= nil then
                v127 = v127 + 1
                v128[v127] = v131
            end
        end
        u49({
            ["featuredKits"] = u107,
            ["featuredKitSkins"] = v128,
            ["bundles"] = u77
        })
    end, {})
    v45(function() --[[ Line: 331 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u8
            [3] = u32
            [4] = u30
            [5] = u47
        --]]
        if u6.isHoarceKat() then
            return nil
        end
        u8.Controllers.RobuxStoreController:requestDailyStorePurchaseHistory()
        u8.Controllers.RobuxStoreController:requestDailyStoreItems()
        local u133 = u32.Client:Get("RobuxPurchaseSuccess"):Connect(function(p132) --[[ Line: 337 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u47
            --]]
            if p132.devProductId == u30.NEW_PLAYER_BUNDLE then
                u47(false)
            end
        end)
        return function() --[[ Line: 342 ]]
            --[[
            Upvalues:
                [1] = u133
            --]]
            u133:Disconnect()
        end
    end, {})
    local function u140(p134, p135) --[[ Line: 346 ]]
        --[[
        Upvalues:
            [1] = u33
            [2] = u36
            [3] = u8
        --]]
        local v136 = u33(p134)
        if p135 == u36.Robux then
            u8.Controllers.RobuxStoreController:purchaseDailyStoreItem(p134, p135)
        elseif v136.bedcoinProduct and p135 == u36.BedCoin then
            local v137 = u8.Controllers.BedCoinProductPurchaseController
            local v138 = {}
            local v139 = v136.bedcoinProduct
            if v139 ~= nil then
                v139 = v139.bedcoinProductId
            end
            v138.productId = v139
            v138.dailyStoreItem = p134
            v137:purchase(v138)
        end
    end
    local v141
    if u46 then
        v141 = u19[u20.NEW_PLAYER_BUNDLE].devProductId ~= nil
    else
        v141 = u46
    end
    if v141 then
        local v142 = {
            ["Title"] = u19[u20.NEW_PLAYER_BUNDLE].name
        }
        local v143 = {}
        local v144 = u19[u20.NEW_PLAYER_BUNDLE].image
        v143.Image = v144 == nil and "" or v144
        v142.BackgroundImage = v143
        v142.BackgroundGradient = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 138, 166)), ColorSequenceKeypoint.new(1, Color3.fromRGB(157, 131, 254)) })
        v142.Product = {
            ["Price"] = u19[u20.NEW_PLAYER_BUNDLE].price,
            ["ProductId"] = u19[u20.NEW_PLAYER_BUNDLE].devProductId,
            ["ProductType"] = u35.DevProduct
        }
        v142.Discount = {
            ["OriginalPrice"] = 1400
        }
        v142.Contents = {
            ["Rewards"] = u19[u20.NEW_PLAYER_BUNDLE].rewards
        }
        local v145 = u42.newPlayerBundleData
        if v145 ~= nil then
            v145 = v145.firstJoinTime
        end
        local v146
        if v145 == nil then
            v146 = u38.getNewPlayerBundleExpireTime()
        else
            v146 = u38.getNewPlayerBundleExpireTimeFromJoin(u42.newPlayerBundleData.firstJoinTime)
        end
        v142.EndTime = v146
        v142.Effects = {
            ["Confetti"] = true,
            ["Ripple"] = true
        }
        v142.LayoutOrder = 2
        v142.GamepadShouldAutoSelect = true
        v141 = u10.createElement(u39, v142)
    end
    local v147 = { u10.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 20)
        }) }
    local v148 = #v147
    if v141 then
        v147[v148 + 1] = v141
    end
    local v149 = #v147
    local v150
    if u48 == nil then
        v150 = u48
    else
        v150 = #u48.bundles == 0
    end
    local v151 = not v150
    if v151 then
        v151 = u10.createElement("TextLabel", {
            ["Text"] = "Bundles",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["LayoutOrder"] = -1,
            ["Size"] = UDim2.new(1, 0, 0, 32),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Heavy)
        })
    end
    if v151 then
        v147[v149 + 1] = v151
    end
    local v152 = #v147
    local v153
    if u48 == nil then
        v153 = u48
    else
        v153 = u48.bundles
    end
    if v153 then
        for v154, v155 in v153 do
            v147[v152 + v154] = v155
        end
    end
    local v156 = #v147
    local v157
    if u48 == nil then
        v157 = u48
    else
        v157 = #u48.featuredKits == 0
    end
    local v158 = not v157
    if v158 then
        local v159 = { u10.createElement("TextLabel", {
                ["Text"] = "New Kits",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 32),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Heavy)
            }) }
        local _ = #v159
        local v160
        if u48 == nil then
            v160 = u48
        else
            v160 = u48.featuredKits
        end
        local v161 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v162 = {}
        local v163 = #v162
        if v160 then
            for v164, v165 in v160 do
                v162[v163 + v164] = v165
            end
        end
        v159.ListContainer = u10.createFragment({
            ["ListContainer"] = u10.createElement(u7, v161, v162)
        })
        v158 = u10.createFragment(v159)
    end
    if v158 then
        v147[v156 + 1] = v158
    end
    local v166 = #v147
    local v167
    if u48 == nil then
        v167 = u48
    else
        v167 = #u48.featuredKitSkins == 0
    end
    local v168 = not v167
    if v168 then
        local v169 = { u10.createElement("TextLabel", {
                ["Text"] = "New Kit Skins",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.new(1, 0, 0, 32),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Heavy)
            }) }
        local _ = #v169
        local v170
        if u48 == nil then
            v170 = u48
        else
            v170 = u48.featuredKitSkins
        end
        local v171 = {
            ["AutomaticSize"] = "Y",
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v172 = { u10.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 4,
                ["SortOrder"] = "LayoutOrder",
                ["CellSize"] = UDim2.new(0.25, -9, 0, 200),
                ["CellPadding"] = UDim2.new(0, 12, 0, 10)
            }) }
        local v173 = #v172
        if v170 then
            for v174, v175 in v170 do
                v172[v173 + v174] = v175
            end
        end
        v169.ListContainer = u10.createFragment({
            ["ListContainer"] = u10.createElement(u7, v171, v172)
        })
        v168 = u10.createFragment(v169)
    end
    if v168 then
        v147[v166 + 1] = v168
    end
    local v176 = #v147
    local v177 = u10.createFragment
    local v178 = {
        ["DailiesTitleHeader"] = u10.createElement(u7, {
            ["LayoutOrder"] = 6,
            ["Size"] = UDim2.new(1, 0, 0, 32)
        }, {
            ["LeftSection"] = u10.createElement(u7, {
                ["Size"] = UDim2.fromScale(0.5, 1)
            }, {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 8)
                }),
                ["DailiesTitle"] = u10.createElement("TextLabel", {
                    ["Text"] = "Daily | ",
                    ["AutomaticSize"] = "X",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["TextYAlignment"] = "Center",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0, 0, 0, 32),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Heavy)
                }),
                u10.createElement(u5, {
                    ["PreText"] = "Refresh in: ",
                    ["EndTime"] = u21.getResetTimeManager():getNextDailyResetTime(),
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = true,
                        ["minutes"] = true,
                        ["seconds"] = true,
                        ["seperator"] = ":"
                    },
                    ["TextLabel"] = {
                        ["TextXAlignment"] = "Left",
                        ["LayoutOrder"] = 2,
                        ["TextTransparency"] = 0.7,
                        ["Size"] = UDim2.fromScale(0, 0.8),
                        ["AutomaticSize"] = Enum.AutomaticSize.X
                    }
                })
            }),
            ["RefreshShopContainer"] = u10.createElement(u7, {
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0)
            }, { u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["HorizontalAlignment"] = "Right",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 8)
                }), u10.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["Text"] = "Refresh Shop",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["TextTransparency"] = 0.7,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }), u10.createElement(u16, {
                    ["BedcoinProductId"] = 64,
                    ["PurchaseButtonProps"] = {
                        ["ZIndex"] = 3,
                        ["AspectRatio"] = 2.8333333333333335,
                        ["LayoutOrder"] = 2,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 616 ]]
                            --[[
                            Upvalues:
                                [1] = u8
                            --]]
                            u8.Controllers.RobuxStoreController:requestDailyStoreRefresh()
                        end,
                        ["Size"] = UDim2.fromScale(1, 0.9)
                    }
                }) })
        })
    }
    v147.DailiesTitleHeader = v177(v178)
    local v179 = u42.dailyStoreItems
    local v180
    if v179 == nil then
        v180 = v179
    else
        local function v191(u181) --[[ Line: 630 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u42
                [3] = u46
                [4] = u48
                [5] = u35
                [6] = u140
                [7] = u10
                [8] = u40
            --]]
            local v182 = u33(u181)
            local v183 = u42.dailyPurchaseHistory
            local v184 = table.find(v183, u181) ~= nil
            local v185 = not u46
            if v185 then
                local v186 = u48
                v185 = (v186 ~= nil and #v186.bundles or v186) == 0
                if v185 then
                    local v187 = u48
                    v185 = (v187 ~= nil and #v187.featuredKits or v187) == 0
                    if v185 then
                        v185 = v182.freeItem == true
                    end
                end
            end
            local v188 = {
                ["Reward"] = v182.reward,
                ["IsFree"] = v182.freeItem,
                ["RobuxProduct"] = v182.robuxProduct and {
                    ["ProductId"] = v182.robuxProduct.productId,
                    ["ProductType"] = u35.DevProduct
                } or nil
            }
            local v189 = v182.bedcoinProduct
            if v189 ~= nil then
                v189 = v189.bedcoinProductId
            end
            v188.BedcoinProductId = v189
            function v188.OnAttemptPuchase(p190) --[[ Line: 667 ]]
                --[[
                Upvalues:
                    [1] = u140
                    [2] = u181
                --]]
                u140(u181, p190)
            end
            v188.AspectRatio = 1.2121212121212122
            v188.IsOwned = v184
            v188.Highlight = v182.freeItem
            v188.LayoutOrder = v182.freeItem == true and 1 or 2
            v188.GamepadShouldAutoSelect = v185
            return u10.createElement(u40, v188)
        end
        v180 = table.create(#v179)
        for v192, v193 in v179 do
            v180[v192] = v191(v193, v192 - 1, v179)
        end
    end
    local v194 = {
        ["LayoutOrder"] = 7,
        ["Size"] = UDim2.new(1, 0, 0, 340)
    }
    local v195 = { u10.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["FillDirectionMaxCells"] = 3,
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.new(0.3333333333333333, -8, 0, 165),
            ["CellPadding"] = UDim2.new(0, 12, 0, 10)
        }) }
    local v196 = #v195
    for v197, v198 in v180 do
        v195[v196 + v197] = v198
    end
    v147.DailyStoreList = u10.createFragment({
        ["DailyStoreList"] = u10.createElement(u7, v194, v195)
    })
    v147.PerksTitle = u10.createFragment({
        ["PerksTitle"] = u10.createElement("TextLabel", {
            ["Text"] = "Buy Perks",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["LayoutOrder"] = 8,
            ["Size"] = UDim2.new(1, 0, 0, 32),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Heavy)
        })
    })
    local v199 = {
        ["Title"] = "VIP Rank",
        ["Product"] = {
            ["Price"] = 400,
            ["GiftType"] = u26.VIP_RANK,
            ["ProductId"] = u31.VIP,
            ["ProductType"] = u35.GamePass
        }
    }
    local v200 = {}
    local v201 = u28(u27.VIP_HOVER_BOARD)
    v200.Image = v201 == nil and "" or v201
    v199.BackgroundImage = v200
    v199.Contents = {
        ["Description"] = {
            "<b><font color=\"" .. u4.richTextColor(u37.mcGreen) .. "\">[VIP]</font></b> Chat Prefix & Colored Name in chat",
            "Earn +<b>50%</b> more Armor Trim XP",
            "Earn +<b>20%</b> more Bed Coins",
            "Create clans for <b>FREE</b>",
            "Exclusive Lobby Gadget & Title -->"
        },
        ["Rewards"] = {
            {
                ["paid"] = true,
                ["lobbyGadget"] = u27.VIP_HOVER_BOARD
            },
            {
                ["paid"] = true,
                ["title"] = u29.VIP
            }
        }
    }
    v199.Effects = {
        ["DisableBGGradientAnim"] = true
    }
    v199.LayoutOrder = 9
    v147[v176 + 1] = u10.createElement(u39, v199)
    v147.BedCoinsTitle = u10.createFragment({
        ["BedCoinsTitle"] = u10.createElement("TextLabel", {
            ["Text"] = "Buy Bed Coins",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["LayoutOrder"] = 10,
            ["Size"] = UDim2.new(1, 0, 0, 32),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Heavy)
        })
    })
    local v202 = u9.values(u18)
    table.sort(v202, function(p203, p204) --[[ Line: 766 ]]
        return p203.amount < p204.amount
    end)
    local function v210(p205) --[[ Line: 770 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u39
            [3] = u35
        --]]
        local v206 = u10.createElement
        local v207 = u39
        local v208 = {
            ["AspectRatio"] = 0.9333333333333333,
            ["Product"] = {
                ["Price"] = p205.robuxPrice,
                ["GiftType"] = p205.giftType,
                ["ProductId"] = p205.devProductId,
                ["ProductType"] = u35.DevProduct
            },
            ["Size"] = UDim2.fromScale(0.24, 1)
        }
        local v209 = {
            ["Rewards"] = {
                {
                    ["paid"] = true,
                    ["bedCoins"] = p205.amount
                }
            },
            ["UIGridLayout"] = {
                ["CellSize"] = UDim2.fromOffset(74, 74),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }
        }
        v208.Contents = v209
        v208.Effects = {
            ["DisableBGGradientAnim"] = true
        }
        return v206(v207, v208)
    end
    local v211 = table.create(#v202)
    for v212, v213 in v202 do
        v211[v212] = v210(v213, v212 - 1, v202)
    end
    local v214 = {
        ["LayoutOrder"] = 11,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v215 = { u10.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 2.975
        }), u10.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Top",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceBetween,
            ["ItemLineAlignment"] = Enum.ItemLineAlignment.Stretch
        }) }
    local v216 = #v215
    for v217, v218 in v211 do
        v215[v216 + v217] = v218
    end
    v147.BedCoinsList = u10.createFragment({
        ["BedCoinsList"] = u10.createElement(u7, v214, v215)
    })
    return u10.createFragment(v147)
end)
return {
    ["RobuxStore"] = v12.connect(function(p220, p221) --[[ Line: 827 ]]
        local v222 = {}
        for v223, v224 in p221 do
            v222[v223] = v224
        end
        v222.newPlayerBundleData = p220.Lobby.robuxStore.newPlayerBundleData
        v222.dailyStoreItems = p220.Lobby.robuxStore.dailyStoreItems
        v222.dailyPurchaseHistory = p220.Lobby.robuxStore.dailyPurchaseHistory
        v222.emotes = p220.Locker.emotes
        v222.winEffects = p220.Locker.winEffects
        v222.bedBreakEffects = p220.Locker.breakBedEffects
        v222.lobbyGadgets = p220.Locker.lobbyGadgets
        v222.titles = p220.Locker.titles
        v222.killEffects = p220.Locker.killEffects
        v222.OwnedKitSkins = p220.Bedwars.ownedKitSkins
        v222.OwnedKits = p220.Bedwars.ownedKits
        return v222
    end)(v219)
}