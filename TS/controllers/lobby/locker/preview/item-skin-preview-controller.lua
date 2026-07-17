-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "ItemSkinPreviewController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 21
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "ItemSkinPreviewController";
end;

function u4.KnitStart(p7) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.previewItemSkin(p8, p9) -- Line: 32
    -- upvalues: u1 (copy), KnitClient (copy), ReplicatedStorage (copy), u2 (copy), Workspace (copy), scaleModel (copy)
    local v10 = u1.new();
    KnitClient.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(0, 0.6108652381980153, 0));
    local Items = ReplicatedStorage:FindFirstChild("Items");

    if Items ~= nil then
        Items = Items:FindFirstChild(p9);
    end;

    if not Items then
        return v10;
    end;

    local v11 = Items:Clone();
    local Handle = v11:FindFirstChild("Handle");

    if not Handle then
        return v10;
    end;

    local v12 = u2("Model", {
        Children = { v11 }
    });
    local Y = select(2, v12:GetBoundingBox()).Y;
    local v13 = Vector3.new(0, Y, 0);
    local v14 = u2("Part", {
        Name = "ItemSkinPivot",
        Anchored = true,
        Transparency = 1,
        Parent = Workspace,
        CFrame = CFrame.new(Handle:GetPivot() * v13)
    });
    v12.Parent = v14;
    v12:PivotTo(CFrame.new(Handle:GetPivot() * v13) * CFrame.Angles(0.6981317007977318, 0, 0));
    scaleModel(v12, 1.5);
    v10:GiveTask(v14);
    v10:GiveTask(v11);

    return v10;
end;

KnitClient.CreateController(u4.new());

return nil;