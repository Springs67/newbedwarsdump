local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u12 = v1.import(script, script.Parent, "RewardInfo", "kit-contract-reward-info-card").KitContractRewardInfoCard
local u13 = v1.import(script, script.Parent, "RewardShowcase", "kit-contract-reward-showcase").KitContractRewardShowcase
local u14 = v1.import(script, script.Parent, "RewardsList", "kit-contract-rewards-list-container").KitContractRewardsListContainer
local u15 = v1.import(script, script.Parent, "StatPanel", "kit-contract-stat-panel").KitContractStatPanel
return {
    ["KitContractCore"] = v7.new(u6)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u6
            [3] = u11
            [4] = u5
            [5] = u4
            [6] = u8
            [7] = u3
            [8] = u9
            [9] = u12
            [10] = u13
            [11] = u15
            [12] = u14
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local v20 = p17.useMemo
        local u21 = u10[u16.SelectedKit]
        if u21 ~= nil then
            u21 = u21.rewards
        end
        if not u21 then
            return u6.createFragment()
        end
        local v22, v23 = v18(u21[1])
        local v24 = u16.store.Lobby.kitStatsProfiles[u16.SelectedKit]
        local u25, u26 = v18(v24 == nil and {
            ["wins"] = 0,
            ["kills"] = 0
        } or v24)
        local v27 = u16.store.Lobby.kitContractProfiles[u16.SelectedKit]
        local v28, u29 = v18(v27 == nil and {
            ["purchasedUnlock"] = false,
            ["claimedRewards"] = {}
        } or v27)
        local v34 = v20(function() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u11
                [3] = u16
                [4] = u25
            --]]
            local v30 = false
            local v31 = 0
            local v32 = 1
            while true do
                if v30 then
                    v31 = v31 + 1
                else
                    v30 = true
                end
                if v31 >= #u21 then
                    break
                end
                local v33 = u11.getProgressBarPercentage(u21[v31 + 1].tier, u16.SelectedKit, u25)
                v32 = u21[v31 + 1].tier
                if v33 < 1 then
                    break
                end
            end
            return v32
        end, {})
        v19(function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u5
                [3] = u26
                [4] = u29
            --]]
            local v35 = u16.store.Lobby.kitStatsProfiles[u16.SelectedKit]
            u26(v35 == nil and (u5.Controllers.KitContractController:getKitStats(u16.SelectedKit):expect() or {
                ["wins"] = 0,
                ["kills"] = 0
            }) or v35)
            local v36 = u16.store.Lobby.kitContractProfiles[u16.SelectedKit]
            u29(v36 == nil and (u5.Controllers.KitContractController:getKitContractProfile(u16.SelectedKit):expect() or {
                ["purchasedUnlock"] = false,
                ["claimedRewards"] = {}
            }) or v36)
        end, {})
        local function v38() --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u29
            --]]
            local v37 = u16.store.Lobby.kitContractProfiles[u16.SelectedKit]
            u29(v37 == nil and {
                ["purchasedUnlock"] = false,
                ["claimedRewards"] = {}
            } or v37)
        end
        local v39 = u16.SelectedKit
        local v40 = u16.store.Lobby.kitContractProfiles[u16.SelectedKit]
        if v40 ~= nil then
            v40 = v40.purchasedUnlock
        end
        v19(v38, { v39, v40 })
        if not v22 then
            return u6.createFragment()
        end
        local v41 = {}
        for v42, v43 in u16 do
            v41[v42] = v43
        end
        v41.SelectedKit = nil
        v41.store = nil
        local v44 = {}
        for v45, v46 in v41 do
            v44[v45] = v46
        end
        return u6.createElement(u4, v44, {
            ["Header"] = u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0)
            }, { u6.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                }), u6.createElement(u4, {
                    ["Size"] = UDim2.fromScale(0.2, 1)
                }, {
                    u6.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                    }),
                    u6.createElement("TextLabel", {
                        ["LayoutOrder"] = 1,
                        ["BackgroundTransparency"] = 1,
                        ["TextSize"] = 26,
                        ["TextWrapped"] = false,
                        ["TextTransparency"] = 0.5,
                        ["AutomaticSize"] = Enum.AutomaticSize.XY,
                        ["Text"] = u8[u16.SelectedKit].name .. " Kit \226\134\146 ",
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }),
                    u6.createElement("ImageLabel", {
                        ["LayoutOrder"] = 2,
                        ["BackgroundTransparency"] = 1,
                        ["Image"] = u9.SCROLL_SOLID,
                        ["Size"] = UDim2.fromScale(0.1, 1)
                    }, { u6.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }),
                    u6.createElement("TextLabel", {
                        ["LayoutOrder"] = 3,
                        ["BackgroundTransparency"] = 1,
                        ["TextSize"] = 26,
                        ["TextWrapped"] = false,
                        ["AutomaticSize"] = Enum.AutomaticSize.XY,
                        ["Text"] = " " .. u8[u16.SelectedKit].name .. " Contract",
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    })
                }) }),
            ["KitContractBody"] = u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 0.75)
            }, {
                u6.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }),
                ["KitContractBodyLeft"] = u6.createElement(u4, {
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(0.3, 1)
                }, { u6.createElement(u12, {
                        ["Reward"] = v22,
                        ["SelectedKit"] = u16.SelectedKit,
                        ["KitContractProfile"] = v28,
                        ["KitStats"] = u25,
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) }),
                ["KitContractBodyCenter"] = u6.createElement(u4, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.4, 1)
                }, { u6.createElement(u13, {
                        ["Reward"] = v22,
                        ["Size"] = UDim2.fromScale(1, 1)
                    }) }),
                ["KitContractBodyRight"] = u6.createElement(u4, {
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.3, 1)
                }, { u6.createElement(u15, {
                        ["SelectedKit"] = u16.SelectedKit,
                        ["UserKitStatProfile"] = u25,
                        ["Size"] = UDim2.fromScale(1, 0.9),
                        ["Position"] = UDim2.fromScale(0, 0.1),
                        ["HighestUnlockedTier"] = v34
                    }) })
            }),
            ["KitContractFooter"] = u6.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 0.27),
                ["Position"] = UDim2.fromScale(0.5, 0.74),
                ["AnchorPoint"] = Vector2.new(0.5, 0)
            }, {
                ["KitContractRewardsListContainer"] = u6.createElement(u14, {
                    ["store"] = u16.store,
                    ["SelectedKit"] = u16.SelectedKit,
                    ["Size"] = UDim2.fromScale(0.8, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Reward"] = v22,
                    ["SetReward"] = v23,
                    ["KitContractProfile"] = v28,
                    ["UserKitStatProfile"] = u25,
                    ["HighestUnlockedTier"] = v34
                })
            })
        })
    end)
}