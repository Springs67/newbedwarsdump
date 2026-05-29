local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent, "script-leaderboard-row").ScriptLeaderboardRow
local v4 = u2.Component:extend("ScriptLeaderboardContainer")
function v4.init(_) --[[ Line: 8 ]] end
function v4.render(p5) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v6 = #p5.props.leaderboard ~= 0
    if v6 then
        local v7 = p5.props.leaderboard
        local v8 = table.create(#v7)
        for v9, v10 in v7 do
            local _ = v9 - 1
            v8[v9] = u2.createElement(u3, {
                ["data"] = v10
            })
        end
        local v11 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Position"] = UDim2.fromScale(0.84, 0.012),
            ["Size"] = UDim2.fromScale(0.15, 0.3)
        }
        local v12 = {}
        local v13 = #v12
        for v14, v15 in v8 do
            v12[v13 + v14] = v15
        end
        v6 = u2.createFragment({
            ["ScriptLeaderboardContainer"] = u2.createElement("Frame", v11, v12)
        })
    end
    local v16 = {
        ["ResetOnSpawn"] = false
    }
    local v17 = {}
    local v18 = #v17
    if v6 then
        v17[v18 + 1] = v6
    end
    return u2.createFragment({
        ["ScriptLeaderboardGUI"] = u2.createElement("ScreenGui", v16, v17)
    })
end
function v4.didMount(_) --[[ Line: 52 ]] end
return {
    ["ScriptLeaderboardContainer"] = v4
}