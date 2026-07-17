-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local InfectionPointsBar = RuntimeLib.import(script, script.Parent, "infection-points-bar").InfectionPointsBar;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "InfectionPointsBarController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "InfectionPointsBarController";
end;

function u2.KnitStart(p5) -- Line: 26
    -- upvalues: KnitController (copy), Players (copy), u1 (copy), InfectionPointsBar (copy)
    KnitController.KnitStart(p5);
    Players.LocalPlayer:GetAttributeChangedSignal("InfectedVariantType"):Once(function() -- Line: 28
        -- upvalues: Players (ref), u1 (ref), InfectionPointsBar (ref)
        local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
        u1.mount(u1.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u1.createElement(InfectionPointsBar) }), PlayerGui, "InfectionPointsBar");
    end);
end;

KnitClient.CreateController(u2.new());

return nil;