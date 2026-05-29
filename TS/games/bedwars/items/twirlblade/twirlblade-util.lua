local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
return {
    ["TwirlbladeUtil"] = {
        ["SPIN_DAMAGE"] = 25,
        ["SPIN_HIT_RADIUS"] = v3 * 5,
        ["twirlbladeAttackCountAttribute"] = v4.new("TwirlbladeAttackCount", v2.optional(v2.number))
    }
}