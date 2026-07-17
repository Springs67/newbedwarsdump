-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "ScreenParticlesController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 24
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "ScreenParticlesController";
end;

function u6.KnitStart(p9) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p9);
end;

function u6.emitParticlesOnScreen(p10, u11) -- Line: 35
    -- upvalues: u3 (copy), Workspace (copy), GameQueryUtil (copy), RunService (copy), u5 (copy), KnitClient2 (copy), u2 (copy)
    local u12 = u3("Part", {
        Size = Vector3.new(1, 1, 1),
        CanCollide = false,
        Transparency = 1,
        Anchored = true,
        Parent = Workspace.CurrentCamera
    });
    GameQueryUtil:setQueryIgnored(u12, true);
    local v13 = {};

    for _, v in u11.particleEmitter do
        local v14 = v:Clone();
        v14.LockedToPart = true;
        v14.ZOffset = 0;
        v14.EmissionDirection = Enum.NormalId.Back;

        if not u11.keepEnabled then
            v14.Enabled = false;
        end;

        v14.Parent = u12;
        table.insert(v13, v14);
    end;

    local v19 = RunService.Heartbeat:Connect(function() -- Line: 56
        -- upvalues: u11 (copy), u5 (ref), KnitClient2 (ref), Workspace (ref), u12 (copy)
        local depth = u11.depth;
        local v15 = depth == nil and 0.5 or depth;
        local v16 = u5.ScreenWidthToWorldWidth(u5.ViewSizeX(), -v15, KnitClient2.Controllers.FovController:getBaseFOV()) * 1.2;
        local v17 = u5.ScreenHeightToWorldHeight(u5.ViewSizeY(), -v15, KnitClient2.Controllers.FovController:getBaseFOV()) * 1.2;
        local v18 = Vector3.new(v16, v17, 1);
        u12.CFrame = Workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -v15 - 0.5);
        u12.Size = v18;
    end);

    for _, v in v13 do
        local v20 = v:GetAttribute("EmitCount");
        v:Emit(v20 == nil and 30 or v20);
    end;

    local u21 = u2.new();
    u21:GiveTask(u12);
    u21:GiveTask(v19);
    local cleanupAfter = u11.cleanupAfter;

    if cleanupAfter ~= 0 and (cleanupAfter == cleanupAfter and cleanupAfter) then
        task.delay(u11.cleanupAfter, function() -- Line: 82
            -- upvalues: u21 (copy)
            u21:DoCleaning();
        end);
    end;

    return u21;
end;

KnitClient.CreateController(u6.new());

return nil;