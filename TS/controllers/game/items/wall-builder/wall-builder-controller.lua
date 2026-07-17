-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "WallBuilderController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "WallBuilderController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), BlockEngineClientEvents (copy), Workspace (copy), default (copy)
    KnitController.KnitStart(p4);
    BlockEngineClientEvents.PlaceBlock:connect(function(p5) -- Line: 28
        -- upvalues: Workspace (ref), default (ref)
        local v6 = #p5.blockType - 7;

        if v6 <= 0 or string.sub(p5.blockType, v6) ~= "_builder" then
            return nil;
        end;

        local LookVector = Workspace.CurrentCamera.CFrame.LookVector;
        local v7 = math.abs(LookVector.X) - math.abs(LookVector.Z) > 0 and Vector3.new(0, 0, 1) or Vector3.new(1, 0, 0);
        default.Client:Get("WallBuilderPlaced"):SendToServer({
            blockPosition = p5.blockPosition,
            direction = v7,
            blockType = p5.blockType
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;