local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.SlideIn
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, script.Parent, "confirmation-modal").ConfirmationModal
local v8 = u5.PureComponent:extend("ConfirmationModalBase")
function v8.init(_) --[[ Line: 12 ]] end
function v8.render(p9) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u3
        [3] = u7
        [4] = u4
    --]]
    local v10 = { u5.createElement(u3, {
            ["BackgroundTransparency"] = 0.2,
            ["AppId"] = p9.props.AppId
        }) }
    local v11 = #v10
    local v12 = {}
    local v13 = #v12
    local v14 = {}
    local v15 = {
        ["DisplayOrder"] = 1600,
        ["ResetOnSpawn"] = false
    }
    for v16, v17 in p9.props do
        v14[v16] = v17
    end
    v12[v13 + 1] = u5.createElement(u7, v14)
    v10[v11 + 1] = u5.createElement(u4, {}, v12)
    return u5.createElement("ScreenGui", v15, v10)
end
return {
    ["ConfirmationModalApp"] = v6.connect(function(p18, p19) --[[ Line: 37 ]]
        local v20 = {
            ["store"] = p18
        }
        for v21, v22 in p19 do
            v20[v21] = v22
        end
        return v20
    end)(v8)
}