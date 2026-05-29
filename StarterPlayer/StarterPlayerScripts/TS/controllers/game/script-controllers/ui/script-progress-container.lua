local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "script-progress-bar").ScriptProgressBar
local v4 = u2.Component:extend("ScriptProgressContainer")
function v4.init(_) --[[ Line: 8 ]] end
function v4.render(p5) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v6 = {}
    local _ = #v6
    local v7 = p5.props.progressBars
    local v8 = table.create(#v7)
    local v9 = {
        ["ResetOnSpawn"] = false
    }
    for v10, v11 in v7 do
        local v12 = v10 - 1
        local v13 = u2.createElement
        local v14 = u3
        local v15 = {
            ["data"] = v11,
            ["alignment"] = (v12 + 1) % 2 == 0 and "R" or "L"
        }
        local v16 = (v12 + 1) / 2
        v15.row = math.ceil(v16)
        v8[v10] = v13(v14, v15)
    end
    local v17 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.5, 0.1),
        ["Position"] = UDim2.fromScale(0.25, 0.009)
    }
    local v18 = {}
    local v19 = #v18
    for v20, v21 in v8 do
        v18[v19 + v20] = v21
    end
    v6.ScriptProgressBarContainer = u2.createElement("Frame", v17, v18)
    return u2.createFragment({
        ["ScriptProgressBarGUI"] = u2.createElement("ScreenGui", v9, v6)
    })
end
function v4.didMount(_) --[[ Line: 46 ]] end
return {
    ["ScriptProgressContainer"] = v4
}