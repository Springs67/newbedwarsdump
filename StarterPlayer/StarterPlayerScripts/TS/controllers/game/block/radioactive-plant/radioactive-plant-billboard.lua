local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u6 = v4(v5.IRON).image
local u7 = v4(v5.DIAMOND).image
return {
    ["RadioactivePlantBillboard"] = v3.new(u2)(function(u8, p9) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
            [3] = u7
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, u13 = v10(0)
        local v14, u15 = v10(0)
        v11(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
                [3] = u15
            --]]
            u8.radioactivePlantInstance:GetAttributeChangedSignal("IronDeposits"):Connect(function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u13
                --]]
                u13((u8.radioactivePlantInstance:GetAttribute("IronDeposits")))
            end)
            u8.radioactivePlantInstance:GetAttributeChangedSignal("DiamondDeposits"):Connect(function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u15
                --]]
                u15((u8.radioactivePlantInstance:GetAttribute("DiamondDeposits")))
            end)
        end, {})
        local v16 = u2.createFragment
        local v17 = {}
        local v18 = u2.createElement
        local v19 = {
            ["ExtentsOffset"] = Vector3.new(0, 3.5, 0),
            ["MaxDistance"] = 30,
            ["Adornee"] = u8.radioactivePlantInstance,
            ["Size"] = UDim2.fromScale(5, 6)
        }
        local v20 = {}
        local v21 = u2.createElement
        local v22 = {
            ["Image"] = "rbxassetid://10667281451",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["ImageColor3"] = Color3.fromRGB(0, 255, 204)
        }
        local v23 = {}
        local v24 = u2.createElement
        local v25 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.6),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.8, 0.7)
        }
        local v26 = {
            ["DepositedHeader"] = u2.createElement("TextLabel", {
                ["Text"] = "<b>DEPOSITED</b>",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["Font"] = Enum.Font.RobotoMono,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            })
        }
        local v27 = u2.createElement
        local v28 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.75),
            ["Position"] = UDim2.fromScale(0, 0.35)
        }
        local v29 = { (u2.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.15, 0)
            })) }
        local v30 = u2.createElement
        local v31 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.35)
        }
        local v32 = {
            ["IronIcon"] = u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 0.75,
                ["BorderSizePixel"] = 0,
                ["Image"] = u6,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u2.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Transparency"] = 0.75
                }), u2.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }),
            ["IronCounter"] = u2.createElement("TextLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "x<b>" .. tostring(v12) .. "</b>",
                ["Position"] = UDim2.fromScale(0.4, 0.15),
                ["Size"] = UDim2.fromScale(0.6, 0.8),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.RobotoMono
            })
        }
        v29.IronDeposited = v30("Frame", v31, v32)
        local v33 = u2.createElement
        local v34 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.35),
            ["Position"] = UDim2.fromScale(0, 0.4)
        }
        local v35 = {
            ["DiamondIcon"] = u2.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 0.75,
                ["BorderSizePixel"] = 0,
                ["Image"] = u7,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.4, 1),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                ["ScaleType"] = Enum.ScaleType.Fit
            }, { u2.createElement("UIStroke", {
                    ["Thickness"] = 1,
                    ["Transparency"] = 0.75
                }), u2.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }) }),
            ["DiamondsCounter"] = u2.createElement("TextLabel", {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Text"] = "x<b>" .. tostring(v14) .. "</b>",
                ["Position"] = UDim2.fromScale(0.4, 0.15),
                ["Size"] = UDim2.fromScale(0.6, 0.8),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Font"] = Enum.Font.RobotoMono
            })
        }
        v29.DiamondsDeposited = v33("Frame", v34, v35)
        v26.DepositedContainer = v27("Frame", v28, v29)
        v23.UsableArea = v24("Frame", v25, v26)
        v20.BillboardFrame = v21("ImageLabel", v22, v23)
        v17.RadioactivePlantBillboard = v18("BillboardGui", v19, v20)
        return v16(v17)
    end)
}