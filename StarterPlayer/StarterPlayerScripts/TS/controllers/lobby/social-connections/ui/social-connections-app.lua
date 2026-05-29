local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent, "social-connections-core").SocialConnectionsCore
local v6 = u3.PureComponent:extend("SocialConnectionsAppBase")
function v6.init(_) --[[ Line: 10 ]] end
function v6.render(p7) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u5
    --]]
    return u3.createElement("ScreenGui", {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u2.isSmallScreen()
    }, { u3.createElement(u5, {
            ["store"] = p7.props.store,
            ["AppId"] = p7.props.AppId
        }) })
end
return {
    ["SocialConnectionsApp"] = v4.connect(function(p8, p9) --[[ Line: 24 ]]
        local v10 = {
            ["store"] = p8
        }
        for v11, v12 in p9 do
            v10[v11] = v12
        end
        return v10
    end)(v6)
}