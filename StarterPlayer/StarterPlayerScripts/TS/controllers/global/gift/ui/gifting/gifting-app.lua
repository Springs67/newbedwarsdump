local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent, "gifting-core").GiftingCore
local v6 = u3.PureComponent:extend("GiftingAppBase")
function v6.init(_) --[[ Line: 10 ]] end
function v6.render(p7) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u5
    --]]
    local v8 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u2.isSmallScreen()
    }
    local v9 = {}
    local v10 = #v9
    local v11 = {}
    for v12, v13 in p7.props do
        v11[v12] = v13
    end
    v9[v10 + 1] = u3.createElement(u5, v11)
    return u3.createElement("ScreenGui", v8, v9)
end
return {
    ["GiftingApp"] = v4.connect(function(_, p14) --[[ Line: 27 ]]
        return p14
    end)(v6)
}