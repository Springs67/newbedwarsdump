local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
return {
    ["WerewolfTailAttributes"] = {
        ["WerewolfJumpBoostAttr"] = v3.new("WerewolfJumpBoost", v2.optional(v2.number)),
        ["WerewolfSpeedBoostAttr"] = v3.new("WerewolfSpeedBoost", v2.optional(v2.number)),
        ["WerewolfChargingHowl"] = v3.new("WerewolfChargingHowl", v2.optional(v2.boolean)),
        ["WerewolfTest1"] = v3.new("WerewolfTest1", v2.optional(v2.string))
    }
}