local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u4 = v1.import(script, script.Parent, "ranked-progress-bar-core").RankedProgressBarCore
local v5 = u2.PureComponent:extend("RankedProgressBarAppBase")
function v5.init(_) --[[ Line: 9 ]] end
function v5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
    --]]
    local v7 = {}
    local v8 = #v7
    local v9 = {}
    local v10 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 101
    }
    for v11, v12 in p6.props do
        v9[v11] = v12
    end
    v7[v8 + 1] = u2.createElement(u4, v9)
    return u2.createElement("ScreenGui", v10, v7)
end
return {
    ["RankedProgressBarApp"] = v3.connect(function(p13, p14) --[[ Line: 26 ]]
        local v15 = {
            ["store"] = p13
        }
        for v16, v17 in p14 do
            v15[v16] = v17
        end
        return v15
    end)(v5)
}