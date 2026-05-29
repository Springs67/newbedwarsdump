local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.DividerComponent
local u7 = v3.Empty
local u8 = v3.SoundManager
local u9 = v3.UILayers
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.MarketplaceService
local u16 = v14.Players
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-utils").GiftUtils
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util")
local u30 = v29.getKitPriceBedCoins
local u31 = v29.getKitPriceRobuxAsync
local u32 = v29.getKitRentalBedCoinProduct
local u33 = v29.getKitSkinPriceRobuxAsync
local u34 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "square-image-button").SquareImageButton
local u35 = v1.import(script, script.Parent, "kit-details-equip-button").KitDetailsEquipButton
return {
    ["KitDetailsKitActionButtons"] = v13.new(u12)(function(u36, p37) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u30
            [3] = u31
            [4] = u33
            [5] = u24
            [6] = u22
            [7] = u21
            [8] = u5
            [9] = u10
            [10] = u25
            [11] = u11
            [12] = u20
            [13] = u32
            [14] = u8
            [15] = u28
            [16] = u12
            [17] = u17
            [18] = u2
            [19] = u19
            [20] = u15
            [21] = u16
            [22] = u9
            [23] = u4
            [24] = u34
            [25] = u26
            [26] = u7
            [27] = u6
            [28] = u35
            [29] = u18
            [30] = u27
        --]]
        local v38 = p37.useState
        local v39 = p37.useEffect
        local v40, u41 = v38(u36.store.Bedwars.kit or u23.NONE)
        local u42, u43 = v38({
            ["robux"] = nil,
            ["bedcoins"] = nil
        })
        local v44, u45 = v38(nil)
        v39(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u36
                [3] = u31
                [4] = u43
            --]]
            task.spawn(function() --[[ Line: 47 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u36
                    [3] = u31
                    [4] = u43
                --]]
                local v46 = u30(u36.SelectedKit)
                local v47, v48 = u31(u36.SelectedKit):await()
                local v49 = u43
                local v50 = {}
                if not v47 then
                    v48 = nil
                end
                v50.robux = v48
                v50.bedcoins = v46
                v49(v50)
            end)
        end, {})
        v39(function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u33
                [3] = u45
            --]]
            task.spawn(function() --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u33
                    [3] = u45
                --]]
                if u36.SelectedKitSkin then
                    local v51, v52 = u33(u36.SelectedKitSkin):await()
                    if v51 then
                        u45(v52)
                    end
                end
            end)
        end, { u36.SelectedKitSkin })
        v39(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u36
                [3] = u23
            --]]
            u41(u36.store.Bedwars.kit or u23.NONE)
        end, { u36.store.Bedwars.kit })
        local u53 = u24(u36.SelectedKit)
        local v54
        if u36.SelectedKitSkin then
            v54 = u22[u36.SelectedKitSkin]
        else
            v54 = nil
        end
        local v55, v56
        if u36.SelectedKitSkin then
            v55 = u36.SelectedKitSkin == u21.DEFAULT
            if not v55 then
                if u5.isHoarceKat() then
                    local v57 = u36.store.Bedwars.ownedKitSkins
                    local v58 = u36.SelectedKitSkin
                    v55 = table.find(v57, v58) ~= nil
                else
                    v55 = u10.Controllers.UnlockController:isKitSkinUnlocked(u36.SelectedKitSkin)
                end
            end
            local v59
            if v54 == nil then
                v59 = v54
            else
                v59 = v54.product
                if v59 ~= nil then
                    v59 = v59.devProductId
                end
            end
            v56 = v59 ~= nil
            if v56 then
                if v54 ~= nil then
                    v54 = v54.product
                    if v54 ~= nil then
                        v54 = v54.priceRobux
                    end
                end
                v56 = v54 ~= nil
            end
        else
            v55 = false
            v56 = false
        end
        local v60 = false
        local v61 = v40 == u36.SelectedKit
        local v62 = false
        local v63 = false
        local v64 = false
        local u65 = false
        local v66
        if u5.isHoarceKat() then
            v66 = u36.SelectedKit == u23.NONE and true or u53.freeKit
            if not v66 then
                local v67 = u36.store.Bedwars.ownedKits
                local v68 = u36.SelectedKit
                v66 = table.find(v67, v68) ~= nil
            end
        else
            v66 = u10.Controllers.UnlockController:isKitOwned(u36.SelectedKit)
        end
        local u69 = v66 and true or v60
        local v70 = not u69
        if v70 then
            v70 = u36.SelectedKit ~= u23.NONE
        end
        if v70 then
            v70 = u42.robux
            if v70 == 0 or (v70 ~= v70 or not v70) then
                v70 = u42.bedcoins
            end
        end
        local v71 = v70 ~= 0 and (v70 == v70 and v70) and true or v62
        local v72
        if u5.isHoarceKat() then
            v72 = u36.SelectedKit == u23.NONE and true or u24(u36.SelectedKit).freeKit
            if not v72 then
                local v73 = u36.store.Bedwars.ownedKits
                local v74 = u36.SelectedKit
                v72 = table.find(v73, v74) ~= nil
            end
        else
            local v75 = u10.Controllers.UnlockController:isKitUnlocked(u36.SelectedKit)
            if not v75 then
                local v76 = u10.Controllers.MatchController
                if v76 ~= nil then
                    v76 = v76:getQueueMeta()
                    if v76 ~= nil then
                        v76 = v76.allowUnownedKits
                    end
                end
                v75 = v76 == true
            end
            v72 = v75 and true or v64
        end
        local v77 = not u53.notGiftable and ((u53.devProductId ~= nil or u53.gamepassId ~= nil) and u25.isKitGift(u36.SelectedKit))
        if v77 then
            v77 = u36.SelectedKit ~= u23.NONE
        end
        local v78
        if v56 then
            if u36.SelectedKitSkin then
                v78 = u25.isKitSkinGift(u36.SelectedKitSkin)
            else
                v78 = false
            end
        else
            v78 = v56
        end
        local v79 = nil
        for v80, v81 in u11.entries(u36.store.Consumable.record) do
            local _ = v80 - 1
            local _ = v81[1]
            local v82 = v81[2]
            local v83 = v82.status == u20.ACTIVE
            if v83 then
                local v84 = v82.extraData
                if v84 ~= nil then
                    v84 = v84.rentedKit
                end
                v83 = v84 == u36.SelectedKit
            end
            if v83 == true then
                v79 = v81
                break
            end
        end
        if v79 ~= nil then
            v79 = v79[2]
        end
        local v85 = v79 ~= nil
        local u86 = u32(u36.SelectedKit)
        local v87
        if u86 == nil then
            v87 = u86
        else
            v87 = u86.purchaseData
        end
        local v88 = not (v85 or (u69 or u53.disableKitRenting))
        if v88 then
            v88 = u86 ~= nil
        end
        if v88 then
            if v87 ~= nil then
                v87 = v87.productType
            end
            v88 = v87 == "RentKit"
            if v88 then
                v88 = not v72
            end
        end
        local v89 = v88 and true or v63
        if u36.SelectedKit then
            u65 = u36.store
            if u65 ~= nil then
                u65 = u65.Bedwars.favoriteKits[u36.SelectedKit] ~= nil
            end
            if u65 == nil then
                u65 = false
            end
        end
        local v90 = {
            ["Title"] = "PURCHASE KIT",
            ["Size"] = UDim2.new(0.85, -10, 1, 0)
        }
        local v91 = {}
        local v92 = #v91
        local v93 = u42.robux
        local v94 = (v93 == 0 or (v93 ~= v93 or not v93)) and {} or {
            {
                ["robux"] = u42.robux
            }
        }
        local v95 = #v94
        table.move(v94, 1, v95, v92 + 1, v91)
        local v96 = v92 + v95
        local v97 = u42.bedcoins
        local v98 = (v97 == 0 or (v97 ~= v97 or not v97)) and {} or {
            {
                ["bedcoin"] = u42.bedcoins
            }
        }
        table.move(v98, 1, #v98, v96 + 1, v91)
        v90.Cost = v91
        local v99 = u42.robux
        local v100
        if v99 == 0 or (v99 ~= v99 or not v99) then
            v100 = nil
        else
            v100 = Color3.fromRGB(255, 224, 107)
        end
        v90.BackgroundColor3 = v100
        v90.Selectable = true
        function v90.OnClick() --[[ Line: 262 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u28
                [3] = u42
                [4] = u12
                [5] = u17
                [6] = u2
                [7] = u19
                [8] = u36
                [9] = u53
                [10] = u15
                [11] = u16
                [12] = u10
                [13] = u9
            --]]
            u8:playSound(u28.UI_CLICK)
            local v101 = {}
            local v102 = u42.robux
            if v102 ~= 0 and (v102 == v102 and v102) then
                local v103 = u12.createElement
                local v104 = u17
                local v106 = {
                    ["Selectable"] = true,
                    ["Size"] = UDim2.new(0.25, 0, 1, 0),
                    ["Cost"] = {
                        {
                            ["robux"] = u42.robux
                        }
                    },
                    ["OnClick"] = function() --[[ Name: OnClick, Line 274 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u19
                            [3] = u36
                            [4] = u53
                            [5] = u15
                            [6] = u16
                        --]]
                        local function v105() --[[ Line: 275 ]]
                            --[[
                            Upvalues:
                                [1] = u2
                                [2] = u19
                                [3] = u36
                            --]]
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.PURCHASE_OPTIONS_SCREEN_APP)
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.KIT_DETAILS_APP, {
                                ["SelectedKit"] = u36.SelectedKit
                            })
                        end
                        if u53.gamepassId == nil then
                            if u53.devProductId ~= nil then
                                u15:PromptProductPurchase(u16.LocalPlayer, u53.devProductId)
                                v105()
                            end
                        else
                            u15:PromptGamePassPurchase(u16.LocalPlayer, u53.gamepassId)
                            v105()
                        end
                    end
                }
                local v107 = v103(v104, v106)
                table.insert(v101, v107)
            end
            local v108 = u42.bedcoins
            if v108 ~= 0 and (v108 == v108 and v108) then
                local v109 = u12.createElement
                local v110 = u17
                local v112 = {
                    ["Selectable"] = true,
                    ["Size"] = UDim2.new(0.25, 0, 1, 0),
                    ["Cost"] = {
                        {
                            ["bedcoin"] = u42.bedcoins
                        }
                    },
                    ["BackgroundColor3"] = Color3.fromRGB(255, 224, 107),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 302 ]]
                        --[[
                        Upvalues:
                            [1] = u53
                            [2] = u10
                            [3] = u2
                            [4] = u19
                            [5] = u36
                        --]]
                        local v111 = u53.bedCoinProduct
                        if v111 ~= nil then
                            v111 = v111.bedCoinProductId
                        end
                        if v111 ~= 0 and (v111 == v111 and v111) then
                            u10.Controllers.BedCoinProductPurchaseController:purchase({
                                ["productId"] = u53.bedCoinProduct.bedCoinProductId
                            })
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.PURCHASE_OPTIONS_SCREEN_APP)
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.KIT_DETAILS_APP, {
                                ["SelectedKit"] = u36.SelectedKit
                            })
                        end
                    end
                }
                local v113 = v109(v110, v112)
                table.insert(v101, v113)
            end
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.PURCHASE_OPTIONS_SCREEN_APP, {
                ["Description"] = "Please select your payment method.",
                ["Title"] = "Purchase " .. u53.name .. " Kit",
                ["Image"] = u53.renderImage,
                ["Buttons"] = v101,
                ["OnExit"] = function() --[[ Name: OnExit, Line 327 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u9
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u9.MAIN)
                end,
                ["OnBack"] = function() --[[ Name: OnBack, Line 330 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u19
                        [3] = u36
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.PURCHASE_OPTIONS_SCREEN_APP)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.KIT_DETAILS_APP, {
                        ["SelectedKit"] = u36.SelectedKit
                    })
                end
            })
        end
        v90.LayoutOrder = 0
        local v114 = u12.createElement(u17, v90)
        local v115 = u12.createElement("Frame", {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 0.5,
            ["Size"] = UDim2.new(0.85, -10, 1, 0),
            ["BackgroundColor3"] = u4.BLACK
        }, { u12.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }), u12.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundColor3"] = u4.BLACK
            }, { u12.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u12.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
                }) }), u12.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Text"] = "UNOBTAINABLE",
                ["TextTransparency"] = 0.4,
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) })
        local v116 = {}
        for v117, v118 in u36 do
            v116[v117] = v118
        end
        v116.SelectedKit = nil
        v116.SelectedKitSkin = nil
        v116.store = nil
        local v119 = {}
        for v120, v121 in v116 do
            v119[v120] = v121
        end
        local v122 = u36.SelectedKitSkin
        if v122 then
            if v44 == nil then
                v122 = false
            else
                v122 = v56
            end
        end
        if v122 then
            local v123 = {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.33)
            }
            local v124 = {}
            local v125 = u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
            local v126
            if v55 then
                v126 = u12.createElement("Frame", {
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.new(0.85, -10, 1, 0),
                    ["BackgroundColor3"] = Color3.fromRGB(204, 194, 61)
                }, { u12.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = "OWNED KIT SKIN",
                        ["TextTransparency"] = 0.4,
                        ["Size"] = UDim2.fromScale(0.8, 0.8),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }), u12.createElement("Frame", {
                        ["BorderSizePixel"] = 0,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["BackgroundColor3"] = u4.BLACK
                    }, { u12.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.1, 0)
                        }), u12.createElement("UIGradient", {
                            ["Rotation"] = 90,
                            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
                        }) }), u12.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }) })
            else
                v126 = u12.createElement(u17, {
                    ["Title"] = "PURCHASE KIT SKIN",
                    ["Selectable"] = true,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.new(0.85, -10, 1, 0),
                    ["Cost"] = {
                        {
                            ["robux"] = v44
                        }
                    },
                    ["OnClick"] = function() --[[ Name: OnClick, Line 411 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u28
                            [3] = u10
                            [4] = u36
                        --]]
                        u8:playSound(u28.UI_CLICK)
                        u10.Controllers.KitSkinController:purchaseKitSkin(u36.SelectedKitSkin, u36.SelectedKit)
                    end
                })
            end
            __set_list(v124, 1, {v125, v126})
            local v127 = #v124
            if v78 then
                v78 = u12.createElement(u34, {
                    ["Selectable"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.15, 1),
                    ["BackgroundColor3"] = Color3.fromRGB(84, 214, 235),
                    ["Image"] = u26.GIFT_SOLID,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 459 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u28
                            [3] = u2
                            [4] = u19
                            [5] = u36
                            [6] = u9
                        --]]
                        u8:playSound(u28.UI_CLICK)
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.GIFTING, {
                            ["GiftType"] = u36.SelectedKitSkin
                        }, u9.OVERLAY)
                    end
                })
            end
            if v78 then
                v124[v127 + 1] = v78
            end
            v122 = u12.createElement(u7, v123, v124)
        end
        local v128 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v129 = #v128
        if v122 then
            v128[v129 + 1] = v122
        end
        local v130 = #v128
        local v131 = u36.SelectedKitSkin
        if v131 then
            if v44 == nil then
                v56 = false
            elseif v56 then
                v56 = u12.createElement(u6, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(1, 0, 0, 2),
                    ["BarColor"] = {
                        ["Transparency"] = 0.5
                    }
                })
            end
        else
            v56 = v131
        end
        if v56 then
            v128[v130 + 1] = v56
        end
        local v132 = #v128
        local v133 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.33)
        }
        local v134 = {}
        local v135 = u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["Padding"] = UDim.new(0, 10),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })
        if v72 then
            v115 = u12.createElement(u35, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0.85, -10, 1, 0),
                ["SelectedKit"] = u36.SelectedKit,
                ["Equipped"] = v61,
                ["ActiveRental"] = v79
            })
        elseif v71 then
            v115 = v114
        end
        __set_list(v134, 1, {v135, v115})
        local v136 = #v134
        local v137
        if v77 then
            v137 = u12.createElement(u34, {
                ["Selectable"] = true,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(0.15, 1),
                ["BackgroundColor3"] = Color3.fromRGB(84, 214, 235),
                ["Image"] = u26.GIFT_SOLID,
                ["OnClick"] = function() --[[ Name: OnClick, Line 523 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u28
                        [3] = u2
                        [4] = u19
                        [5] = u36
                        [6] = u9
                    --]]
                    u8:playSound(u28.UI_CLICK)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.GIFTING, {
                        ["GiftType"] = u36.SelectedKit
                    }, u9.OVERLAY)
                end
            })
        else
            v137 = v77
        end
        if v137 then
            v134[v136 + 1] = v137
        end
        v128[v132 + 1] = u12.createElement(u7, v133, v134)
        if v72 then
            if v71 then
                v71 = u12.createElement(u7, {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 0.33)
                }, { u12.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["Padding"] = UDim.new(0, 10),
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder
                    }), v114, u12.createElement(u7, {
                        ["Size"] = UDim2.fromScale(0.15, 1)
                    }) })
            end
        else
            v71 = v72
        end
        if v71 then
            v128[v132 + 2] = v71
        end
        local v138 = #v128
        if v89 then
            local v139 = {
                ["Title"] = "RENT KIT",
                ["Size"] = UDim2.new(0.85, -10, 1, 0)
            }
            local v140 = {
                ["custom"] = 1,
                ["Image"] = u26.KIT_RENTAL_PASS_ALL
            }
            local v141 = {}
            local v142
            if u86 == nil then
                v142 = u86
            else
                v142 = u86.cost
            end
            v141.bedcoin = v142
            v139.Cost = { v140, v141 }
            v139.BackgroundColor3 = Color3.fromRGB(255, 224, 107)
            v139.Selectable = true
            function v139.OnClick() --[[ Line: 575 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u28
                    [3] = u2
                    [4] = u19
                    [5] = u53
                    [6] = u86
                    [7] = u36
                    [8] = u10
                    [9] = u12
                    [10] = u17
                    [11] = u26
                    [12] = u9
                --]]
                u8:playSound(u28.UI_CLICK)
                local v143 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v144 = u19.PURCHASE_OPTIONS_SCREEN_APP
                local v145 = {
                    ["Description"] = "Please select your payment method.",
                    ["Title"] = "Rent " .. u53.name .. " Kit",
                    ["Image"] = u53.renderImage
                }
                local v146 = {
                    ["Size"] = UDim2.new(0.25, 0, 1, 0)
                }
                local v147 = {}
                local v148 = u86
                if v148 ~= nil then
                    v148 = v148.cost
                end
                v147.bedcoin = v148
                v146.Cost = { v147 }
                v146.BackgroundColor3 = Color3.fromRGB(255, 224, 107)
                v146.Selectable = true
                function v146.OnClick() --[[ Line: 598 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u19
                        [3] = u36
                        [4] = u10
                    --]]
                    local function v149() --[[ Line: 599 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u19
                            [3] = u36
                        --]]
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.PURCHASE_OPTIONS_SCREEN_APP)
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.KIT_DETAILS_APP, {
                            ["SelectedKit"] = u36.SelectedKit
                        })
                    end
                    u10.Controllers.KitRentalController:promptBedCoinPurchaseKitRental(u36.SelectedKit)
                    v149()
                end
                local v150 = {}
                local v151 = u12.createElement(u17, v146)
                local v152 = u12.createElement
                local v153 = u17
                local v154 = {
                    ["Selectable"] = true,
                    ["Size"] = UDim2.new(0.25, 0, 1, 0),
                    ["Cost"] = {
                        {
                            ["custom"] = 1,
                            ["Image"] = u26.KIT_RENTAL_PASS_ALL
                        }
                    },
                    ["BackgroundColor3"] = Color3.fromRGB(255, 224, 107),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 616 ]]
                        --[[
                        Upvalues:
                            [1] = u2
                            [2] = u19
                            [3] = u36
                            [4] = u10
                        --]]
                        return u10.Controllers.KitRentalController:rentKit(u36.SelectedKit)
                    end
                }
                __set_list(v150, 1, {v151, v152(v153, v154)})
                v145.Buttons = v150
                function v145.OnExit() --[[ Line: 626 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u9
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u9.MAIN)
                end
                function v145.OnBack() --[[ Line: 629 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u19
                        [3] = u36
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.PURCHASE_OPTIONS_SCREEN_APP)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u19.KIT_DETAILS_APP, {
                        ["SelectedKit"] = u36.SelectedKit
                    })
                end
                v143:openApp(v144, v145)
            end
            v139.LayoutOrder = 0
            v89 = u12.createElement(u17, v139)
        end
        local v155 = {
            ["LayoutOrder"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.33)
        }
        local v156 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Right,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0, 10),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v157 = #v156
        if v89 then
            v156[v157 + 1] = v89
        end
        local v158 = #v156
        local v159
        if u69 then
            local v160 = u12.createElement
            local v161 = u34
            local v162 = {
                ["Selectable"] = true,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.15, 1)
            }
            local v163
            if u65 then
                v163 = u26.STAR_ALT_SOLID
            else
                v163 = u26.STAR_ALT_OUTLINE
            end
            v162.Image = v163
            v162.ImageTransparency = u65 and 0 or 0.5
            v162.BackgroundColor3 = Color3.fromRGB(51, 51, 51)
            function v162.OnClick() --[[ Line: 664 ]]
                --[[
                Upvalues:
                    [1] = u65
                    [2] = u18
                    [3] = u36
                    [4] = u69
                    [5] = u5
                    [6] = u27
                --]]
                if u65 then
                    u18:dispatch({
                        ["type"] = "RemoveFavoriteKit",
                        ["kit"] = u36.SelectedKit
                    })
                else
                    if not u69 then
                        return nil
                    end
                    u18:dispatch({
                        ["type"] = "AddFavoriteKit",
                        ["kit"] = u36.SelectedKit
                    })
                end
                local v164 = u36.store
                if v164 ~= nil then
                    v164 = v164.Bedwars.favoriteKits
                end
                if v164 then
                    v164 = not u5.isHoarceKat()
                end
                if v164 then
                    local v165 = u27.Client:Get("FavoriteKitUpdate")
                    local v166 = {}
                    local v167 = u36.store
                    if v167 ~= nil then
                        v167 = v167.Bedwars.favoriteKits
                    end
                    v166.favoriteKits = v167
                    v165:SendToServer(v166)
                end
            end
            v159 = v160(v161, v162)
        elseif v77 then
            v159 = u12.createElement(u7, {
                ["Size"] = UDim2.fromScale(0.15, 1)
            })
        else
            v159 = nil
        end
        if v159 then
            v156[v158 + 1] = v159
        end
        v128[v138 + 1] = u12.createElement(u7, v155, v156)
        return u12.createElement(u7, v119, v128)
    end)
}