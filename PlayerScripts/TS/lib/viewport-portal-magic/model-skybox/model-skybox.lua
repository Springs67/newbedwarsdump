-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Lighting = v3.Lighting;
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "WorldModelHandler";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 19
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 23
    -- upvalues: u2 (copy)
    p6.trackedDeepModels = {};
    p6.trackedShallowModels = {};
    p6.worldModel = u2("WorldModel", {});
end;

function u4.cloneObjectDescendants(p7, p8) -- Line: 28
    local v9 = p8:GetDescendants();
    local v10 = {};

    for i, v in pairs(v9) do
        v:SetAttribute("_cloneMatch", i);
    end;

    p8.Archivable = true;
    local v11 = p8:Clone();

    for _, descendant in ipairs(v11:GetDescendants()) do
        local v12 = descendant:GetAttribute("_cloneMatch");

        if v12 ~= 0 and (v12 == v12 and v12) then
            local v13 = v9[v12];

            if v13 then
                v10[v13] = descendant;
                v9[v12] = nil;
                v13:SetAttribute("_cloneMatch", nil);
            end;

            descendant:SetAttribute("_cloneMatch", nil);
        end;
    end;

    return {
        copy = v11,
        matches = v10
    };
end;

function u4.trackCharacter(u14, u15) -- Line: 55
    -- upvalues: CollectionService (copy), Workspace (copy)
    local v16 = u14:cloneObjectDescendants(u15);
    local copy = v16.copy;
    local matches = v16.matches;
    CollectionService:RemoveTag(copy, "inventory-entity");

    for _, descendant in copy:GetDescendants() do
        if descendant:IsA("BasePart") or descendant:IsA("Decal") then
            descendant.LocalTransparencyModifier = 0;
        end;
    end;

    local Animate = copy:FindFirstChild("Animate");

    if Animate then
        Animate:Destroy();
    end;

    copy.Parent = u14.worldModel;
    local v17 = {};

    for i, v in matches do
        if i:IsA("BasePart") and v:IsA("BasePart") then
            v.Anchored = true;
            v17[i] = v;
        end;
    end;

    u14.trackedDeepModels[copy] = v17;
    u15.AncestryChanged:Connect(function() -- Line: 78
        -- upvalues: u15 (copy), Workspace (ref), copy (copy), u14 (copy)
        if not u15:IsDescendantOf(Workspace) then
            copy:Destroy();
            u14.trackedDeepModels[copy] = nil;
        end;
    end);

    return copy;
end;

function u4.addShallowModel(p18, p19) -- Line: 86
    local v20 = p19:Clone();
    p18.trackedShallowModels[p19] = v20;
    v20.Parent = p18.worldModel;
end;

function u4.updateWorldModel(p21, p22) -- Line: 93
    if p22 == nil then
        p22 = Vector3.new();
    end;

    for _, v in p21.trackedDeepModels do
        for i, v2 in v do
            v2.CFrame = i.CFrame + p22;
        end;
    end;

    for i, v in p21.trackedShallowModels do
        v:PivotTo(i:GetPivot());
    end;
end;

local u23 = u4;
local u24 = setmetatable({}, {
    __tostring = function() -- Line: 114, Name: __tostring
        return "ModelSkybox";
    end,

    __index = u23
});
u24.__index = u24;

function u24.new(...) -- Line: 120
    -- upvalues: u24 (ref)
    local v25 = setmetatable({}, u24);

    return v25:constructor(...) or v25;
end;

function u24.constructor(u26, p27, p28) -- Line: 124
    -- upvalues: u23 (copy), u1 (copy), Workspace (copy), u2 (copy), Players (copy), Lighting (copy), RunService (copy)
    u23.constructor(u26);
    u26.origin = p27;
    u26.maid = u1.new();
    u26.scale = 500;
    u26.distance = 500;
    u26.pos = Vector3.new();
    u26.pos = p27;
    u26.currentCamera = Workspace.CurrentCamera;
    u26.attachment = u2("Attachment", {
        Parent = Workspace.Terrain
    });
    u26.billboardGui = u2("BillboardGui", {
        ResetOnSpawn = false,
        Parent = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"),
        Adornee = u26.attachment
    });
    u26.camera = u2("Camera", {
        Parent = u26.billboardGui
    });
    u26.viewportFrame = u2("ViewportFrame", {
        BackgroundTransparency = 1,
        Ambient = Color3.fromRGB(200, 200, 200),
        LightColor = Color3.fromRGB(140, 140, 140),
        LightDirection = Lighting:GetSunDirection(),
        Size = UDim2.fromScale(1, 1),
        CurrentCamera = u26.camera,
        Parent = u26.billboardGui
    });
    u26.worldModel.Parent = u26.viewportFrame;

    if p28 == nil and true or p28 then
        u26.maid:GiveTask(u26.currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() -- Line: 158
            -- upvalues: u26 (copy)
            u26:updateBillboardSize();
        end));
        u26:updateBillboardSize();
        u26.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 162
            -- upvalues: u26 (copy)
            u26:update();
        end));
    end;

    u26.maid:GiveTask(function() -- Line: 166
        -- upvalues: u26 (copy)
        u26.attachment:Destroy();
        u26.billboardGui:Destroy();
        u26.camera:Destroy();
        u26.viewportFrame:Destroy();
        u26.worldModel:Destroy();
    end);
end;

function u24.update(p29) -- Line: 174
    local v30 = p29.pos - p29.origin;
    local v31 = p29.pos + p29.currentCamera.CFrame.Position / p29.scale;
    local CFrame2 = p29.currentCamera.CFrame;
    local v32 = CFrame.new(0, 0, -p29.distance);
    p29.attachment.WorldCFrame = CFrame2 * v32;
    p29.camera.CFrame = CFrame.fromMatrix(v31, p29.currentCamera.CFrame.RightVector, p29.currentCamera.CFrame.UpVector);
    p29.camera.FieldOfView = p29.currentCamera.FieldOfView;
    p29:updateWorldModel(v30);
end;

function u24.updateBillboardSize(p33) -- Line: 190
    p33.billboardGui.Size = UDim2.fromOffset(p33.currentCamera.ViewportSize.X, p33.currentCamera.ViewportSize.Y);
end;

function u24.destroy(p34) -- Line: 193
    p34.maid:Destroy();
end;

local u35 = u24;
local u36 = setmetatable({}, {
    __tostring = function() -- Line: 201, Name: __tostring
        return "ModelBillboard";
    end,

    __index = u35
});
u36.__index = u36;

function u36.new(...) -- Line: 207
    -- upvalues: u36 (ref)
    local v37 = setmetatable({}, u36);

    return v37:constructor(...) or v37;
end;

function u36.constructor(u38, u39, u40, u41) -- Line: 211
    -- upvalues: u35 (copy), RunService (copy)
    u35.constructor(u38, Vector3.new(), false);
    u38:trackCharacter(u39);
    u38.billboardGui.Size = UDim2.new(0.4, 0, 0.4, 0);
    u38.billboardGui.SizeOffset = Vector2.new(0, 0.4);
    u38.maid:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 216
        -- upvalues: u39 (copy), u41 (copy), u40 (copy), u38 (copy)
        local v42 = u40 + (u39:GetPivot().Position - u41) * 0.01;
        local v43 = u38.currentCamera.CFrame.LookVector * -1;
        u38.attachment.CFrame = CFrame.new(v42 + Vector3.new(0, 0, 0));
        u38.camera.CFrame = CFrame.lookAt(v42 + v43 * 10, v42);
        u38.camera.FieldOfView = u38.currentCamera.FieldOfView;
        u38:updateWorldModel(v42 - u39:GetPivot().Position);
    end));
end;

return {
    WorldModelHandler = u4,
    ModelSkybox = u24,
    ModelBillboard = u36
};