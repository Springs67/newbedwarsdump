local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.ScaleComponent
local u7 = v3.SlideIn
local u8 = v3.WidgetComponent
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards
local u12 = v1.import(script, script.Parent, "RewardShowcase", "battle-pass-reward-showcase-container").BattlePassRewardShowcaseContainer
local u13 = v1.import(script, script.Parent, "RewardsList", "battle-pass-rewards-list").BattlePassRewardsList
local u14 = v1.import(script, script.Parent, "SeasonInfo", "battle-pass-purchase-buttons").BattlePassPurchaseButtons
local u15 = v1.import(script, script.Parent, "SeasonInfo", "Card", "battle-pass-season-info-card").BattlePassInfoCard
return {
    ["BattlePassCore"] = v10.new(u9)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
            [3] = u9
            [4] = u13
            [5] = u6
            [6] = u4
            [7] = u5
            [8] = u15
            [9] = u14
            [10] = u12
            [11] = u8
            [12] = u7
        --]]
        local v18 = p17.useState
        local v19 = p17.useMemo
        local v20 = p17.useEffect
        local v21, u22 = v18(nil)
        v20(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u16
                [3] = u22
            --]]
            local v23 = nil
            for v24, v25 in u11[u16.battlepass] do
                local _ = v24 - 1
                if v25.level == 1 == true then
                    v23 = v25
                    break
                end
            end
            u22(v23)
        end, { u16.battlepass })
        local function v26() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u16
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u16.AppId)
        end
        v19(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u13
                [3] = u16
                [4] = u22
            --]]
            return u9.createElement(u13, {
                ["LayoutOrder"] = 2,
                ["store"] = u16.store,
                ["battlepass"] = u16.battlepass,
                ["Size"] = UDim2.new(1, 0, 0.5, -10),
                ["SetReward"] = u22
            })
        end, { u16.store.BattlePass })
        local v27 = {}
        local _ = #v27
        local v28 = {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromOffset(1200, 545)
        }
        local v29 = {}
        local v30 = u9.createElement
        local v31 = u6
        local v32 = {
            ["MaximumSize"] = Vector2.new(1500, 720)
        }
        local v33
        if u4.isSmallScreen() then
            v33 = Vector2.new(48, 48)
        else
            v33 = Vector2.new(24, 24)
        end
        v32.ScreenPadding = v33
        __set_list(v29, 1, {v30(v31, v32)})
        local v34 = #v29
        local v35 = {
            ["Title"] = "Battle Pass",
            ["AppId"] = u16.AppId,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["OnClose"] = v26
        }
        local v36 = {}
        local v37 = u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 20)
        })
        local v38 = u9.createElement
        local v39 = u5
        local v40 = {
            ["Size"] = UDim2.new(0.73, -10, 1, 0)
        }
        local v41 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }),
            ["TopFrameRow"] = u9.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.3, -5)
            }, {
                u9.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 24)
                }),
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 8)
                }),
                u9.createElement(u15, {
                    ["store"] = u16.store,
                    ["battlepass"] = u16.battlepass,
                    ["Size"] = UDim2.new(0.4, -4, 1, 0)
                }),
                u9.createElement(u14, {
                    ["LayoutOrder"] = 2,
                    ["store"] = u16.store,
                    ["battlepass"] = u16.battlepass,
                    ["Size"] = UDim2.new(0.4, -4, 1, 0)
                })
            }),
            u9.createElement(u13, {
                ["LayoutOrder"] = 2,
                ["store"] = u16.store,
                ["battlepass"] = u16.battlepass,
                ["Size"] = UDim2.new(1, 0, 0.7, -5),
                ["SetReward"] = u22
            })
        }
        __set_list(v36, 1, {v37, v38(v39, v40, v41)})
        local v42 = #v36
        if v21 then
            v21 = u9.createElement(u12, {
                ["BattlePass"] = u16.store.BattlePass,
                ["Reward"] = v21,
                ["Size"] = UDim2.new(0.27, -10, 1, 0)
            })
        end
        if v21 then
            v36[v42 + 1] = v21
        end
        v29[v34 + 1] = u9.createElement(u8, v35, v36)
        v27.BattlePassApp = u9.createElement("Frame", v28, v29)
        return u9.createElement(u7, {}, v27)
    end)
}