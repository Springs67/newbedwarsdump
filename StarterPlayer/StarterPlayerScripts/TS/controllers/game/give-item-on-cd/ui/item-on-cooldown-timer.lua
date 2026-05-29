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
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["GiveItemOnCooldownApp"] = v9.new(u8)(function(u16, p17) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
            [3] = u14
            [4] = u12
            [5] = u15
            [6] = u8
            [7] = u6
            [8] = u3
            [9] = u4
            [10] = u13
            [11] = u5
        --]]
        local v18 = p17.useState
        local v19 = p17.useEffect
        local u20 = "Next" .. u16.itemType .. "ReceiveTime"
        local v21 = u11.LocalPlayer:GetAttribute(u20)
        local u22, u23 = v18(v21 == nil and 0 or v21)
        local v24, u25 = v18(0)
        local v26, u27 = v18(false)
        v19(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u11
                [3] = u20
                [4] = u23
            --]]
            local u28 = u7.new()
            u28:GiveTask(u11.LocalPlayer:GetAttributeChangedSignal(u20):Connect(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u20
                    [3] = u23
                --]]
                local v29 = u11.LocalPlayer:GetAttribute(u20)
                if v29 ~= 0 and (v29 == v29 and v29) then
                    u23(v29)
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
                [1] = u14
                [2] = u11
                [3] = u16
                [4] = u27
                [5] = u22
                [6] = u12
                [7] = u25
            --]]
            local u30 = true
            local function u33() --[[ Line: 44 ]]
                --[[
                Upvalues:
                    [1] = u30
                    [2] = u14
                    [3] = u11
                    [4] = u16
                    [5] = u27
                    [6] = u22
                    [7] = u12
                    [8] = u25
                    [9] = u33
                --]]
                task.delay(1, function() --[[ Line: 45 ]]
                    --[[
                    Upvalues:
                        [1] = u30
                        [2] = u14
                        [3] = u11
                        [4] = u16
                        [5] = u27
                        [6] = u22
                        [7] = u12
                        [8] = u25
                        [9] = u33
                    --]]
                    if not u30 then
                        return nil
                    end
                    if u14.getAmount(u11.LocalPlayer, u16.itemType) >= u16.maxAmount then
                        u27(true)
                    else
                        u27(false)
                    end
                    local v31 = u22 - u12:GetServerTimeNow()
                    local v32 = 1 - math.round(v31) / u16.interval
                    u25((math.clamp(v32, 0, 1)))
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
        end, { u22 })
        local v34 = u15(u16.itemType).displayName
        local v35 = {
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v36 = {}
        local v37 = u8.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(2)
        })
        local v38 = u8.createElement
        local v39 = u6
        local v40 = {}
        local v41 = u8.createElement(u3, {
            ["TextSize"] = 16,
            ["Text"] = v34 .. " Item Timer",
            ["Font"] = Enum.Font.SourceSansBold,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v42 = u8.createElement(u3, {
            ["TextSize"] = 14,
            ["Text"] = "When the bar fills up you will receive another " .. v34,
            ["Font"] = Enum.Font.SourceSans,
            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v43 = u8.createElement
        local v44 = u3
        local v45 = {
            ["TextSize"] = 14,
            ["RichText"] = true
        }
        local v46 = u16.maxAmount
        v45.Text = "Max " .. v34 .. "s: " .. tostring(v46)
        v45.Font = Enum.Font.SourceSans
        v45.TextColor3 = Color3.fromRGB(191, 191, 191)
        v45.TextXAlignment = Enum.TextXAlignment.Left
        v45.Limits = Vector2.new(300, 60)
        __set_list(v40, 1, {v41, v42, v43(v44, v45)})
        __set_list(v36, 1, {v37, v38(v39, {}, v40)})
        local _ = #v36
        local v47 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v48 = { u8.createElement("UIListLayout", {
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
                        ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.brighten(Color3.fromRGB(209, 135, 64), 0.9)), ColorSequenceKeypoint.new(1, u4.darken(Color3.fromRGB(209, 135, 64), 0.9)) })
                    }), u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(4)
                    }) }) }) }
        local v49 = #v48
        local v50 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v51 = u15(u16.itemType).image
        if v51 == nil then
            v51 = u13.WORLD_EDIT_ROTATE
        end
        v50.Image = v51
        v50.BackgroundTransparency = 1
        v48[v49 + 1] = u8.createElement("ImageLabel", v50)
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
            v48[v49 + 2] = v26
        end
        v36.Container = u8.createElement(u5, v47, v48)
        return u8.createFragment({
            [u16.itemType .. "Timer"] = u8.createElement("Frame", v35, v36)
        })
    end)
}