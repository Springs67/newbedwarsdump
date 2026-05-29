local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v5 = u3.Component:extend("IceQueenProgressBar")
function v5.init(_) --[[ Line: 9 ]] end
function v5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u3
        [3] = u2
    --]]
    local v7 = {
        ["Size"] = u4.actionBarProgressBarSize
    }
    local v8 = p6.props.store.Kit.iceQueenProgress
    v7.Progress = v8 == nil and 0.01 or v8
    v7.BarGradient = ColorSequence.new(Color3.fromRGB(140, 212, 255), Color3.fromRGB(15, 79, 255))
    v7.AcceptZero = true
    return u3.createElement(u2, v7)
end
function v5.shouldUpdate(p9, p10) --[[ Line: 24 ]]
    return p10.store.Kit.iceQueenProgress ~= p9.props.store.Kit.iceQueenProgress
end
return {
    ["IceQueenProgressBar"] = v5
}