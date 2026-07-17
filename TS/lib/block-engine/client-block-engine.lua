-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local IClientBlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "client-block-engine").IClientBlockEngine;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local v1 = RuntimeLib.import(script, script.Parent.Parent, "network");
local BreakBlockEventZap = v1.BreakBlockEventZap;
local PlaceBlockEventZap = v1.PlaceBlockEventZap;
local v2 = {
    mobileActionButtonPosition = BedwarsUI:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
    breakBlockRemoteZap = BreakBlockEventZap,
    placeBlockRemoteZap = PlaceBlockEventZap
};
local u3 = IClientBlockEngine.new(v2);
RuntimeLib.Promise.defer(function() -- Line: 17
    -- upvalues: Workspace (copy), u3 (copy)
    Workspace:WaitForChild("BlockHandlersReady");
    u3:startBlockReplication();
end);

return {
    ClientBlockEngine = u3
};