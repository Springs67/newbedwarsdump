local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "global-stats").GlobalStats
local u11 = v1.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "queue-stats-section").QueueStatsSection
local u12 = v1.import(script, script.Parent.Parent.Parent, "stats-board", "ui", "rank-stats").RankStats
local u13 = v1.import(script, script.Parent, "currently-equipped").CurrentlyEquipped
local u14 = v1.import(script, script.Parent, "favorite-kits").FavoriteKits
return {
    ["PlayerProfileStats"] = v6.new(u5)(function(p15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u5
            [4] = u4
            [5] = u12
            [6] = u7
            [7] = u10
            [8] = u11
            [9] = u3
            [10] = u14
            [11] = u13
        --]]
        local _ = p16.useState
        local v17 = p15.ProfileData.rankStats.matchesPlayed >= u8.NUM_PROVISIONAL_MATCHES
        local v18 = next(p15.ProfileData.favoriteKitData) == nil and 0 or 0.27
        local v19 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u9.backgroundPrimary
        }
        local v20 = p15.FrameProps
        if v20 then
            for v21, v22 in v20 do
                v19[v21] = v22
            end
        end
        local v23 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v24 = #v23
        local v25 = {
            ["ScrollingFrameProps"] = {
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(u4.isSmallScreen() and 1 or 0.6, 1),
                ["Position"] = UDim2.fromScale(0, 0),
                ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
            }
        }
        local v26 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 20)
            }), u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 10),
                ["PaddingBottom"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }) }
        local v27 = #v26
        if v17 then
            v17 = u5.createElement(u12, {
                ["store"] = p15.store,
                ["RankStats"] = p15.ProfileData.rankStats,
                ["OtherPlayerViewing"] = p15.ProfileData.userId ~= u7.LocalPlayer.UserId
            })
        end
        if v17 then
            v26[v27 + 1] = v17
        end
        local v28 = #v26
        v26[v28 + 1] = u5.createElement(u10, {
            ["store"] = p15.store,
            ["GlobalStats"] = p15.ProfileData.globalStats,
            ["Queues"] = p15.ProfileData.queues,
            ["Honor"] = p15.ProfileData.honor
        })
        v26[v28 + 2] = u5.createElement(u11, {
            ["store"] = p15.store,
            ["Queues"] = p15.ProfileData.queues
        })
        v23.Stats = u5.createElement(u3, v25, v26)
        local v29 = not u4.isSmallScreen()
        if v29 then
            local v30 = {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.4, 1)
            }
            local v31 = { u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                }) }
            local v32 = #v31
            local v33 = next(p15.ProfileData.favoriteKitData) ~= nil
            if v33 then
                v33 = u5.createElement(u14, {
                    ["ProfileData"] = p15.ProfileData,
                    ["Size"] = UDim2.fromScale(1, v18)
                })
            end
            if v33 then
                v31[v32 + 1] = v33
            end
            v31[#v31 + 1] = u5.createElement(u13, {
                ["ProfileData"] = p15.ProfileData,
                ["Size"] = UDim2.fromScale(1, next(p15.ProfileData.favoriteKitData) == nil and 1 or 1 - v18 - 0.01)
            })
            v29 = u5.createFragment({
                ["PlayerProfileRight"] = u5.createElement("Frame", v30, v31)
            })
        end
        if v29 then
            v23[v24 + 1] = v29
        end
        return u5.createElement("Frame", v19, v23)
    end)
}