local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "warrior", "warrior-kit-util").WarriorUtil
return {
    ["WarriorGritBar"] = v5.new(u4)(function(_, p8) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u6
            [4] = u7
            [5] = u2
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local u11, u12 = v9(0)
        local v13, u14 = v9(0.01)
        local v15 = u4.createRef()
        v10(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u6
                [3] = u7
                [4] = u12
            --]]
            local u16 = u3.new()
            u16:GiveTask(u6.LocalPlayer:GetAttributeChangedSignal(u7.GRIT_ATTRIBUTE):Connect(function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u7
                    [3] = u12
                --]]
                local v17 = u6.LocalPlayer:GetAttribute(u7.GRIT_ATTRIBUTE)
                u12(v17 == nil and 0 or v17)
            end))
            return function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                return u16:DoCleaning()
            end
        end, {})
        v10(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u11
            --]]
            u14(u11 / 100)
        end, { u11 })
        local v18 = u4.createElement
        local v19 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.55, 0.15)
        }
        local v20 = {}
        local v21 = u4.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 12.441176470588236
        })
        local v22 = u4.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 10,
            ["AnchorPoint"] = Vector2.new(0.5, 0.1),
            ["Position"] = UDim2.new(0.5, 0, 0, 0),
            ["Size"] = UDim2.new(0, 3, 0.9, 0),
            ["BackgroundColor3"] = Color3.fromRGB(84, 84, 84)
        })
        local v23 = u4.createElement
        local v24 = u2
        local v25 = {
            ["LayoutOrder"] = 1,
            ["AcceptZero"] = true,
            ["Progress"] = v13,
            ["BarRef"] = v15,
            ["BarColor"] = Color3.fromRGB(250, 255, 0),
            ["Size"] = UDim2.fromScale(1, 1),
            ["ChangingBarColor"] = {
                ["MinBarColor"] = Color3.fromRGB(250, 255, 0),
                ["MaxBarColor"] = Color3.fromRGB(255, 61, 61)
            }
        }
        __set_list(v20, 1, {v21, v22, v23(v24, v25)})
        return v18("Frame", v19, v20)
    end)
}