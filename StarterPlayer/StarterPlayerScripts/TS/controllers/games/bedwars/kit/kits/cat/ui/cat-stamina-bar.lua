local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "attributes").CatStaminaAttr
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cat-balance").CatBalance
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").GetAttribute
return {
    ["CatStaminaBar"] = v5.new(u4)(function(_, p10) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u6
            [4] = u7
            [5] = u9
            [6] = u8
            [7] = u2
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local u13, u14 = v11(0)
        local v15, u16 = v11(0.01)
        local v17 = u4.createRef()
        v12(function() --[[ Line: 17 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u6
                [3] = u7
                [4] = u9
                [5] = u14
            --]]
            local u18 = u3.new()
            u18:GiveTask(u6.LocalPlayer:GetAttributeChangedSignal(u7.Name):Connect(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u6
                    [3] = u7
                    [4] = u14
                --]]
                local v19 = u9(u6.LocalPlayer, u7)
                u14(v19 == nil and 0 or v19)
            end))
            return function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                return u18:DoCleaning()
            end
        end, {})
        v12(function() --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u16
                [2] = u13
                [3] = u8
            --]]
            u16(u13 / u8.STAMINA_MAX)
        end, { u13 })
        local v20 = u4.createElement
        local v21 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.55, 0.15)
        }
        local v22 = {}
        local v23 = u4.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 12.441176470588236
        })
        local v24 = u4.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })
        local v25 = u4.createElement
        local v26 = u2
        local v27 = {
            ["LayoutOrder"] = 1,
            ["AcceptZero"] = true,
            ["Progress"] = v15,
            ["BarRef"] = v17,
            ["BarColor"] = Color3.fromHex("f3af19"),
            ["Title"] = {
                ["text"] = "STAMINA",
                ["color"] = Color3.fromRGB(235, 235, 235)
            },
            ["Size"] = UDim2.fromScale(1, 1)
        }
        __set_list(v22, 1, {v23, v24, v25(v26, v27)})
        return v20("Frame", v21, v22)
    end)
}