local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
return {
    ["DasherKit"] = {
        ["DASH_COOLDOWN"] = 3,
        ["DASH_PROGRESS_DELAY"] = 6,
        ["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0.2,
        ["CHARGE_TIME"] = 0.5,
        ["TOTAL_CHARGE_TIME"] = 0.7,
        ["canDashAttribute"] = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("CanDashNext", v2.optional(v2.number))
    }
}