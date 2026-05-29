local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GenCaptureComponent"] = v7.new(u6)(function(_, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u4
            [4] = u8
            [5] = u3
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, _ = v10(0)
        v11(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            local u13 = u5.new()
            return function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u13
                --]]
                u13:DoCleaning()
            end
        end, {})
        return u6.createElement(u4, {
            ["AcceptZero"] = true,
            ["Size"] = u8.actionBarProgressBarSize:Lerp(UDim2.fromScale(0, 0), 0.3),
            ["Progress"] = v12 / 100,
            ["BarGradient"] = ColorSequence.new(u3.hexColor(12255224), u3.hexColor(16777215))
        })
    end)
}