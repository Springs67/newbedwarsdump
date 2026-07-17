-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ModifierController";
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
    p4.Name = "ModifierController";
    p4.airJumpModifierIdMap = {};
    p4.jumpHeightModifierIdMap = {};
    p4.speedModifierIdMap = {};
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), KnitClient2 (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("UpdateScriptJumpModifier", function(p6) -- Line: 31
        -- upvalues: KnitClient2 (ref), u5 (copy)
        local v7 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
            airJumps = p6.jumps
        });
        u5.airJumpModifierIdMap[p6.id] = {
            Destroy = v7.Destroy
        };
    end);
    default.Client:OnEvent("AddScriptJumpHeightModifier", function(p8) -- Line: 42
        -- upvalues: KnitClient2 (ref), u5 (copy)
        local v9 = KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
            jumpHeightMultiplier = p8.multiplier
        });
        u5.jumpHeightModifierIdMap[p8.id] = v9;
    end);
    default.Client:OnEvent("UpdateScriptSpeedModifier", function(p10) -- Line: 50
        -- upvalues: KnitClient2 (ref), u5 (copy)
        local v11 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = p10.multiplier
        });
        u5.speedModifierIdMap[p10.id] = v11;
    end);
    default.Client:OnEvent("RemoveScriptJumpModifier", function(p12) -- Line: 58
        -- upvalues: u5 (copy)
        local v13 = u5.airJumpModifierIdMap[p12.id];

        if v13 ~= nil then
            v13.Destroy();
        end;
    end);
    default.Client:OnEvent("RemoveScriptJumpHeightModifier", function(p14) -- Line: 67
        -- upvalues: u5 (copy)
        local v15 = u5.jumpHeightModifierIdMap[p14.id];

        if v15 ~= nil then
            v15.Destroy();
        end;
    end);
    default.Client:OnEvent("RemoveScriptSpeedModifier", function(p16) -- Line: 76
        -- upvalues: u5 (copy)
        local v17 = u5.speedModifierIdMap[p16.id];

        if v17 ~= nil then
            v17.Destroy();
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;