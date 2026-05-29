local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.ProgressBar
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LumenProgressBar"] = function(p7) --[[ Name: LumenProgressBar, Line 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u6
            [4] = u3
        --]]
        local v8 = p7.store.Kit.lumenProgress
        local v9 = v8 == nil and 0 or v8
        local v10 = math.max(0.01, v9)
        local v11 = math.min(1, v10)
        return u5.createElement(u4, {
            ["Size"] = u6.actionBarProgressBarSize,
            ["Progress"] = v11,
            ["BarGradient"] = ColorSequence.new(u3.hexColor(14363435), u3.hexColor(14573407))
        })
    end
}