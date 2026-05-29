local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["ResourcesAccumulatedBillboard"] = v4.new(u3)(function(u7, p8) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u3
            [4] = u5
        --]]
        local v9 = p8.useEffect
        local v10 = p8.useState
        local _ = p8.useMemo
        local v11, u12 = v10(0)
        local v13, u14 = v10(0)
        local v15, u16 = v10(false)
        v9(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
                [3] = u6
                [4] = u12
                [5] = u14
                [6] = u16
            --]]
            local u17 = u2.new()
            u17:GiveTask(u7.updateResourceCountsSignal:Connect(function(p18) --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u12
                    [3] = u14
                --]]
                local v19 = p18[u6.IRON]
                u12(v19 == nil and 0 or v19)
                local v20 = p18[u6.EMERALD]
                u14(v20 == nil and 0 or v20)
            end))
            u17:GiveTask(u7.enableBillboardSignal:Connect(function(p21) --[[ Line: 38 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16(p21)
            end))
            return function() --[[ Line: 41 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:DoCleaning()
            end
        end, {})
        local v22 = u3.createFragment
        local v23 = {}
        local v24 = u3.createElement
        local v25 = {
            ["ExtentsOffset"] = Vector3.new(0, 3, 0),
            ["AlwaysOnTop"] = true,
            ["Adornee"] = u7.chest,
            ["Size"] = UDim2.fromScale(5, 6),
            ["MaxDistance"] = u5.SPLIT_RANGE,
            ["Enabled"] = v15
        }
        local v26 = {}
        local v27 = u3.createElement
        local v28 = {
            ["Image"] = "rbxassetid://10667281451",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageColor3"] = Color3.fromRGB(0, 255, 204)
        }
        local v29 = {}
        local v30 = u3.createElement
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.7)
        }
        local v32 = {
            ["AccumulatedHeader"] = u3.createElement("TextLabel", {
                ["Text"] = "RESOURCES ACCUMULATED",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(1, 0.225),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        local v33 = u3.createElement
        local v34 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.725),
            ["Position"] = UDim2.fromScale(0, 0.3725)
        }
        local v35 = { (u3.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.15, 0)
            })) }
        local v36 = u3.createElement
        local v37 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.35)
        }
        local v38 = {
            ["IronIcon"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://6850537969",
                ["BackgroundTransparency"] = 0.75,
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u3.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Transparency"] = 0.75
                }), u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }),
            ["IronCounter"] = u3.createElement("TextLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "x<b>" .. tostring(v11) .. "</b>",
                ["Position"] = UDim2.fromScale(0.4, 0.15),
                ["Size"] = UDim2.fromScale(0.6, 0.8),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            })
        }
        v35.IronAccumulated = v36("Frame", v37, v38)
        local v39 = u3.createElement
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["Position"] = UDim2.fromScale(0, 0.4)
        }
        local v41 = {
            ["EmeraldIcon"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://6850538075",
                ["BackgroundTransparency"] = 0.75,
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u3.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Transparency"] = 0.75
                }), u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }),
            ["EmeraldCounter"] = u3.createElement("TextLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "x<b>" .. tostring(v13) .. "</b>",
                ["Position"] = UDim2.fromScale(0.4, 0.15),
                ["Size"] = UDim2.fromScale(0.6, 0.8),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            })
        }
        v35.EmeraldsAccumulated = v39("Frame", v40, v41)
        v32.Container = v33("Frame", v34, v35)
        v29.UsableArea = v30("Frame", v31, v32)
        v26.BillboardFrame = v27("ImageLabel", v28, v29)
        v23.ChestBillboard = v24("BillboardGui", v25, v26)
        return v22(v23)
    end)
}