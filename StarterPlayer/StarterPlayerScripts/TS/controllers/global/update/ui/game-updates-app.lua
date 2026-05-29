local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.SlideIn
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, script.Parent, "game-updates-core").GameUpdatesCore
local v8 = u5.PureComponent:extend("GameUpdatesAppBase")
function v8.init(_) --[[ Line: 12 ]] end
function v8.render(p9) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u7
    --]]
    return u5.createElement("ScreenGui", {
        ["DisplayOrder"] = 20
    }, { u5.createElement(u4, {}, { u5.createElement(u3, {
                ["AppId"] = p9.props.AppId
            }), u5.createElement(u7, {
                ["store"] = p9.props.store,
                ["AppId"] = p9.props.AppId
            }) }) })
end
return {
    ["GameUpdatesApp"] = v6.connect(function(p10, p11) --[[ Line: 30 ]]
        local v12 = {
            ["store"] = p10
        }
        for v13, v14 in p11 do
            v12[v13] = v14
        end
        return v12
    end)(v8)
}