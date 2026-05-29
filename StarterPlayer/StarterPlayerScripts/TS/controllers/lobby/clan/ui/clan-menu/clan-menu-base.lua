local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.DeviceUtil
local u5 = v2.SlideIn
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, script.Parent, "clan-menu-core").ClanMenu
local v9 = u6.PureComponent:extend("ClanMenuBase")
function v9.init(_) --[[ Line: 13 ]] end
function v9.render(p10) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u4
        [3] = u3
        [4] = u5
        [5] = u8
    --]]
    return u6.createElement("ScreenGui", {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = not u4.isSmallScreen()
    }, { u6.createElement(u3, {
            ["AppId"] = p10.props.AppId
        }), u6.createElement(u5, {}, { u6.createElement(u8, {
                ["AppId"] = p10.props.AppId,
                ["store"] = p10.props.store,
                ["StartingTab"] = p10.props.tab
            }) }) })
end
return {
    ["ClanMenuApp"] = v7.connect(function(p11, p12) --[[ Line: 34 ]]
        local v13 = {
            ["store"] = p11
        }
        for v14, v15 in p12 do
            v13[v14] = v15
        end
        return v13
    end)(v9)
}