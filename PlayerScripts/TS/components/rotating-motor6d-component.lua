-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local Attribute = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute;
local RotationSpeed = Attribute.new("RotationSpeed", t.optional(t.number));
local RotationDirection = Attribute.new("RotationDirection", t.optional(t.string));
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "RotatingMotor6DComponent";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 16
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, p5) -- Line: 20
    -- upvalues: u1 (copy), RotationSpeed (copy), RotationDirection (copy)
    p4.instance = p5;
    p4.lastHeartbeat = os.clock();

    if not p5:IsA("Motor6D") then
        error("RotatingObjects must be of class Motor6D");
    end;

    p4.config = u1.new(p5, { RotationSpeed, RotationDirection });
end;

function u2.HeartbeatUpdate(p6) -- Line: 28
    local v7 = os.clock();
    local v8 = v7 - p6.lastHeartbeat;
    p6.lastHeartbeat = v7;
    local RotationSpeed2 = p6.config.Values.RotationSpeed;
    local v9 = RotationSpeed2 == nil and 10 or RotationSpeed2;
    local RotationDirection2 = p6.config.Values.RotationDirection;

    if RotationDirection2 ~= nil then
        RotationDirection2 = string.lower(RotationDirection2);
    end;

    if RotationDirection2 == "x" then
        local C0 = p6.instance.C0;
        local v10 = CFrame.Angles(math.rad(v9 * v8), 0, 0);
        p6.instance.C0 = C0 * v10;

        return;
    end;

    if RotationDirection2 == "y" then
        local C0 = p6.instance.C0;
        local v11 = CFrame.Angles(0, math.rad(v9 * v8), 0);
        p6.instance.C0 = C0 * v11;

        return;
    end;

    if RotationDirection2 == "z" then
        local C0 = p6.instance.C0;
        local v12 = CFrame.Angles(0, 0, (math.rad(v9 * v8)));
        p6.instance.C0 = C0 * v12;

        return;
    end;

    local C0 = p6.instance.C0;
    local v13 = CFrame.Angles(0, 0, (math.rad(v9 * v8)));
    p6.instance.C0 = C0 * v13;
end;

function u2.Destroy(p14) -- Line: 68
end;

u2.Tag = "RotatingMotor6D";

return u2;