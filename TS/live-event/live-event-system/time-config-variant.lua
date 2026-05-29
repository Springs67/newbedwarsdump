local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "variant", "out")
local v2 = v1.default
local v3 = v1.fields
return {
    ["TimeConfig"] = v2({
        ["betweenDates"] = v3(),
        ["startDateAndLength"] = v3()
    })
}