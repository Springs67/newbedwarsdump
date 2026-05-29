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
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["SummonStoneItemTimerApp"] = v9.new(u8)(function(_, p17) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u12
            [4] = u13
            [5] = u14
            [6] = u8
            [7] = u6
            [8] = u3
            [9] = u4
            [10] = u15
            [11] = u16
            [12] = u5
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local v20 = u11.LocalPlayer:GetAttribute("NextSummonStoneReceiveTime")
        local v21 = v20 == nil and 0 or v20
        local v22, u23 = v18(0)
        local u24, u25 = v18(v21)
        local v26, u27 = v18(false)
        v19(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u11
                [3] = u25
            --]]
            local u28 = u7.new()
            u28:GiveTask(u11.LocalPlayer:GetAttributeChangedSignal("NextSummonStoneReceiveTime"):Connect(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u25
                --]]
                local v29 = u11.LocalPlayer:GetAttribute("NextSummonStoneReceiveTime")
                if v29 ~= 0 and (v29 == v29 and v29) then
                    u25(v29)
                end
            end))
            return function() --[[ Line: 37 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:DoCleaning()
            end
        end)
        v19(function() --[[ Line: 41 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u27
                [3] = u24
                [4] = u12
                [5] = u13
                [6] = u14
                [7] = u23
            --]]
            local u30 = true
            local function u33() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u11
                    [3] = u27
                    [4] = u24
                    [5] = u12
                    [6] = u13
                    [7] = u14
                    [8] = u23
                    [9] = u33
                --]]
                task.delay(1, function() --[[ Line: 45 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u11
                        [3] = u27
                        [4] = u24
                        [5] = u12
                        [6] = u13
                        [7] = u14
                        [8] = u23
                        [9] = u33
                    --]]
                    if not u30 then
                        return nil
                    end
                    if u11.LocalPlayer:GetAttribute("DisableSummonStonePurchase") == true then
                        u27(true)
                    else
                        u27(false)
                    end
                    local v31 = u24 - u12:GetServerTimeNow()
                    local v32 = 1 - math.round(v31) / u13.ResourceSpawnDelayModifierCheck:fire(u14.PASSIVE_RECEIVE_TIME).spawnDelay
                    u23((math.clamp(v32, 0, 1)))
                    u33()
                end)
            end
            u33()
            return function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30 = false
            end
        end, { u24 })
        local v34 = {
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v35 = { u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(2)
            }), u8.createElement(u6, {}, { u8.createElement(u3, {
                    ["Text"] = "Summon Stone Timer",
                    ["TextSize"] = 16,
                    ["Font"] = Enum.Font.SourceSansBold,
                    ["Limits"] = Vector2.new(300, 60)
                }), u8.createElement(u3, {
                    ["Text"] = "When the bar fills up you will receive another summon stone",
                    ["TextSize"] = 14,
                    ["Font"] = Enum.Font.SourceSans,
                    ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Limits"] = Vector2.new(300, 60)
                }) }) }
        local _ = #v35
        local v36 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v37 = { u8.createElement("UIListLayout", {
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
                    ["Size"] = UDim2.fromScale(1, v26 and 1 or math.clamp(v22, 0, 1))
                }, { u8.createElement("UIGradient", {
                        ["Rotation"] = 60,
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromRGB(80, 150, 200), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromRGB(80, 150, 200), 0.9)) })
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(4)
                    }) }) }), u8.createElement("ImageLabel", {
                ["LayoutOrder"] = 2,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.5, 1),
                ["Image"] = u15(u16.SUMMON_STONE).image
            }) }
        local v38 = #v37
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
            v37[v38 + 1] = v26
        end
        v35.Container = u8.createElement(u5, v36, v37)
        return u8.createFragment({
            ["SummonStoneTimer"] = u8.createElement("Frame", v34, v35)
        })
    end)
}