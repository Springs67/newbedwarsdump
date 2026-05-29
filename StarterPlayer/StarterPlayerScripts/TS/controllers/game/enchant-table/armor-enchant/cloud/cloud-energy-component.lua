local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CloudEnergyComponent"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u4
            [4] = u9
            [5] = u8
            [6] = u3
        --]]
        local v12 = p11.useState
        local v13 = p11.useEffect
        local v14, u15 = v12(0)
        v13(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u10
                [3] = u15
            --]]
            local u16 = u5.new()
            u16:GiveTask(u10.character:GetAttributeChangedSignal("CloudEnergy"):Connect(function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u15
                --]]
                local v17 = u10.character:GetAttribute("CloudEnergy")
                u15(v17 == nil and 0 or v17)
            end))
            return function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end
        end, {})
        return u6.createElement(u4, {
            ["AcceptZero"] = true,
            ["Size"] = u9.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v14 / u8.CLOUD_MAX_ENERGY,
            ["BarGradient"] = ColorSequence.new(u3.hexColor(16773050), u3.hexColor(16777215))
        })
    end)
}