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
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["RavenTimerApp"] = v9.new(u8)(function(_, p15) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u13
            [4] = u14
            [5] = u12
            [6] = u8
            [7] = u6
            [8] = u3
            [9] = u4
            [10] = u5
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18 = u11.LocalPlayer:GetAttribute("NextRavenReceiveTime")
        local u19, u20 = v16(v18 == nil and 0 or v18)
        local v21, u22 = v16(0)
        local v23, u24 = v16(false)
        v17(function() --[[ Line: 27 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u11
                [3] = u20
            --]]
            local u25 = u7.new()
            u25:GiveTask(u11.LocalPlayer:GetAttributeChangedSignal("NextRavenReceiveTime"):Connect(function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u20
                --]]
                local v26 = u11.LocalPlayer:GetAttribute("NextRavenReceiveTime")
                if v26 ~= 0 and (v26 == v26 and v26) then
                    u20(v26)
                end
            end))
            return function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:DoCleaning()
            end
        end)
        v17(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u14
                [4] = u24
                [5] = u19
                [6] = u12
                [7] = u22
            --]]
            local u27 = true
            local function u30() --[[ Line: 42 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u13
                    [3] = u11
                    [4] = u14
                    [5] = u24
                    [6] = u19
                    [7] = u12
                    [8] = u22
                    [9] = u30
                --]]
                task.delay(1, function() --[[ Line: 43 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u13
                        [3] = u11
                        [4] = u14
                        [5] = u24
                        [6] = u19
                        [7] = u12
                        [8] = u22
                        [9] = u30
                    --]]
                    if not u27 then
                        return nil
                    end
                    if u13.getAmount(u11.LocalPlayer, u14.RAVEN) >= 2 then
                        u24(true)
                    else
                        u24(false)
                    end
                    local v28 = u19 - u12:GetServerTimeNow()
                    local v29 = 1 - math.round(v28) / 45
                    u22((math.clamp(v29, 0, 1)))
                    u30()
                end)
            end
            u30()
            return function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27 = false
            end
        end, { u19 })
        local v31 = {
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v32 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(2)
            }), u8.createElement(u6, {}, { u8.createElement(u3, {
                    ["Text"] = "Raven Item Timer",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }), u8.createElement(u3, {
                    ["Text"] = "When the bar fills up you will receive another Raven",
                    ["TextSize"] = 14,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Limits"] = Vector2.new(300, 60)
                }), u8.createElement(u3, {
                    ["Text"] = "Max Ravens: 1",
                    ["TextSize"] = 14,
                    ["RichText"] = true,
                    ["Font"] = Enum.Font.SourceSans,
                    ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) }
        local _ = #v32
        local v33 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v34 = { u8.createElement("UIListLayout", {
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
                    ["Size"] = UDim2.fromScale(1, (math.clamp(v21, 0, 1)))
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = 60,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromRGB(209, 135, 64), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromRGB(209, 135, 64), 0.9)) })
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(4)
                    }) }) }), u8.createElement("ImageLabel", {
                ["LayoutOrder"] = 2,
                ["Image"] = "rbxassetid://7343272003",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1)
            }) }
        local v35 = #v34
        if v23 then
            v23 = u8.createElement(u3, {
                ["Text"] = "MAX",
                ["TextSize"] = 14,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextColor3"] = Color3.fromRGB(255, 89, 89),
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            })
        end
        if v23 then
            v34[v35 + 1] = v23
        end
        v32.Container = u8.createElement(u5, v33, v34)
        return u8.createFragment({
            ["RavenTimer"] = u8.createElement("Frame", v31, v32)
        })
    end)
}