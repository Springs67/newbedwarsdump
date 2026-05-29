local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.CircularSpinner
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "map-browser", "map-browser-constants").MapBrowser
local u13 = v1.import(script, script.Parent, "custom-maps-browser-search").CustomMapsBrowserSearch
local u14 = v1.import(script, script.Parent, "pagination", "pagination").Pagination
local u15 = v1.import(script, script.Parent, "published-map-card").PublishedMapCard
return {
    ["CustomMapsBrowser"] = v11.new(u10)(function(_, p16) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u10
            [4] = u7
            [5] = u4
            [6] = u5
            [7] = u15
            [8] = u3
            [9] = u12
            [10] = u14
            [11] = u8
            [12] = u13
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local _ = p16.useBinding
        local v19, v20 = v17(false)
        local v21, u22 = v17(nil)
        local v23, u24 = v17(1)
        v18(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u22
                [3] = u9
            --]]
            if u6.isHoarceKat() then
                local v25 = {
                    ["mapEntityId"] = "",
                    ["mapId"] = "",
                    ["joinCode"] = "D9S3BG95LPZ0",
                    ["likes"] = 43,
                    ["dislikes"] = 6,
                    ["hidden"] = false,
                    ["joins"] = 3,
                    ["featured"] = true,
                    ["metadata"] = {
                        ["mapTitle"] = "5v5 Castlegrounds",
                        ["mapDescription"] = "In the Blox Fruits hide-and-seek map, players explore a lush tropical paradise, blending in as pirates.",
                        ["creator"] = "Sprux",
                        ["thumbnailImage"] = "rbxassetid://13915009106",
                        ["tags"] = { "bedwars", "pvp" }
                    }
                }
                u22({
                    ["sizeHint"] = 1,
                    ["documents"] = {
                        v25,
                        v25,
                        v25,
                        v25,
                        v25,
                        v25,
                        v25,
                        v25,
                        v25,
                        v25
                    }
                })
            else
                u9.Controllers.CustomMapBrowserController:getExistingLocalRatings()
            end
        end, {})
        local v26
        if v19 then
            v26 = u10.createElement(u7, {
                ["LayoutOrder"] = 3,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.88, 0)
            }, { u10.createElement(u4, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.15, 0.15),
                    ["Position"] = UDim2.new(0.5, 0, 0.375, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u10.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        else
            local v27
            if v21 == nil then
                v27 = v21
            else
                v27 = #v21.documents == 0
            end
            if v27 then
                v26 = u10.createFragment({
                    ["NoResultsFoundContainer"] = u10.createElement(u7, {
                        ["LayoutOrder"] = 3,
                        ["ZIndex"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0.88, 0)
                    }, { u10.createElement("TextLabel", {
                            ["Text"] = "No results found",
                            ["TextScaled"] = true,
                            ["BackgroundTransparency"] = 1,
                            ["Size"] = UDim2.fromScale(0.75, 0.1),
                            ["Position"] = UDim2.new(0.5, 0, 0.375, 0),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["TextColor3"] = u5.WHITE,
                            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
                        }) })
                })
            else
                local v28 = {}
                local v29 = #v28
                local v30
                if v21 == nil then
                    v30 = v21
                else
                    local v31 = v21.documents
                    v30 = table.create(#v31)
                    for v32, v33 in v31 do
                        local v34 = v32 - 1
                        v30[v32] = u10.createElement(u15, {
                            ["LayoutOrder"] = v34,
                            ["AppId"] = v33.mapId,
                            ["Map"] = v33
                        })
                    end
                end
                local v35 = {
                    ["ScrollingFrameProps"] = {
                        ["LayoutOrder"] = 3,
                        ["ZIndex"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0.7525, 0)
                    }
                }
                local v36 = { u10.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["HorizontalAlignment"] = "Left",
                        ["VerticalAlignment"] = "Top",
                        ["SortOrder"] = "LayoutOrder",
                        ["Padding"] = UDim.new(0, 6)
                    }) }
                local v37 = #v36
                if v30 then
                    for v38, v39 in v30 do
                        v36[v37 + v38] = v39
                    end
                end
                v28[v29 + 1] = u10.createElement(u3, v35, v36)
                if v21 then
                    local v40 = {
                        ["Page"] = v23
                    }
                    local v41 = math
                    if v21 ~= nil then
                        v21 = v21.sizeHint
                    end
                    local v42 = v21 / u12.MAPS_PER_PAGE
                    v40.TotalPages = v41.ceil(v42)
                    v40.FrameProps = {
                        ["LayoutOrder"] = 5,
                        ["Size"] = UDim2.fromScale(1, 0.07)
                    }
                    function v40.OnPageChage(p43) --[[ Line: 154 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                        --]]
                        u24(p43)
                    end
                    v21 = u10.createElement(u14, v40)
                end
                if v21 then
                    v28[v29 + 2] = v21
                end
                v26 = u10.createFragment(v28)
            end
        end
        local v44 = {
            ["LayoutOrder"] = 4,
            ["BackgroundTransparency"] = 0.65,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v46 = {
            u10.createElement(u8, {
                ["Padding"] = {
                    ["Horizontal"] = 18,
                    ["Vertical"] = 18
                }
            }),
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }),
            u10.createElement(u13, {
                ["Size"] = UDim2.fromScale(1, 0.13),
                ["SetLoading"] = v20,
                ["onSearchComplete"] = function(_, p45) --[[ Name: onSearchComplete, Line 189 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                    --]]
                    u22(p45)
                end,
                ["Page"] = v23
            }),
            [#v46 + 1] = v26
        }
        return u10.createFragment({
            ["CustomMapsBrowser"] = u10.createElement("Frame", v44, v46)
        })
    end)
}