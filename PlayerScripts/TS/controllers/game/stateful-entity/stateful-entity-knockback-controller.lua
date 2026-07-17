-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KnockbackUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "knockback-util").KnockbackUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "StatefulEntityKnockbackController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "StatefulEntityKnockbackController";
    p3.lastImpulseTime = 0;
end;

function u1.KnitStart(u4) -- Line: 29
    -- upvalues: KnitController (copy), default (copy), Players (copy), KnockbackUtil (copy)
    KnitController.KnitStart(u4);
    default.Client:WaitFor("StatefulEntityPlayerKnockbackRequest"):expect():Connect(function(p5) -- Line: 32
        -- upvalues: u4 (copy), Players (ref), KnockbackUtil (ref)
        local v6 = time();
        local v7 = v6 - u4.lastImpulseTime;
        u4.lastImpulseTime = v6;

        if v7 >= 0.016 then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character.PrimaryPart;
            end;

            if not Character then
                return nil;
            end;

            KnockbackUtil.applyKnockbackPlatformStand(Character);
            Character:ApplyImpulse(p5);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;