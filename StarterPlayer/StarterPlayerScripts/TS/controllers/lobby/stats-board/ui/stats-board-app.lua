local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AutoCanvasScrollingFrame
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "board-header").StatsBoardHeader
local u7 = v1.import(script, script.Parent, "global-stats").GlobalStats
local u8 = v1.import(script, script.Parent, "level-stats").LevelStats
local u9 = v1.import(script, script.Parent, "queue-stats-section").QueueStatsSection
local u10 = v1.import(script, script.Parent, "rank-stats").RankStats
local u21 = v4.new(u3)(function(p11, p12) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u6
        [4] = u2
        [5] = u8
        [6] = u10
        [7] = u7
        [8] = u9
    --]]
    local _ = p12.useState
    local v13 = UDim2.fromScale(1, 0.125)
    local v14 = u3.createElement
    local v15 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = u5.backgroundPrimary
    }
    local v16 = {}
    local v17 = u3.createElement(u6, {
        ["Size"] = v13
    })
    local v18 = u3.createElement
    local v19 = u2
    local v20 = {
        ["ScrollingFrameProps"] = {
            ["Size"] = UDim2.fromScale(1, 1 - v13.Y.Scale),
            ["Position"] = UDim2.fromScale(0, v13.Y.Scale)
        }
    }
    __set_list(v16, 1, {v17, v18(v19, v20, {
    u3.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Vertical,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
        ["Padding"] = UDim.new(0, 20)
    }),
    u3.createElement("UIPadding", {
        ["PaddingTop"] = UDim.new(0.01, 0),
        ["PaddingBottom"] = UDim.new(0.03, 0),
        ["PaddingLeft"] = UDim.new(0.075, 0),
        ["PaddingRight"] = UDim.new(0.075, 0)
    }),
    u3.createElement(u8, {
        ["AppId"] = "LevelStats"
    }),
    u3.createElement(u10, {
        ["store"] = p11.store
    }),
    u3.createElement(u7, {
        ["store"] = p11.store
    }),
    u3.createElement(u9, {
        ["store"] = p11.store
    })
})})
    return v14("Frame", v15, v16)
end)
return {
    ["StatsBoardUIWrapper"] = function(p22) --[[ Name: StatsBoardUIWrapper, Line 58 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u21
        --]]
        local v23 = {
            ["LightInfluence"] = 0.25,
            ["Face"] = Enum.NormalId.Front,
            ["SizingMode"] = Enum.SurfaceGuiSizingMode.PixelsPerStud
        }
        local v24 = {}
        local v25 = #v24
        local v26 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.new(1, -30, 1, -30)
        }
        local v27 = {}
        local v28 = #v27
        local v29 = {}
        for v30, v31 in p22 do
            v29[v30] = v31
        end
        v27[v28 + 1] = u3.createElement(u21, v29)
        v24[v25 + 1] = u3.createElement("Frame", v26, v27)
        return u3.createElement("SurfaceGui", v23, v24)
    end,
    ["StatsBoard"] = u21
}