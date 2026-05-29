local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.SoundManager
local u8 = v2.TooltipContainer
local u9 = v2.UIUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.TweenService
local u16 = v14.UserInputService
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "badge").Badge
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableStatus
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = v1.import(script, script.Parent.Parent.Parent, "misc", "kit-viewport").KitViewport
local v28 = u13.Component:extend("KitShopItemCard")
function v28.init(p29) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
    --]]
    p29.hoverMaid = u12.new()
    p29.ref = u13.createRef()
    p29.maid = u12.new()
end
function v28.didMount(p30) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u7
        [3] = u26
        [4] = u21
        [5] = u5
        [6] = u9
    --]]
    local v31 = #u16:GetConnectedGamepads() ~= 0 and p30.ref:getValue()
    if v31 then
        p30.maid:GiveTask(v31.SelectionGained:Connect(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u26
            --]]
            u7:playSound(u26.UI_CLICK)
        end))
        if p30.props.Kit == u21.NONE and not u5.isHoarceKat() then
            u9:selectGui(v31)
        end
    end
end
function v28.willUnmount(p32) --[[ Line: 50 ]]
    p32.maid:DoCleaning()
end
function v28.render(u33) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u5
        [3] = u21
        [4] = u18
        [5] = u10
        [6] = u23
        [7] = u11
        [8] = u20
        [9] = u24
        [10] = u13
        [11] = u4
        [12] = u7
        [13] = u26
        [14] = u15
        [15] = u25
        [16] = u6
        [17] = u27
        [18] = u17
        [19] = u8
        [20] = u3
        [21] = u19
    --]]
    local v34 = u22(u33.props.Kit)
    local u35 = u33.props.SelectionMode == "VIEW_ONLY"
    local v36
    if u33.props.Kit then
        v36 = u33.props.store
        if v36 ~= nil then
            v36 = v36.Bedwars.favoriteKits[u33.props.Kit] ~= nil
        end
        if v36 == nil then
            v36 = false
        end
    else
        v36 = false
    end
    local v37
    if u5.isHoarceKat() then
        v37 = u33.props.Kit == u21.NONE and true or u22(u33.props.Kit).freeKit
        if not v37 then
            local v38 = u18:getState().Bedwars.ownedKits
            local v39 = u33.props.Kit
            v37 = table.find(v38, v39) ~= nil
        end
    else
        v37 = u10.Controllers.UnlockController:isKitOwned(u33.props.Kit)
    end
    local v40 = u33.props.store.Bedwars.kit == u33.props.Kit
    local v41 = not (u33.props.store.Bedwars.kit or u33.props.Kit) and true or v40
    local v42 = u23.FreeKitRotation.kitAvailableThisWeek(u33.props.Kit, u33.props.store.Bedwars.freeKitLevel)
    local v43 = u23.FreeKitRotation.getFreeKitLevelReq(u33.props.Kit)
    local v44 = v34.limitedTime
    local v45 = v34.unlockedInBattlePass
    if v45 == nil then
        v45 = false
    end
    local v46 = u33.props.store.Clans.myClan
    if v46 ~= nil then
        v46 = v46.kitShop.unlocks[u33.props.Kit] ~= nil
    end
    if v46 == nil then
        v46 = false
    end
    local v47 = nil
    for v48, v49 in u11.entries(u33.props.store.Consumable.record) do
        local _ = v48 - 1
        local _ = v49[1]
        local v50 = v49[2]
        local v51 = v50.status == u20.ACTIVE
        if v51 then
            local v52 = v50.extraData
            if v52 ~= nil then
                v52 = v52.rentedKit
            end
            v51 = v52 == u33.props.Kit
        end
        if v51 == true then
            v47 = v49
            break
        end
    end
    if v47 ~= nil then
        v47 = v47[2]
    end
    local v53 = v47 ~= nil
    local v54
    if v34.kitClass == nil then
        v54 = nil
    else
        v54 = u24(v34.kitClass)
    end
    local v55 = {
        [u13.Ref] = u33.ref,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v56
    if v37 and u33.props.SelectionMode == "OPEN_DETAILS" then
        v56 = Color3.fromRGB(255, 255, 255)
    else
        v56 = u4.BLACK
    end
    v55.BackgroundColor3 = v56
    v55.BackgroundTransparency = u33.props.Selected and 0.25 or 0.5
    v55.BorderSizePixel = v41 and 1 or 0
    v55.BorderMode = "Outline"
    v55.BorderColor3 = u4.hexColor(16771973)
    v55.LayoutOrder = u33.props.LayoutOrder
    v55.AutoButtonColor = false
    v55.Selectable = true
    v55[u13.Event.MouseButton1Click] = function() --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u7
            [3] = u26
            [4] = u33
        --]]
        if u35 then
            return nil
        end
        u7:playSound(u26.UI_CLICK)
        u33.props.OnClick()
    end
    v55[u13.Event.MouseButton2Click] = function() --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u7
            [3] = u26
            [4] = u33
        --]]
        if u35 then
            return nil
        end
        u7:playSound(u26.UI_CLICK)
        local v57 = u33.props.OnRightClick
        if v57 ~= nil then
            v57()
        end
    end
    v55[u13.Event.MouseEnter] = function(p58) --[[ Line: 166 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u33
            [3] = u15
        --]]
        if u35 then
            return nil
        end
        u33.hoverMaid:DoCleaning()
        if not u33.props.Selected then
            local u59 = u15:Create(p58, TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = 0.25
            })
            u33.hoverMaid:GiveTask(function() --[[ Line: 175 ]]
                --[[
                Upvalues:
                    [1] = u59
                --]]
                u59:Cancel()
            end)
            u59:Play()
        end
    end
    v55[u13.Event.MouseLeave] = function(p60) --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u33
            [3] = u15
        --]]
        if u35 then
            return nil
        end
        u33.hoverMaid:DoCleaning()
        if not u33.props.Selected then
            local u61 = u15:Create(p60, TweenInfo.new(0.12), {
                ["BackgroundTransparency"] = u33.props.Selected and 0.25 or 0.5
            })
            u33.hoverMaid:GiveTask(function() --[[ Line: 190 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                u61:Cancel()
            end)
            u61:Play()
        end
    end
    local v62 = {}
    local v63 = u13.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.02, 0)
    })
    local v64 = u13.createElement
    local v65 = "UIStroke"
    local v66 = {}
    local v67
    if u33.props.Selected then
        v67 = Color3.fromRGB(255, 227, 66)
    else
        v67 = u4.WHITE
    end
    v66.Color = v67
    v66.Thickness = u33.props.Selected and 2 or 1
    v66.Transparency = u33.props.Selected and 0 or 0.5
    __set_list(v62, 1, {v63, v64(v65, v66)})
    local v68 = #v62
    local v69 = v36 and not u35
    if v69 then
        v69 = u13.createElement("ImageLabel", {
            ["ImageTransparency"] = 0.8,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Image"] = u25.STAR_ALT_SOLID
        })
    end
    if v69 then
        v62[v68 + 1] = v69
    end
    local v70 = #v62
    v62[v70 + 1] = u13.createElement(u6, {
        ["Size"] = UDim2.fromScale(0.92, 0.92),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }, { u13.createElement(u27, {
            ["Kit"] = u33.props.Kit,
            ["ImageTransparency"] = u33.props.Banned and 0.6 or 0
        }) })
    local v71 = u33.props.Banned
    if v71 then
        v71 = u13.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.75, 0.75),
            ["Image"] = u25.BLOCK_ICON,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    end
    if v71 then
        v62[v70 + 2] = v71
    end
    local v72 = #v62
    local v73
    if v42 then
        v73 = not u35
    else
        v73 = v42
    end
    if v73 then
        local v74 = (v43 == nil and 0 or v43) > 0
        if v74 then
            local v75 = {
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["BackgroundColor3"] = u4.hexColor(2789761)
            }
            local v76 = { u13.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(6, 6)
                }) }
            local v77 = #v76
            local v78 = {
                ["Size"] = UDim2.fromScale(0.9, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = (v43 == nil and 0 or v43) <= 0 and "" or "Lv. " .. tostring(v43),
                ["Font"] = "Roboto",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["LayoutOrder"] = 2
            }
            v76[v77 + 1] = u13.createElement("TextLabel", v78)
            v74 = u13.createElement("Frame", v75, v76)
        end
        local v79 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.22),
            ["Image"] = u25.BANNER_HORIZONTAL,
            ["Position"] = UDim2.fromScale(0.5, -0.01),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v80 = { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.8421052631578947
            }), u13.createElement("TextLabel", {
                ["Text"] = "FREE THIS WEEK!",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["Size"] = UDim2.fromScale(0.75, 0.45),
                ["Position"] = UDim2.fromScale(0.5, 0.13),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }) }
        local v81 = #v80
        if v74 then
            v80[v81 + 1] = v74
        end
        v73 = u13.createElement("ImageLabel", v79, v80)
    end
    if v73 then
        v62[v72 + 1] = v73
    end
    local v82 = #v62
    local v83 = v44 and not (u35 or v42)
    if v83 then
        v83 = u13.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.22),
            ["Image"] = u25.BANNER_HORIZONTAL,
            ["Position"] = UDim2.fromScale(0.5, -0.01),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["ImageColor3"] = Color3.fromRGB(252, 122, 122)
        }, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.8421052631578947
            }), u13.createElement("TextLabel", {
                ["Text"] = "LIMITED",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["Size"] = UDim2.fromScale(0.75, 0.45),
                ["Position"] = UDim2.fromScale(0.5, 0.13),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }) })
    end
    if v83 then
        v62[v82 + 1] = v83
    end
    local v84 = #v62
    v62.KitTrainingIcons = u13.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.16),
        ["AnchorPoint"] = Vector2.new(-1, 0),
        ["Position"] = UDim2.fromScale(0.03, 0.03)
    }, { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.05, 0)
        }) })
    local v85 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.16),
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(0.97, 0.03)
    }
    local v86 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Right",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v87 = #v86
    local v88 = v34.featured and not u35
    if v88 then
        v88 = u13.createElement(u17, {
            ["Text"] = v34.featured.text,
            ["TextLabelProps"] = {
                ["LayoutOrder"] = 90
            },
            ["BackgroundColor"] = v34.featured.backgroundColor
        })
    end
    if v88 then
        v86[v87 + 1] = v88
    end
    local v89 = #v86
    if v53 then
        v53 = u13.createElement("TextLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["Text"] = "\226\143\176",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 97,
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u13.createElement(u8, {}, { u13.createElement(u3, {
                    ["Text"] = "Unlocked with Rental Pass",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end
    if v53 then
        v86[v89 + 1] = v53
    end
    local v90 = #v86
    if v46 then
        v46 = u13.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 98,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u25.CLAN
        }, { u13.createElement(u8, {}, { u13.createElement(u3, {
                    ["Text"] = "Unlocked by Clan",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end
    if v46 then
        v86[v90 + 1] = v46
    end
    local v91 = #v86
    local v92 = not v37 and ((v34.priceRobux ~= nil or v34.bedCoinProduct ~= nil) and not u35)
    if v92 then
        v92 = u13.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 100,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u25.BED_COIN_ICON
        }, { u13.createElement(u8, {}, { u13.createElement(u3, {
                    ["Text"] = "Purchasable",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end
    if v92 then
        v86[v91 + 1] = v92
    end
    local v93 = #v86
    local v94 = v34.battlepassSeason
    if v94 then
        v94 = u13.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 99,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u19(v34.battlepassSeason).icon
        }, { u13.createElement(u8, {}, { u13.createElement(u3, {
                    ["TextSize"] = 16,
                    ["Text"] = "BP Season " .. string.gsub(v34.battlepassSeason, "season", ""),
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) })
    end
    if v94 then
        v86[v93 + 1] = v94
    end
    v62.KitCategoryIcons = u13.createElement("Frame", v85, v86)
    if v34 then
        local v95 = {
            ["BackgroundTransparency"] = 0.55,
            ["Size"] = UDim2.fromScale(1, 0.16),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v96 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.035, 0)
            }), u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.03, 0)
            }), u13.createElement(u6, {
                ["LayoutOrder"] = 0
            }) }
        local v97 = #v96
        if v54 then
            if v54.imageId == "" then
                v54 = false
            else
                v54 = u13.createFragment({
                    ["KitClass"] = u13.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["ScaleType"] = "Fit",
                        ["LayoutOrder"] = 1,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.12, 0.75),
                        ["Image"] = v54.imageId,
                        ["ImageTransparency"] = u33.props.Banned and 0.35 or 0
                    }, { u13.createElement(u8, {}, { u13.createElement(u3, {
                                ["TextSize"] = 16,
                                ["Text"] = v54.display,
                                ["Font"] = Enum.Font.SourceSansBold
                            }) }), u13.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) })
                })
            end
        end
        if v54 then
            v96[v97 + 1] = v54
        end
        v96[#v96 + 1] = u13.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Text"] = v34.name,
            ["TextColor3"] = u4.WHITE,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextTransparency"] = u33.props.Banned and 0.35 or 0
        })
        v34 = u13.createFragment({
            ["KitNameTag"] = u13.createElement("Frame", v95, v96)
        })
    end
    v62[v84 + 1] = v34
    return u13.createElement("ImageButton", v55, v62)
end
return {
    ["KitShopItemCard"] = v28
}