-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v1 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network");
local EntityDamageEventZap = v1.EntityDamageEventZap;
local EntityHealEventZap = v1.EntityHealEventZap;
local HealType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "heal-type").HealType;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent, "effect", "vignette", "vignette-meta").VignetteType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "DamageController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "DamageController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: EntityHealEventZap (copy), EntityUtil (copy), Players (copy), HealType (copy), KnitClient (copy), VignetteType (copy), EntityDamageEventZap (copy)
    EntityHealEventZap.On(function(p6, p7, p8, p9) -- Line: 33
        -- upvalues: EntityUtil (ref), Players (ref), HealType (ref), KnitClient (ref), VignetteType (ref)
        if p9 then
            return nil;
        end;

        if p6.PrimaryPart then
            local v10 = EntityUtil:getPlayerFromEntityInstance(p6);

            if not v10 then
                return nil;
            end;

            if v10 ~= Players.LocalPlayer then
                return nil;
            end;

            if p8 == HealType.REGEN then
                return nil;
            end;

            KnitClient.Controllers.VignetteController:createVignette(VignetteType.HEAL);
            task.delay(0.5, function() -- Line: 49
                -- upvalues: KnitClient (ref), VignetteType (ref)
                KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.HEAL);
            end);
        end;
    end);
    EntityDamageEventZap.On(function(p11, p12, p13, p14) -- Line: 54
        if p14 then
            return nil;
        end;
    end);
end;

function u2.requestSelfDeath(p15, p16) -- Line: 60
    -- upvalues: default (copy)
    default.Client:Get("RequestSelfDeath"):SendToServer({
        damageType = p16
    });
end;

return {
    DamageController = KnitClient.CreateController(u2.new())
};