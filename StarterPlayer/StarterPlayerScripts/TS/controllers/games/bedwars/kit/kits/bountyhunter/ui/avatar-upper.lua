local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent, "kit-upper-viewport").KitUpperViewport
local v5 = u3.Component:extend("AvatarUpper")
function v5.init(_) --[[ Line: 9 ]] end
function v5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u4
    --]]
    local v7 = u2.copy(p6.props)
    v7.store = nil
    v7.player = nil
    v7[u3.Children] = nil
    if p6.props.store.Bedwars.othersUsingKitSkin[p6.props.player.UserId] then
        local v8 = {
            ["kit"] = p6.props.store.Bedwars.kits[p6.props.player.UserId]
        }
        for v9, v10 in v7 do
            v8[v9] = v10
        end
        local v11 = {}
        local v12 = #v11
        local v13 = p6.props[u3.Children]
        if v13 then
            for v14, v15 in v13 do
                if type(v14) == "number" then
                    v11[v12 + v14] = v15
                else
                    v11[v14] = v15
                end
            end
        end
        return u3.createElement(u4, v8, v11)
    end
    local v16 = p6.props.player.UserId
    local v17 = {
        ["ScaleType"] = "Crop",
        ["Image"] = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(v16) .. "&w=352&h=352"
    }
    for v18, v19 in v7 do
        v17[v18] = v19
    end
    local v20 = {}
    local v21 = #v20
    local v22 = p6.props[u3.Children]
    if v22 then
        for v23, v24 in v22 do
            if type(v23) == "number" then
                v20[v21 + v23] = v24
            else
                v20[v23] = v24
            end
        end
    end
    return u3.createElement("ImageLabel", v17, v20)
end
return {
    ["AvatarUpper"] = v5
}