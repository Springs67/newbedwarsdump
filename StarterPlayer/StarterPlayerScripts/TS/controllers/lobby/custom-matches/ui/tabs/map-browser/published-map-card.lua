local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.CircularSpinner
local u4 = v2.CodesUtil
local u5 = v2.ColorUtil
local u6 = v2.DividerComponent
local u7 = v2.Empty
local u8 = v2.GetTarmacAsset
local u9 = v2.Padding
local u10 = v2.SoundManager
local u11 = v2.StringUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v98 = v14.new(u13)(function(u21, p22) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u12
        [3] = u10
        [4] = u19
        [5] = u8
        [6] = u13
        [7] = u5
        [8] = u9
        [9] = u7
        [10] = u11
        [11] = u20
        [12] = u18
        [13] = u6
        [14] = u4
        [15] = u17
        [16] = u3
    --]]
    local v23 = p22.useBinding
    local v24 = p22.useState
    local v25 = p22.useEffect
    local u26, u27 = v24(false)
    local v28, _ = v23(u16:getState().Lobby.mapBrowserProfileData.ratings[u21.Map.mapId])
    local u29, u30 = v24(u16:getState().Lobby.mapBrowserProfileData.ratings[u21.Map.mapId])
    local u31, u32 = v24("")
    local u33 = u21.Map
    local v34 = u33.likes
    if v28:getValue() and v28:getValue() == "like" or u29 ~= "like" then
        if v28:getValue() == "like" and (u29 == "dislike" or u29 == "unset") then
            v34 = v34 - 1
        end
    else
        v34 = v34 + 1
    end
    v25(function() --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u10
            [3] = u19
            [4] = u32
        --]]
        local u35 = true
        if u31 ~= "" then
            u10:playSound(u19.ERROR_NOTIFICATION)
            task.delay(3, function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u32
                --]]
                if u35 then
                    u32("")
                end
            end)
        end
        return function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u35
            --]]
            u35 = false
        end
    end, { u31 })
    local v36 = u21.Map.metadata.thumbnailImage
    local v37
    if v36 == "" or not v36 then
        v37 = u8("NoImage").Image
    else
        v37 = "rbxassetid://" .. string.gsub(u21.Map.metadata.thumbnailImage, "rbxassetid://", "")
    end
    local v38 = u21.Map.featured == true
    local v39 = {
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 1,
        ["Size"] = UDim2.new(0.98, 0, 0, 82),
        ["BackgroundColor3"] = Color3.fromRGB(47, 49, 80),
        ["LayoutOrder"] = u21.LayoutOrder
    }
    local v40 = {
        u13.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }),
        u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.03, 0)
        }),
        ["MapImage"] = u13.createElement("ImageLabel", {
            ["ScaleType"] = "Crop",
            ["BackgroundTransparency"] = 0.3,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
            ["Image"] = v37,
            ["BackgroundColor3"] = u5.BLACK
        }, { u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) })
    }
    local _ = #v40
    local v41 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.6, 1)
    }
    local v42 = { u13.createElement(u9, {
            ["Padding"] = {
                ["Vertical"] = 10
            }
        }), u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.08, 0)
        }) }
    local _ = #v42
    local v43 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.6)
    }
    local v44 = {
        u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.05, 0)
        }),
        ["MapName"] = u13.createElement("TextLabel", {
            ["TextXAlignment"] = "Left",
            ["TextScaled"] = true,
            ["AutoLocalize"] = false,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["Text"] = u33.metadata.mapTitle,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = u5.WHITE
        }),
        ["SubTitleRow"] = u13.createElement(u7, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.275)
        }, {
            ["Subtitle"] = u13.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["AutomaticSize"] = "X",
                ["TextSize"] = 10,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(0, 1),
                ["Text"] = "By: @" .. u33.metadata.creator .. "  |  " .. u11.formatNumberWithCommas(u33.joins) .. " joins  ",
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.WHITE
            })
        })
    }
    local _ = #v44
    local v45 = u33.metadata.tags
    local function v52(p46) --[[ Line: 162 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u5
            [3] = u9
        --]]
        local v47 = u13.createFragment
        local v48 = {}
        local v49 = u13.createElement
        local v50 = {
            ["AutomaticSize"] = "X",
            ["BackgroundTransparency"] = 0.3,
            ["Size"] = UDim2.fromScale(0, 1),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v51 = {
            u13.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }),
            u13.createElement(u9, {
                ["Padding"] = {
                    ["Vertical"] = 3,
                    ["Horizontal"] = 6
                }
            }),
            ["Tag"] = u13.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextSize"] = 7,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0, 1),
                ["Text"] = string.upper(p46),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u5.WHITE
            })
        }
        v48.TagPill = v49("Frame", v50, v51)
        return v47(v48)
    end
    local v53 = table.create(#v45)
    for v54, v55 in v45 do
        v53[v54] = v52(v55, v54 - 1, v45)
    end
    local v56 = {
        ["LayoutOrder"] = 3,
        ["BackgroundTransparency"] = 0,
        ["Size"] = UDim2.fromScale(1, 0.275)
    }
    local v57 = { u13.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Left",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.005, 0)
        }) }
    local v58 = #v57
    for v59, v60 in v53 do
        v57[v58 + v59] = v60
    end
    v44.Tags = u13.createElement(u7, v56, v57)
    v42.MapInfoHeader = u13.createElement(u7, v43, v44)
    v42.MapDescription = u13.createElement("TextLabel", {
        ["Font"] = "Roboto",
        ["TextXAlignment"] = "Left",
        ["TextYAlignment"] = "Top",
        ["TextSize"] = 10,
        ["TextWrapped"] = true,
        ["TextTruncate"] = "AtEnd",
        ["AutoLocalize"] = false,
        ["TextTransparency"] = 0.3,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.32),
        ["Text"] = u33.metadata.mapDescription,
        ["TextColor3"] = u5.WHITE
    })
    v40.MapInfo = u13.createElement(u7, v41, v42)
    local v61
    if u31 == "" or not u31 then
        local v62 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.3),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v63 = { u13.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v64 = #v63
        if v38 then
            v38 = u13.createFragment({
                ["FeaturedStar"] = u13.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://17351820249",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.85, 0.85),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["ImageColor3"] = Color3.fromRGB(255, 184, 38),
                    ["AnchorPoint"] = Vector2.new(0, 0)
                })
            })
        end
        if v38 then
            v63[v64 + 1] = v38
        end
        local v65 = #v63
        local v66 = u13.createElement
        local v67 = "ImageButton"
        local v68 = {
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["SizeConstraint"] = "RelativeYY",
            ["Image"] = u18.THUMBS_UP
        }
        local v69
        if u29 == "like" then
            v69 = Color3.fromRGB(113, 255, 110)
        else
            v69 = Color3.fromRGB(199, 199, 199)
        end
        v68.ImageColor3 = v69
        v68.BackgroundTransparency = 1
        v68[u13.Event.Activated] = function() --[[ Line: 296 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u33
                [3] = u12
                [4] = u30
                [5] = u32
            --]]
            if u29 == "like" then
                local v70 = {
                    ["rating"] = "unset",
                    ["mapId"] = u33.mapId
                }
                local v71 = u12.Controllers.CustomMapBrowserController:userRateMap(v70)
                if v71.success then
                    u30(v70.rating)
                else
                    u32(v71.errorMessage)
                end
            else
                local v72 = {
                    ["rating"] = "like",
                    ["mapId"] = u33.mapId
                }
                local v73 = u12.Controllers.CustomMapBrowserController:userRateMap(v72)
                if v73.success then
                    u30(v72.rating)
                else
                    u32(v73.errorMessage)
                end
            end
        end
        v68[u13.Event.MouseEnter] = function(p74) --[[ Line: 309 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            local v75
            if u29 == "like" then
                v75 = Color3.fromRGB(113, 255, 110)
            else
                v75 = Color3.fromRGB(255, 255, 255)
            end
            p74.ImageColor3 = v75
        end
        v68[u13.Event.MouseLeave] = function(p76) --[[ Line: 312 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            local v77
            if u29 == "like" then
                v77 = Color3.fromRGB(113, 255, 110)
            else
                v77 = Color3.fromRGB(199, 199, 199)
            end
            p76.ImageColor3 = v77
        end
        v68.LayoutOrder = 2
        v63.ThumbsUp = v66(v67, v68, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v63.TotalLikes = u13.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0, 0.9),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["Text"] = u11.formatNumberWithCommas(v34),
            ["TextColor3"] = u5.WHITE
        })
        v63[v65 + 1] = u13.createElement(u6, {
            ["Direction"] = "Y",
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(0, 1, 0.8, 0)
        })
        local v78 = u13.createElement
        local v79 = "ImageButton"
        local v80 = {
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["SizeConstraint"] = "RelativeYY",
            ["Image"] = u18.THUMBS_DOWN
        }
        local v81
        if u29 == "dislike" then
            v81 = Color3.fromRGB(255, 121, 136)
        else
            v81 = Color3.fromRGB(199, 199, 199)
        end
        v80.ImageColor3 = v81
        v80.BackgroundTransparency = 1
        v80[u13.Event.Activated] = function() --[[ Line: 342 ]]
            --[[
            Upvalues:
                [1] = u29
                [2] = u33
                [3] = u12
                [4] = u30
                [5] = u32
            --]]
            if u29 == "dislike" then
                local v82 = {
                    ["rating"] = "unset",
                    ["mapId"] = u33.mapId
                }
                local v83 = u12.Controllers.CustomMapBrowserController:userRateMap(v82)
                if v83.success then
                    u30(v82.rating)
                else
                    u32(v83.errorMessage)
                end
            else
                local v84 = {
                    ["rating"] = "dislike",
                    ["mapId"] = u33.mapId
                }
                local v85 = u12.Controllers.CustomMapBrowserController:userRateMap(v84)
                if v85.success then
                    u30(v84.rating)
                else
                    u32(v85.errorMessage)
                end
            end
        end
        v80[u13.Event.MouseEnter] = function(p86) --[[ Line: 355 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            local v87
            if u29 == "dislike" then
                v87 = Color3.fromRGB(255, 121, 136)
            else
                v87 = Color3.fromRGB(255, 255, 255)
            end
            p86.ImageColor3 = v87
        end
        v80[u13.Event.MouseLeave] = function(p88) --[[ Line: 358 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            local v89
            if u29 == "dislike" then
                v89 = Color3.fromRGB(255, 121, 136)
            else
                v89 = Color3.fromRGB(199, 199, 199)
            end
            p88.ImageColor3 = v89
        end
        v80.LayoutOrder = 4
        v63.ThumbsDown = v78(v79, v80, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v61 = u13.createFragment({
            ["RatingsContainer"] = u13.createElement(u7, v62, v63)
        })
    else
        v61 = u13.createFragment({
            ["RatingsContainer"] = u13.createElement(u7, {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            }, { u13.createElement("TextLabel", {
                    ["TextXAlignment"] = "Right",
                    ["TextYAlignment"] = "Center",
                    ["TextScaled"] = true,
                    ["TextWrapped"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1.6, 0.8),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0),
                    ["Text"] = u31,
                    ["TextColor3"] = u20.backgroundError,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                }) })
        })
    end
    local v90 = {
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.2, 1)
    }
    local v91 = {
        u13.createElement(u9, {
            ["Padding"] = {
                ["Vertical"] = 10,
                ["Right"] = 8
            }
        }),
        u13.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["HorizontalAlignment"] = "Right",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.1, 0)
        }),
        [#v91 + 1] = v61
    }
    local _ = #v91
    v91.MapJoinCode = u13.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.3),
        ["BackgroundColor3"] = Color3.fromRGB(94, 98, 186)
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
            ["AutoLocalize"] = false,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.7),
            ["Text"] = u4.displayCode(u33.joinCode, "-", 4),
            ["Font"] = Enum.Font.GothamBold,
            ["TextColor3"] = u20.textPrimary
        })
    })
    local v92 = u13.createElement
    local v93 = "ImageButton"
    local v94 = {
        ["Size"] = UDim2.fromScale(1, 0.3),
        ["BackgroundColor3"] = Color3.fromRGB(60, 156, 107),
        ["BackgroundTransparency"] = u26 and 0.3 or 0,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        [u13.Event.Activated] = function() --[[ Line: 423 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u27
                [3] = u12
                [4] = u17
                [5] = u21
            --]]
            if u26 then
                return nil
            end
            u27(true)
            if not u12.Controllers.LobbyCustomMatchesController:createMatch(u17.BEDWARS_TO4, u21.Map.joinCode, {
                ["isPublishedMap"] = true
            }) then
                u27(false)
            end
        end
    }
    local v95 = {}
    local v96 = u13.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.5, 0)
    })
    local v97
    if u26 then
        v97 = u13.createElement(u3, {
            ["Size"] = UDim2.fromScale(0.8, 0.8),
            ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }, { u13.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    else
        v97 = u13.createFragment({
            ["Button"] = u13.createElement("TextLabel", {
                ["Text"] = "CREATE",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.8, 0.7),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.fromRGB(99, 255, 143)
            })
        })
    end
    __set_list(v95, 1, {v96, v97})
    v91.HostMatchButton = v92(v93, v94, v95)
    v40.Actions = u13.createElement(u7, v90, v91)
    return u13.createFragment({
        [u21.Map.mapId .. "_PublishedMapCard"] = u13.createElement("Frame", v39, v40)
    })
end)
return {
    ["PublishedMapCard"] = v15.connect(function(_, p99) --[[ Line: 467 ]]
        local v100 = {}
        for v101, v102 in p99 do
            v100[v101] = v102
        end
        return v100
    end)(v98)
}