-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "PvPArenaFleetFootedAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy)
    PvPArenaBaseAugmentController.constructor(p3, PvPArenaAugmentType.FLEET_FOOTED);
    p3.Name = "PvPArenaFleetFootedAugmentController";
    p3.fleetFootStackCount = 0;
end;

function u1.onGameInit(u4) -- Line: 27
    -- upvalues: PvPArenaBaseAugmentController (copy), WatchCharacter (copy), Players (copy)
    PvPArenaBaseAugmentController.onGameInit(u4);
    WatchCharacter(function(p5) -- Line: 29
        -- upvalues: Players (ref), u4 (copy)
        if p5 == Players.LocalPlayer and u4.fleetFootStackCount > 0 then
            u4:addSpeedModifier();
        end;
    end);
end;

function u1.onActivated(p6) -- Line: 35
    p6.fleetFootStackCount = p6.fleetFootStackCount + 1;
    p6:addSpeedModifier();
end;

function u1.addSpeedModifier(p7) -- Line: 39
    -- upvalues: KnitClient (copy)
    if p7.speedModifier then
        KnitClient.Controllers.SprintController:getMovementStatusModifier():removeModifier(p7.speedModifier);
    end;

    p7.speedModifier = {
        blockSprint = false,
        moveSpeedMultiplier = 1 + (p7.config.speedMultiplier - 1) * p7.fleetFootStackCount
    };
    KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier(p7.speedModifier);
end;

KnitClient.CreateController(u1.new());

return nil;