-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local OGNameTag = RuntimeLib.import(script, script.Parent, "og", "og-nametag").OGNameTag;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "ClassicBedwarsController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.BEDWARS });
    p5.Name = "ClassicBedwarsController";
    p5.forceRescaleMaid = {};
end;

function u3.KnitStart(u6) -- Line: 32
    -- upvalues: GameKnitController (copy), WatchCharacter (copy), KnitClient2 (copy), QueueType (copy), EntityUtil (copy), KnitClient (copy)
    GameKnitController.KnitStart(u6);
    WatchCharacter(function(p7, p8) -- Line: 35
        -- upvalues: KnitClient2 (ref), QueueType (ref), EntityUtil (ref), u6 (copy)
        if KnitClient2.Controllers.MatchController:getQueueTypeAsync():expect() ~= QueueType.BEDWARS_OG_TO4 then
            return nil;
        end;

        local v9 = EntityUtil:getEntity(p7);

        if v9 then
            v9:hideNametag();
            u6:attachOGNametag(p8);
        end;
    end);
    KnitClient2.Controllers.MatchController:getQueueTypeAsync():andThen(function(p10) -- Line: 46
        -- upvalues: QueueType (ref), KnitClient (ref)
        if p10 == QueueType.BEDWARS_OG_TO4 then
            KnitClient.Controllers.BedHealthDisplayController:disableBedHealthBillboards();
            KnitClient.Controllers.BedHealthDisplayController:removeBedHealthBillboards();
        end;
    end);
end;

function u3.attachOGNametag(p11, u12) -- Line: 54
    -- upvalues: EntityUtil (copy), u2 (copy), OGNameTag (copy)
    local u13 = EntityUtil:getEntity(u12);

    if u13 ~= nil then
        u13 = u13:getInstance();
    end;

    if not u13 then
        return nil;
    end;

    task.spawn(function() -- Line: 63
        -- upvalues: u2 (ref), OGNameTag (ref), u13 (copy), u12 (copy)
        u2.mount(u2.createElement(OGNameTag, {
            EntityInstance = u13
        }), u12:WaitForChild("Head", 3));
    end);
end;

KnitClient.CreateController(u3.new());

return nil;