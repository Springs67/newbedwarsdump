local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-profile-utils").AfkProfileUtil
local u6 = v1.import(script, script.Parent, "afk-shop-app").AfkShopApp
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u6
        [3] = u4
        [4] = u5
        [5] = u2
    --]]
    local u8 = u3("AfkShopApp", u6, {}, {}, {
        ["Parent"] = p7
    })
    local v9 = u4
    local v10 = {}
    local v11 = {
        ["type"] = "SetAfkDataAll"
    }
    for v12, v13 in u5.makeStarterAfkData() do
        v10[v12] = v13
    end
    v11.afkData = v10
    v9:dispatch(v11)
    return function() --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end