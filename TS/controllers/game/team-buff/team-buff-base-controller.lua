-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "TeamBuffKnitController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.Name = "GameKnitController";
    p2.disabled = true;
end;

function v1.KnitStart(p3) -- Line: 25
    -- upvalues: KnitClient (copy), getQueueMeta (copy)
    local v4, v5 = KnitClient.Controllers.MatchController:getQueueTypeAsync():await();

    if v4 then
        local disabledFeatures = getQueueMeta(v5).disabledFeatures;

        if disabledFeatures ~= nil then
            disabledFeatures = disabledFeatures.disableTeamBuff;
        end;

        if not disabledFeatures and not p3.disabled then
            p3:onGameInit();
        end;
    end;
end;

function v1.onGameInit(p6) -- Line: 42
end;

return {
    TeamBuffKnitController = v1
};