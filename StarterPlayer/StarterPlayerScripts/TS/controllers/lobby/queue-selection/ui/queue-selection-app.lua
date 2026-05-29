local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DarkBackground
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent, "queue-selection-app-core").QueueSelectionAppCore
local v6 = u3.PureComponent:extend("QueueSelectionAppBase")
function v6.init(_) --[[ Line: 10 ]] end
function v6.render(p7) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u5
    --]]
    local v8 = { u3.createElement(u2, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = p7.props.AppId
        }) }
    local v9 = #v8
    local v10 = {}
    local v11 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false
    }
    for v12, v13 in p7.props do
        v10[v12] = v13
    end
    v8[v9 + 1] = u3.createElement(u5, v10)
    return u3.createElement("ScreenGui", v11, v8)
end
return {
    ["QueueSelectionApp"] = v4.connect(function(p14, p15) --[[ Line: 32 ]]
        local v16 = {
            ["store"] = p14
        }
        for v17, v18 in p15 do
            v16[v17] = v18
        end
        return v16
    end)(v6)
}