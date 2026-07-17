-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CursedCoffinBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cursed-coffin-balance").CursedCoffinBalance;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PartFollowUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "part-follow-util").PartFollowUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "CursedCoffinController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 37
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 41
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "CursedCoffinController";
    p7.playersWithCoffin = {};
end;

function u5.KnitStart(u8) -- Line: 46
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), SyncEventPriority (copy), ItemType (copy), BlockEngine (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), WatchCollectionTag (copy), default (copy)
    KnitController.KnitStart(u8);
    ClientSyncEvents.PlaceBlock:setPriority(SyncEventPriority.HIGHEST):connect(function(p9) -- Line: 49
        -- upvalues: ItemType (ref), BlockEngine (ref)
        if p9.blockType ~= ItemType.CURSED_COFFIN then
            return nil;
        end;

        local v10 = BlockEngine:getStore():getBlockAt(p9.blockPosition - Vector3.new(0, 1, 0));
        local v11 = BlockEngine:getStore():getBlockAt(p9.blockPosition - Vector3.new(1, 0, 0));

        if not v10 then
            p9:setCancelled(true);

            return nil;
        end;

        if v11 then
            p9:setCancelled(true);

            return nil;
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("cursed-coffin"):Connect(function(p12) -- Line: 70
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.CURSED_COFFIN_DESTROY, {
            position = p12.Position
        });
    end);
    WatchCollectionTag("cursed-coffin", function(u13) -- Line: 77
        -- upvalues: u8 (copy)
        if not u8:isClientPrediction(u13) then
            local u14 = nil;
            u14 = u13.Destroying:Connect(function() -- Line: 80
                -- upvalues: u8 (ref), u13 (copy), u14 (ref)
                u8:playCoffinDestroyEffect(u13);
                u14:Disconnect();
            end);
        end;
    end);
    default.Client:OnEvent("CursedCoffinPlayRespawnAnimation", function(p15) -- Line: 86
        -- upvalues: u8 (copy)
        u8:playCoffinRespawnAnimation(p15.coffin);
    end);
    default.Client:OnEvent("CursedCoffinPlaceEvent", function(p16) -- Line: 89
        -- upvalues: u8 (copy)
        u8:playCoffinActivateEffect(p16.player);
    end);
    default.Client:OnEvent("CursedCoffinBreakEvent", function(p17) -- Line: 92
        -- upvalues: u8 (copy)
        u8:playCoffinDeactivateEffect(p17.player, p17.coffinInstance);
    end);
    default.Client:OnEvent("CursedCoffinValidateMap", function(p18) -- Line: 95
        -- upvalues: u8 (copy)
        if p18.shouldDelete then
            u8.playersWithCoffin[p18.player] = nil;

            return;
        end;

        u8.playersWithCoffin[p18.player] = true;
    end);
end;

function u5.playCoffinActivateEffect(p19, p20) -- Line: 107
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), PartFollowUtil (copy), SoundManager (copy), GameSound (copy), CursedCoffinBalance (copy)
    local Character = p20.Character;

    if not Character then
        return nil;
    end;

    local u21 = ReplicatedStorage.Assets.Effects.CursedCoffinEffect:Clone();

    if not p20.Character then
        return nil;
    end;

    u21.Parent = Workspace;
    u21.Massless = true;
    u21.CFrame = Character.HumanoidRootPart.CFrame;
    PartFollowUtil.startFollowing(u21, Character.HumanoidRootPart, Vector3.new(0, 0, 0), true);
    SoundManager:playSound(GameSound.CURSED_COFFIN_ACTIVATE, {});
    task.delay(CursedCoffinBalance.VAMPIRISM_EFFECT_ANIMATION_DURATION, function() -- Line: 125
        -- upvalues: u21 (copy)
        u21:Destroy();
    end);
end;

function u5.playCoffinDeactivateEffect(p22, p23, p24) -- Line: 129
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), PartFollowUtil (copy), SoundManager (copy), GameSound (copy), Players (copy), CursedCoffinBalance (copy), KnitClient2 (copy)
    local Character = p23.Character;

    if not Character then
        return nil;
    end;

    local u25 = ReplicatedStorage.Assets.Effects.CursedCoffinEffect:Clone();

    if not p23.Character then
        return nil;
    end;

    u25.Parent = Workspace;
    u25.Massless = true;
    u25.CFrame = Character.HumanoidRootPart.CFrame;
    PartFollowUtil.startFollowing(u25, Character.HumanoidRootPart, Vector3.new(0, 0, 0), true);
    SoundManager:playSound(GameSound.CURSED_COFFIN_DEACTIVATE, {});
    local v26 = p24:GetAttribute("PlacedByUserId");

    if v26 == 0 or (v26 ~= v26 or not v26) then
        return nil;
    end;

    local u27 = Players:GetPlayerByUserId(v26);
    task.delay(CursedCoffinBalance.VAMPIRISM_EFFECT_ANIMATION_DURATION, function() -- Line: 151
        -- upvalues: Players (ref), u27 (copy), KnitClient2 (ref), ReplicatedStorage (ref), u25 (copy)
        if Players.LocalPlayer == u27 then
            KnitClient2.Controllers.ScreenParticlesController:emitParticlesOnScreen({
                cleanupAfter = 1,
                particleEmitter = { ReplicatedStorage.Assets.Effects.BedBreakParticles }
            });
        end;

        u25:Destroy();
    end);
end;

function u5.playCoffinDestroyEffect(p28, p29) -- Line: 161
    -- upvalues: BlockEngine (copy), ItemType (copy), Workspace (copy), GameQueryUtil (copy), KnitClient (copy)
    local v30 = BlockEngine:getHandlerRegistry():getHandler(ItemType.CURSED_COFFIN);
    local u31 = BlockEngine:getBlockPosition(p29.Position);
    local u32 = u31 + Vector3.new(0, 0, -1);
    local u33 = v30:place(u31, 0);
    u33.CanCollide = false;
    u33.CanQuery = false;
    u33.CastShadow = false;
    u33.Parent = Workspace;
    local v34 = u33:GetDescendants();

    local function v37(u35, p36) -- Line: 175
        -- upvalues: GameQueryUtil (ref)
        if u35:IsA("BasePart") then
            u35.Anchored = false;
            u35.CanCollide = true;
            u35.CollisionGroup = "Players";
            GameQueryUtil:setQueryIgnored(u35, true);
            task.delay(0.01 * p36, function() -- Line: 181
                -- upvalues: u35 (copy)
                return u35:Destroy();
            end);
        end;
    end;

    for i, v in v34 do
        v37(v, i - 1, v34);
    end;

    task.delay(0.25, function() -- Line: 190
        -- upvalues: KnitClient (ref), u33 (copy), ItemType (ref), u31 (copy), u32 (copy)
        local v38 = false;
        local v39 = 0;

        while true do
            if v38 then
                v39 = v39 + 1;
            else
                v38 = true;
            end;

            if v39 >= 20 then
                u33:Destroy();

                return;
            end;

            if v39 % 2 == 0 then
                KnitClient.Controllers.BlockDebrisController:convertBlockToDebris(u33, ItemType.CURSED_COFFIN, u31, Vector3.new(0, 0.4, 0), v39);
            else
                KnitClient.Controllers.BlockDebrisController:convertBlockToDebris(u33, ItemType.CURSED_COFFIN, u32, Vector3.new(0, 0.4, 0), v39);
            end;
        end;
    end);
end;

function u5.playCoffinRespawnAnimation(p40, p41) -- Line: 213
    -- upvalues: u3 (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p41 ~= nil then
        p41 = p41:FindFirstChild("Rig");

        if p41 ~= nil then
            p41 = p41:FindFirstChild("AnimationController");
        end;
    end;

    if not p41 then
        return nil;
    end;

    local v42;

    if p41 == nil then
        v42 = p41;
    else
        v42 = p41:FindFirstChild("Animator");
    end;

    local v43 = v42 or u3("Animator", {
        Parent = p41
    });

    if v43 then
        GameAnimationUtil:playAnimation(v43, AnimationType.CURSED_COFFIN_RESPAWN);
    end;
end;

function u5.isClientPrediction(p44, p45) -- Line: 239
    return p45:GetAttribute("ClientPlaced");
end;

function u5.playerHasCursedCoffin(p46, p47) -- Line: 242
    return p46.playersWithCoffin[p47] ~= nil;
end;

KnitClient.CreateController(u5.new());

return nil;