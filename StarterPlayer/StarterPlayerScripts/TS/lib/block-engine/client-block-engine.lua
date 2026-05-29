local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "client-block-engine").IClientBlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local v4 = v1.import(script, script.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local v5 = v1.import(script, script.Parent.Parent, "network")
local v6 = v5.BreakBlockEventZap
local v7 = v5.PlaceBlockEventZap
local v8 = {
    ["mobileActionButtonPosition"] = v4:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
    ["breakBlockRemoteZap"] = v6,
    ["placeBlockRemoteZap"] = v7
}
local u9 = v2.new(v8)
v1.Promise.defer(function() --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
    --]]
    u3:WaitForChild("BlockHandlersReady")
    u9:startBlockReplication()
end)
return {
    ["ClientBlockEngine"] = u9
}