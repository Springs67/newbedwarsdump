local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ButtonComponent
local u7 = v3.ColorUtil
local u8 = v3.DeviceUtil
local u9 = v3.Empty
local u10 = v3.ImageId
local u11 = v3.TooltipContainer
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta")
local u19 = v18.BedwarsKitSkinMeta
local u20 = v18.getSkinsForKit
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getKitSkinPriceRobuxAsync
local u26 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport
local u27 = v1.import(script, script.Parent.Parent.Parent.Parent, "misc", "player-viewport").PlayerViewport
return {
    ["KitShopShowcase"] = v14.new(u13)(function(u28, p29) --[[ Line: 29 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u21
            [3] = u8
            [4] = u12
            [5] = u17
            [6] = u19
            [7] = u2
            [8] = u16
            [9] = u13
            [10] = u26
            [11] = u15
            [12] = u24
            [13] = u5
            [14] = u7
            [15] = u10
            [16] = u11
            [17] = u4
            [18] = u22
            [19] = u23
            [20] = u6
            [21] = u20
            [22] = u9
            [23] = u27
        --]]
        local v30 = p29.useState
        local v31 = p29.useEffect
        local u32, u33 = v30(0)
        v31(function() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u25
                [3] = u33
            --]]
            if not u28.SelectedSkin then
                return nil
            end
            u25(u28.SelectedSkin):andThen(function(p34) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                if p34 ~= 0 and (p34 == p34 and p34) then
                    u33(p34)
                end
            end):catch(function() --[[ Line: 43 ]] end)
        end, { u28.SelectedSkin })
        local u35
        if u28.SelectedKit then
            u35 = u28.store
            if u35 ~= nil then
                u35 = u35.Bedwars.favoriteKits[u28.SelectedKit] ~= nil
            end
            if u35 == nil then
                u35 = false
            end
        else
            u35 = false
        end
        local v36
        if u28.SelectedKit then
            local v37 = u28.store
            if v37 ~= nil then
                local v38 = v37.Bedwars.ownedKits
                local v39 = u28.SelectedKit
                v37 = table.find(v38, v39) ~= nil
            end
            v36 = v37 or u21(u28.SelectedKit).freeKit
        else
            v36 = false
        end
        local v40
        if u8.isHoarceKat() then
            v40 = false
        else
            v40 = u12.Controllers.UnlockController.allKitsUnlocked
        end
        local u41 = v36 or v40
        local u42 = u17.DEFAULT
        local v43 = u28.SelectedKit
        if v43 then
            v43 = u28.store
            if v43 ~= nil then
                v43 = v43.Bedwars.equippedKitSkins
            end
        end
        if v43 then
            u42 = u28.store.Bedwars.equippedKitSkins[u28.SelectedKit] or u42
        end
        local v44, v45
        if u28.SelectedSkin and u28.store then
            v44 = u28.SelectedSkin == u17.DEFAULT
            if not v44 then
                if u8.isHoarceKat() then
                    local v46 = u28.store.Bedwars.ownedKitSkins
                    local v47 = u28.SelectedSkin
                    v44 = table.find(v46, v47) ~= nil
                else
                    v44 = u12.Controllers.UnlockController:isKitSkinUnlocked(u28.SelectedSkin)
                end
            end
            local v48 = u19[u28.SelectedSkin].product
            if v48 ~= nil then
                v48 = v48.devProductId
            end
            v45 = v48 ~= nil
            if v45 then
                local v49 = u19[u28.SelectedSkin].product
                if v49 ~= nil then
                    v49 = v49.priceRobux
                end
                v45 = v49 ~= nil
            end
        else
            v45 = false
            v44 = false
        end
        local function u50() --[[ Line: 124 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u12
            --]]
            if u28.SelectedSkin and u28.SelectedKit then
                u12.Controllers.KitSkinController:purchaseKitSkin(u28.SelectedSkin, u28.SelectedKit)
            end
        end
        local function u54() --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u2
                [3] = u16
                [4] = u13
                [5] = u26
            --]]
            if not u28.SelectedSkin then
                return nil
            end
            local v51 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v52 = u16.GIFTING
            local v53 = {
                ["GiftType"] = u28.SelectedSkin,
                ["CustomImage"] = u13.createElement(u26, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Kit"] = u28.SelectedKit,
                    ["Skin"] = u28.SelectedSkin,
                    ["Size"] = UDim2.fromScale(1, 1)
                })
            }
            v51:openApp(v52, v53)
        end
        local function u59() --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u35
                [3] = u15
                [4] = u41
                [5] = u8
                [6] = u24
            --]]
            if u28.SelectedKit then
                if u35 then
                    u15:dispatch({
                        ["type"] = "RemoveFavoriteKit",
                        ["kit"] = u28.SelectedKit
                    })
                else
                    if not u41 then
                        return nil
                    end
                    u15:dispatch({
                        ["type"] = "AddFavoriteKit",
                        ["kit"] = u28.SelectedKit
                    })
                end
                local v55 = u28.store
                if v55 ~= nil then
                    v55 = v55.Bedwars.favoriteKits
                end
                if v55 then
                    v55 = not u8.isHoarceKat()
                end
                if v55 then
                    local v56 = u24.Client:Get("FavoriteKitUpdate")
                    local v57 = {}
                    local v58 = u28.store
                    if v58 ~= nil then
                        v58 = v58.Bedwars.favoriteKits
                    end
                    v57.favoriteKits = v58
                    v56:SendToServer(v57)
                end
            end
        end
        local v60 = {}
        for v61, v62 in u28 do
            v60[v61] = v62
        end
        v60.SelectedKit = nil
        v60.SelectedSkin = nil
        v60.ItemImage = nil
        v60.store = nil
        local function v65(p63) --[[ Line: 189 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u5
                [3] = u54
                [4] = u7
                [5] = u10
                [6] = u11
                [7] = u4
                [8] = u28
                [9] = u22
            --]]
            local v64 = p63.Size
            return u13.createElement(u5, {
                ["BackgroundTransparency"] = 0.6,
                ["AutoButtonColor"] = true,
                ["Size"] = v64,
                ["OnClick"] = u54,
                ["BackgroundColor3"] = u7.hexColor(7631988),
                ["CornerRadius"] = UDim.new(0, 0)
            }, { u13.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["Image"] = u10.GIFTS_SOLID,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.65, 0.65)
                }), u13.createElement(u11, {}, { u13.createElement(u4, {
                        ["Text"] = "Gift Kit Skin",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u13.createElement(u4, {
                        ["TextSize"] = 14,
                        ["Text"] = not u28.SelectedSkin and "" or u22[u28.SelectedSkin].name,
                        ["Font"] = Enum.Font.SourceSansSemibold,
                        ["Limits"] = Vector2.new(300, 500)
                    }) }) })
        end
        local function v73(p66) --[[ Line: 226 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u35
                [3] = u23
                [4] = u7
                [5] = u59
                [6] = u11
                [7] = u4
            --]]
            local v67 = p66.Size
            local v68 = u13.createElement
            local v69 = "ImageButton"
            local v70 = {
                ["Size"] = v67,
                ["BackgroundTransparency"] = 1,
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0)
            }
            local v71
            if u35 then
                v71 = u23.STAR_ALT_SOLID
            else
                v71 = u23.STAR_ALT_OUTLINE
            end
            v70.Image = v71
            v70.ImageTransparency = u35 and 0 or 0.5
            local v72
            if u35 then
                v72 = u7.hexColor(16765535)
            else
                v72 = u7.WHITE
            end
            v70.ImageColor3 = v72
            v70[u13.Event.Activated] = function() --[[ Line: 236 ]]
                --[[
                Upvalues:
                    [1] = u59
                --]]
                u59()
            end
            return v68(v69, v70, { u13.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }), u13.createElement(u11, {}, { u13.createElement(u4, {
                        ["Text"] = "Favorite Kit",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) })
        end
        local function v85(p74) --[[ Line: 253 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u7
                [3] = u10
                [4] = u32
            --]]
            local v75 = p74.Size
            local v76 = u13.createElement
            local v77 = {
                ["BackgroundTransparency"] = 0.6,
                ["Size"] = v75,
                ["BackgroundColor3"] = u7.BLACK
            }
            local v78 = {}
            local v79 = u13.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.05, 0)
            })
            local v80 = u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.05)
            })
            local v81 = u13.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Image"] = u10.ROBUX,
                ["Size"] = UDim2.fromScale(0.5, 0.6),
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
            })
            local v82 = u13.createElement
            local v83 = {
                ["AutomaticSize"] = "X",
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center"
            }
            local v84 = u32
            v83.Text = tostring(v84)
            v83.Size = UDim2.fromScale(0, 0.5)
            v83.TextColor3 = Color3.fromRGB(255, 255, 255)
            __set_list(v78, 1, {v79, v80, v81, v82("TextLabel", v83)})
            return v76("Frame", v77, v78)
        end
        local function v88(p86) --[[ Line: 293 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u6
                [3] = u50
                [4] = u7
                [5] = u42
                [6] = u28
            --]]
            local v87 = p86.Size
            return u13.createElement(u6, {
                ["Text"] = "BUY SKIN",
                ["AutoButtonColor"] = true,
                ["Size"] = v87,
                ["OnClick"] = u50,
                ["BackgroundColor3"] = u7.WHITE,
                ["BackgroundTransparency"] = u42 == u28.SelectedSkin and 0.8 or 0.6,
                ["TextColor3"] = u7.WHITE,
                ["CornerRadius"] = UDim.new(0, 0)
            })
        end
        local v89 = {
            ["Image"] = "rbxassetid://93313483017936",
            ["ImageTransparency"] = 0.7,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["BackgroundColor3"] = u7.hexColor(3092567),
            ["ScaleType"] = Enum.ScaleType.Crop
        }
        for v90, v91 in v60 do
            v89[v90] = v91
        end
        local v92
        if u28.SelectedKit == nil then
            v92 = false
        else
            v92 = u20(u28.SelectedKit) ~= nil
        end
        if v92 then
            local v93 = {
                ["Size"] = UDim2.new(1, 0, 0.2, 0),
                ["Position"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(1, 1)
            }
            local v94 = { u13.createElement("UISizeConstraint", {
                    ["MaxSize"] = Vector2.new((1 / 0), 30)
                }), u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Bottom",
                    ["HorizontalAlignment"] = "Right"
                }) }
            local v95 = #v94
            local v96 = v45 and not u8.isSmallScreen()
            if v96 then
                v96 = u13.createElement(v85, {
                    ["Size"] = UDim2.fromScale(0.25, 1)
                })
            end
            if v96 then
                v94[v95 + 1] = v96
            end
            local v97 = #v94
            local v98 = v45 and not v44
            if v98 then
                v98 = u13.createElement(v88, {
                    ["Size"] = UDim2.fromScale(u8.isSmallScreen() and 0.6 or 0.4, 1)
                })
            end
            if v98 then
                v94[v97 + 1] = v98
            end
            local v99 = #v94
            if v45 then
                v45 = u13.createElement(v65, {
                    ["Size"] = UDim2.fromScale(u8.isSmallScreen() and 0.2 or 0.125, 1)
                })
            end
            if v45 then
                v94[v99 + 1] = v45
            end
            v92 = u13.createFragment({
                ["ActionButtons"] = u13.createElement(u9, v93, v94)
            })
        end
        local v100 = {}
        local v101 = u13.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0.05, 0),
            ["PaddingRight"] = UDim.new(0.05, 0),
            ["PaddingBottom"] = UDim.new(0.05, 0),
            ["PaddingLeft"] = UDim.new(0.05, 0)
        })
        local v102
        if u28.SelectedKit == nil then
            if u28.ItemImage == nil then
                v102 = u13.createElement(u27, {
                    ["SizeConstraint"] = "RelativeYY",
                    ["Rotate"] = true,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0)
                })
            else
                v102 = u13.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u28.ItemImage
                })
            end
        else
            v102 = u13.createElement(u26, {
                ["SizeConstraint"] = "RelativeYY",
                ["Kit"] = u28.SelectedKit,
                ["Skin"] = u28.SelectedSkin,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            })
        end
        __set_list(v100, 1, {v101, v102})
        local v103 = #v100
        if v92 then
            v100[v103 + 1] = v92
        end
        local v104 = #v100
        local v105 = u28.SelectedKit and u41
        if v105 then
            v105 = u13.createFragment({
                ["FavoriteButton"] = u13.createElement(u9, {
                    ["Size"] = UDim2.fromScale(1, 0.15)
                }, { u13.createElement(v73, {
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) })
            })
        end
        if v105 then
            v100[v104 + 1] = v105
        end
        return u13.createFragment({
            ["TopSection"] = u13.createElement("ImageLabel", v89, v100)
        })
    end)
}