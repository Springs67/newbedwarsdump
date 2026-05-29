local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
return {
    ["BlockKickerKitAttributes"] = {
        ["BlockKickerKit_BlockCount"] = v3.new("BlockKickerKit_BlockCount", v2.optional(v2.number)),
        ["BlockKickerKit_LastBlockKickTime"] = v3.new("BlockKickerKit_LastBlockKickTime", v2.optional(v2.number)),
        ["BlockKickerKit_CurrentKickCombo"] = v3.new("BlockKickerKit_CurrentKickCombo", v2.optional(v2.number))
    }
}