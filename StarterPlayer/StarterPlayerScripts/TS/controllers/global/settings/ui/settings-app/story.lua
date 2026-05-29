local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "settings-reducer").SettingsReducer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-util").makeStarterSettings
local u7 = v1.import(script, script.Parent, "settings-app").SettingsApp
return function(p8) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u6
        [4] = u2
        [5] = u3
        [6] = u7
    --]]
    local v9 = {
        ["Settings"] = u5
    }
    local v10 = {
        ["store"] = u4.Store.new(u4.combineReducers(v9), {
            ["Settings"] = u6()
        })
    }
    local u11 = u2.mount(u2.createElement(u3, v10, { u2.createElement(u7, {
            ["AppId"] = "SettingsApp"
        }) }), p8)
    return function() --[[ Line: 22 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        return u2.unmount(u11)
    end
end