local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute
return {
    ["BillboardTitleAttr"] = v3.new("BillboardTitle", v2.string),
    ["BillboardSubtitleAttr"] = v3.new("BillboardSubtitle", v2.optional(v2.string)),
    ["BillboardSizeAttr"] = v3.new("BillboardSize", v2.optional(v2.UDim2)),
    ["BillboardMaxSizeAttr"] = v3.new("BillboardMaxSize", v2.optional(v2.Vector2)),
    ["BillboardStudsOffsetAttr"] = v3.new("BillboardStudsOffset", v2.optional(v2.Vector3)),
    ["BillboardAlwaysOnTopAttr"] = v3.new("AlwaysOnTop", v2.optional(v2.boolean)),
    ["BillboardAutomaticSizeAttr"] = v3.new("AutomaticSize", v2.optional(v2.boolean))
}