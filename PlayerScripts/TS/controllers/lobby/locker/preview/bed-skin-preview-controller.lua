-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local ItemSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").ItemSkinMeta;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "BedSkinPreviewController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "BedSkinPreviewController";
end;

function u4.KnitStart(p7) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.previewBedSkin(p8, p9) -- Line: 35
    -- upvalues: u1 (copy), KnitClient (copy), ReplicatedStorage (copy), u2 (copy), Workspace (copy), scaleModel (copy), ItemSkinMeta (copy), ColorUtil (copy), TeamColorHex (copy)
    local v10 = u1.new();
    KnitClient.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(0, 0.6108652381980153, 0));
    local v11 = KnitClient.Controllers.LockerPreviewController:getBedAttachment();
    local v12 = KnitClient.Controllers.LockerPreviewController:getBedCenterAttachment();
    local v13 = ReplicatedStorage.Assets.Blocks:FindFirstChild(p9);

    if not v13 then
        return v10;
    end;

    local v14 = v13:Clone();
    local Y = select(2, v14:GetBoundingBox()).Y;
    local v15 = Vector3.new(0, Y, 0);
    local v16 = u2("Part", {
        Name = "BedSkinPivot",
        Anchored = true,
        Transparency = 1,
        Parent = Workspace,
        CFrame = CFrame.new(v12.WorldPosition + v15)
    });
    v14.Parent = v16;
    v14:PivotTo(CFrame.new(v11.WorldPosition + v15) * CFrame.Angles(0.6981317007977318, 0, 0));
    scaleModel(v14, 1.5);
    v10:GiveTask(v16);
    v10:GiveTask(v14);
    local Carpet = v14:FindFirstChild("Carpet", true);

    if Carpet then
        Carpet:Destroy();
    end;

    local defaultColor = ItemSkinMeta[p9].defaultColor;
    local v17 = v14:FindFirstChildWhichIsA("SurfaceAppearance", true);

    if v17 then
        if defaultColor == nil then
            defaultColor = TeamColorHex.red;
        end;

        v17.Color = ColorUtil.hexColor(defaultColor);
    end;

    return v10;
end;

KnitClient.CreateController(u4.new());

return nil;