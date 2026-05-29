local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["NyokaProgressApp"] = v5.new(u4)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u2
            [4] = u6
        --]]
        local v9 = p8.useState
        local v10 = p8.useEffect
        local v11 = u7.player:GetAttribute("MendingCanopyStaffMana")
        local v12, u13 = v9(v11 == nil and 0 or v11)
        v10(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u7
                [3] = u13
            --]]
            local u14 = u3.new()
            u14:GiveTask(u7.player:GetAttributeChangedSignal("MendingCanopyStaffMana"):Connect(function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u13
                --]]
                local v15 = u7.player:GetAttribute("MendingCanopyStaffMana")
                u13(v15 == nil and 100 or v15)
            end))
            return function() --[[ Line: 36 ]]
                --[[
                Upvalues:
                    [1] = u14
                --]]
                u14:DoCleaning()
            end
        end, {})
        local v16 = u4.createElement
        local v17 = u2
        local v18 = {
            ["AcceptZero"] = true,
            ["Size"] = u6.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3)
        }
        local v19 = v12 / u7.maxProgress
        v18.Progress = math.clamp(v19, 0, 1)
        v18.BarGradient = ColorSequence.new(Color3.fromRGB(213, 127, 18), Color3.fromRGB(255, 243, 1))
        return v16(v17, v18)
    end)
}