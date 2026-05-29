local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.Empty
local u9 = v3.ShineEffect
local u10 = v3.ShineEffectVariation
local u11 = v3.SlideIn
local u12 = v3.TooltipContainer
local u13 = v3.UILayers
local u14 = v3.WidgetComponent
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").ConsumableTypeMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "class", "bedwars-class-meta").getBedwarsClassMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u26
if u7.isSmallScreen() then
    u26 = UDim2.fromScale(0.7, 0.8)
else
    u26 = UDim2.fromOffset(1000, 680)
end
local u27 = UDim2.fromScale(0.5, 0.46)
local u28 = Vector2.new(0.5, 0.5)
local v89 = v17.new(u16)(function(_, p29) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u22
        [3] = u20
        [4] = u21
        [5] = u25
        [6] = u23
        [7] = u12
        [8] = u4
        [9] = u6
        [10] = u8
        [11] = u7
        [12] = u26
        [13] = u27
        [14] = u28
        [15] = u15
        [16] = u24
        [17] = u5
        [18] = u2
        [19] = u19
        [20] = u13
        [21] = u9
        [22] = u10
        [23] = u14
        [24] = u11
    --]]
    local v30 = p29.useState
    u16.createRef()
    local u31, u32 = v30(nil)
    local u33
    if u31 then
        u33 = u22[u31]
    else
        u33 = nil
    end
    local u34 = u20[u21.KIT_RENTAL_BEGINNER].rentableKits
    local function v50(u35, p36) --[[ Line: 36 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u25
            [3] = u34
            [4] = u16
            [5] = u32
            [6] = u31
            [7] = u23
            [8] = u12
            [9] = u4
            [10] = u6
            [11] = u8
        --]]
        local v37 = u22[u35].renderImage
        local v38 = u22[u35].name
        local v39 = u22[u35].kitClass
        local v40 = {
            ["BackgroundColor3"] = u25.backgroundPrimary,
            ["Size"] = UDim2.fromScale(1 / #u34, 1),
            ["LayoutOrder"] = p36,
            ["BorderSizePixel"] = 0,
            [u16.Event.Activated] = function(_) --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u35
                --]]
                u32(u35)
            end,
            ["ClipsDescendants"] = true,
            ["ZIndex"] = 11
        }
        local v41 = { u16.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.5799086757990868
            }) }
        local v42 = #v41
        local v43
        if u31 == nil or u31 ~= u35 then
            v43 = false
        else
            v43 = u16.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = Color3.fromRGB(255, 255, 255)
            })
        end
        if v43 then
            v41[v42 + 1] = v43
        end
        v41[#v41 + 1] = u16.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.1, 0)
        })
        v41.KitRender = u16.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 11,
            ["Position"] = UDim2.fromScale(-0.125, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Size"] = UDim2.fromScale(1.5, 1.5),
            ["Image"] = v37,
            ["ScaleType"] = Enum.ScaleType.Crop
        })
        local v44 = {
            ["ZIndex"] = 11,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v45 = { u16.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.04, 0),
                ["PaddingBottom"] = UDim.new(0.04, 0),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v46 = #v45
        local v47
        if v39 == nil then
            v47 = false
        else
            local v48 = u16.createFragment
            local v49 = {
                ["KitClassIcon"] = u16.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["LayoutOrder"] = 1,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 11,
                    ["Position"] = UDim2.fromScale(1, 0),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Size"] = UDim2.fromScale(1, 0.25),
                    ["Image"] = u23(v39).imageId,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u16.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u16.createElement(u12, {}, { u16.createElement(u4, {
                            ["TextSize"] = 16,
                            ["Text"] = u23(v39).display,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextColor3"] = u6.WHITE,
                            ["Limits"] = Vector2.new(300, 60)
                        }), u16.createElement(u4, {
                            ["TextSize"] = 14,
                            ["Text"] = u23(v39).description,
                            ["Font"] = Enum.Font.SourceSansSemibold,
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) })
            }
            v47 = v48(v49)
        end
        if v47 then
            v45[v46 + 1] = v47
        end
        local _ = #v45
        v45.KitName = u16.createElement("TextLabel", {
            ["LayoutOrder"] = 2,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 12,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["AnchorPoint"] = Vector2.new(1, 1),
            ["Position"] = UDim2.fromScale(1, 1),
            ["Text"] = v38,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Right,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        v41.ContentsContainer = u16.createElement(u8, v44, v45)
        return u16.createElement("ImageButton", v40, v41)
    end
    local v51 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u7.isSmallScreen()
    }
    local v52 = {}
    local v53 = #v52
    local v54 = {}
    local _ = #v54
    local v55 = {
        ["Size"] = u26,
        ["Position"] = u27,
        ["AnchorPoint"] = u28
    }
    local v56 = {}
    local v57 = #v56
    local v58 = {
        ["AppId"] = "KitRentalPopup",
        ["ClipsDescendents"] = false,
        ["Title"] = "Beginner Kit Rental",
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 171 ]]
            --[[
            Upvalues:
                [1] = u15
            --]]
            u15.Controllers.LobbyTutorialController:closeKitRentalPopup()
        end,
        ["ContentUIPadding"] = u16.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 0),
            ["PaddingRight"] = UDim.new(0, 0)
        })
    }
    local v59 = {
        ["BackgroundGradient"] = u16.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["BackgroundColor3"] = u6.WHITE
        }, { u16.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }), u16.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(57, 59, 105)), ColorSequenceKeypoint.new(1, Color3.fromRGB(112, 115, 207)) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
            }) })
    }
    local v60 = #v59
    local v61 = {
        ["SizeConstraint"] = "RelativeYY",
        ["Position"] = UDim2.fromScale(0.5, 0.4),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 0.85)
    }
    local v62
    if u33 == nil then
        v62 = u33
    else
        v62 = u33.renderImage
    end
    if v62 == nil then
        v62 = u24.NONE_KIT_RENDER
    end
    v61.Image = v62
    local v63
    if u33 == nil then
        v63 = u33
    else
        v63 = u33.renderImage
    end
    v61.ImageTransparency = (v63 == "" or not v63) and 0.5 or 0
    v61.ScaleType = Enum.ScaleType.Crop
    v61.LayoutOrder = 2
    v61.BackgroundTransparency = 1
    v61.BorderSizePixel = 0
    v59.BackgroundKitRender = u16.createElement("ImageLabel", v61)
    local v64
    if u33 then
        local v65 = {
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(0.5, 0.4),
            ["Position"] = UDim2.fromScale(0.05, 0.4),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v66 = { u16.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v67 = #v66
        local v68
        if u33.kitClass == nil then
            v68 = false
        else
            v68 = u16.createFragment({
                ["KitClassIcon"] = u16.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["LayoutOrder"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = 3,
                    ["Position"] = UDim2.fromScale(1, 0),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Image"] = u23(u33.kitClass).imageId,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }, { u16.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u16.createElement(u12, {}, { u16.createElement(u4, {
                            ["TextSize"] = 16,
                            ["Text"] = u23(u33.kitClass).display,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextColor3"] = u6.WHITE,
                            ["Limits"] = Vector2.new(300, 60)
                        }), u16.createElement(u4, {
                            ["TextSize"] = 14,
                            ["Text"] = u23(u33.kitClass).description,
                            ["Font"] = Enum.Font.SourceSansSemibold,
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) })
            })
        end
        if v68 then
            v66[v67 + 1] = v68
        end
        local _ = #v66
        v66.KitName = u16.createElement("TextLabel", {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 10,
            ["Size"] = UDim2.fromScale(0.8, 0.15),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Text"] = u33.name,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })
        local v69 = {
            ["Size"] = UDim2.fromScale(0.6, 0.6)
        }
        local v70 = u33.description
        v69.Text = v70 == nil and "" or v70
        v69.RichText = true
        v69.TextScaled = true
        v69.TextTransparency = 0.3
        v69.TextColor3 = Color3.fromRGB(255, 255, 255)
        v69.Font = Enum.Font.Arial
        v69.BackgroundTransparency = 1
        v69.TextXAlignment = Enum.TextXAlignment.Left
        v69.TextYAlignment = "Top"
        v69.LayoutOrder = 2
        v69.ZIndex = 10
        v66.KitDescription = u16.createElement("TextLabel", v69, { u16.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }) })
        v64 = u16.createFragment({
            ["SelectedKitInfo"] = u16.createElement(u8, v65, v66)
        })
    else
        v64 = u33
    end
    if v64 then
        v59[v60 + 1] = v64
    end
    local _ = #v59
    local v71 = {
        ["ZIndex"] = 11,
        ["Size"] = UDim2.fromScale(0.9, 0.4),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, 1)
    }
    local v72 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Bottom",
            ["Padding"] = UDim.new(0.03, 0.1),
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
        }) }
    local v73 = #v72
    local v74 = not u31
    if v74 then
        v74 = u16.createElement("TextLabel", {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["ZIndex"] = 11,
            ["Size"] = UDim2.fromScale(0.8, 0.075),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Text"] = string.upper("Choose a kit to rent"),
            ["TextColor3"] = Color3.fromRGB(255, 237, 79),
            ["Font"] = Enum.Font.ArialBold,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
    end
    if v74 then
        v72[v73 + 1] = v74
    end
    local v75 = #v72
    local v76 = table.create(#u34)
    for v77, v78 in u34 do
        v76[v77] = v50(v78, v77 - 1)
    end
    local v79 = {
        ["LayoutOrder"] = 3,
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 11,
        ["Size"] = UDim2.fromScale(1, 0.4)
    }
    local v80 = { u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.015, 0),
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
        }) }
    local v81 = #v80
    for v82, v83 in v76 do
        v80[v81 + v82] = v83
    end
    v72.KitBox = u16.createElement("Frame", v79, v80)
    v72[v75 + 1] = u16.createElement(u8, {
        ["LayoutOrder"] = 4,
        ["ZIndex"] = 11,
        ["Size"] = UDim2.fromScale(1, 0.35)
    }, {
        u16.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.035, 0)
        }),
        ["RentKitButton"] = u16.createElement(u5, {
            ["Text"] = "Rent Kit",
            ["LayoutOrder"] = 3,
            ["CornerRadius"] = UDim.new(0.1, 0),
            ["Size"] = UDim2.fromScale(0.3, 0.65),
            ["TextLabel"] = {
                ["ZIndex"] = 2,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.9, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            },
            ["BackgroundColor3"] = Color3.fromRGB(44, 184, 96),
            ["OnClick"] = function() --[[ Name: OnClick, Line 412 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u2
                    [3] = u19
                    [4] = u6
                    [5] = u25
                    [6] = u33
                    [7] = u15
                    [8] = u13
                --]]
                local _ = u31 == nil
                local v84 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
                local v85 = u19.CONFIRMATION_MODAL
                local v86 = {
                    ["Title"] = "Beginner Kit Rental"
                }
                local v87 = u6.richTextColor(u25.mcAqua)
                local v88 = u33
                if v88 ~= nil then
                    v88 = v88.name
                end
                v86.Body = "Are you sure you want to rent the <font color=\"" .. v87 .. "\"><b>" .. tostring(v88) .. "</b></font> kit?"
                v86.PrimaryBtnProps = {
                    ["Text"] = "Yes"
                }
                v86.SecondaryBtnProps = {
                    ["Text"] = "Cancel"
                }
                function v86.OnPrimaryBtnClick() --[[ Line: 433 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                        [2] = u15
                    --]]
                    if u31 ~= nil then
                        u15.Controllers.LobbyTutorialController:selectKitRental(u31)
                    end
                end
                function v86.OnSecondaryBtnClick() --[[ Line: 438 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u13
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u13.OVERLAY)
                end
                v84:openApp(v85, v86)
            end
        }, { u16.createElement(u9, {
                ["Loop"] = false,
                ["OnHover"] = true,
                ["Variation"] = u10.gradientLarge
            }), u16.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4.669642857142857
            }) }),
        ["ChooseLaterButton"] = u16.createElement(u5, {
            ["Text"] = "Choose Later",
            ["LayoutOrder"] = 4,
            ["CornerRadius"] = UDim.new(0.2, 0),
            ["Size"] = UDim2.fromScale(0.25, 0.4),
            ["TextLabel"] = {
                ["ZIndex"] = 2,
                ["Font"] = Enum.Font.ArialBold,
                ["Size"] = UDim2.fromScale(0.9, 0.65),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            },
            ["BackgroundColor3"] = u25.backgroundTertiary,
            ["OnClick"] = function() --[[ Name: OnClick, Line 466 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15.Controllers.LobbyTutorialController:closeKitRentalPopup()
            end
        }, { u16.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 4.669642857142857
            }) }),
        u16.createElement("TextLabel", {
            ["Text"] = "(You can choose later from the locker)",
            ["RichText"] = true,
            ["LineHeight"] = 1.05,
            ["TextScaled"] = true,
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 5,
            ["ZIndex"] = 11,
            ["Size"] = UDim2.fromScale(0.35, 0.2),
            ["Position"] = UDim2.fromScale(0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Font"] = Enum.Font.Arial,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top
        })
    })
    v59.BottomActionsContainer = u16.createElement(u8, v71, v72)
    v56[v57 + 1] = u16.createElement(u14, v58, v59)
    v54.PopupBackground = u16.createElement(u8, v55, v56)
    v52[v53 + 1] = u16.createElement(u11, {}, v54)
    return u16.createElement("ScreenGui", v51, v52)
end)
return {
    ["BeginnerKitRentalPopup"] = v18.connect(function(_, p90) --[[ Line: 500 ]]
        local v91 = {}
        for v92, v93 in p90 do
            v91[v92] = v93
        end
        return v91
    end)(v89)
}