local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.Padding
local u8 = v2.StringUtil
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = u1.import(script, script.Parent.Parent.Parent, "custom-match-tabs").CustomMatchAppTab
local u16 = u1.import(script, script.Parent.Parent.Parent, "custom-matches-code-inputs").CustomMatchesCodeInputs
local u17 = u1.import(script, script.Parent.Parent, "vertical-list-map-listing").VerticalListMapListing
return {
    ["CustomMatchesHomeTab"] = v11.new(u10)(function(u18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u13
            [3] = u1
            [4] = u8
            [5] = u9
            [6] = u12
            [7] = u10
            [8] = u16
            [9] = u4
            [10] = u7
            [11] = u14
            [12] = u15
            [13] = u6
            [14] = u17
            [15] = u3
        --]]
        local v20 = p19.useState
        local v21 = p19.useEffect
        local v22, u23 = v20(nil)
        local v24, u25 = v20(nil)
        local _, u26 = v20(0)
        local u27, u28 = v20(false)
        v21(function() --[[ Line: 26 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u13
                [3] = u1
                [4] = u28
                [5] = u8
                [6] = u23
                [7] = u25
                [8] = u9
                [9] = u18
                [10] = u12
                [11] = u26
            --]]
            if u5.isHoarceKat() then
                local v30 = {
                    ["Title"] = "5v5 Castlegrounds! FFA. PRO\226\128\153S ONLY",
                    ["Creator"] = "Sprux",
                    ["ThumbnailAssetId"] = u13.JUGGERNAUT_ARMOR_RENDER,
                    ["Tags"] = {},
                    ["Stat"] = {
                        ["Value"] = "16/200",
                        ["Icon"] = u13.USERS_SOLID
                    },
                    ["ExtraTextInfo"] = { " " },
                    ["ActionButton"] = {
                        ["Icon"] = u13.ENTER_FILLED_ICON,
                        ["OnClick"] = u1.async(function() --[[ Line: 40 ]]
                            --[[
                            Upvalues:
                                [1] = u28
                                [2] = u1
                            --]]
                            u28(true)
                            u1.await(task.wait(5))
                            u28(false)
                            return u1.Promise.new(function(p29) --[[ Line: 44 ]]
                                return p29(true)
                            end)
                        end)
                    }
                }
                local v31 = {}
                for v32, v33 in v30 do
                    v31[v32] = v33
                end
                v31.Stat = {
                    ["Value"] = u8.formatNumberWithCommas(1434),
                    ["Icon"] = u13.THUMBS_UP
                }
                v31.ActionButton = {
                    ["Icon"] = u13.EDIT_FILLED_ICON,
                    ["OnClick"] = u1.async(function() --[[ Line: 60 ]]
                        --[[
                        Upvalues:
                            [1] = u28
                            [2] = u1
                        --]]
                        u28(true)
                        u1.await(task.wait(5))
                        u28(false)
                        return u1.Promise.new(function(p34) --[[ Line: 64 ]]
                            return p34(true)
                        end)
                    end)
                }
                u23({
                    ["totalListings"] = 134,
                    ["listings"] = {
                        v30,
                        v30,
                        v30,
                        v30,
                        v30,
                        v30,
                        v30,
                        v30,
                        v30,
                        v30
                    }
                })
                u25({
                    ["totalListings"] = 1364,
                    ["listings"] = {
                        v31,
                        v31,
                        v31,
                        v31,
                        v31,
                        v31,
                        v31,
                        v31,
                        v31,
                        v31
                    }
                })
            else
                u9.Controllers.LiveGamesBrowserController:searchServers({
                    ["skip"] = 0,
                    ["limit"] = 8
                }):andThen(function(p35) --[[ Line: 83 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                        [2] = u28
                        [3] = u9
                        [4] = u23
                    --]]
                    local v36 = p35.documents
                    local function v43(u37) --[[ Line: 85 ]]
                        --[[
                        Upvalues:
                            [1] = u13
                            [2] = u28
                            [3] = u9
                        --]]
                        local v38 = {}
                        local v39 = u37.blobData.thumbnailImage
                        v38.ThumbnailAssetId = v39 == nil and "" or v39
                        v38.Title = u37.blobData.mapTitle
                        v38.Creator = u37.blobData.creator
                        v38.ServerHealthState = u37.blobData.healthState
                        v38.ExtraTextInfo = { " " }
                        v38.Tags = {}
                        local v40 = {}
                        local v41 = u37.players
                        v40.Value = tostring(v41)
                        v40.Icon = u13.USERS_SOLID
                        v38.Stat = v40
                        v38.ActionButton = {
                            ["Icon"] = u13.ENTER_FILLED_ICON,
                            ["OnClick"] = function() --[[ Name: OnClick, Line 104 ]]
                                --[[
                                Upvalues:
                                    [1] = u28
                                    [2] = u9
                                    [3] = u37
                                --]]
                                u28(true)
                                local v42 = u9.Controllers.LiveGamesBrowserController:joinServer(u37.blobData.joinCode)
                                v42:andThen(function(_) --[[ Line: 107 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u28
                                    --]]
                                    u28(false)
                                end)
                                return v42
                            end
                        }
                        return v38
                    end
                    local v44 = table.create(#v36)
                    for v45, v46 in v36 do
                        v44[v45] = v43(v46, v45 - 1, v36)
                    end
                    u23({
                        ["totalListings"] = p35.sizeHint,
                        ["listings"] = v44
                    })
                end)
                u9.Controllers.CustomMapBrowserController:getFeaturedList():andThen(function(p47) --[[ Line: 132 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u13
                        [3] = u28
                        [4] = u18
                        [5] = u12
                        [6] = u25
                    --]]
                    local v48 = p47.documents
                    local v49 = p47.sizeHint
                    local function v54(u50) --[[ Line: 135 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u13
                            [3] = u28
                            [4] = u18
                            [5] = u12
                        --]]
                        local v51 = {}
                        local v52 = u50.metadata.thumbnailImage
                        v51.ThumbnailAssetId = v52 == nil and "" or v52
                        v51.Title = u50.metadata.mapTitle
                        v51.Creator = u50.metadata.creator
                        v51.Tags = u50.metadata.tags
                        v51.Stat = {
                            ["Value"] = u8.formatNumberWithCommas(u50.likes),
                            ["Icon"] = u13.THUMBS_UP
                        }
                        v51.ActionButton = {
                            ["Icon"] = u13.EDIT_FILLED_ICON,
                            ["OnClick"] = function() --[[ Name: OnClick, Line 152 ]]
                                --[[
                                Upvalues:
                                    [1] = u28
                                    [2] = u18
                                    [3] = u12
                                    [4] = u50
                                --]]
                                u28(true)
                                local v53 = u18.OnCreateMatch(u12.BEDWARS_TO4, u50.joinCode, {
                                    ["isPublishedMap"] = true,
                                    ["mapName"] = u50.metadata.mapTitle,
                                    ["mapThumbnail"] = u50.metadata.thumbnailImage
                                })
                                v53:andThen(function(_) --[[ Line: 159 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u28
                                    --]]
                                    u28(false)
                                end)
                                return v53
                            end
                        }
                        return v51
                    end
                    local v55 = table.create(#v48)
                    for v56, v57 in v48 do
                        v55[v56] = v54(v57, v56 - 1, v48)
                    end
                    u25({
                        ["totalListings"] = v49,
                        ["listings"] = v55
                    })
                end)
                u9.Controllers.CustomMapBrowserController:getPublishedMapCount():andThen(function(p58) --[[ Line: 183 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26(p58)
                end)
            end
        end, {})
        local v59 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v60 = { u10.createElement(u16, {
                ["LayoutOrder"] = 1,
                ["OnJoinMatch"] = u18.OnJoinMatch,
                ["OnCreateMatch"] = function(...) --[[ Name: OnCreateMatch, Line 195 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    return u9.Controllers.LobbyCustomMatchesController:createMatch(unpack({ ... }))
                end,
                ["FrameProps"] = {
                    ["BackgroundTransparency"] = 0.65,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1, 0.18),
                    ["AutomaticSize"] = Enum.AutomaticSize.None,
                    ["BackgroundColor3"] = u4.BLACK
                }
            }) }
        local _ = #v60
        local v61 = {
            ["BackgroundTransparency"] = 0.65,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Position"] = UDim2.fromScale(0, 0.18),
            ["Size"] = UDim2.fromScale(1, 0.8025),
            ["BackgroundColor3"] = u4.BLACK
        }
        local v62 = { u10.createElement(u7, {
                ["Padding"] = {
                    ["Vertical"] = 18
                }
            }) }
        local _ = #v62
        local v63 = {
            ["ScrollingFrameProps"] = {
                ["ScrollBarThickness"] = 0,
                ["ScrollBarImageTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }
        }
        local v64 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 6)
            }), u10.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v65 = #v64
        local v66 = {
            ["Size"] = UDim2.new(1, 0, 0, 14)
        }
        local v67 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v68 = #v67
        local v69 = {
            ["TextSize"] = 14,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v70 = u4.richTextColor(u14.textPrimary)
        local v71
        if v22 == nil then
            v71 = v22
        else
            v71 = v22.totalListings
        end
        local v72 = (v71 == 0 or (v71 ~= v71 or not v71)) and 0 or u8.formatNumberWithCommas(v22.totalListings)
        v69.Text = "<font color=\"" .. v70 .. "\">" .. tostring(v72) .. " LIVE SERVERS</font> you can join"
        v69.TextColor3 = u4.WHITE
        v69.RichText = true
        v69.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v69.BackgroundTransparency = 1
        v69.TextXAlignment = "Left"
        v69.LayoutOrder = 1
        v67.Title = u10.createElement("TextLabel", v69)
        v67[v68 + 1] = u10.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["BackgroundTransparency"] = 1,
            [u10.Event.Activated] = function() --[[ Line: 276 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u15
                --]]
                u18.SetTab(u15.GAME_BROWSER)
            end,
            ["LayoutOrder"] = 2
        }, {
            ["VIEW MORE"] = u10.createElement("TextLabel", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextSize"] = 12,
                ["Text"] = "VIEW MORE",
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Center",
                ["LayoutOrder"] = 1,
                [u10.Event.MouseEnter] = function(p73) --[[ Line: 291 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    p73.TextColor3 = u14.textPrimary
                end,
                [u10.Event.MouseLeave] = function(p74) --[[ Line: 294 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                    --]]
                    p74.TextColor3 = u4.WHITE
                end
            })
        })
        v64.Header = u10.createElement(u6, v66, v67)
        if v22 ~= nil then
            local v75 = v22.listings
            local function v80(p76) --[[ Line: 303 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u10
                    [3] = u17
                --]]
                local v77 = {}
                for v78, v79 in p76 do
                    v77[v78] = v79
                end
                v77.Disabled = u27
                v77.FrameProps = {
                    ["Size"] = UDim2.new(1, 0, 0, 42)
                }
                return u10.createElement(u17, v77)
            end
            v22 = table.create(#v75)
            for v81, v82 in v75 do
                v22[v81] = v80(v82, v81 - 1, v75)
            end
        end
        if v22 then
            for v83, v84 in v22 do
                v64[v65 + v83] = v84
            end
        end
        v62.GameBrowserList = u10.createElement(u3, v63, v64)
        local v85 = {
            ["ScrollingFrameProps"] = {
                ["ScrollBarThickness"] = 0,
                ["ScrollBarImageTransparency"] = 1,
                ["Position"] = UDim2.fromScale(0.5, 0),
                ["Size"] = UDim2.fromScale(0.5, 1)
            }
        }
        local v86 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 6)
            }), u10.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }) }
        local v87 = #v86
        local v88 = {
            ["Size"] = UDim2.new(1, 0, 0, 14)
        }
        local v89 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder"
            }) }
        local v90 = #v89
        local v91 = {
            ["TextSize"] = 14,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v92 = u4.richTextColor(u14.textPrimary)
        local v93
        if v24 == nil then
            v93 = v24
        else
            v93 = v24.totalListings
        end
        local v94 = (v93 == 0 or (v93 ~= v93 or not v93)) and 0 or u8.formatNumberWithCommas(v24.totalListings)
        v91.Text = "<font color=\"" .. v92 .. "\">" .. tostring(v94) .. " PUBLISHED MAPS</font> from the community"
        v91.TextColor3 = u4.WHITE
        v91.RichText = true
        v91.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v91.BackgroundTransparency = 1
        v91.TextXAlignment = "Left"
        v91.LayoutOrder = 1
        v89.Title = u10.createElement("TextLabel", v91)
        v89[v90 + 1] = u10.createElement("ImageButton", {
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["BackgroundTransparency"] = 1,
            [u10.Event.Activated] = function() --[[ Line: 379 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u15
                --]]
                u18.SetTab(u15.MAP_BROWSER)
            end,
            ["LayoutOrder"] = 2
        }, {
            ["VIEW MORE"] = u10.createElement("TextLabel", {
                ["Size"] = UDim2.fromScale(1, 1),
                ["TextSize"] = 12,
                ["Text"] = "VIEW MORE",
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["BackgroundTransparency"] = 1,
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Center",
                ["LayoutOrder"] = 1,
                [u10.Event.MouseEnter] = function(p95) --[[ Line: 394 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                    --]]
                    p95.TextColor3 = u14.textPrimary
                end,
                [u10.Event.MouseLeave] = function(p96) --[[ Line: 397 ]]
                    --[[
                    Upvalues:
                        [1] = u4
                    --]]
                    p96.TextColor3 = u4.WHITE
                end
            })
        })
        v86.Header = u10.createElement(u6, v88, v89)
        if v24 ~= nil then
            local v97 = v24.listings
            local function v102(p98) --[[ Line: 406 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u10
                    [3] = u17
                --]]
                local v99 = {}
                for v100, v101 in p98 do
                    v99[v100] = v101
                end
                v99.Disabled = u27
                v99.FrameProps = {
                    ["Size"] = UDim2.new(1, 0, 0, 42)
                }
                return u10.createElement(u17, v99)
            end
            v24 = table.create(#v97)
            for v103, v104 in v97 do
                v24[v103] = v102(v104, v103 - 1, v97)
            end
        end
        if v24 then
            for v105, v106 in v24 do
                v86[v87 + v105] = v106
            end
        end
        v62.MapBrowserList = u10.createElement(u3, v85, v86)
        v60.ListingsContainer = u10.createElement("Frame", v61, v62)
        return u10.createElement(u6, v59, v60)
    end)
}