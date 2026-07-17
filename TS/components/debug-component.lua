-- Decompiled with Potassium's decompiler.

local IS_DEV = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "shared-constants").IS_DEV;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "DebugPartComponent";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 13
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4) -- Line: 17
    -- upvalues: IS_DEV (copy)
    if not p4:IsA("BasePart") then
        error("Any instance with DebugPart tag must be a BasePart");
    end;

    p4.CanCollide = false;
    p4.Transparency = IS_DEV and 0.5 or 1;
end;

function u1.Destroy(p5) -- Line: 24
end;

u1.Tag = "DebugPart";

return u1;