local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoCanvasScrollingFrame
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.IconButton
local u9 = v3.Padding
local u10 = v3.ScaleComponent
local u11 = v3.SlideIn
local u12 = v3.SoundManager
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "news", "news-types")
local u19 = v18.News
local u20 = v18.NewsMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, script.Parent, "news-reader").NewsReader
local u23 = v1.import(script, script.Parent, "special", "issue-1-reader").Issue1Reader
local u24 = v1.import(script, script.Parent, "special", "issue-2-reader").Issue2Reader
local v67 = v15.new(u14)(function(u25, p26) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u21
        [3] = u6
        [4] = u14
        [5] = u5
        [6] = u19
        [7] = u23
        [8] = u24
        [9] = u22
        [10] = u13
        [11] = u20
        [12] = u4
        [13] = u10
        [14] = u9
        [15] = u7
        [16] = u8
        [17] = u17
        [18] = u2
        [19] = u11
    --]]
    local v27 = p26.useState
    local v28 = p26.useEffect
    local v29, u30 = v27(nil)
    local v31 = UDim2.fromOffset(1024, 760)
    v28(function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u21
            [3] = u25
            [4] = u30
        --]]
        u12:playSound(u21.UI_OPEN_2)
        if u25.selectedNews then
            u30(u25.selectedNews)
        end
    end, {})
    local v32 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v33 = { u14.createElement(u5, {
            ["AppId"] = u25.AppId,
            ["ImageButtonProps"] = {
                ["ZIndex"] = 0
            },
            ["OnClick"] = function() --[[ Name: OnClick, Line 48 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u21
                --]]
                u12:playSound(u21.UI_CLOSE_2)
                return true
            end
        }) }
    local v34 = #v33
    local v35
    if v29 == u19.NEWSPAPER_ISSUE_1 then
        v35 = u14.createElement(u23, {
            ["SelectedNews"] = v29,
            ["SetSelectedNews"] = u30
        })
    elseif v29 == u19.NEWSPAPER_ISSUE_2 then
        v35 = u14.createElement(u24, {
            ["SelectedNews"] = v29,
            ["SetSelectedNews"] = u30
        })
    else
        local v36
        if v29 then
            v36 = u14.createElement(u22, {
                ["SelectedNews"] = v29,
                ["SetSelectedNews"] = u30
            })
        else
            local v37 = u13.entries(u20)
            local function v49(p38) --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u30
                    [3] = u12
                    [4] = u21
                --]]
                local u39 = p38[1]
                local v40 = p38[2]
                if v40.disabled then
                    return nil
                end
                local v41 = u14.createFragment
                local v42 = {}
                local v43 = u14.createElement
                local v44 = {
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
                    ["BackgroundTransparency"] = 1,
                    [u14.Event.Activated] = function() --[[ Line: 87 ]]
                        --[[
                        Upvalues:
                            [1] = u30
                            [2] = u39
                            [3] = u12
                            [4] = u21
                        --]]
                        u30(u39)
                        u12:playSound(u21.UI_CLICK_2)
                    end
                }
                local v45 = {
                    u14.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0.04, 0)
                    }),
                    ["NewsCoverArt"] = u14.createElement("ImageLabel", {
                        ["BorderSizePixel"] = 0,
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.75),
                        ["Image"] = v40.coverArt,
                        ["ScaleType"] = Enum.ScaleType.Crop,
                        ["BackgroundColor3"] = Color3.fromRGB(77, 77, 77)
                    }, { u14.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.07, 0)
                        }) }),
                    ["NewsTitle"] = u14.createElement("TextLabel", {
                        ["TextYAlignment"] = "Center",
                        ["TextXAlignment"] = "Left",
                        ["TextScaled"] = true,
                        ["Font"] = "GothamBold",
                        ["BackgroundTransparency"] = 1,
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0.1),
                        ["Text"] = v40.title,
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                        ["TextTruncate"] = Enum.TextTruncate.AtEnd
                    })
                }
                local v46 = u14.createElement
                local v47 = {
                    ["TextYAlignment"] = "Center",
                    ["TextXAlignment"] = "Left",
                    ["TextScaled"] = true,
                    ["Font"] = "GothamBold",
                    ["TextTransparency"] = 0.3,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(1, 0.075)
                }
                local v48 = #v40.pageAssetIds
                v47.Text = tostring(v48) .. " Pages"
                v47.TextColor3 = Color3.fromRGB(255, 255, 255)
                v47.TextTruncate = Enum.TextTruncate.AtEnd
                v45.NewsPages = v46("TextLabel", v47)
                v42.NewsCard = v43("ImageButton", v44, v45)
                return v41(v42)
            end
            local v50 = 0
            local v51 = {}
            for v52, v53 in v37 do
                local v54 = v49(v53, v52 - 1, v37)
                if v54 ~= nil then
                    v50 = v50 + 1
                    v51[v50] = v54
                end
            end
            local v55 = {
                ["ScrollingFrameProps"] = {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.9)
                }
            }
            local v56 = { u14.createElement("UIGridLayout", {
                    ["FillDirectionMaxCells"] = 4,
                    ["VerticalAlignment"] = "Top",
                    ["HorizontalAlignment"] = "Left",
                    ["CellSize"] = UDim2.fromScale(0.25, 0.33),
                    ["CellPadding"] = UDim2.new(0.05, 0, 0.05, 0)
                }) }
            local v57 = #v56
            for v58, v59 in v51 do
                v56[v57 + v58] = v59
            end
            v36 = u14.createFragment({
                ["NewsList"] = u14.createElement(u4, v55, v56)
            })
        end
        local v60 = {
            ["BorderSizePixel"] = 0,
            ["AutoButtonColor"] = false,
            ["Modal"] = true,
            ["Size"] = v31,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromHex("#333333")
        }
        local v61 = {
            u14.createElement(u10, {
                ["PowerRelationshipPastMaximum"] = 0.6,
                ["MaximumSize"] = Vector2.new(v31.X.Offset * 1.2, v31.Y.Offset * 1.2),
                ["ScreenPadding"] = Vector2.new(30, 30)
            }),
            u14.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }),
            u14.createElement(u9, {
                ["Padding"] = UDim.new(0, 28)
            }),
            (u14.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Left",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 16)
            }))
        }
        local v62 = u14.createElement
        local v63 = u7
        local v64 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 28)
        }
        local v65 = {
            ["NewsTitle"] = u14.createElement("TextLabel", {
                ["Text"] = "BedWars News",
                ["TextYAlignment"] = "Center",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["Font"] = "GothamBold",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextTruncate"] = Enum.TextTruncate.AtEnd
            }),
            u14.createElement(u8, {
                ["Size"] = UDim2.new(0, 28, 0, 28),
                ["Image"] = u17.X,
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["OnClick"] = function() --[[ Name: OnClick, Line 220 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u25
                        [3] = u12
                        [4] = u21
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u25.AppId)
                    u12:playSound(u21.UI_CLOSE_2)
                end
            })
        }
        v61.Header = v62(v63, v64, v65)
        v61[#v61 + 1] = v36
        v35 = u14.createFragment({
            ["NewsAppContainer"] = u14.createElement("ImageButton", v60, v61)
        })
    end
    local v66 = {
        [#v66 + 1] = v35
    }
    v33[v34 + 1] = u14.createElement(u11, {}, v66)
    return u14.createFragment({
        ["NewsApp"] = u14.createElement("ScreenGui", v32, v33)
    })
end)
return {
    ["NewsApp"] = v16.connect(function(_, p68) --[[ Line: 244 ]]
        local v69 = {}
        for v70, v71 in p68 do
            v69[v70] = v71
        end
        return v69
    end)(v67)
}