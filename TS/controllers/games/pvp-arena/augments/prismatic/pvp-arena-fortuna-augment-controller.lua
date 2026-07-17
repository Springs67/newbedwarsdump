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
        return "PvpArenaFortunaAugmentController";
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
    PvPArenaBaseAugmentController.constructor(p3, PvPArenaAugmentType.FORTUNA);
    p3.Name = "PvpArenaFortunaAugmentController";
end;

function u1.onActivated(p4) -- Line: 28
    -- upvalues: KnitClient (copy), AbilityId (copy), Players (copy), Flamework (copy), BedwarsImageId (copy)
    KnitClient.Controllers.PvpArenaAugmentAbilityController:registerAbilities({ AbilityId.CARD_THROW, AbilityId.CARD_UPGRADES });
    local v5 = KnitClient.Controllers.PvpArenaAugmentAbilityController:getAbilityType(AbilityId.CARD_THROW);
    local u6 = KnitClient.Controllers.PvpArenaAugmentAbilityController:getAbilityType(AbilityId.CARD_UPGRADES);

    if not (v5 and u6) then
        return nil;
    end;

    KnitClient.Controllers.FortunaController:add(Players.LocalPlayer);
    KnitClient.Controllers.FortunaController:initKit(Players.LocalPlayer);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.CARD_THROW);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.CARD_UPGRADES);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CARD_THROW, {
        abilityButton = {
            icon = BedwarsImageId.CARD_THROW
        },
        abilityType = v5
    }):andThen(function() -- Line: 45
        -- upvalues: Flamework (ref), AbilityId (ref), BedwarsImageId (ref), u6 (copy)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CARD_UPGRADES, {
            abilityButton = {
                icon = BedwarsImageId.CARD_UPGRADE
            },
            abilityType = u6
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;