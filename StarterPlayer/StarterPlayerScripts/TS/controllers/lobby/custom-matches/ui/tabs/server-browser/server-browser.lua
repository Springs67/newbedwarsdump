local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.CircularSpinner
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-constants").ServerBrowserConstants
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "server-health", "server-health-state").ServerHealthState
local u14 = v1.import(script, script.Parent.Parent, "map-browser", "pagination", "pagination").Pagination
local u15 = v1.import(script, script.Parent, "live-server-card").LiveServerCard
local u16 = v1.import(script, script.Parent, "server-browser-search").ServerBrowserSearch
return {
    ["ServerBrowser"] = v10.new(u9)(function(_, p17) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
            [3] = u12
            [4] = u9
            [5] = u7
            [6] = u4
            [7] = u5
            [8] = u15
            [9] = u3
            [10] = u11
            [11] = u14
            [12] = u8
            [13] = u16
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local v20, v21 = v18(false)
        local v22, u23 = v18(nil)
        local v24, u25 = v18(1)
        v19(function() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
                [3] = u12
                [4] = u23
            --]]
            if u6.isHoarceKat() then
                local v26 = {
                    ["players"] = 699,
                    ["blobData"] = {
                        ["joinCode"] = "1234567",
                        ["mapTitle"] = "5v5 Castlegrounds",
                        ["mapDescription"] = "In the Blox Fruits hide-and-seek map, players explore a lush tropical paradise, blending in as pirates.",
                        ["creator"] = "Sprux",
                        ["thumbnailImage"] = "rbxassetid://13915009106",
                        ["healthState"] = u13.LAGGING,
                        ["matchState"] = u12.RUNNING
                    }
                }
                u23({
                    ["sizeHint"] = 1,
                    ["documents"] = {
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26,
                        v26
                    }
                })
            end
        end, {})
        local v27
        if v20 then
            v27 = u9.createElement(u7, {
                ["LayoutOrder"] = 3,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.new(1, 0, 1, 0)
            }, { u9.createElement(u4, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.15, 0.15),
                    ["Position"] = UDim2.new(0.5, 0, 0.375, 0),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u9.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) })
        else
            local v28
            if v22 == nil then
                v28 = v22
            else
                v28 = #v22.documents == 0
            end
            if v28 then
                v27 = u9.createFragment({
                    ["NoResultsFoundContainer"] = u9.createElement(u7, {
                        ["LayoutOrder"] = 3,
                        ["ZIndex"] = 1,
                        ["Size"] = UDim2.new(1, 0, 1, 0)
                    }, { u9.createElement("TextLabel", {
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
                local v29 = {}
                local v30 = #v29
                local v31
                if v22 == nil then
                    v31 = v22
                else
                    local v32 = v22.documents
                    v31 = table.create(#v32)
                    for v33, v34 in v32 do
                        local _ = v33 - 1
                        v31[v33] = u9.createElement(u15, {
                            ["serverInfo"] = v34
                        })
                    end
                end
                local v35 = {
                    ["ScrollingFrameProps"] = {
                        ["LayoutOrder"] = 3,
                        ["ZIndex"] = 1,
                        ["Size"] = UDim2.new(1, 0, 0.91, 0)
                    }
                }
                local v36 = { u9.createElement("UIGridLayout", {
                        ["FillDirection"] = "Horizontal",
                        ["HorizontalAlignment"] = "Left",
                        ["VerticalAlignment"] = "Top",
                        ["SortOrder"] = "LayoutOrder",
                        ["CellPadding"] = UDim2.new(0, 14, 0, 8),
                        ["CellSize"] = UDim2.new(0, 136, 0, 114)
                    }) }
                local v37 = #v36
                if v31 then
                    for v38, v39 in v31 do
                        v36[v37 + v38] = v39
                    end
                end
                v29[v30 + 1] = u9.createElement(u3, v35, v36)
                if v22 then
                    local v40 = {
                        ["Page"] = v24
                    }
                    local v41 = math
                    if v22 ~= nil then
                        v22 = v22.sizeHint
                    end
                    local v42 = v22 / u11.GAMES_PER_PAGE
                    v40.TotalPages = v41.ceil(v42)
                    v40.FrameProps = {
                        ["LayoutOrder"] = 5,
                        ["Size"] = UDim2.fromScale(1, 0.07)
                    }
                    function v40.OnPageChage(p43) --[[ Line: 145 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                        --]]
                        u25(p43)
                    end
                    v22 = u9.createElement(u14, v40)
                end
                if v22 then
                    v29[v30 + 2] = v22
                end
                v27 = u9.createFragment(v29)
            end
        end
        local v44 = {
            ["LayoutOrder"] = 4,
            ["BackgroundTransparency"] = 0.65,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u5.BLACK
        }
        local v46 = {
            u9.createElement(u8, {
                ["Padding"] = {
                    ["Horizontal"] = 18,
                    ["Vertical"] = 18
                }
            }),
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Top",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 10)
            }),
            u9.createElement(u16, {
                ["Size"] = UDim2.fromScale(1, 0),
                ["SetLoading"] = v21,
                ["onSearchComplete"] = function(_, p45) --[[ Name: onSearchComplete, Line 180 ]]
                    --[[
                    Upvalues:
                        [1] = u23
                    --]]
                    u23(p45)
                end,
                ["Page"] = v24
            }),
            [#v46 + 1] = v27
        }
        return u9.createFragment({
            ["CustomMapsBrowser"] = u9.createElement("Frame", v44, v46)
        })
    end)
}