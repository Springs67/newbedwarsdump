-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "CameraController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "CameraController";
    p4.cameraSubjectMap = {};
end;

function u2.KnitStart(p5) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p5);
end;

function u2.registerCameraSubject(p6, p7, p8, p9) -- Line: 30
    p6.cameraSubjectMap[p7] = {
        priority = p8,
        subject = p9
    };
    p6:setCameraSubject();
end;

function u2.deregisterCameraSubject(p10, p11) -- Line: 40
    p10.cameraSubjectMap[p11] = nil;
    p10:setCameraSubject();
end;

function u2.setZoom(p12, p13) -- Line: 46
    -- upvalues: Players (copy)
    local CameraMaxZoomDistance = Players.LocalPlayer.CameraMaxZoomDistance;
    local CameraMinZoomDistance = Players.LocalPlayer.CameraMinZoomDistance;
    Players.LocalPlayer.CameraMinZoomDistance = p13;
    Players.LocalPlayer.CameraMaxZoomDistance = p13;
    Players.LocalPlayer.CameraMaxZoomDistance = CameraMaxZoomDistance;
    Players.LocalPlayer.CameraMinZoomDistance = CameraMinZoomDistance;
end;

function u2.setMaxZoom(p14, p15) -- Line: 55
    -- upvalues: Players (copy)
    Players.LocalPlayer.CameraMaxZoomDistance = p15;
end;

function u2.setMinZoom(p16, p17) -- Line: 58
    -- upvalues: Players (copy)
    Players.LocalPlayer.CameraMinZoomDistance = p17;
end;

function u2.setCameraSubject(p18) -- Line: 61
    -- upvalues: Workspace (copy), Players (copy)
    local u19 = -1;
    local u20 = nil;

    local function _(p21, p22) -- Line: 65
        -- upvalues: u19 (ref), u20 (ref)
        if u19 < p21.priority then
            u19 = p21.priority;
            u20 = p22;
        end;
    end;

    for i, v in p18.cameraSubjectMap do
        if u19 < v.priority then
            u19 = v.priority;
            u20 = i;
        end;
    end;

    if u20 then
        local v23 = p18.cameraSubjectMap[u20];

        if v23 ~= nil then
            v23 = v23.subject;
        end;

        Workspace.CurrentCamera.CameraSubject = v23;
    else
        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character:FindFirstChild("Humanoid");
        end;

        Workspace.CurrentCamera.CameraSubject = Character;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;