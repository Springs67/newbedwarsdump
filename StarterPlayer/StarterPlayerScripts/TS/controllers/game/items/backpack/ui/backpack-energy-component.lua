local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BackpackEnergyComponent"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u4
            [4] = u8
            [5] = u3
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local _, u13 = v11(0)
        local v14 = u9.backpack:GetAttribute("Energy")
        local v15 = v14 == nil and 100 or v14
        v12(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u13
            --]]
            local u16 = u5.new()
            u16:GiveTask(u9.backpack:GetAttributeChangedSignal("Energy"):Connect(function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u9
                --]]
                local v17 = u13
                local v18 = u9.backpack:GetAttribute("Energy")
                v17(v18 == nil and 0 or v18)
            end))
            return function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end
        end, {})
        return u6.createElement(u4, {
            ["AcceptZero"] = true,
            ["Size"] = u8.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v15 / 100,
            ["BarGradient"] = ColorSequence.new(u3.hexColor(12255224), u3.hexColor(16777215))
        })
    end)
}