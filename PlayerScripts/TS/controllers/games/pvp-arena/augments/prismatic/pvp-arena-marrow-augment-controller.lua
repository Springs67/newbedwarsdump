-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local SkeletonKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "skeleton", "skeleton-kit-balance").SkeletonKitBalance;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PvPArenaBaseAugmentController = RuntimeLib.import(script, script.Parent.Parent.Parent, "pvp-arena-base-augment-controller").PvPArenaBaseAugmentController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "PvPArenaMarrowAugmentController";
    end,

    __index = PvPArenaBaseAugmentController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: PvPArenaBaseAugmentController (copy), PvPArenaAugmentType (copy), u2 (copy)
    PvPArenaBaseAugmentController.constructor(p6, PvPArenaAugmentType.MARROW);
    p6.Name = "PvPArenaMarrowAugmentController";
    p6.poisonStatusMaid = u2.new();
end;

function u4.onGameInit(u7) -- Line: 37
    -- upvalues: PvPArenaBaseAugmentController (copy), default (copy), Workspace (copy), ReplicatedStorage (copy), Players (copy), SkeletonKitBalance (copy), KnitClient2 (copy)
    PvPArenaBaseAugmentController.onGameInit(u7);
    default.Client:Get("SkeletonKit_SpawnPoisonCloud"):Connect(function(p8) -- Line: 40
        -- upvalues: Workspace (ref), ReplicatedStorage (ref)
        local v9 = p8.endServerTime - Workspace:GetServerTimeNow();

        if v9 <= 0 then
            return nil;
        end;

        local u10 = ReplicatedStorage.Assets.Effects.SkeletonKit_Smoke:Clone();
        u10:PivotTo(CFrame.new(p8.position));
        u10.Parent = Workspace;
        u10.Smoke:Emit(10);
        task.delay(v9, function() -- Line: 49
            -- upvalues: u10 (copy)
            u10:Destroy();
        end);
    end);
    default.Client:Get("SkeletonKit_PlayerEnteredPoisonCloud"):Connect(function(p11) -- Line: 54
        -- upvalues: Players (ref), u7 (copy), SkeletonKitBalance (ref), KnitClient2 (ref)
        if p11.player ~= Players.LocalPlayer then
            return nil;
        end;

        u7.poisonStatusMaid:DoCleaning();

        if SkeletonKitBalance.PoisonDisablesJump then
            u7.poisonStatusMaid:GiveTask(KnitClient2.Controllers.JumpHeightController:getJumpModifier():addModifier({
                jumpHeightMultiplier = 0,
                airJumps = 0
            }));
        end;

        if SkeletonKitBalance.PoisonDisablesSprint or SkeletonKitBalance.PoisonMoveSpeedMultiplier ~= 1 then
            u7.poisonStatusMaid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = SkeletonKitBalance.PoisonDisablesSprint,
                moveSpeedMultiplier = SkeletonKitBalance.PoisonMoveSpeedMultiplier
            }));
        end;
    end);
    default.Client:Get("SkeletonKit_PlayerExitedPoisonCloud"):Connect(function(p12) -- Line: 74
        -- upvalues: Players (ref), u7 (copy)
        if p12.player ~= Players.LocalPlayer then
            return nil;
        end;

        u7.poisonStatusMaid:DoCleaning();
    end);
end;

function u4.onActivated(p13) -- Line: 81
    -- upvalues: KnitClient (copy), AbilityId (copy), Flamework (copy), BedwarsImageId (copy)
    KnitClient.Controllers.PvpArenaAugmentAbilityController:registerAbilities({ AbilityId.SKELETON_ABILITY });
    local v14 = KnitClient.Controllers.PvpArenaAugmentAbilityController:getAbilityType(AbilityId.SKELETON_ABILITY);

    if not v14 then
        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.SKELETON_ABILITY);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SKELETON_ABILITY, {
        abilityType = v14,
        abilityButton = {
            icon = BedwarsImageId.SKELETON_KIT_ABILITY_ICON
        }
    });
end;

KnitClient.CreateController(u4.new());

return nil;