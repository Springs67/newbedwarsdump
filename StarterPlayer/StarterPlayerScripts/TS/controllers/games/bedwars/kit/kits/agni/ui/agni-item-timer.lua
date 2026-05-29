local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "agni", "agni-util").AgniKitUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["AgniItemTimerApp"] = v9.new(u8)(function(_, p16) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u14
            [4] = u15
            [5] = u13
            [6] = u12
            [7] = u8
            [8] = u6
            [9] = u3
            [10] = u4
            [11] = u5
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local v19 = u11.LocalPlayer:GetAttribute("NextClusterReceiveTime")
        local u20, u21 = v17(v19 == nil and 0 or v19)
        local v22, u23 = v17(0)
        local v24, u25 = v17(false)
        v18(function() --[[ Line: 28 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u11
                [3] = u21
            --]]
            local u26 = u7.new()
            u26:GiveTask(u11.LocalPlayer:GetAttributeChangedSignal("NextClusterReceiveTime"):Connect(function() --[[ Line: 30 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u21
                --]]
                local v27 = u11.LocalPlayer:GetAttribute("NextClusterReceiveTime")
                if v27 ~= 0 and (v27 == v27 and v27) then
                    u21(v27)
                end
            end))
            return function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                u26:DoCleaning()
            end
        end)
        v18(function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u11
                [3] = u15
                [4] = u13
                [5] = u25
                [6] = u20
                [7] = u12
                [8] = u23
            --]]
            local u28 = true
            local function u31() --[[ Line: 43 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u14
                    [3] = u11
                    [4] = u15
                    [5] = u13
                    [6] = u25
                    [7] = u20
                    [8] = u12
                    [9] = u23
                    [10] = u31
                --]]
                task.delay(1, function() --[[ Line: 44 ]]
                    --[[
                    Upvalues:
                        [1] = u28
                        [2] = u14
                        [3] = u11
                        [4] = u15
                        [5] = u13
                        [6] = u25
                        [7] = u20
                        [8] = u12
                        [9] = u23
                        [10] = u31
                    --]]
                    if not u28 then
                        return nil
                    end
                    if u14.getAmount(u11.LocalPlayer, u15.CLUSTER_BOMB) >= u13.MAX_CLUSTER_NADE_SIZE then
                        u25(true)
                    else
                        u25(false)
                    end
                    local v29 = u20 - u12:GetServerTimeNow()
                    local v30 = 1 - math.round(v29) / u13.CLUSTER_INTERVAL
                    u23((math.clamp(v30, 0, 1)))
                    u31()
                end)
            end
            u31()
            return function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28 = false
            end
        end, { u20 })
        local v32 = {
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v33 = {}
        local v34 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(2)
        })
        local v35 = u8.createElement
        local v36 = u6
        local v37 = {}
        local v38 = u8.createElement(u3, {
            ["Text"] = "Cluster Bomb Item Timer",
            ["TextSize"] = 16,
            ["Font"] = Enum.Font.SourceSansBold,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v39 = u8.createElement(u3, {
            ["Text"] = "When the bar fills up you will receive another Cluster Bomb",
            ["TextSize"] = 14,
            ["Font"] = Enum.Font.SourceSans,
            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v40 = u8.createElement
        local v41 = u3
        local v42 = {
            ["TextSize"] = 14,
            ["RichText"] = true
        }
        local v43 = u13.MAX_CLUSTER_NADE_SIZE
        v42.Text = "Max Cluster Bombs: " .. tostring(v43)
        v42.Font = Enum.Font.SourceSans
        v42.TextColor3 = Color3.fromRGB(191, 191, 191)
        v42.TextXAlignment = Enum.TextXAlignment.Left
        v42.Limits = Vector2.new(300, 60)
        __set_list(v37, 1, {v38, v39, v40(v41, v42)})
        __set_list(v33, 1, {v34, v35(v36, {}, v37)})
        local _ = #v33
        local v44 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v45 = { u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u8.createElement("Frame", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 0.5,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.1, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(4)
                }), u8.createElement("Frame", {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundColor3"] = Color3.fromRGB(80, 150, 200),
                    ["AnchorPoint"] = Vector2.new(0, 1),
                    ["Position"] = UDim2.fromScale(0, 1),
                    ["Size"] = UDim2.fromScale(1, (math.clamp(v22, 0, 1)))
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = 60,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromRGB(209, 135, 64), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromRGB(209, 135, 64), 0.9)) })
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(4)
                    }) }) }), u8.createElement("ImageLabel", {
                ["LayoutOrder"] = 2,
                ["Image"] = "rbxassetid://17009910977",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }) }
        local v46 = #v45
        if v24 then
            v24 = u8.createElement(u3, {
                ["Text"] = "MAX",
                ["TextSize"] = 14,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = Color3.fromRGB(255, 89, 89),
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        end
        if v24 then
            v45[v46 + 1] = v24
        end
        v33.Container = u8.createElement(u5, v44, v45)
        return u8.createFragment({
            ["ClusterBombTimer"] = u8.createElement("Frame", v32, v33)
        })
    end)
}