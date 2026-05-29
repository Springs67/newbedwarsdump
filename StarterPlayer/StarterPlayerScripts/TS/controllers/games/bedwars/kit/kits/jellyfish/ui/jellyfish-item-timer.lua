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
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jellyfish", "jellyfish-kit-util").JellyfishBalance
return {
    ["JellyfishItemTimerApp"] = v9.new(u8)(function(_, p18) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
            [3] = u11
            [4] = u15
            [5] = u16
            [6] = u17
            [7] = u13
            [8] = u14
            [9] = u8
            [10] = u6
            [11] = u3
            [12] = u4
            [13] = u5
        --]]
        local v19 = p18.useState
        local v20 = p18.useEffect
        local v21 = u12.LocalPlayer:GetAttribute("NextJellyfishReceiveTime")
        local u22, u23 = v19(v21 == nil and 0 or v21)
        local v24, u25 = v19(0)
        local v26, u27 = v19(false)
        v20(function() --[[ Line: 30 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u12
                [3] = u23
            --]]
            local u28 = u7.new()
            u28:GiveTask(u12.LocalPlayer:GetAttributeChangedSignal("NextJellyfishReceiveTime"):Connect(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u12
                    [2] = u23
                --]]
                local v29 = u12.LocalPlayer:GetAttribute("NextJellyfishReceiveTime")
                if v29 ~= 0 and (v29 == v29 and v29) then
                    u23(v29)
                end
            end))
            return function() --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:DoCleaning()
            end
        end)
        v20(function() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u12
                [3] = u15
                [4] = u16
                [5] = u17
                [6] = u27
                [7] = u22
                [8] = u13
                [9] = u14
                [10] = u25
            --]]
            local u30 = true
            local function u37() --[[ Line: 45 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u11
                    [3] = u12
                    [4] = u15
                    [5] = u16
                    [6] = u17
                    [7] = u27
                    [8] = u22
                    [9] = u13
                    [10] = u14
                    [11] = u25
                    [12] = u37
                --]]
                task.delay(1, function() --[[ Line: 46 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u11
                        [3] = u12
                        [4] = u15
                        [5] = u16
                        [6] = u17
                        [7] = u27
                        [8] = u22
                        [9] = u13
                        [10] = u14
                        [11] = u25
                        [12] = u37
                    --]]
                    if not u30 then
                        return nil
                    end
                    local v31 = 0
                    local v32 = {}
                    for v33, v34 in u11:GetTagged("jellyfish") do
                        local _ = v33 - 1
                        if v34:GetAttribute("PlacedByUserId") == u12.LocalPlayer.UserId == true then
                            v31 = v31 + 1
                            v32[v31] = v34
                        end
                    end
                    if #v32 + u15.getAmount(u12.LocalPlayer, u16.JELLYFISH) >= u17.MaxJellyfishOwned then
                        u27(true)
                    else
                        u27(false)
                    end
                    local v35 = u22 - u13:GetServerTimeNow()
                    local v36 = 1 - math.round(v35) / u14.AbilityCooldownModifierCheck:fire(u17.GetJellyfishTime).cooldown
                    u25((math.clamp(v36, 0, 1)))
                    u37()
                end)
            end
            u37()
            return function() --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30 = false
            end
        end, { u22 })
        local v38 = {
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v39 = {}
        local v40 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(2)
        })
        local v41 = u8.createElement
        local v42 = u6
        local v43 = {}
        local v44 = u8.createElement(u3, {
            ["Text"] = "Jellyfish Spawn Timer",
            ["TextSize"] = 16,
            ["Font"] = Enum.Font.SourceSansBold,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v45 = u8.createElement(u3, {
            ["Text"] = "When the bar fills up you will receive another jellyfish",
            ["TextSize"] = 14,
            ["Font"] = Enum.Font.SourceSans,
            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v46 = u8.createElement
        local v47 = u3
        local v48 = {
            ["TextSize"] = 14,
            ["RichText"] = true
        }
        local v49 = u4.richTextColor(Color3.fromRGB(255, 74, 74))
        local v50 = u17.MaxJellyfishOwned
        v48.Text = "Max Jellyfish: <b><font color=\"" .. v49 .. "\">" .. tostring(v50) .. "</font></b> jellyfishes placed and/or in inventory"
        v48.Font = Enum.Font.SourceSans
        v48.TextColor3 = Color3.fromRGB(191, 191, 191)
        v48.TextXAlignment = Enum.TextXAlignment.Left
        v48.Limits = Vector2.new(300, 60)
        __set_list(v43, 1, {v44, v45, v46(v47, v48)})
        __set_list(v39, 1, {v40, v41(v42, {}, v43)})
        local _ = #v39
        local v51 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v52 = { u8.createElement("UIListLayout", {
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
                    ["Size"] = UDim2.fromScale(1, (math.clamp(v24, 0, 1)))
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = 60,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromRGB(80, 150, 200), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromRGB(80, 150, 200), 0.9)) })
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(4)
                    }) }) }), u8.createElement("ImageLabel", {
                ["LayoutOrder"] = 2,
                ["Image"] = "rbxassetid://18129975091",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }) }
        local v53 = #v52
        if v26 then
            v26 = u8.createElement(u3, {
                ["Text"] = "MAX",
                ["TextSize"] = 14,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = Color3.fromRGB(255, 89, 89),
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        end
        if v26 then
            v52[v53 + 1] = v26
        end
        v39.Container = u8.createElement(u5, v51, v52)
        return u8.createFragment({
            ["JellyfishTimer"] = u8.createElement("Frame", v38, v39)
        })
    end)
}