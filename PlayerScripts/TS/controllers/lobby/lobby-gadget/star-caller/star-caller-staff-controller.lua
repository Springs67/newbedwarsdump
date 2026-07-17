-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "StarCallerStaffController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 29
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p4);
    p4.Name = "StarCallerStaffController";
    p4.maid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), Players (copy), AbilityId (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    HandKnitController.KnitStart(p5);
    ClientSyncEvents.AbilityUsed:connect(function(p6) -- Line: 36
        -- upvalues: Players (ref), AbilityId (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        if p6.userCharacter == Players.LocalPlayer.Character and p6.ability == AbilityId.METEOR_SUMMON then
            local v7 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_BOSS_CAST));

            if v7 ~= nil then
                v7:AdjustSpeed(0.5);
            end;
        end;
    end);
end;

function u2.isRelevantItem(p8, p9) -- Line: 46
    -- upvalues: ItemType (copy)
    return p9.itemType == ItemType.METEOR_CALLER;
end;

function u2.onEnable(u10, p11, p12) -- Line: 49
    -- upvalues: Flamework (copy), AbilityId (copy), BedwarsImageId (copy)
    u10:setupYield(function() -- Line: 50
        -- upvalues: u10 (copy), Flamework (ref), AbilityId (ref), BedwarsImageId (ref)
        u10.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.METEOR_SUMMON, {
            abilityType = "ItemPrimary",
            abilityButton = {
                icon = BedwarsImageId.METEOR
            }
        }):expect());

        return function() -- Line: 57
            -- upvalues: u10 (ref)
            u10.maid:DoCleaning();
        end;
    end);
end;

function u2.onDisable(p13) -- Line: 62
    p13.maid:DoCleaning();
end;

KnitClient.CreateController(u2.new());

return nil;