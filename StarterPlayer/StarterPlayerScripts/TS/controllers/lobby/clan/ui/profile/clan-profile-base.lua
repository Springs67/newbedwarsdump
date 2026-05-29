local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ConfettiGroup
local u4 = v2.DarkBackground
local u5 = v2.DeviceUtil
local u6 = v2.SlideIn
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, script.Parent, "clan-profile-core").ClanProfileCore
local v10 = u7.PureComponent:extend("ClanProfileBase")
function v10.init(_) --[[ Line: 14 ]] end
function v10.render(p11) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u7
        [3] = u4
        [4] = u3
        [5] = u9
        [6] = u6
    --]]
    local v12 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }
    local v13 = { u7.createElement(u4, {
            ["AppId"] = p11.props.AppId
        }) }
    local v14 = #v13
    local v15 = {}
    local v16 = #v15
    local v17 = p11.props.newClan
    if v17 then
        v17 = u7.createElement(u3, {
            ["Lifetime"] = 10
        })
    end
    if v17 then
        v15[v16 + 1] = v17
    end
    local v18 = #v15
    local v19 = {}
    for v20, v21 in p11.props do
        v19[v20] = v21
    end
    v15[v18 + 1] = u7.createElement(u9, v19)
    v13[v14 + 1] = u7.createElement(u6, {}, v15)
    return u7.createElement("ScreenGui", v12, v13)
end
return {
    ["ClanProfileApp"] = v8.connect(function(p22, p23) --[[ Line: 46 ]]
        local v24 = {
            ["store"] = p22
        }
        for v25, v26 in p23 do
            v24[v25] = v26
        end
        return v24
    end)(v10)
}