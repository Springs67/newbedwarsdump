local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "condiment-gun", "condiment-gun-config").CondimentGunConfigs
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["CondimentAmmoComponent"] = v5.new(u4)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u4
            [4] = u2
            [5] = u7
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, u13 = v10(u8.item:GetAttribute("Ammo"))
        local v14, u15 = v10(u6.condiments[u8.item:GetAttribute("Mode")].color)
        v11(function() --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u8
                [3] = u13
                [4] = u6
                [5] = u15
            --]]
            local u16 = u3.new()
            u16:GiveTask(u8.item:GetAttributeChangedSignal("Ammo"):Connect(function() --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u8
                --]]
                u13(u8.item:GetAttribute("Ammo"))
            end))
            u16:GiveTask(u8.item:GetAttributeChangedSignal("Mode"):Connect(function() --[[ Line: 19 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u8
                    [3] = u15
                --]]
                u15(u6.condiments[u8.item:GetAttribute("Mode")].color)
            end))
            return function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u16
                --]]
                u16:DoCleaning()
            end
        end)
        return u4.createElement(u2, {
            ["AcceptZero"] = true,
            ["Size"] = u7.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v12 / u6.ammo.max,
            ["BarGradient"] = ColorSequence.new(v14.dark, v14.light)
        })
    end)
}