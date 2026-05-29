local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local v4 = v3.RunService
local v5 = v3.Workspace
if v4:IsClient() then
    v2("BoolValue", {
        ["Name"] = "BlockHandlersReady",
        ["Value"] = true,
        ["Parent"] = v5
    })
end
return true