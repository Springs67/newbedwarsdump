local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local v8 = v3.GetTarmacAsset
local u9 = v3.IconButton
local u10 = v3.Padding
local u11 = v3.ScaleComponent
local u12 = v3.SlideIn
local u13 = v3.SoundManager
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v8("NoImage")
local v61 = v16.new(u15)(function(u23, p24) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u20
        [3] = u14
        [4] = u2
        [5] = u6
        [6] = u15
        [7] = u5
        [8] = u21
        [9] = u11
        [10] = u9
        [11] = u19
        [12] = u10
        [13] = u22
        [14] = u4
        [15] = u18
        [16] = u7
        [17] = u12
    --]]
    local _ = p24.useState
    local v25 = p24.useEffect
    local u26 = u23.PendingRating or u23.ProfileStoredRating
    v25(function() --[[ Line: 38 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u20
            [3] = u6
            [4] = u14
        --]]
        u13:playSound(u20.UI_OPEN_2)
        if not u6.isHoarceKat() then
            u14.Controllers.CustomMapBrowserController:getExistingLocalRatings()
        end
        return function() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u20
            --]]
            u13:playSound(u20.UI_CLOSE_2)
        end
    end, {})
    local v27 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v28 = { u15.createElement(u5, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = u23.AppId
        }) }
    local v29 = #v28
    local v30 = {}
    local v31 = #v30
    local v32 = {
        ["BackgroundTransparency"] = 0,
        ["BorderSizePixel"] = 0,
        ["Modal"] = true,
        ["AutoButtonColor"] = false,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(190, 109),
        ["BackgroundColor3"] = u21.backgroundTertiary
    }
    local v33 = {
        u15.createElement(u11, {
            ["MaximumSize"] = Vector2.new(800, 459),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }),
        ["CloseButton"] = u15.createElement(u9, {
            ["Size"] = UDim2.fromScale(0.1, 0.1),
            ["AnchorPoint"] = Vector2.new(1, 0),
            ["Position"] = UDim2.fromScale(0.99, 0.01),
            ["Image"] = u19.X,
            [u15.Event.Activated] = function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u23
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u23.AppId)
            end
        }, { u15.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    }
    local _ = #v33
    local v34 = {
        ["Size"] = UDim2.fromScale(1, 0.75)
    }
    local v35 = { u15.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.075, 0)
        }), u15.createElement(u10, {
            ["Padding"] = {
                ["Top"] = 4
            }
        }) }
    local _ = #v35
    local v36 = {
        ["Size"] = UDim2.fromScale(1, 0.45)
    }
    local v37 = u23.mapData.thumbnailImage
    local v38
    if v37 == "" or not v37 then
        v38 = u22.Image
    else
        v38 = "rbxassetid://" .. u23.mapData.thumbnailImage
    end
    v36.Image = v38
    v36.BorderSizePixel = 0
    v36.BackgroundTransparency = 0.3
    v36.BackgroundColor3 = u4.BLACK
    v36.LayoutOrder = 1
    v35.MapThumbnail = u15.createElement("ImageLabel", v36, { u15.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }), u15.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }) })
    v35.MapTitle = u15.createElement("TextLabel", {
        ["TextScaled"] = true,
        ["RichText"] = true,
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.75, 0.14),
        ["Text"] = "Enjoying <font color=\"" .. u4.richTextColor(u21.mcAqua) .. "\">" .. u23.mapData.mapTitle .. "</font>?",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
    })
    v35.MapSubtext = u15.createElement("TextLabel", {
        ["TextScaled"] = true,
        ["TextTransparency"] = 0.3,
        ["TextYAlignment"] = "Top",
        ["RichText"] = true,
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.75, 0.15),
        ["Text"] = "Feel free to leave a rating and help <b><font color=\"" .. u4.richTextColor(Color3.fromRGB(255, 255, 255)) .. "\">" .. u18:GetNameFromUserIdAsync(u23.mapData.creatorUserId) .. "</font></b> better understand your experience",
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Regular)
    }, { u15.createElement("UITextSizeConstraint", {
            ["MaxTextSize"] = 24
        }) })
    v33.Body = u15.createElement(u7, v34, v35)
    local v39 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(1, 0.225),
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0, 1)
    }
    local v40 = { (u15.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder"
        })) }
    local v41 = u15.createElement
    local v42 = "ImageButton"
    local v43 = {
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v44
    if u26 == "like" then
        v44 = u21.backgroundSuccess
    else
        v44 = u21.backgroundPrimary
    end
    v43.BackgroundColor3 = v44
    v43.BorderSizePixel = 0
    v43[u15.Event.Activated] = function() --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u13
            [3] = u20
            [4] = u14
            [5] = u23
        --]]
        if u26 == "like" then
            u13:playSound(u20.UI_CLICK_2)
            u14.Controllers.CustomMapBrowserController:userRateMap({
                ["rating"] = "unset",
                ["mapId"] = u23.mapData.mapId
            })
        else
            u13:playSound(u20.UI_CLICK_2)
            u14.Controllers.CustomMapBrowserController:userRateMap({
                ["rating"] = "like",
                ["mapId"] = u23.mapData.mapId
            })
        end
    end
    v43.LayoutOrder = 1
    local v45 = { (u15.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.06, 0)
        })) }
    local v46 = u15.createElement
    local v47 = "ImageLabel"
    local v48 = {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.45),
        ["Image"] = u19.THUMBS_UP
    }
    local v49
    if u26 == "like" then
        v49 = Color3.fromRGB(113, 255, 110)
    else
        v49 = Color3.fromRGB(255, 255, 255)
    end
    v48.ImageColor3 = v49
    v48.ImageTransparency = u26 == "like" and 0 or 0.3
    v45.ThumbsUp = v46(v47, v48, { u15.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    __set_list(v45, 2, {u15.createElement("TextLabel", {
    ["AutomaticSize"] = "X",
    ["TextScaled"] = true,
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0, 0.4),
    ["Text"] = u26 == "like" and "LIKED" or "LIKE",
    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
    ["TextTransparency"] = u26 == "like" and 0 or 0.3,
    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
})})
    v40.LikeMapButton = v41(v42, v43, v45)
    local v50 = #v40
    local v51
    if u26 == nil or u26 == "unset" then
        v51 = u15.createFragment({
            ["Divider"] = u15.createElement("Frame", {
                ["BackgroundTransparency"] = 0.8,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(0, 1, 1, 0),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            })
        })
    else
        v51 = false
    end
    if v51 then
        v40[v50 + 1] = v51
    end
    local _ = #v40
    local v52 = u15.createElement
    local v53 = "ImageButton"
    local v54 = {
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v55
    if u26 == "dislike" then
        v55 = u21.backgroundError
    else
        v55 = u21.backgroundPrimary
    end
    v54.BackgroundColor3 = v55
    v54.BorderSizePixel = 0
    v54[u15.Event.Activated] = function() --[[ Line: 234 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u13
            [3] = u20
            [4] = u14
            [5] = u23
        --]]
        if u26 == "dislike" then
            u13:playSound(u20.UI_CLICK_2)
            u14.Controllers.CustomMapBrowserController:userRateMap({
                ["rating"] = "unset",
                ["mapId"] = u23.mapData.mapId
            })
        else
            u13:playSound(u20.UI_CLICK_2)
            u14.Controllers.CustomMapBrowserController:userRateMap({
                ["rating"] = "dislike",
                ["mapId"] = u23.mapData.mapId
            })
        end
    end
    v54.LayoutOrder = 3
    local v56 = { (u15.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.06, 0)
        })) }
    local v57 = u15.createElement
    local v58 = "ImageLabel"
    local v59 = {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.45),
        ["Image"] = u19.THUMBS_DOWN
    }
    local v60
    if u26 == "dislike" then
        v60 = Color3.fromRGB(255, 171, 178)
    else
        v60 = Color3.fromRGB(255, 255, 255)
    end
    v59.ImageColor3 = v60
    v59.ImageTransparency = u26 == "dislike" and 0 or 0.3
    v56.ThumbsUp = v57(v58, v59, { u15.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1
        }) })
    __set_list(v56, 2, {u15.createElement("TextLabel", {
    ["AutomaticSize"] = "X",
    ["TextScaled"] = true,
    ["BackgroundTransparency"] = 1,
    ["BorderSizePixel"] = 0,
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromScale(0, 0.4),
    ["Text"] = u26 == "dislike" and "DISLIKED" or "DISLIKE",
    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
    ["TextTransparency"] = u26 == "dislike" and 0 or 0.3,
    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
})})
    v40.DislikeMapButton = v52(v53, v54, v56)
    v33.Actions = u15.createElement("Frame", v39, v40)
    v30[v31 + 1] = u15.createElement("ImageButton", v32, v33)
    v28[v29 + 1] = u15.createElement(u12, {}, v30)
    return u15.createElement("ScreenGui", v27, v28)
end)
return {
    ["RateMapModal"] = v17.connect(function(p62, p63) --[[ Line: 283 ]]
        local v64 = {}
        for v65, v66 in p63 do
            v64[v65] = v66
        end
        v64.PendingRating = p62.Lobby.pendingMapRatings[p63.mapData.mapId]
        v64.ProfileStoredRating = p62.Lobby.mapBrowserProfileData.ratings[p63.mapData.mapId]
        return v64
    end)(v61)
}