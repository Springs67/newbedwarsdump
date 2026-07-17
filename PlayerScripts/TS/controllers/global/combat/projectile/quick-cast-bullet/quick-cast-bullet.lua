-- Decompiled with Potassium's decompiler.

local Workspace = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 7, Name: __tostring
        return "QuickCastBulletPool";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 12
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, p4, p5) -- Line: 16
    -- upvalues: Workspace (copy)
    local v6 = p5 == nil and 50 or p5;
    p3.available = {};
    p3.template = p4;
    p3.folder = Instance.new("Folder");
    p3.folder.Name = "ModelPool_" .. p4.Name;
    p3.folder.Parent = Workspace;
    local v7 = false;
    local v8 = 0;

    while true do
        if v7 then
            v8 = v8 + 1;
        else
            v7 = true;
        end;

        if v8 >= v6 then
            return;
        end;

        p3:createModel();
    end;
end;

function u1.createModel(p9) -- Line: 42
    local v10 = p9.template:Clone();
    v10:PivotTo(CFrame.new(0, -2000, 0));
    v10.Parent = p9.folder;
    table.insert(p9.available, v10);

    if not v10.PrimaryPart then
        assert(v10.PrimaryPart, "Primary part missing on projectile " .. v10.Name);
    end;

    v10.PrimaryPart.Anchored = true;
    local PrimaryPart = v10.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart:FindFirstChildOfClass("Trail");
    end;

    if PrimaryPart then
        PrimaryPart.Enabled = false;
    end;

    return v10;
end;

function u1.getModel(p11) -- Line: 64
    local available = p11.available;
    local v12 = #available;
    local v13 = available[v12];
    available[v12] = nil;

    if v13 == nil then
        v13 = p11:createModel();
    end;

    local PrimaryPart = v13.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart:FindFirstChildOfClass("Trail");
    end;

    if PrimaryPart then
        PrimaryPart.Enabled = true;
    end;

    return v13;
end;

function u1.returnModel(p14, p15) -- Line: 86
    p15:PivotTo(CFrame.new(0, -2000, 0));
    p15.Parent = p14.folder;
    local PrimaryPart = p15.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart:FindFirstChildOfClass("Trail");
    end;

    if PrimaryPart then
        PrimaryPart.Enabled = false;
    end;

    table.insert(p14.available, p15);
end;

return {
    QuickCastBulletPool = u1
};