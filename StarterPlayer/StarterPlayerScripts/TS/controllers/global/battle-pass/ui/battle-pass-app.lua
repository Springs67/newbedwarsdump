local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DarkBackground
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u6 = v1.import(script, script.Parent, "battle-pass-core").BattlePassCore
local v7 = u3.PureComponent:extend("BattlePassAppBase")
function v7.init(_) --[[ Line: 11 ]] end
function v7.render(p8) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u6
        [4] = u5
    --]]
    return u3.createElement("ScreenGui", {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }, { u3.createElement(u2, {
            ["AppId"] = p8.props.AppId
        }), u3.createElement(u6, {
            ["store"] = p8.props.store,
            ["battlepass"] = p8.props.battlepass or u5.BATTLE_PASS_SEASON,
            ["AppId"] = p8.props.AppId
        }) })
end
return {
    ["BattlePassApp"] = v4.connect(function(p9, p10) --[[ Line: 30 ]]
        local v11 = {
            ["store"] = p9
        }
        for v12, v13 in p10 do
            v11[v12] = v13
        end
        return v11
    end)(v7)
}