local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").TimedProgressBar
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = u3.Component:extend("HiveTimerApp")
function v4.init(p5, _) --[[ Line: 8 ]]
    p5.alive = true
end
function v4.didMount(_) --[[ Line: 11 ]] end
function v4.willUnmount(p6) --[[ Line: 13 ]]
    p6.alive = false
end
function v4.render(p7) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    Color3.fromRGB(255, 255, 255)
    local v8 = u3.createFragment
    local v9 = {}
    local v10 = u3.createElement
    local v11 = {
        ["StudsOffsetWorldSpace"] = Vector3.new(0, 4.5, 1.5),
        ["ResetOnSpawn"] = false,
        ["MaxDistance"] = 150,
        ["Adornee"] = p7.props.block,
        ["Size"] = UDim2.fromScale(8, 2)
    }
    local v12 = {}
    local v13 = u3.createElement
    local v14 = u2
    local v15 = {
        ["Size"] = UDim2.fromScale(1, 0.05),
        ["EndTime"] = p7.props.expireTime,
        ["ProgressBarConfig"] = {
            ["GradientRotation"] = 0,
            ["BarGradient"] = ColorSequence.new(Color3.fromRGB(28, 112, 255), Color3.fromRGB(51, 148, 255))
        }
    }
    __set_list(v12, 1, {v13(v14, v15)})
    v9.ScarabTimer = v10("BillboardGui", v11, v12)
    return v8(v9)
end
return {
    ["HiveTimerApp"] = v4
}