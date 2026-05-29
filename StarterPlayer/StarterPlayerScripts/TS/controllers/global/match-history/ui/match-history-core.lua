local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Empty
local u5 = v2.IconButton
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, script.Parent, "match-history-entry-card").MatchHistoryEntryCard
local u10 = v1.import(script, script.Parent, "match-history-entry-info").MatchHistoryEntryInfo
return {
    ["MatchHistoryCore"] = v7.new(u6)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u3
            [4] = u4
            [5] = u5
            [6] = u8
            [7] = u10
        --]]
        local v13, u14 = p12.useState(nil)
        local v15
        if v13 == nil then
            local v16 = u11.matchHistory
            table.sort(v16, function(p17, p18) --[[ Line: 18 ]]
                return p17.matchStartTime > p18.matchStartTime
            end)
            local function v20(u19) --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u9
                    [3] = u11
                    [4] = u14
                --]]
                return u6.createElement(u9, {
                    ["userId"] = u11.userId,
                    ["match"] = u19,
                    ["onClick"] = function() --[[ Name: onClick, Line 26 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                            [2] = u19
                        --]]
                        u14(u19)
                    end
                })
            end
            local v21 = table.create(#v16)
            for v22, v23 in v16 do
                v21[v22] = v20(v23, v22 - 1, v16)
            end
            local v24 = {
                ["ScrollingFrameProps"] = {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.new(1, 0, 0.92, 0)
                }
            }
            local v25 = { u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local v26 = #v25
            for v27, v28 in v21 do
                v25[v26 + v27] = v28
            end
            v15 = u6.createElement(u3, v24, v25)
        else
            local v29 = u6.createFragment
            local v30 = {
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder"
                }),
                ["HeaderActions"] = u6.createFragment({
                    ["HeaderActions"] = u6.createElement(u4, {
                        ["LayoutOrder"] = 1,
                        ["Size"] = UDim2.fromScale(1, 0.05)
                    }, {
                        ["BackButton"] = u6.createElement(u5, {
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["SizeConstraint"] = "RelativeYY",
                            ["Position"] = UDim2.fromScale(1, 0.5),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Image"] = u8.ARROW_LEFT,
                            [u6.Event.Activated] = function() --[[ Line: 71 ]]
                                --[[
                                Upvalues:
                                    [1] = u14
                                --]]
                                u14(nil)
                            end
                        })
                    })
                }),
                u6.createElement(u9, {
                    ["LayoutOrder"] = 2,
                    ["userId"] = u11.userId,
                    ["match"] = v13,
                    ["onClick"] = function() --[[ Name: onClick, Line 80 ]]
                        --[[
                        Upvalues:
                            [1] = u14
                        --]]
                        u14(nil)
                    end
                }),
                u6.createElement(u10, {
                    ["userId"] = u11.userId,
                    ["match"] = v13
                })
            }
            v15 = v29(v30)
        end
        local v31 = {
            ["Size"] = u11.Size or UDim2.fromScale(1, 1),
            ["LayoutOrder"] = u11.LayoutOrder
        }
        local v32 = {
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.03, 0)
            }),
            [#v32 + 1] = v15
        }
        return u6.createElement(u4, v31, v32)
    end)
}