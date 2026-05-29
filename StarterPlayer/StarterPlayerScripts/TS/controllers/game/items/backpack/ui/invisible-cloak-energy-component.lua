local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["InvisibleCloakEnergyComponent"] = v7.new(u6)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u6
            [4] = u4
            [5] = u8
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local _, u13 = v11(0)
        local v14 = u9.backpack:GetAttribute("Energy")
        local v15 = v14 == nil and 100 or v14
        local v16 = ColorSequence.new(u3.hexColor(12255224), u3.hexColor(16777215))
        if v15 < 20 then
            v16 = ColorSequence.new(u3.hexColor(12257822), u3.hexColor(12257822))
        end
        v12(function() --[[ Line: 23 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u9
                [3] = u13
            --]]
            local u17 = u5.new()
            u17:GiveTask(u9.backpack:GetAttributeChangedSignal("Energy"):Connect(function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u9
                --]]
                local v18 = u13
                local v19 = u9.backpack:GetAttribute("Energy")
                v18(v19 == nil and 0 or v19)
            end))
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u17
                --]]
                u17:DoCleaning()
            end
        end, {})
        return u6.createElement(u4, {
            ["AcceptZero"] = true,
            ["Size"] = u8.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v15 / 100,
            ["BarGradient"] = v16
        })
    end)
}