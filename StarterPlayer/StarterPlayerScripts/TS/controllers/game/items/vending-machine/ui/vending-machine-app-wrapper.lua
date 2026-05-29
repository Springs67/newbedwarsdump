local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, script.Parent, "vending-machine-app").VendingMachineApp
return {
    ["VendingMachineAppWrapper"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
            [3] = u5
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10, u11 = v8(u6.vendingMachine:GetAttribute("VendingMachineState"))
        local v12, u13 = v8(u6.vendingMachine:GetAttribute("ChoosenReward"))
        local v14, u15 = v8(u6.vendingMachine:GetAttribute("VendingMachineDispenseTime"))
        v9(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u6
                [3] = u11
                [4] = u13
                [5] = u15
            --]]
            local u16 = u2.new()
            u16:GiveTask(u6.vendingMachine:GetAttributeChangedSignal("VendingMachineState"):Connect(function() --[[ Line: 15 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u6
                --]]
                u11(u6.vendingMachine:GetAttribute("VendingMachineState"))
            end))
            u16:GiveTask(u6.vendingMachine:GetAttributeChangedSignal("ChoosenReward"):Connect(function() --[[ Line: 18 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u6
                --]]
                u13(u6.vendingMachine:GetAttribute("ChoosenReward"))
            end))
            u16:GiveTask(u6.vendingMachine:GetAttributeChangedSignal("VendingMachineDispenseTime"):Connect(function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u6
                --]]
                u15(u6.vendingMachine:GetAttribute("VendingMachineDispenseTime"))
            end))
            return function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end
        end, {})
        return u3.createElement(u5, {
            ["vendingMachineState"] = v10,
            ["choosenReward"] = v12,
            ["soundPosition"] = u6.vendingMachine.Position,
            ["dispenseTime"] = v14
        })
    end)
}