local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["CustomKitCreation_PropertyLabel"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u4)(function(p5, p6) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
        --]]
        local _ = p6.useState
        local v7 = p6.useEffect
        local u8 = u3.new()
        v7(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            return function() --[[ Line: 12 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                u8:DoCleaning()
            end
        end, {})
        local v9 = u4.createFragment
        local v10 = {
            ["CustomKitCreation_AbilityCustomization_Label"] = u4.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextTransparency"] = 0,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, u2.isSmallScreen() and 30 or 45),
                ["Text"] = p5.Text,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextSize"] = u2.isSmallScreen() and 18 or 24,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["LayoutOrder"] = p5.LayoutOrder
            })
        }
        return v9(v10)
    end)
}