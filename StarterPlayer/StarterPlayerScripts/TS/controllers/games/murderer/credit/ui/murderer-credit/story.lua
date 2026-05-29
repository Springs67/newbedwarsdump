local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent, "murderer-credit-app").MurdererCreditApp
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u3
        [4] = u5
    --]]
    local v7 = {
        ["store"] = u4.Store.new(u4.combineReducers({}), {})
    }
    local u8 = u2.mount(u2.createElement(u3, v7, { u2.createElement(u5, {
            ["AppId"] = "MurdererCredit"
        }) }), p6)
    return function() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u8
        --]]
        return u2.unmount(u8)
    end
end