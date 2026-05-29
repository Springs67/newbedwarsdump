local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "constants", "halloween-graveyard-scene-constants").CLUE_TO_TEXTURE
return {
    ["ClueHud"] = v3.new(u2)(function(u5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local v7 = p6.useState
        local v8 = p6.useEffect
        local v9, u10 = v7({})
        v8(function() --[[ Line: 10 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
            --]]
            local u16 = u5.clueDiscoveredSignal:Connect(function(u11) --[[ Line: 11 ]]
                --[[
                Upvalues:
                    [1] = u10
                --]]
                u10(function(p12) --[[ Line: 12 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                    --]]
                    local v13 = {}
                    local v14 = #v13
                    local v15 = #p12
                    table.move(p12, 1, v15, v14 + 1, v13)
                    v13[v14 + v15 + 1] = u11
                    return v13
                end)
            end)
            return function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:Disconnect()
            end
        end, {})
        local v17 = {}
        local _ = #v17
        local v18 = {
            ["BorderSizePixel"] = 0,
            ["Transparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v19 = {}
        local _ = #v19
        local function v22(p20, p21) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u4
            --]]
            return u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["Image"] = u4[p20],
                ["Size"] = UDim2.fromScale(1, 1),
                ["LayoutOrder"] = 2 + p21,
                ["ImageColor3"] = Color3.fromRGB(78, 252, 223)
            }, { u2.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        end
        local v23 = table.create(#v9)
        local v24 = {
            ["ResetOnSpawn"] = true
        }
        for v25, v26 in v9 do
            v23[v25] = v22(v26, v25 - 1, v9)
        end
        local v27 = {
            ["BorderSizePixel"] = 0,
            ["Transparency"] = 1,
            ["Size"] = UDim2.fromOffset(125, 50),
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0.015, 0.985)
        }
        local v28 = {}
        local v29 = u2.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 4)
        })
        local v30 = u2.createElement
        local v31 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1
        }
        local v32 = #v9
        v31.Text = "CLUES: " .. tostring(v32) .. "/3"
        v31.Size = UDim2.fromScale(0.6, 1)
        v31.Font = Enum.Font.RobotoMono
        v31.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v28, 1, {v29, v30("TextLabel", v31)})
        local v33 = #v28
        for v34, v35 in v23 do
            v28[v33 + v34] = v35
        end
        v19.DiscoveredContainer = u2.createElement("Frame", v27, v28)
        v17.ScreenContainer = u2.createElement("Frame", v18, v19)
        return u2.createElement("ScreenGui", v24, v17)
    end)
}