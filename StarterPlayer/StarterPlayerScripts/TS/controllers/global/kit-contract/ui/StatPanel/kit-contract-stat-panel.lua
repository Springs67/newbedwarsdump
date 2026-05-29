local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, script.Parent, "KitStats", "kit-contract-kit-stats-card").KitContractKitStatsCard
local u9 = v1.import(script, script.Parent, "MasteryInfo", "kit-contract-kit-mastery-emote-stats-card").KitContractKitMasteryEmoteStatsCard
local v10 = {}
local u11 = setmetatable({}, {
    ["__index"] = v10
})
u11.KIT_STATS = 0
v10[0] = "KIT_STATS"
u11.MASTERY_STATS = 1
v10[1] = "MASTERY_STATS"
local function v33(p12, p13) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u5
        [3] = u4
        [4] = u3
        [5] = u7
        [6] = u8
        [7] = u9
    --]]
    local v14, u15 = p13.useState(u11.KIT_STATS)
    local v16 = {}
    for v17, v18 in p12 do
        v16[v17] = v18
    end
    v16.SelectedKit = nil
    v16.UserKitStatProfile = nil
    v16.HighestUnlockedTier = nil
    local v19 = {}
    for v20, v21 in v16 do
        v19[v20] = v21
    end
    local v22 = u5.createFragment
    local v23 = {}
    local v24 = u5.createElement
    local v25 = u4
    local v26 = {
        u5.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.01, 0)
        }),
        ["KitContractStatPanelTabSelector"] = u5.createElement(u4, {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(0.85, 0.1)
        }, { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.03, 0)
            }), u5.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["BackgroundColor3"] = u3.BLACK,
                ["BackgroundTransparency"] = v14 == u11.KIT_STATS and 0.5 or 0.75,
                ["BorderSizePixel"] = 0,
                [u5.Event.MouseButton1Click] = function() --[[ Line: 62 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u11
                    --]]
                    return u15(u11.KIT_STATS)
                end
            }, { u5.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0),
                    ["PaddingTop"] = UDim.new(0.02, 0),
                    ["PaddingBottom"] = UDim.new(0.02, 0)
                }), u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                    ["Image"] = u7.SCROLL_SOLID,
                    ["ImageColor3"] = u3.WHITE
                }, { u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) }), u5.createElement("ImageButton", {
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["BackgroundColor3"] = u3.BLACK,
                ["BackgroundTransparency"] = v14 == u11.MASTERY_STATS and 0.6 or 0.75,
                ["BorderSizePixel"] = 0,
                [u5.Event.MouseButton1Click] = function() --[[ Line: 93 ]]
                    --[[
                    Upvalues:
                        [1] = u15
                        [2] = u11
                    --]]
                    return u15(u11.MASTERY_STATS)
                end
            }, { u5.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0),
                    ["PaddingTop"] = UDim.new(0.02, 0),
                    ["PaddingBottom"] = UDim.new(0.02, 0)
                }), u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.1, 0)
                }), u5.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.new(0.5, 0, 0.5, 0),
                    ["Image"] = u7.STAR_SOLID,
                    ["ImageColor3"] = u3.WHITE
                }, { u5.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }) }) })
    }
    local v27 = u5.createElement
    local v28 = "Frame"
    local v29 = {
        ["BackgroundTransparency"] = 0.6,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.fromScale(0.85, 0.8),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundColor3"] = u3.BLACK
    }
    local v30 = {}
    local v31 = u5.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0.03, 0)
    })
    local v32
    if v14 == u11.KIT_STATS then
        v32 = u5.createElement(u8, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["SelectedKit"] = p12.SelectedKit,
            ["UserKitStatProfile"] = p12.UserKitStatProfile,
            ["HighestUnlockedTier"] = p12.HighestUnlockedTier
        })
    else
        v32 = u5.createElement(u9, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["SelectedKit"] = p12.SelectedKit,
            ["UserKitStatProfile"] = p12.UserKitStatProfile
        })
    end
    __set_list(v30, 1, {v31, v32})
    __set_list(v26, 2, {v27(v28, v29, v30)})
    v23.KitContractStatPanel = v24(v25, v19, v26)
    return v22(v23)
end
return {
    ["KitContractStatPanelTab"] = u11,
    ["KitContractStatPanel"] = v6.new(u5)(v33)
}