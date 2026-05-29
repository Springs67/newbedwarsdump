local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.CodesUtil
local u6 = v3.ColorUtil
local u7 = v3.CornerFiller
local u8 = v3.Empty
local u9 = v3.IconButton
local u10 = v3.TooltipContainer
local u11 = v3.UILayers
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "emote", "emote-assets").getEmoteAsset
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u22 = v1.import(script, script.Parent, "map-publish-form").MapPublishForm
local u23 = v1.import(script, script.Parent, "map-settings-modal").MapSettingsModal
return {
    ["MapSaveCard"] = v14.new(u13)(function(u24, p25) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u2
            [3] = u15
            [4] = u6
            [5] = u20
            [6] = u12
            [7] = u11
            [8] = u23
            [9] = u13
            [10] = u16
            [11] = u19
            [12] = u8
            [13] = u9
            [14] = u18
            [15] = u17
            [16] = u7
            [17] = u5
            [18] = u22
            [19] = u10
            [20] = u4
        --]]
        local v26, u27 = p25.useState(false)
        os.date("%x %I:%M %p", u24.MapSave.lastUpdated)
        local v28 = u21.isGameServer()
        local function u32() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u15
                [3] = u6
                [4] = u20
                [5] = u24
                [6] = u12
                [7] = u11
            --]]
            local v29 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v30 = u15.CONFIRMATION_MODAL
            local v31 = {
                ["Title"] = "Delete Map Save?",
                ["Body"] = "Are you sure you want to delete the map <font color=\"" .. u6.richTextColor(u20.mcAqua) .. "\"><b>" .. u24.MapSave.name .. "</b></font>? You can\'t undo this action!",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Delete",
                    ["BackgroundColor3"] = u20.backgroundError
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel"
                },
                ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 41 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u24
                    --]]
                    u12.Controllers.CustomMatchController:deleteMapSave(u24.MapSave.code)
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 44 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
                end
            }
            v29:openApp(v30, v31)
        end
        local function u33() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u23
                [3] = u24
                [4] = u11
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                ["appId"] = "MapSettingsModal",
                ["app"] = u23
            }, {
                ["MapSaveDisplayInfo"] = u24.MapSave
            }, u11.OVERLAY)
        end
        local function v37() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u15
                [3] = u6
                [4] = u20
                [5] = u24
                [6] = u27
                [7] = u12
                [8] = u11
            --]]
            local v34 = u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController")
            local v35 = u15.CONFIRMATION_MODAL
            local v36 = {
                ["Title"] = "Overwrite Map Save?",
                ["Body"] = "Are you sure you want to ovewrite the map save <font color=\"" .. u6.richTextColor(u20.mcAqua) .. "\"><b>" .. u24.MapSave.name .. "</b></font> with the current map?\n<font color=\"" .. u6.richTextColor(u20.mcRed) .. "\" transparency=\"0\"><b>You can\'t undo this action!</b></font>",
                ["PrimaryBtnProps"] = {
                    ["Text"] = "Overwrite",
                    ["BackgroundColor3"] = u20.backgroundTertiary
                },
                ["SecondaryBtnProps"] = {
                    ["Text"] = "Cancel"
                },
                ["OnPrimaryBtnClick"] = function() --[[ Name: OnPrimaryBtnClick, Line 68 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u12
                        [3] = u24
                    --]]
                    u27(true)
                    u12.Controllers.CustomMatchController:saveMap(u24.MapSave.code):andThen(function(_) --[[ Line: 71 ]]
                        --[[
                        Upvalues:
                            [1] = u27
                        --]]
                        u27(false)
                    end)
                end,
                ["OnSecondaryBtnClick"] = function() --[[ Name: OnSecondaryBtnClick, Line 76 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeLayer(u11.OVERLAY)
                end
            }
            v34:openApp(v35, v36)
        end
        local v38 = {
            ["Size"] = UDim2.fromScale(0.3, 1),
            ["LayoutOrder"] = u24.MapSave.dateCreated
        }
        local v39 = u24.ContainerProps
        if v39 then
            for v40, v41 in v39 do
                v38[v40] = v41
            end
        end
        local v42 = {}
        local v43 = #v42
        local v44
        if v28 then
            v44 = u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0.035, 0)
            })
        else
            v44 = v28
        end
        if v44 then
            v42[v43 + 1] = v44
        end
        local v45 = #v42
        local v51 = {
            ["Size"] = UDim2.fromScale(1, v28 and 0.85 or 1),
            ["BackgroundColor3"] = u20.backgroundTertiary,
            ["BorderSizePixel"] = 0,
            ["AutoButtonColor"] = false,
            [u13.Event.Activated] = function(_) --[[ Line: 106 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                local v46 = u24.OnClick
                if v46 ~= nil then
                    v46()
                end
            end,
            [u13.Event.MouseEnter] = function(p47) --[[ Line: 112 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                local v48 = u24.OnHover
                if v48 ~= nil then
                    v48(p47)
                end
            end,
            [u13.Event.MouseLeave] = function(p49) --[[ Line: 118 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                local v50 = u24.OnHoverOut
                if v50 ~= nil then
                    v50(p49)
                end
            end
        }
        local v52 = u24.FrameProps
        if v52 then
            for v53, v54 in v52 do
                v51[v53] = v54
            end
        end
        local v55 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["Padding"] = UDim.new(0, 0)
            }), u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) }
        local v56 = #v55
        local v57 = {
            ["Size"] = UDim2.fromScale(1, 0.45)
        }
        local v58 = {}
        local _ = #v58
        local v59 = {
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["Size"] = UDim2.fromScale(1, 0.7)
        }
        local v60 = u24.MapSave.image
        local v61
        if v60 == "" or not v60 then
            v61 = u16(u19.DUCK_CELEBRATION)
        else
            v61 = "rbxassetid://" .. u24.MapSave.image
        end
        v59.Image = v61
        v59.ImageTransparency = 0.1
        v59.ScaleType = "Crop"
        v59.BackgroundTransparency = 1
        v58.ThumbnailImage = u13.createElement("ImageLabel", v59)
        local v62 = u13.createElement
        local v63 = u8
        local v64 = {
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(1, 0.05)
        }
        local v65 = { (u13.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.075, 0),
                ["PaddingRight"] = UDim.new(0.075, 0),
                ["PaddingTop"] = UDim.new(0.05, 0)
            })) }
        local v66 = u13.createElement
        local v67 = "Frame"
        local v68 = {
            ["BackgroundTransparency"] = 0.4,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.5, 0.8),
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.5)
        }
        local v69
        if u24.MapSave.published then
            v69 = Color3.fromRGB(99, 227, 255)
        else
            v69 = Color3.fromRGB(255, 127, 99)
        end
        v68.BackgroundColor3 = v69
        v65.PublishedPill = v66(v67, v68, { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }), u13.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["Font"] = "GothamBold",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.8, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Text"] = u24.MapSave.published and "PUBLISHED" or "PRIVATE",
                ["TextColor3"] = u6.WHITE
            }) })
        v65.TopActionButtons = u13.createElement(u8, {
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5)
        }, { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.05, 0)
            }), u13.createElement(u9, {
                ["BackgroundTransparency"] = 1,
                ["Tooltip"] = "Edit Map Save",
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["Image"] = u18.GEAR_OULTINE_ICON,
                ["OnClick"] = function() --[[ Name: OnClick, Line 204 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33()
                end,
                ["IconProps"] = {
                    ["ScaleType"] = "Fit",
                    ["Size"] = UDim2.fromScale(0.8, 0.8)
                }
            }, { u13.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }), u13.createElement(u9, {
                ["BackgroundTransparency"] = 1,
                ["Tooltip"] = "Delete Map Save",
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["Image"] = u18.TRASH_SOLID,
                ["OnClick"] = function() --[[ Name: OnClick, Line 221 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32()
                end,
                ["IconProps"] = {
                    ["ScaleType"] = "Fit",
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["ImageColor3"] = u20.mcRed
                }
            }, { u13.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) }) })
        v58.TopButtonsList = v62(v63, v64, v65)
        v55.HeroBanner = u13.createElement(u8, v57, v58)
        v55.MapDisplayInfo = u13.createElement(u8, {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.55)
        }, {
            u13.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder"
            }),
            ["TopSection"] = u13.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.45),
                ["BackgroundColor3"] = u6.hexColor(8554484)
            }, {
                u13.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0),
                    ["PaddingLeft"] = UDim.new(0.075, 0),
                    ["PaddingRight"] = UDim.new(0.075, 0)
                }),
                u13.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.1, 0)
                }),
                u13.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Text"] = "<b>" .. u24.MapSave.name .. "</b>",
                    ["TextColor3"] = u6.WHITE
                }),
                u13.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["TextTransparency"] = 0.3,
                    ["TextXAlignment"] = "Left",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.3),
                    ["Text"] = u17[u24.MapSave.queueType].title,
                    ["TextColor3"] = u6.WHITE
                })
            }),
            ["BottomSection"] = u13.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.55),
                ["BackgroundColor3"] = u6.hexColor(7764697)
            }, {
                u13.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 10)
                }),
                u13.createElement(u7, {
                    ["TopLeft"] = true,
                    ["TopRight"] = true
                }),
                u13.createElement(u8, {
                    ["Size"] = UDim2.fromScale(0.8, 1)
                }, {
                    u13.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.15, 0),
                        ["PaddingBottom"] = UDim.new(0.15, 0),
                        ["PaddingLeft"] = UDim.new(0.075, 0),
                        ["PaddingRight"] = UDim.new(0.075, 0)
                    }),
                    u13.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["HorizontalAlignment"] = "Center",
                        ["VerticalAlignment"] = "Center",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.1, 0)
                    }),
                    u13.createElement("Frame", {
                        ["BackgroundTransparency"] = 0.4,
                        ["BorderSizePixel"] = 0,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.7),
                        ["BackgroundColor3"] = u6.hexColor(6185658)
                    }, {
                        u13.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.5, 0)
                        }),
                        ["MapCode"] = u13.createElement("TextBox", {
                            ["TextScaled"] = true,
                            ["TextXAlignment"] = "Center",
                            ["BackgroundTransparency"] = 1,
                            ["ClearTextOnFocus"] = false,
                            ["TextEditable"] = false,
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["Size"] = UDim2.fromScale(0.8, 0.7),
                            ["Text"] = u5.displayCode(u24.MapSave.code, "-", 4),
                            ["Font"] = Enum.Font.GothamBold,
                            ["TextColor3"] = u20.textPrimary
                        })
                    }),
                    u13.createElement("TextLabel", {
                        ["Text"] = "MAP CODE",
                        ["TextScaled"] = true,
                        ["TextTransparency"] = 0.3,
                        ["TextXAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0.2),
                        ["TextColor3"] = u6.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                    })
                }),
                u13.createElement(u8, {
                    ["Size"] = UDim2.fromScale(0.15, 0.49),
                    ["Position"] = UDim2.fromScale(0.925, 0.15),
                    ["AnchorPoint"] = Vector2.new(1, 0)
                }, { u13.createElement("ImageButton", {
                        ["Position"] = UDim2.fromScale(1, 0.5),
                        ["AnchorPoint"] = Vector2.new(1, 0.5),
                        ["Size"] = UDim2.fromScale(1, 0.7),
                        ["Image"] = "",
                        ["BackgroundColor3"] = u20.backgroundSuccess,
                        ["BackgroundTransparency"] = 0,
                        ["BorderSizePixel"] = 0,
                        ["ScaleType"] = Enum.ScaleType.Fit,
                        [u13.Event.Activated] = function() --[[ Line: 366 ]]
                            --[[
                            Upvalues:
                                [1] = u2
                                [2] = u22
                                [3] = u24
                                [4] = u11
                            --]]
                            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
                                ["appId"] = "PublishMapModal",
                                ["app"] = u22
                            }, {
                                ["MapSaveDisplayInfo"] = u24.MapSave
                            }, u11.OVERLAY)
                        end
                    }, { u13.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0, 6)
                        }), u13.createElement(u10, {}, { u13.createElement(u4, {
                                ["Text"] = "Publish Map",
                                ["TextSize"] = 16,
                                ["Font"] = Enum.Font.SourceSansBold,
                                ["Limits"] = Vector2.new(300, 60)
                            }) }), u13.createElement("ImageLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["BorderSizePixel"] = 0,
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Size"] = UDim2.fromScale(0.5, 0.5),
                            ["Image"] = u18.UPLOAD_ICON_SOLID
                        }, { u13.createElement("UIAspectRatioConstraint", {
                                ["AspectRatio"] = 1
                            }) }) }) })
            })
        })
        local v70 = u24[u13.Children]
        if v70 then
            for v71, v72 in v70 do
                if type(v71) == "number" then
                    v55[v56 + v71] = v72
                else
                    v55[v71] = v72
                end
            end
        end
        v42.MapSaveCard = u13.createElement("ImageButton", v51, v55)
        if v28 then
            local v73 = u13.createFragment
            local v74 = {
                ["ResaveMapButton"] = u13.createElement("TextButton", {
                    ["Size"] = UDim2.fromScale(1, 0.115),
                    ["Text"] = v26 and "UPDATING..." or "UPDATE MAP",
                    ["BackgroundColor3"] = u6.hexColor(6185658),
                    ["TextColor3"] = u20.textPrimary,
                    ["TextScaled"] = true,
                    ["Font"] = "GothamBold",
                    ["LayoutOrder"] = 2,
                    [u13.Event.Activated] = v37
                }, { u13.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.15, 0),
                        ["PaddingBottom"] = UDim.new(0.15, 0),
                        ["PaddingLeft"] = UDim.new(0.075, 0),
                        ["PaddingRight"] = UDim.new(0.075, 0)
                    }), u13.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }) })
            }
            v28 = v73(v74)
        end
        if v28 then
            v42[v45 + 1] = v28
        end
        local v75 = u13.createFragment
        local v76 = {}
        local v77 = u24.MapSave.dateCreated
        v76["MapSaveCard_" .. tostring(v77)] = u13.createElement(u8, v38, v42)
        return v75(v76)
    end)
}