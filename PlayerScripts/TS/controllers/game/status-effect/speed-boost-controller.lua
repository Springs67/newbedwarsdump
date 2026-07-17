-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "SpeedBoostController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SpeedBoostController";
    p4.playerSpeedMaids = {};
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), StatusEffectType (copy), EntityUtil (copy), Players (copy), u1 (copy), StatusEffectUtil (copy), KnitClient (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.StatusEffectAdded:connect(function(p6) -- Line: 32
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), Players (ref), u5 (copy), u1 (ref), StatusEffectUtil (ref), KnitClient (ref)
        if p6.statusEffect ~= StatusEffectType.GENERIC_SPEED_BOOST then
            return nil;
        end;

        local entityInstance = p6.entityInstance;
        local v7 = EntityUtil:getEntity(Players.LocalPlayer);

        if v7 ~= nil then
            v7 = v7:getInstance();
        end;

        if entityInstance ~= v7 then
            return nil;
        end;

        local v8 = u5.playerSpeedMaids[Players.LocalPlayer];

        if v8 then
            v8:DoCleaning();
        end;

        local v9 = u1.new();
        u5.playerSpeedMaids[Players.LocalPlayer] = v9;
        local v10 = StatusEffectUtil:getActive(p6.entityInstance, StatusEffectType.GENERIC_SPEED_BOOST);

        if v10 ~= nil then
            v10 = v10.extraNumbers;
        end;

        local v11 = (v10 == nil or #v10 < 1) and 1 or v10[1];
        v9:GiveTask((KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = v11
        })));
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(p12) -- Line: 69
        -- upvalues: StatusEffectType (ref), EntityUtil (ref), Players (ref), u5 (copy)
        if p12.statusEffect ~= StatusEffectType.GENERIC_SPEED_BOOST then
            return nil;
        end;

        local entityInstance = p12.entityInstance;
        local v13 = EntityUtil:getEntity(Players.LocalPlayer);

        if v13 ~= nil then
            v13 = v13:getInstance();
        end;

        if entityInstance ~= v13 then
            return nil;
        end;

        local v14 = u5.playerSpeedMaids[Players.LocalPlayer];

        if v14 then
            v14:DoCleaning();
            u5.playerSpeedMaids[Players.LocalPlayer] = nil;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;