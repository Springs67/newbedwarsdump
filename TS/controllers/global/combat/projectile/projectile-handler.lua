-- Decompiled with Potassium's decompiler.

local ProjectileMeta = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 7, Name: __tostring
        return "ProjectileHandler";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 12
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15) -- Line: 16
    p3.gravityMultiplier = p4;
    p3.velocityMultiplier = p5;
    p3.projectile = p6;
    p3.inputInfo = p7;
    p3.targetPoint = p8;
    p3.fromPositionOffset = p9 == nil and Vector3.new(0, 2, 0) or p9;
    p3.drawDurationSeconds = p10 == nil and 0 or p10;
    p3.lockedAimPoint = p11;
    p3.targetingId = p12;
    p3.startAtCenterOfCamera = p13;
    p3.projectileSourceController = p14;
    p3.player = p15;
end;

function u1.getProjectileMeta(p16) -- Line: 36
    -- upvalues: ProjectileMeta (copy)
    return ProjectileMeta[p16.projectile];
end;

return {
    ProjectileHandler = u1
};