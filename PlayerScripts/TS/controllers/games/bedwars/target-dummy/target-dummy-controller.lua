-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local TargetDummyClient = RuntimeLib.import(script, script.Parent, "target-dummy-client").TargetDummyClient;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "TargetDummyController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "TargetDummyController";
    p3.targetDummyClientMap = {};
end;

function u1.KnitStart(u4) -- Line: 28
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u4);
    default.Client:OnEvent("SpawnTargetDummy", function(p5) -- Line: 30
        -- upvalues: u4 (copy)
        u4:spawnTargetDummy(p5.targetDummyEntity, p5.currentEraTier, p5.targetDummyPosition, p5.teamId);
    end);
    default.Client:OnEvent("CleanupTargetDummy", function(p6) -- Line: 33
        -- upvalues: u4 (copy)
        local position = p6.position;
        local v7 = u4.targetDummyClientMap[position];

        if v7 ~= nil then
            local v8 = v7:getGameEntity();

            if v8 ~= nil then
                v8:Destroy();
            end;

            u4.targetDummyClientMap[position] = nil;
        end;
    end);
end;

function u1.spawnTargetDummy(p9, p10, p11, p12, p13) -- Line: 45
    -- upvalues: StatefulEntityUtil (copy), TargetDummyClient (copy)
    local v14 = StatefulEntityUtil:getGameEntityCFrame(p10);
    local v15 = p10:GetAttribute("EntityUUID");
    local v16 = TargetDummyClient.new(v14, v15, p10, p11, p13);
    p9.targetDummyClientMap[p12] = v16;
end;

KnitClient.CreateController(u1.new());

return nil;