-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "draw");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "pid");
local LocalPlayer = Players.LocalPlayer;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "LevitatorComponent";
    end
});
u5.__index = u5;

function u5.new(...) -- Line: 19
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 23
    -- upvalues: u3 (copy), u4 (copy), LocalPlayer (copy), Workspace (copy), u1 (copy)
    p7.levitator = p8;
    p7.debugRay = u3.ray(Ray.new());
    p7.levitationPid = u4.new(0, 1000, 100, 7, 0);
    local Parent = p8.Parent;

    if Parent ~= nil then
        Parent = Parent.Parent;
    end;

    if Parent ~= LocalPlayer.Character then
        return nil;
    end;

    local v9 = RaycastParams.new();
    v9.FilterDescendantsInstances = { Workspace:FindFirstChild("Map") };
    v9.FilterType = Enum.RaycastFilterType.Whitelist;
    p7.raycastParams = v9;
    p7.vectorForce = u1("VectorForce", {
        Parent = p8,
        Attachment0 = u1("Attachment", {
            Parent = p8
        })
    });
    p7.levitationPid:Debug("LevitationPid", Workspace);
end;

function u5.SteppedUpdate(p10, p11) -- Line: 48
    -- upvalues: u3 (copy), Workspace (copy)
    local v12 = p10.levitator.Position + Vector3.new(0, 0.1, 0);
    local v13 = Ray.new(v12, Vector3.new(0, -4, 0));
    u3.updateRay(p10.debugRay, v13);
    local v14 = Workspace:Raycast(v12, Vector3.new(0, -4, 0), p10.raycastParams);
    local v15 = not v14 and 0 or p10.levitationPid:Calculate(p11, v14.Position.Y + 4, v12.Y);
    p10.vectorForce.Force = Vector3.new(0, v15, 0);
end;

function u5.Destroy(p16) -- Line: 69
end;

return u5;