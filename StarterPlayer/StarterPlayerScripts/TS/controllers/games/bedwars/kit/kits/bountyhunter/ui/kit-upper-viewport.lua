local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "global", "kit-shop", "ui", "misc", "kit-viewport").KitViewport
local v5 = u3.Component:extend("KitUpperViewport")
function v5.init(_, _) --[[ Line: 9 ]] end
function v5.render(p6) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
        [3] = u4
    --]]
    local v7 = u2.copy(p6.props)
    v7.kit = nil
    v7[u3.Children] = nil
    local v8 = {
        ["Kit"] = p6.props.kit
    }
    local v9 = {}
    local v10 = #v9
    local v11 = p6.props[u3.Children]
    if v11 then
        for v12, v13 in v11 do
            if type(v12) == "number" then
                v9[v10 + v12] = v13
            else
                v9[v12] = v13
            end
        end
    end
    return u3.createElement(u4, v8, v9)
end
return {
    ["KitUpperViewport"] = v5
}