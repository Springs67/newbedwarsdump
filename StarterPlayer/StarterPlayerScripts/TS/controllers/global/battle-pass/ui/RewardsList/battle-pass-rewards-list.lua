local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-rewards").BattlePassRewards
local u9 = v1.import(script, script.Parent, "battle-pass-level-rewards-list-level-card").BattlePassLevelRewardsListLevelCard
local u10 = v1.import(script, script.Parent, "battle-pass-rewards-list-pass-titles").BattlePassRewardsListPassTitles
return {
    ["BattlePassRewardsList"] = v6.new(u5)(function(u11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u5
            [4] = u10
            [5] = u4
            [6] = u9
            [7] = u3
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local v15 = p12.useMemo
        local v16 = nil
        for v17, v18 in u8[u11.battlepass] do
            local _ = v17 - 1
            if v18.level == 1 == true then
                v16 = v18
                break
            end
        end
        local u19, u20 = v13(v16)
        local u21, u22 = v13(nil)
        v14(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u7
                [3] = u11
            --]]
            u22(u7(u11.battlepass))
        end, { u11.battlepass })
        local v42 = v15(function() --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u8
                [3] = u11
            --]]
            if not u21 then
                return {}
            end
            local v23 = false
            local v24 = 1
            local u25 = {}
            while true do
                if v23 then
                    v24 = v24 + 1
                else
                    v23 = true
                end
                local v26 = u21
                if v26 ~= nil then
                    v26 = v26.maxLevel
                end
                if v24 > v26 then
                    break
                end
                u25[v24] = {}
            end
            local v27 = false
            local v28 = 1
            while true do
                if v27 then
                    v28 = v28 + 1
                else
                    v27 = true
                end
                local v29 = u21
                if v29 ~= nil then
                    v29 = v29.epilogueLevels
                end
                if v28 > (v29 == nil and 0 or v29) then
                    local v30 = u8[u11.battlepass]
                    local function v38(p31) --[[ Line: 92 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                        --]]
                        if u25[p31.level] ~= nil then
                            local v32 = u25
                            local v33 = p31.level
                            local v34 = {}
                            local v35 = #v34
                            local v36 = u25[p31.level]
                            local v37 = #v36
                            table.move(v36, 1, v37, v35 + 1, v34)
                            v34[v35 + v37 + 1] = p31
                            v32[v33] = v34
                        else
                            u25[p31.level] = { p31 }
                        end
                    end
                    for v39, v40 in v30 do
                        v38(v40, v39 - 1, v30)
                    end
                    return u25
                end
                local v41 = u21
                if v41 ~= nil then
                    v41 = v41.maxLevel
                end
                u25[v41 + v28] = {}
            end
        end, { u21 })
        local v43 = v15(function() --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
            --]]
            return u5.createElement(u10, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1)
            })
        end, {})
        local v44 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u11.Size,
            ["LayoutOrder"] = u11.LayoutOrder
        }
        local v45 = { u5.createElement(u4, {
                ["Size"] = UDim2.new(1, 0, 0.95, 0)
            }, { v43 }) }
        local _ = #v45
        local v46 = {}
        local v47 = #v46
        for v48, v49 in v42 do
            v47 = v47 + 1
            v46[v47] = { v48, v49 }
        end
        local function v53(p50) --[[ Line: 146 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u11
                [4] = u20
                [5] = u19
            --]]
            local v51 = p50[1]
            local v52 = p50[2]
            return u5.createElement(u9, {
                ["Level"] = v51,
                ["BattlePass"] = u11.store.BattlePass,
                ["Size"] = UDim2.new(0, 90, 0.95, 0),
                ["SetReward"] = u11.SetReward,
                ["LevelRewards"] = v52,
                ["LayoutOrder"] = v51,
                ["SetActive"] = u20,
                ["Active"] = u19
            })
        end
        local v54 = table.create(#v46)
        for v55, v56 in v46 do
            v54[v55] = v53(v56, v55 - 1, v46)
        end
        local v57 = {
            ["AdditionalSpace"] = 50,
            ["ScrollingFrameProps"] = {
                ["ScrollBarThickness"] = 8,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Position"] = UDim2.new(0, 24, 0, 0),
                ["Size"] = UDim2.new(1, -24, 1, 0),
                ["ScrollingDirection"] = Enum.ScrollingDirection.X
            }
        }
        local v58 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            }), u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 2),
                ["PaddingBottom"] = UDim.new(0, 2),
                ["PaddingLeft"] = UDim.new(0, 2),
                ["PaddingRight"] = UDim.new(0, 2)
            }) }
        local v59 = #v58
        for v60, v61 in v54 do
            v58[v59 + v60] = v61
        end
        v45.BattlePassRewardsList = u5.createElement(u3, v57, v58)
        return u5.createFragment({
            ["BattlePassRewardsListContainer"] = u5.createElement("Frame", v44, v45)
        })
    end)
}