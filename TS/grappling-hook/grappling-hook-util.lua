local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.UNEQUIPPED = "UNEQUIPPED"
v2.UNEQUIPPED = "UNEQUIPPED"
v3.HOOK_CHAMBERED = "HOOK_CHAMBERED"
v2.HOOK_CHAMBERED = "HOOK_CHAMBERED"
v3.HOOK_FORWARD_TRANSIT = "HOOK_FORWARD_TRANSIT"
v2.HOOK_FORWARD_TRANSIT = "HOOK_FORWARD_TRANSIT"
v3.HOOK_BACKWARD_TRANSIT = "HOOK_BACKWARD_TRANSIT"
v2.HOOK_BACKWARD_TRANSIT = "HOOK_BACKWARD_TRANSIT"
v3.HOOK_GRAPPLED = "HOOK_GRAPPLED"
v2.HOOK_GRAPPLED = "HOOK_GRAPPLED"
v3.PLAYER_IN_TRANSIT = "PLAYER_IN_TRANSIT"
v2.PLAYER_IN_TRANSIT = "PLAYER_IN_TRANSIT"
local v4 = {
    ["FORCE_SCALAR"] = 500
}
local v5 = v1.Gravity
v4.FORCE_ADDITIVE = Vector3.new(0, v5, 0)
v4.SPEED = 5
v4.GRAPPLING_HOOK_HIT_COOLDOWN = 3.5
return {
    ["GrapplingHookFunctions"] = v3,
    ["GrapplingHookConst"] = v4
}