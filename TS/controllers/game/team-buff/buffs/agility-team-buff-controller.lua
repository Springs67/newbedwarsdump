-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local TeamBuffBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "snake-shrine-buff", "team-buff-balance").TeamBuffBalance;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "AgilityTeamBuffController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "AgilityTeamBuffController";
    p4.speedMaid = u1.new();
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), Players (copy), KnitClient (copy), TeamBuffBalance (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 31
        -- upvalues: StatusEffectType (ref), Players (ref), u5 (copy), KnitClient (ref), TeamBuffBalance (ref)
        if p6.statusEffect ~= StatusEffectType.SNAKE_AGILITY_INVISIBLE then
            return nil;
        end;

        local v7 = Players:GetPlayerFromCharacter(p6.entityInstance);

        if v7 and v7 == Players.LocalPlayer then
            u5.speedMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = false,
                moveSpeedMultiplier = TeamBuffBalance.SNAKE_AGILITY_SPEED_MULTIPLIER
            }));
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p8) -- Line: 43
        -- upvalues: StatusEffectType (ref), Players (ref), u5 (copy)
        if p8.statusEffect ~= StatusEffectType.SNAKE_AGILITY_INVISIBLE then
            return nil;
        end;

        local v9 = Players:GetPlayerFromCharacter(p8.entityInstance);

        if v9 and v9 == Players.LocalPlayer then
            u5.speedMaid:DoCleaning();
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;