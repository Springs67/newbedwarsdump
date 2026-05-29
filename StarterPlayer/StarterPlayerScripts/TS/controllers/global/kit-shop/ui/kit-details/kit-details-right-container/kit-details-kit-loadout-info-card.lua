local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity").DEFAULT_ENTITY_MAX_HEALTH
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-override").getBedwarsShopOverrides
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u15 = v1.import(script, script.Parent.Parent, "kit-details-item-list-container").KitDetailsItemListContainer
local u16 = v1.import(script, script.Parent, "kit-details-item-card").KitDetailsItemCard
return {
    ["KitDetailsKitLoadoutInfoCard"] = v6.new(u5)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u12
            [4] = u7
            [5] = u8
            [6] = u5
            [7] = u3
            [8] = u13
            [9] = u15
            [10] = u14
            [11] = u4
            [12] = u16
            [13] = u9
        --]]
        local v19 = p18.useState
        local v20 = p18.useEffect
        local v21 = p18.useMemo
        local u22, u23 = v19(nil)
        local u24 = v21(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u17
            --]]
            return u10(u17.SelectedKit)
        end, { u17.SelectedKit })
        local u38 = v21(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u11
            --]]
            local v25 = u24.kitItems
            local v26
            if v25 == nil then
                v26 = v25
            else
                local function v34(p27) --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    local v28 = nil
                    for v29, v30 in u11.ShopItems do
                        local _ = v29 - 1
                        if v30.itemType == p27.itemType == true then
                            v28 = v30
                            break
                        end
                    end
                    local v31 = p27.innateItem ~= nil
                    if v31 then
                        v28 = v31
                    else
                        local v32 = p27.loadoutinfo
                        if v32 ~= nil then
                            v32 = v32.reoccuringTimeSeconds
                        end
                        local v33 = v32 ~= nil
                        if v33 then
                            v28 = v33
                        else
                            if v28 ~= nil then
                                v28 = v28.disabled
                            end
                            if not v28 then
                                v28 = p27.loadoutinfo
                                if v28 ~= nil then
                                    v28 = v28.startingItem
                                end
                            end
                        end
                    end
                    return v28
                end
                local v35 = 0
                v26 = {}
                for v36, v37 in v25 do
                    if v34(v37, v36 - 1, v25) == true then
                        v35 = v35 + 1
                        v26[v35] = v37
                    end
                end
            end
            return v26 == nil and {} or v26
        end, { u17.SelectedKit })
        local u64 = v21(function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u11
                [3] = u12
                [4] = u17
                [5] = u7
            --]]
            local v39 = u24.kitItems
            local v40
            if v39 == nil then
                v40 = v39
            else
                local function v46(p41) --[[ Line: 89 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    local v42 = nil
                    for v43, v44 in u11.ShopItems do
                        local _ = v43 - 1
                        local v45 = v44.itemType == p41.itemType
                        if v45 then
                            v45 = not v44.disabled
                            if not v45 then
                                v45 = p41.loadoutinfo
                                if v45 ~= nil then
                                    v45 = v45.shopItem
                                end
                            end
                        end
                        if v45 == true then
                            v42 = v44
                            break
                        end
                    end
                    return v42 and {
                        ["itemType"] = v42.itemType,
                        ["amount"] = v42.amount,
                        ["price"] = v42.price,
                        ["currencyItemType"] = v42.currency
                    } or nil
                end
                local v47 = 0
                v40 = {}
                for v48, v49 in v39 do
                    local v50 = v46(v49, v48 - 1, v39)
                    if v50 ~= nil then
                        v47 = v47 + 1
                        v40[v47] = v50
                    end
                end
            end
            local v51 = v40 == nil and {} or v40
            for _, v52 in u12() do
                if v52:getKit() == u17.SelectedKit then
                    for _, v53 in v52:getOverride(u7.LocalPlayer, {}) do
                        local v54 = nil
                        for v55, v56 in v51 do
                            local _ = v55 - 1
                            if v56.itemType == v53.itemType == true then
                                v54 = v56
                                break
                            end
                        end
                        if not v53.disabled then
                            local v57 = v53.amount
                            if v57 == nil then
                                if v54 == nil then
                                    v57 = v54
                                else
                                    v57 = v54.amount
                                end
                            end
                            local v58 = v53.price
                            if v58 == nil then
                                if v54 == nil then
                                    v58 = v54
                                else
                                    v58 = v54.price
                                end
                            end
                            local v59 = v53.currency
                            if v59 == nil then
                                if v54 ~= nil then
                                    v54 = v54.currencyItemType
                                end
                            else
                                v54 = v59
                            end
                            if v57 ~= 0 and (v57 == v57 and (v57 and (v58 ~= 0 and (v58 == v58 and (v58 and v54))))) then
                                local v60 = -1
                                for v61, v62 in v51 do
                                    local _ = v61 - 1
                                    if v62.itemType == v53.itemType == true then
                                        v60 = v61 - 1
                                        break
                                    end
                                end
                                local v63 = {
                                    ["itemType"] = v53.itemType,
                                    ["amount"] = v57,
                                    ["price"] = v58,
                                    ["currencyItemType"] = v54
                                }
                                if v60 < 0 then
                                    table.insert(v51, v63)
                                else
                                    v51[v60 + 1] = v63
                                end
                            end
                        end
                    end
                end
            end
            return v51
        end, { u17.SelectedKit })
        local u78 = v21(function() --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u8
                [3] = u17
            --]]
            local v65 = u24.abilities or {}
            local function v72(p66) --[[ Line: 227 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u17
                --]]
                local v67 = u8[p66.abilityId]
                local v68 = p66.triggerConfigOverride
                if v68 ~= nil then
                    v68 = v68.abilityButton
                    if v68 ~= nil then
                        v68 = v68.icon
                    end
                end
                if v68 == nil then
                    v68 = v67.triggerConfig
                    if v68 ~= nil then
                        v68 = v68.abilityButton
                        if v68 ~= nil then
                            v68 = v68.icon
                        end
                    end
                end
                if v68 == "" or not v68 then
                    warn("[Bryan] missing ability image for " .. p66.abilityId .. " | " .. u17.SelectedKit)
                    return nil
                end
                local v69 = {}
                for v70, v71 in p66 do
                    v69[v70] = v71
                end
                v69.image = v68
                return v69
            end
            local v73 = 0
            local v74 = {}
            for v75, v76 in v65 do
                local v77 = v72(v76, v75 - 1, v65)
                if v77 ~= nil then
                    v73 = v73 + 1
                    v74[v73] = v77
                end
            end
            return v74
        end, { u17.SelectedKit })
        v20(function() --[[ Line: 272 ]]
            --[[
            Upvalues:
                [1] = u78
                [2] = u38
                [3] = u64
                [4] = u23
            --]]
            local v79 = u78[1]
            local v80 = u38[1]
            local v81 = u64[1]
            if v79 then
                u23({
                    ["idType"] = "AbilityId",
                    ["loadoutType"] = "Ability",
                    ["id"] = v79.abilityId
                })
                return
            elseif v80 then
                u23({
                    ["idType"] = "ItemType",
                    ["loadoutType"] = "Starter Item",
                    ["id"] = v80.itemType
                })
            elseif v81 then
                u23({
                    ["idType"] = "ItemType",
                    ["loadoutType"] = "Shop Item",
                    ["id"] = v81.itemType
                })
            end
        end, {})
        local v82 = {}
        for v83, v84 in u17 do
            v82[v83] = v84
        end
        v82.SelectedKit = nil
        local v85 = {}
        for v86, v87 in v82 do
            v85[v86] = v87
        end
        local v88
        if #u78 == 0 and (#u38 == 0 and (#u64 == 0 and u24.hpModifier == nil)) then
            v88 = u5.createFragment({ u5.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Text"] = "Read description for more information.",
                    ["TextTransparency"] = 0.5,
                    ["Size"] = UDim2.fromScale(0.8, 0.5),
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Bottom
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 32,
                        ["MinTextSize"] = 8
                    }) }), u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ImageTransparency"] = 0.5,
                    ["Size"] = UDim2.fromScale(0.2, 0.2),
                    ["Image"] = u13.HELP_ICON_SOLID
                }, { u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        else
            local v89 = {}
            local v90 = #v89
            local v91
            if #u38 > 0 then
                v91 = u5.createFragment({ u5.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = "STARTER ITEMS",
                        ["TextTransparency"] = 0.25,
                        ["ZIndex"] = 100,
                        ["Size"] = UDim2.fromScale(1, 0.075),
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }, { u5.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 32,
                            ["MinTextSize"] = 8
                        }) }), u5.createElement(u15, {
                        ["Size"] = UDim2.fromScale(1, 0.15),
                        ["CalculateCellSize"] = function(p92, p93) --[[ Name: CalculateCellSize, Line 359 ]]
                            return UDim2.fromOffset(p92.Y - p93, p92.Y - p93)
                        end,
                        ["SetItems"] = function(u94) --[[ Name: SetItems, Line 362 ]]
                            --[[
                            Upvalues:
                                [1] = u22
                                [2] = u14
                                [3] = u23
                                [4] = u3
                                [5] = u5
                                [6] = u13
                                [7] = u4
                                [8] = u16
                                [9] = u38
                            --]]
                            local function v118(p95) --[[ Line: 363 ]]
                                --[[
                                Upvalues:
                                    [1] = u22
                                    [2] = u14
                                    [3] = u23
                                    [4] = u94
                                    [5] = u3
                                    [6] = u5
                                    [7] = u13
                                    [8] = u4
                                    [9] = u16
                                --]]
                                local v96 = u22
                                if v96 ~= nil then
                                    v96 = v96.id
                                end
                                local v97 = v96 == p95.itemType
                                if v97 then
                                    local v98 = u22
                                    if v98 ~= nil then
                                        v98 = v98.idType
                                    end
                                    v97 = v98 == "ItemType"
                                end
                                local v99 = u14(p95.itemType)
                                local function v101(p100) --[[ Line: 378 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u23
                                    --]]
                                    u23({
                                        ["idType"] = "ItemType",
                                        ["loadoutType"] = "Starter Item",
                                        ["id"] = p100
                                    })
                                end
                                local v102 = {
                                    ["BackgroundTransparency"] = 0.5,
                                    ["BorderSizePixel"] = 0,
                                    ["Size"] = u94,
                                    ["Id"] = p95.itemType,
                                    ["BackgroundColor3"] = u3.brighten(u3.BLACK, v97 and 0.25 or 0)
                                }
                                local v103 = v99.image
                                v102.Image = v103 == nil and "" or v103
                                v102.OnClick = v101
                                v102.OnHover = v101
                                v102.Selectable = true
                                local v104 = p95.innateItem
                                if v104 ~= nil then
                                    v104 = v104.amount
                                end
                                local v105 = v104 ~= nil
                                if v105 then
                                    local v106 = {
                                        ["BackgroundTransparency"] = 1,
                                        ["TextScaled"] = true,
                                        ["Size"] = UDim2.fromScale(1, 0.3),
                                        ["Position"] = UDim2.fromScale(0, 0),
                                        ["AnchorPoint"] = Vector2.new(0, 0)
                                    }
                                    local v107 = p95.innateItem
                                    if v107 ~= nil then
                                        v107 = v107.amount
                                    end
                                    v106.Text = "x" .. tostring(v107)
                                    v106.TextColor3 = u3.WHITE
                                    v106.TextStrokeColor3 = u3.BLACK
                                    v106.TextStrokeTransparency = 0
                                    v106.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                                    v106.TextXAlignment = Enum.TextXAlignment.Left
                                    v106.TextYAlignment = Enum.TextYAlignment.Center
                                    v105 = u5.createElement("TextLabel", v106)
                                end
                                local v108 = {}
                                local v109 = #v108
                                if v105 then
                                    v108[v109 + 1] = v105
                                end
                                local v110 = #v108
                                local v111 = p95.loadoutinfo
                                if v111 ~= nil then
                                    v111 = v111.reoccuringTimeSeconds
                                end
                                local v112 = v111 ~= nil
                                if v112 then
                                    local v113 = {
                                        ["Size"] = UDim2.fromScale(1, 0.3),
                                        ["Position"] = UDim2.fromScale(1, 1),
                                        ["AnchorPoint"] = Vector2.new(1, 1)
                                    }
                                    local v114 = { u5.createElement("UIListLayout", {
                                            ["FillDirection"] = Enum.FillDirection.Horizontal,
                                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                            ["SortOrder"] = Enum.SortOrder.LayoutOrder
                                        }), u5.createElement("ImageLabel", {
                                            ["BackgroundTransparency"] = 1,
                                            ["Size"] = UDim2.fromScale(0.2, 1),
                                            ["Image"] = u13.HUD_TIMER_ICON
                                        }, { u5.createElement("UIAspectRatioConstraint", {
                                                ["AspectRatio"] = 1
                                            }) }) }
                                    local v115 = #v114
                                    local v116 = {
                                        ["BackgroundTransparency"] = 1,
                                        ["TextScaled"] = true,
                                        ["Size"] = UDim2.fromScale(0.8, 1)
                                    }
                                    local v117 = p95.loadoutinfo
                                    if v117 ~= nil then
                                        v117 = v117.reoccuringTimeSeconds
                                    end
                                    v116.Text = tostring(v117) .. " sec"
                                    v116.TextColor3 = u3.WHITE
                                    v116.TextStrokeColor3 = u3.BLACK
                                    v116.TextStrokeTransparency = 0
                                    v116.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                                    v116.TextXAlignment = Enum.TextXAlignment.Right
                                    v116.TextYAlignment = Enum.TextYAlignment.Center
                                    v114[v115 + 1] = u5.createElement("TextLabel", v116)
                                    v112 = u5.createElement(u4, v113, v114)
                                end
                                if v112 then
                                    v108[v110 + 1] = v112
                                end
                                return u5.createElement(u16, v102, v108)
                            end
                            local v119 = table.create(#u38)
                            for v120, v121 in u38 do
                                v119[v120] = v118(v121, v120 - 1, u38)
                            end
                            return v119
                        end
                    }) })
            else
                v91 = false
            end
            if v91 then
                v89[v90 + 1] = v91
            end
            local v122 = #v89
            local v123
            if #u64 > 0 then
                v123 = u5.createFragment({ u5.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = "SHOP ITEMS",
                        ["TextTransparency"] = 0.25,
                        ["ZIndex"] = 100,
                        ["Size"] = UDim2.fromScale(1, 0.075),
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }, { u5.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 32,
                            ["MinTextSize"] = 8
                        }) }), u5.createElement(u15, {
                        ["Size"] = UDim2.fromScale(1, 0.15),
                        ["CalculateCellSize"] = function(p124, p125) --[[ Name: CalculateCellSize, Line 519 ]]
                            return UDim2.fromOffset(p124.Y - p125, p124.Y - p125)
                        end,
                        ["SetItems"] = function(u126) --[[ Name: SetItems, Line 522 ]]
                            --[[
                            Upvalues:
                                [1] = u22
                                [2] = u14
                                [3] = u23
                                [4] = u3
                                [5] = u5
                                [6] = u4
                                [7] = u16
                                [8] = u64
                            --]]
                            local function v152(p127) --[[ Line: 523 ]]
                                --[[
                                Upvalues:
                                    [1] = u22
                                    [2] = u14
                                    [3] = u23
                                    [4] = u126
                                    [5] = u3
                                    [6] = u5
                                    [7] = u4
                                    [8] = u16
                                --]]
                                local v128 = u22
                                if v128 ~= nil then
                                    v128 = v128.id
                                end
                                local v129 = v128 == p127.itemType
                                if v129 then
                                    local v130 = u22
                                    if v130 ~= nil then
                                        v130 = v130.idType
                                    end
                                    v129 = v130 == "ItemType"
                                end
                                local v131 = u14(p127.itemType)
                                local function v133(p132) --[[ Line: 538 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u23
                                    --]]
                                    u23({
                                        ["idType"] = "ItemType",
                                        ["loadoutType"] = "Shop Item",
                                        ["id"] = p132
                                    })
                                end
                                local v134 = {
                                    ["BackgroundTransparency"] = 0.5,
                                    ["BorderSizePixel"] = 0,
                                    ["Size"] = u126,
                                    ["Id"] = p127.itemType,
                                    ["BackgroundColor3"] = u3.brighten(u3.BLACK, v129 and 0.25 or 0)
                                }
                                local v135 = v131.image
                                v134.Image = v135 == nil and "" or v135
                                v134.OnClick = v133
                                v134.OnHover = v133
                                v134.Selectable = true
                                local v136
                                if p127 == nil then
                                    v136 = p127
                                else
                                    v136 = p127.amount
                                end
                                local v137 = v136 ~= nil
                                if v137 then
                                    local v138 = {
                                        ["BackgroundTransparency"] = 1,
                                        ["TextScaled"] = true,
                                        ["Size"] = UDim2.fromScale(1, 0.3),
                                        ["Position"] = UDim2.fromScale(0, 0),
                                        ["AnchorPoint"] = Vector2.new(0, 0)
                                    }
                                    local v139
                                    if p127 == nil then
                                        v139 = p127
                                    else
                                        v139 = p127.amount
                                    end
                                    v138.Text = "x" .. tostring(v139)
                                    v138.TextColor3 = u3.WHITE
                                    v138.TextStrokeColor3 = u3.BLACK
                                    v138.TextStrokeTransparency = 0
                                    v138.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                                    v138.TextXAlignment = Enum.TextXAlignment.Left
                                    v138.TextYAlignment = Enum.TextYAlignment.Center
                                    v137 = u5.createElement("TextLabel", v138)
                                end
                                local v140 = {}
                                local v141 = #v140
                                if v137 then
                                    v140[v141 + 1] = v137
                                end
                                local v142 = #v140 + 1
                                local v143 = u5.createElement
                                local v144 = u4
                                local v145 = {
                                    ["Size"] = UDim2.fromScale(1, 0.3),
                                    ["Position"] = UDim2.fromScale(1, 1),
                                    ["AnchorPoint"] = Vector2.new(1, 1)
                                }
                                local v146 = {}
                                local v147 = u5.createElement("UIListLayout", {
                                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                                })
                                local v148 = u5.createElement("ImageLabel", {
                                    ["BackgroundTransparency"] = 1,
                                    ["Size"] = UDim2.fromScale(0.4, 2),
                                    ["Image"] = u14(p127.currencyItemType).image
                                }, { u5.createElement("UIAspectRatioConstraint", {
                                        ["AspectRatio"] = 1
                                    }) })
                                local v149 = u5.createElement
                                local v150 = {
                                    ["BackgroundTransparency"] = 1,
                                    ["TextScaled"] = true,
                                    ["TextStrokeTransparency"] = 0,
                                    ["Size"] = UDim2.fromScale(0.8, 1)
                                }
                                local v151 = p127.price
                                v150.Text = tostring(v151)
                                v150.TextColor3 = u3.WHITE
                                v150.TextStrokeColor3 = u3.BLACK
                                v150.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                                v150.TextXAlignment = Enum.TextXAlignment.Left
                                v150.TextYAlignment = Enum.TextYAlignment.Center
                                __set_list(v146, 1, {v147, v148, v149("TextLabel", v150)})
                                v140[v142] = v143(v144, v145, v146)
                                return u5.createElement(u16, v134, v140)
                            end
                            local v153 = table.create(#u64)
                            for v154, v155 in u64 do
                                v153[v154] = v152(v155, v154 - 1, u64)
                            end
                            return v153
                        end
                    }) })
            else
                v123 = false
            end
            if v123 then
                v89[v122 + 1] = v123
            end
            local v156 = #v89
            local v157
            if #u78 > 0 then
                v157 = u5.createFragment({ u5.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = "ABILITIES",
                        ["TextTransparency"] = 0.25,
                        ["ZIndex"] = 100,
                        ["Size"] = UDim2.fromScale(1, 0.075),
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }, { u5.createElement("UITextSizeConstraint", {
                            ["MaxTextSize"] = 32,
                            ["MinTextSize"] = 8
                        }) }), u5.createElement(u15, {
                        ["Size"] = UDim2.fromScale(1, 0.15),
                        ["CalculateCellSize"] = function(p158, p159) --[[ Name: CalculateCellSize, Line 661 ]]
                            return UDim2.fromOffset(p158.Y - p159, p158.Y - p159)
                        end,
                        ["SetItems"] = function(u160) --[[ Name: SetItems, Line 664 ]]
                            --[[
                            Upvalues:
                                [1] = u22
                                [2] = u8
                                [3] = u23
                                [4] = u5
                                [5] = u13
                                [6] = u3
                                [7] = u4
                                [8] = u16
                                [9] = u78
                            --]]
                            local function v178(p161) --[[ Line: 665 ]]
                                --[[
                                Upvalues:
                                    [1] = u22
                                    [2] = u8
                                    [3] = u23
                                    [4] = u5
                                    [5] = u13
                                    [6] = u3
                                    [7] = u4
                                    [8] = u160
                                    [9] = u16
                                --]]
                                local v162 = u22
                                if v162 ~= nil then
                                    v162 = v162.id
                                end
                                local v163 = v162 == p161.abilityId
                                if v163 then
                                    local v164 = u22
                                    if v164 ~= nil then
                                        v164 = v164.idType
                                    end
                                    v163 = v164 == "AbilityId"
                                end
                                local v165 = u8[p161.abilityId]
                                local function v167(p166) --[[ Line: 680 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u23
                                    --]]
                                    u23({
                                        ["idType"] = "AbilityId",
                                        ["loadoutType"] = "Ability",
                                        ["id"] = p166
                                    })
                                end
                                local v168 = v165.cooldown
                                if v168 ~= nil then
                                    v168 = v168.duration
                                end
                                local v169 = v168 ~= nil
                                if v169 then
                                    local v170 = {
                                        ["Size"] = UDim2.fromScale(1, 0.3),
                                        ["Position"] = UDim2.fromScale(1, 1),
                                        ["AnchorPoint"] = Vector2.new(1, 1)
                                    }
                                    local v171 = { u5.createElement("UIListLayout", {
                                            ["FillDirection"] = Enum.FillDirection.Horizontal,
                                            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                                            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                                            ["SortOrder"] = Enum.SortOrder.LayoutOrder
                                        }), u5.createElement("ImageLabel", {
                                            ["BackgroundTransparency"] = 1,
                                            ["Size"] = UDim2.fromScale(0.2, 1),
                                            ["Image"] = u13.HUD_TIMER_ICON
                                        }, { u5.createElement("UIAspectRatioConstraint", {
                                                ["AspectRatio"] = 1
                                            }) }) }
                                    local v172 = #v171
                                    local v173 = {
                                        ["BackgroundTransparency"] = 1,
                                        ["TextScaled"] = true,
                                        ["Size"] = UDim2.fromScale(0.8, 1)
                                    }
                                    local v174 = v165.cooldown
                                    if v174 ~= nil then
                                        v174 = v174.duration
                                    end
                                    v173.Text = tostring(v174) .. " sec"
                                    v173.TextColor3 = u3.WHITE
                                    v173.TextStrokeColor3 = u3.BLACK
                                    v173.TextStrokeTransparency = 0
                                    v173.FontFace = Font.fromName("Roboto", Enum.FontWeight.ExtraBold)
                                    v173.TextXAlignment = Enum.TextXAlignment.Right
                                    v173.TextYAlignment = Enum.TextYAlignment.Center
                                    v171[v172 + 1] = u5.createElement("TextLabel", v173)
                                    v169 = u5.createElement(u4, v170, v171)
                                end
                                local v175 = {
                                    ["BackgroundTransparency"] = 0.5,
                                    ["BorderSizePixel"] = 0,
                                    ["Selectable"] = true,
                                    ["Size"] = u160,
                                    ["Id"] = p161.abilityId,
                                    ["BackgroundColor3"] = u3.brighten(u3.BLACK, v163 and 0.25 or 0),
                                    ["Image"] = p161.image,
                                    ["OnClick"] = v167,
                                    ["OnHover"] = v167
                                }
                                local v176 = {}
                                local v177 = #v176
                                if v169 then
                                    v176[v177 + 1] = v169
                                end
                                return u5.createElement(u16, v175, v176)
                            end
                            local v179 = table.create(#u78)
                            for v180, v181 in u78 do
                                v179[v180] = v178(v181, v180 - 1, u78)
                            end
                            return v179
                        end
                    }) })
            else
                v157 = false
            end
            if v157 then
                v89[v156 + 1] = v157
            end
            local v182 = #v89
            local v183 = u22 ~= nil
            if v183 then
                local v184 = {
                    ["Size"] = UDim2.fromScale(1, 0.325)
                }
                local v185 = { u5.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Vertical,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }), u5.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0, 20)
                    }) }
                local v186 = #v185
                local v187 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1, 0.15)
                }
                local v190 = (function() --[[ Line: 789 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u14
                        [3] = u8
                        [4] = u3
                    --]]
                    local v188 = u22.idType
                    local v189
                    if v188 == "ItemType" then
                        v189 = u14(u22.id).displayName
                    else
                        if v188 ~= "AbilityId" then
                            return nil
                        end
                        v189 = u8[u22.id].actionBarName
                    end
                    return v189 .. " <font color=\"" .. u3.richTextColor(u3.darken(u3.WHITE, 0.5)) .. "\">(" .. u22.loadoutType .. ")</font>"
                end)()
                v187.Text = v190 == nil and "" or v190
                v187.TextColor3 = u3.WHITE
                v187.RichText = true
                v187.TextTransparency = 0.25
                v187.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                v187.TextXAlignment = Enum.TextXAlignment.Left
                v187.TextYAlignment = Enum.TextYAlignment.Top
                v185[v186 + 1] = u5.createElement("TextLabel", v187, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 24,
                        ["MinTextSize"] = 4
                    }) })
                local v191 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(1, 0.85)
                }
                local v193 = (function() --[[ Line: 829 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u14
                        [3] = u8
                    --]]
                    local v192 = u22.idType
                    if v192 == "ItemType" then
                        return u14(u22.id).description
                    end
                    if v192 == "AbilityId" then
                        return u8[u22.id].actionBarDescription
                    end
                end)()
                v191.Text = v193 == nil and "" or v193
                v191.TextColor3 = u3.WHITE
                v191.TextTransparency = 0.5
                v191.FontFace = Font.fromName("Roboto", Enum.FontWeight.Regular)
                v191.TextXAlignment = Enum.TextXAlignment.Left
                v191.TextYAlignment = Enum.TextYAlignment.Top
                v185[v186 + 2] = u5.createElement("TextLabel", v191, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 24,
                        ["MinTextSize"] = 6
                    }) })
                v183 = u5.createElement(u4, v184, v185)
            end
            if v183 then
                v89[v182 + 1] = v183
            end
            local v194 = #v89
            local v195
            if u24.hpModifier == nil then
                v195 = false
            else
                local v196 = u5.createFragment
                local v197 = {}
                local v198 = u5.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Text"] = "Stats",
                    ["TextTransparency"] = 0.25,
                    ["ZIndex"] = 100,
                    ["Size"] = UDim2.fromScale(1, 0.075),
                    ["TextColor3"] = u3.WHITE,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }, { u5.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 32,
                        ["MinTextSize"] = 8
                    }) })
                local v199 = u5.createElement
                local v200 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["TextTransparency"] = 0.25,
                    ["RichText"] = true,
                    ["ZIndex"] = 100,
                    ["Size"] = UDim2.fromScale(1, 0.075)
                }
                local v201 = u9 * u24.hpModifier
                v200.Text = "<b>Base Health:</b> " .. tostring(v201)
                v200.TextColor3 = u3.WHITE
                v200.FontFace = Font.fromName("Roboto")
                v200.TextXAlignment = Enum.TextXAlignment.Left
                v200.TextYAlignment = Enum.TextYAlignment.Center
                __set_list(v197, 1, {v198, v199("TextLabel", v200, { u5.createElement("UITextSizeConstraint", {
        ["MaxTextSize"] = 24,
        ["MinTextSize"] = 6
    }) })})
                v195 = v196(v197)
            end
            if v195 then
                v89[v194 + 1] = v195
            end
            v88 = u5.createFragment(v89)
        end
        local v202 = {
            u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }),
            u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u5.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 20),
                ["PaddingRight"] = UDim.new(0, 20),
                ["PaddingTop"] = UDim.new(0, 15),
                ["PaddingBottom"] = UDim.new(0, 15)
            }),
            [#v202 + 1] = v88
        }
        return u5.createElement("Frame", v85, v202)
    end)
}