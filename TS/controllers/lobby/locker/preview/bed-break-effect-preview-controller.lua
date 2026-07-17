-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedBreakEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "BedBreakEffectPreviewController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BedBreakEffectPreviewController";
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p5);
end;

function u2.previewBedBreakEffect(p6, p7) -- Line: 30
    -- upvalues: u1 (copy), BedBreakEffectMeta (copy), KnitClient (copy), ClientSyncEvents (copy), Players (copy)
    local v8 = u1.new();
    local v9 = BedBreakEffectMeta[p7];
    KnitClient.Controllers.LockerPreviewController:setPreviewAngle(CFrame.Angles(-0.3490658503988659, 0.6108652381980153, 0));
    local preview = v9.preview;

    if preview ~= nil then
        preview = preview.offset;
    end;

    KnitClient.Controllers.LockerPreviewController:setPreviewOffset(preview == nil and Vector3.new(0, 0, 0) or preview);
    local v10 = KnitClient.Controllers.LockerPreviewController:getBedAttachment();
    local v11 = KnitClient.Controllers.LockerPreviewController:getBedCenterAttachment();
    local v12 = ClientSyncEvents.StartBedBreakEffectPreview:fire(p7, Players.LocalPlayer, CFrame.new(v10.WorldPosition), "0", v11.WorldPosition);

    if v12.maid then
        v8:GiveTask(v12.maid);
    end;

    return v8;
end;

KnitClient.CreateController(u2.new());

return nil;