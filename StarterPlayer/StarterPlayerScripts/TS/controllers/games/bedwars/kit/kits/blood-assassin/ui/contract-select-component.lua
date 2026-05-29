local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "blood-assassin-contracts").BloodAssassinContracts
local u6 = v1.import(script, script.Parent, "blood-assassin-frame").BloodAssassinFrame
local u7 = v1.import(script, script.Parent, "blood-assassin-learning-list").BloodAssassinLearningList
return {
    ["ContractSelectComponent"] = v4.new(u3)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u6
            [4] = u7
            [5] = u5
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local u12 = u3.createRef()
        local v13, u14 = v10(20)
        v11(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u12
                [3] = u14
            --]]
            local u15 = u2.new()
            local u16 = u12:getValue()
            if u16 then
                u14(u16.AbsoluteSize.Y * 0.09101941747572816)
                u15:GiveTask((u16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 19 ]]
                    --[[
                    Upvalues:
                        [1] = u14
                        [2] = u16
                    --]]
                    u14(u16.AbsoluteSize.Y * 0.09101941747572816)
                end)))
            end
            return function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u15
                --]]
                u15:DoCleaning()
            end
        end, {})
        return u3.createFragment({ u3.createElement("Frame", {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["BackgroundTransparency"] = 1,
                [u3.Ref] = u12
            }, { u3.createElement(u6, {
                    ["Title"] = "DARK LEARNINGS",
                    ["Size"] = UDim2.fromScale(0.34798534798534797, 0.6553398058252428),
                    ["HeaderSizePixels"] = v13
                }, { u3.createElement(u7, {
                        ["bloodUpgrades"] = p8.bloodUpgrades
                    }) }), u3.createElement(u6, {
                    ["Title"] = "CONTRACTS",
                    ["Size"] = UDim2.fromScale(0.6111111111111112, 0.9902912621359223),
                    ["HeaderSizePixels"] = v13,
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(1, 0)
                }, { u3.createElement(u5, {
                        ["activeContract"] = p8.activeContract,
                        ["availableContracts"] = p8.availableContracts
                    }) }) }) })
    end)
}