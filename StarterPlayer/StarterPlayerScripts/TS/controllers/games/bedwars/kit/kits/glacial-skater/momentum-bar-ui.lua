local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "glacial-skater", "glacial-skater-balance").GlacialSkaterBalance
local u8 = v6.new()
return {
    ["momentumChanged"] = u8,
    ["MomentumBarUi"] = v5.new(u4)(function(_, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u3
            [3] = u8
            [4] = u7
            [5] = u2
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, u13 = v10(0)
        local v14 = u4.createRef()
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
                [3] = u13
                [4] = u7
            --]]
            local u15 = u3.new()
            u15:GiveTask(u8:Connect(function(p16) --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u7
                --]]
                u13(p16 / u7.MAX_MOMENTUM)
            end))
            return function() --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                return u15:DoCleaning()
            end
        end, {})
        return u4.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.55, 0.15)
        }, { u4.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 12.441176470588236
            }), u4.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), u4.createElement(u2, {
                ["LayoutOrder"] = 1,
                ["AcceptZero"] = true,
                ["Pills"] = 4,
                ["Progress"] = v12,
                ["BarRef"] = v14,
                ["BarColor"] = Color3.fromRGB(152, 193, 217)
            }) })
    end)
}