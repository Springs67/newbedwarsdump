-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local t = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "attribute-config");
local RotationSpeed = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes").Attribute.new("RotationSpeed", t.number);
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "RotatingObjectComponent";
    end
});
u2.__index = u2;

function u2.new(...) -- Line: 15
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, p5) -- Line: 19
    -- upvalues: u1 (copy), RotationSpeed (copy)
    p4.instance = p5;
    p4.lastHeartbeat = os.clock();

    if not p5:IsA("Model") then
        error("RotatingObjects must be of class Model");
    end;

    p4.config = u1.new(p5, { RotationSpeed });
end;

function u2.HeartbeatUpdate(p6) -- Line: 27
    if p6.instance.PrimaryPart ~= nil then
        local v7 = os.clock();
        local v8 = v7 - p6.lastHeartbeat;
        p6.lastHeartbeat = v7;
        p6.instance:PivotTo(p6.instance:GetPrimaryPartCFrame() * CFrame.Angles(0, math.rad(p6.config.Values.RotationSpeed * v8), 0));
    end;
end;

function u2.Destroy(p9) -- Line: 39
end;

u2.Tag = "RotatingObject";

return u2;