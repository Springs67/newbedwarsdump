-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MountMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "MountSittingController";
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
    p4.Name = "MountSittingController";
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), RunService (copy), KnitClient2 (copy), MountMeta (copy)
    KnitController.KnitStart(u5);
    RunService.Stepped:Connect(function() -- Line: 29
        -- upvalues: KnitClient2 (ref), MountMeta (ref), u5 (copy)
        for _, v in KnitClient2.Controllers.MountController:getActiveMounts() do
            local v6 = MountMeta[v.mountType];

            if v6 ~= nil then
                local Parent = v.model.Parent;

                if Parent ~= nil then
                    u5:performStep(v.model, v6, Parent);
                end;
            end;
        end;
    end);
end;

function u2.performStep(p7, p8, p9, p10) -- Line: 43
    local v11 = p8.PrimaryPart and (p9.controlBoneCallback and p9.controlBoneCallback(p8));

    if v11 then
        local v12 = (p10.HumanoidRootPart.CFrame * CFrame.new(p9.playerMountOffset or Vector3.new(0, -1.3, 0))):ToObjectSpace(v11.TransformedWorldCFrame);
        local v13 = CFrame;
        local playerMountRotationOffsetDegrees = p9.playerMountRotationOffsetDegrees;

        if playerMountRotationOffsetDegrees ~= nil then
            playerMountRotationOffsetDegrees = playerMountRotationOffsetDegrees.X;
        end;

        local v14 = math.rad(70 + (playerMountRotationOffsetDegrees == nil and 0 or playerMountRotationOffsetDegrees));
        local playerMountRotationOffsetDegrees2 = p9.playerMountRotationOffsetDegrees;

        if playerMountRotationOffsetDegrees2 ~= nil then
            playerMountRotationOffsetDegrees2 = playerMountRotationOffsetDegrees2.Y;
        end;

        local playerMountRotationOffsetDegrees3 = p9.playerMountRotationOffsetDegrees;

        if playerMountRotationOffsetDegrees3 ~= nil then
            playerMountRotationOffsetDegrees3 = playerMountRotationOffsetDegrees3.Z;
        end;

        local v15 = v13.Angles(v14, playerMountRotationOffsetDegrees2 == nil and 0 or playerMountRotationOffsetDegrees2, playerMountRotationOffsetDegrees3 == nil and 0 or playerMountRotationOffsetDegrees3);
        p10.LowerTorso.Root.Transform = v12 * v15;
    end;
end;

KnitClient.CreateController(u2.new());

return nil;