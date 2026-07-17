-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "QueueEnvironmentController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "QueueEnvironmentController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), PlaceUtil (copy), KnitClient (copy), getQueueMeta (copy)
    KnitController.KnitStart(p4);

    if PlaceUtil.isGameServer() then
        KnitClient.Controllers.MatchController:getQueueTypeAsync():andThen(function(p5) -- Line: 30
            -- upvalues: getQueueMeta (ref), KnitClient (ref)
            local environment = getQueueMeta(p5).environment;

            if not environment then
                return nil;
            end;

            KnitClient.Controllers.EnvironmentController:setupEnvironment(environment);
        end);
    end;
end;

KnitClient.CreateController(u1.new());

return nil;