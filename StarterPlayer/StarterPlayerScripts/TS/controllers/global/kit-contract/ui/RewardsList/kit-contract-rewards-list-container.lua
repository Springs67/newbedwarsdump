local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Empty
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent, "kit-contract-rewards-list-card").KitContractRewardsListCard
return {
    ["KitContractRewardsListContainer"] = v7.new(u6)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u6
            [3] = u11
            [4] = u5
            [5] = u10
            [6] = u3
            [7] = u8
            [8] = u4
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16 = p13.useValue
        local v17 = u12.HighestUnlockedTier
        local v18 = v17 == nil and 1 or v17
        local function u25(p19) --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
            --]]
            local v20 = u9[u12.SelectedKit]
            if not v20 then
                return Vector2.new(0, 0)
            end
            local v21 = -1
            for v22, v23 in v20.rewards do
                local _ = v22 - 1
                if v23.tier == p19 == true then
                    v21 = v22 - 1
                    break
                end
            end
            if v21 == -1 then
                return Vector2.new(0, 0)
            end
            local v24 = v21 * 201.5 - 427.8125 + 100
            return Vector2.new(v24, 0)
        end
        local u26 = v16(u6.createRef())
        local u27, u28 = v14(v18)
        v15(function() --[[ Line: 57 ]]
            --[[
            Upvalues:
                [1] = u26
                [2] = u25
                [3] = u27
            --]]
            local u29 = u26.value:getValue()
            if not u29 then
                return nil
            end
            task.defer(function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u25
                    [3] = u27
                --]]
                u29.CanvasPosition = u25(u27)
            end)
        end, { u27 })
        v15(function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
                [3] = u27
            --]]
            local v30 = u9[u12.SelectedKit]
            if v30 ~= nil then
                v30 = nil
                for v31, v32 in v30.rewards do
                    local _ = v31 - 1
                    if v32.tier == u27 == true then
                        v30 = v32
                        break
                    end
                end
            end
            u12.SetReward(v30)
        end, { u27 })
        local v33 = {}
        for v34, v35 in u12 do
            v33[v34] = v35
        end
        v33.store = nil
        v33.SelectedKit = nil
        v33.SetReward = nil
        v33.UserKitStatProfile = nil
        v33.KitContractProfile = nil
        v33.HighestUnlockedTier = nil
        v33.Reward = nil
        local v36 = {}
        for v37, v38 in v33 do
            v36[v37] = v38
        end
        local v39 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }) }
        local v40 = #v39
        local v41 = u9[u12.SelectedKit]
        if v41 ~= nil then
            local v42 = v41.rewards
            local function v48(p43, p44) --[[ Line: 116 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u11
                    [3] = u12
                    [4] = u28
                    [5] = u5
                    [6] = u10
                --]]
                local v45 = u6.createFragment
                local v47 = {
                    ["KitContractRewardsListCard" .. tostring(p44)] = u6.createElement(u11, {
                        ["store"] = u12.store,
                        ["LayoutOrder"] = p44,
                        ["Reward"] = p43,
                        ["SelectedKit"] = u12.SelectedKit,
                        ["KitStats"] = u12.UserKitStatProfile,
                        ["KitContractProfile"] = u12.KitContractProfile,
                        ["ActiveCard"] = u12.Reward,
                        ["OnSelectCard"] = function(p46) --[[ Name: OnSelectCard, Line 126 ]]
                            --[[
                            Upvalues:
                                [1] = u28
                                [2] = u5
                                [3] = u10
                            --]]
                            u28(p46)
                            u5:playSound(u10.UI_CLICK)
                        end
                    })
                }
                return v45(v47)
            end
            v41 = table.create(#v42)
            for v49, v50 in v42 do
                v41[v49] = v48(v50, v49 - 1, v42)
            end
        end
        local v51 = {
            ["Size"] = UDim2.new(0.925, 0, 1, 0),
            ["CanvasSize"] = UDim2.new(1.85, 0, 1, -10),
            ["BackgroundTransparency"] = 1,
            ["ScrollBarThickness"] = 4,
            ["ScrollBarImageTransparency"] = 0.3,
            ["LayoutOrder"] = 1,
            [u6.Ref] = u26.value
        }
        local v52 = { u6.createElement("UIGridLayout", {
                ["FillDirectionMaxCells"] = 10,
                ["CellPadding"] = UDim2.new(0.0075, 0, 0, 0),
                ["CellSize"] = UDim2.new(0.092, 0, 1, -10),
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v53 = #v52
        if v41 then
            for v54, v55 in v41 do
                v52[v53 + v54] = v55
            end
        end
        v39[v40 + 1] = u6.createElement("ScrollingFrame", v51, v52)
        v39.PreviousButton = u6.createElement(u3, {
            ["LayoutOrder"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.05, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 172 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u12
                    [3] = u27
                    [4] = u28
                    [5] = u5
                    [6] = u10
                --]]
                if not u9[u12.SelectedKit] then
                    return nil
                end
                local v56 = u27 - 1
                u28(v56 < 1 and 1 or v56)
                u5:playSound(u10.UI_CLICK)
            end
        }, { u6.createElement("ImageLabel", {
                ["Rotation"] = -90,
                ["ImageTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 0.125),
                ["Image"] = u8.ROUNDED_TRIANGLE_UP,
                ["ScaleType"] = Enum.ScaleType.Fit
            }) })
        v39.NextButton = u6.createElement(u3, {
            ["LayoutOrder"] = 2,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.05, 1),
            ["OnClick"] = function() --[[ Name: OnClick, Line 199 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u12
                    [3] = u27
                    [4] = u28
                    [5] = u5
                    [6] = u10
                --]]
                local v57 = u9[u12.SelectedKit]
                if not v57 then
                    return nil
                end
                local v58 = #v57.rewards
                local v59 = u27 + 1
                if v58 >= v59 then
                    v58 = v59
                end
                u28(v58)
                u5:playSound(u10.UI_CLICK)
            end
        }, { u6.createElement("ImageLabel", {
                ["Rotation"] = 90,
                ["ImageTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 0.125),
                ["Image"] = u8.ROUNDED_TRIANGLE_UP,
                ["ScaleType"] = Enum.ScaleType.Fit
            }) })
        return u6.createElement(u4, v36, v39)
    end)
}