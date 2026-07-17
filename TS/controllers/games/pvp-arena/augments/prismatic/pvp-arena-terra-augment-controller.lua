-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "PvPArenaTerraAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u1.__index = u1;

function u1.new(...) -- Line: 20
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 24
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy)
    PvPArenaBaseAugmentController.constructor(p3, PvPArenaAugmentType.TERRA_KICK);
    p3.Name = "PvPArenaTerraAugmentController";
end;

function u1.onActivated(p4) -- Line: 28
    -- upvalues: KnitClient (copy), AbilityId (copy), Players (copy), Flamework (copy), BedwarsImageId (copy)
    KnitClient.Controllers.PvpArenaAugmentAbilityController:registerAbilities({ AbilityId.BLOCK_STOMP, AbilityId.BLOCK_KICK });
    local v5 = KnitClient.Controllers.PvpArenaAugmentAbilityController:getAbilityType(AbilityId.BLOCK_STOMP);
    local u6 = KnitClient.Controllers.PvpArenaAugmentAbilityController:getAbilityType(AbilityId.BLOCK_KICK);

    if not (v5 and u6) then
        return nil;
    end;

    KnitClient.Controllers.BlockKickerKitController:add(Players.LocalPlayer);
    KnitClient.Controllers.BlockKickerKitController:initKit(Players.LocalPlayer);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.BLOCK_STOMP);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.BLOCK_KICK);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BLOCK_STOMP, {
        abilityButton = {
            icon = BedwarsImageId.BLOCK_STOMP
        },
        abilityType = v5
    }):andThen(function() -- Line: 45
        -- upvalues: Flamework (ref), AbilityId (ref), BedwarsImageId (ref), u6 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.BLOCK_KICK, {
            abilityButton = {
                icon = BedwarsImageId.BLOCK_KICK
            },
            abilityType = u6
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;