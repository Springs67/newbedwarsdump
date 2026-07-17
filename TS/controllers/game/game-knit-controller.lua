-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "GameKnitController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.gameTypes = p3;
    p2.Name = "GameKnitController";
end;

function v1.KnitStart(p4) -- Line: 26
    -- upvalues: PlaceUtil (copy), KnitClient (copy), getQueueMeta (copy)
    if not PlaceUtil.isGameServer() then
        return nil;
    end;

    local v5, v6 = KnitClient.Controllers.MatchController:getQueueTypeAsync():await();

    if v5 then
        local v7 = getQueueMeta(v6);

        if table.find(p4.gameTypes, v7.game) ~= nil then
            p4:onGameInit();
        end;
    end;
end;

function v1.onGameInit(p8) -- Line: 40
end;

return {
    GameKnitController = v1
};