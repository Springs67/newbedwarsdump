-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "OilClientStatusEffectHandler";
    end,

    __index = ClientStatusEffectHandler
});
u2.__index = u2;

function u2.new(...) -- Line: 17
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 21
    -- upvalues: ClientStatusEffectHandler (copy), u1 (copy)
    ClientStatusEffectHandler.constructor(p4, ...);
    p4.movementModifier = {
        blockSprint = true
    };
    p4.jumpHeightModifier = {
        jumpHeightMultiplier = 0,
        airJumps = 0
    };
    p4.jumpMaid = u1.new();
end;

function u2.onApply(p5, p6, p7) -- Line: 32
    -- upvalues: Players (copy), KnitClient (copy)
    if not Players.LocalPlayer.Character or p6 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    p5.jumpMaid:GiveTask(KnitClient.Controllers.JumpHeightController:getJumpModifier():addModifier(p5.jumpHeightModifier));
    p5.jumpMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier(p5.movementModifier));
end;

function u2.onRemove(p8, p9, p10) -- Line: 39
    -- upvalues: Players (copy), KnitClient (copy)
    if not Players.LocalPlayer.Character or p9 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    KnitClient.Controllers.SprintController:getMovementStatusModifier():removeModifier(p8.movementModifier);
    KnitClient.Controllers.JumpHeightController:getJumpModifier():removeModifier(p8.jumpHeightModifier);
    p8.jumpMaid:DoCleaning();
end;

return {
    OilClientStatusEffectHandler = u2
};