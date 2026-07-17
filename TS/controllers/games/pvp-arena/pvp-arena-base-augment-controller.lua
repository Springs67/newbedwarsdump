-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local getPvPArenaAugmentMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta").getPvPArenaAugmentMeta;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "PvPArenaBaseAugmentController";
    end,

    __index = GameKnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 17
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p2, { GameType.PVP_ARENA });
    p2.Name = "PvPArenaBaseAugmentController";
    p2.augmentType = p3;
    p2.config = p2:getAugmentConfig();
end;

function v1.onGameInit(u4) -- Line: 23
    -- upvalues: ClientSyncEvents (copy)
    ClientSyncEvents.PvPArenaAugmentClientSelected:connect(function(p5) -- Line: 24
        -- upvalues: u4 (copy)
        if u4.augmentType == p5.augmentType then
            u4:onActivated();
        end;
    end);
end;

function v1.getAugmentConfig(p6) -- Line: 30
    -- upvalues: getPvPArenaAugmentMeta (copy)
    return getPvPArenaAugmentMeta(p6.augmentType).config();
end;

return {
    PvPArenaBaseAugmentController = v1
};