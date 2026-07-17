-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KillEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "KillEffectPreviewController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "KillEffectPreviewController";
end;

function u4.KnitStart(p7) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p7);
end;

function u4.previewKillEffect(p8, p9) -- Line: 34
    -- upvalues: u2 (copy), KillEffectMeta (copy), KnitClient (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), Players (copy)
    local v10 = u2.new();
    local v11 = KillEffectMeta[p9];
    local LockerPreviewController = KnitClient.Controllers.LockerPreviewController;
    local preview = v11.preview;

    if preview ~= nil then
        preview = preview.customAngle;
    end;

    if preview == nil then
        preview = CFrame.Angles(0, 3.7524578917878086, 0);
    end;

    LockerPreviewController:setPreviewAngle(preview);
    local preview2 = v11.preview;

    if preview2 ~= nil then
        preview2 = preview2.offset;
    end;

    KnitClient.Controllers.LockerPreviewController:setPreviewOffset(preview2 == nil and Vector3.new(0, 0, 0) or preview2);
    local preview3 = v11.preview;

    if preview3 ~= nil then
        preview3 = preview3.floorVisible;
    end;

    if preview3 then
        KnitClient.Controllers.LockerPreviewController:setFloorVisible(true);
    else
        KnitClient.Controllers.LockerPreviewController:setFloorVisible(false);
    end;

    local v12 = ReplicatedStorage.Assets.Misc.Dummy:Clone();
    v12.Name = "PreviewDummy";
    v12.Parent = Workspace;
    v12:PivotTo(CFrame.new(KnitClient.Controllers.LockerPreviewController:getPreviewDummyPosition()));
    v10:GiveTask(v12);

    if p9 then
        v10:GiveTask(KnitClient2.Controllers.KillEffectController:getKillEffects()[p9].new(Players.LocalPlayer):onKill(Players.LocalPlayer, v12, v12:GetPivot()));
    end;

    return v10;
end;

KnitClient.CreateController(u4.new());

return nil;