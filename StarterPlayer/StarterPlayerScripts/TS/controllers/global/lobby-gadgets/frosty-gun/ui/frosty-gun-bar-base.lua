local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent, "frosty-gun-core").FrostyGunCore
local v14 = v3.new(u2)(function(p6, p7) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local _ = p7.useState
    local v8 = {}
    local v9 = #v8
    local v10 = {}
    local v11 = {
        ["ResetOnSpawn"] = false
    }
    for v12, v13 in p6 do
        v10[v12] = v13
    end
    v8[v9 + 1] = u2.createElement(u5, v10)
    return u2.createFragment({
        ["FrostyGunGUI"] = u2.createElement("ScreenGui", v11, v8)
    })
end)
return {
    ["FrostyGunUiBase"] = v4.connect(function(p15, p16) --[[ Line: 24 ]]
        local v17 = {}
        for v18, v19 in p16 do
            v17[v18] = v19
        end
        v17.activeMode = p15.Kit.frostyGunMode
        return v17
    end)(v14)
}