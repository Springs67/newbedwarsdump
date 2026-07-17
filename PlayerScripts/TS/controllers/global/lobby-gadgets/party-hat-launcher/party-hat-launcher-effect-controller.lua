-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local PlayerUtil = v1.PlayerUtil;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "PartyHatLauncherEffectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 30
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "PartyHatLauncherEffectController";
    p4.playerHatMap = {};
end;

function u2.KnitStart(u5) -- Line: 39
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), PlaceUtil (copy), KnitClient (copy), FireworkType (copy), SoundManager (copy), GameSound (copy), default (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), ItemType (copy), ReplicatedStorage (copy), WeldUtil (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.LocalProjectileImpact:connect(function(p6) -- Line: 41
        -- upvalues: PlaceUtil (ref), KnitClient (ref), FireworkType (ref), SoundManager (ref), GameSound (ref)
        if not PlaceUtil.isLobbyServer() then
            return nil;
        end;

        if p6.projectile.Name ~= "party_hat_missile" then
            return nil;
        end;

        KnitClient.Controllers.FireworkController:playFireworkEffect(p6.hitPosition, FireworkType.CONFETTI, {
            sizeMultiplier = 1,
            noSound = true
        });
        SoundManager:playSound(GameSound.CONFETTI, {
            volumeMultiplier = 0.8,
            rollOffMaxDistance = 1000,
            rollOffMinDistance = 200,
            position = p6.hitPosition
        });
        SoundManager:playSound(GameSound.CONFETTI_POPPER, {
            volumeMultiplier = 0.4,
            rollOffMaxDistance = 1000,
            rollOffMinDistance = 200,
            position = p6.hitPosition
        });
    end);
    default.Client:Get("PartyHatMissileHit"):Connect(function(p7) -- Line: 65
        -- upvalues: u5 (copy)
        u5:giveHat(p7.playerInRange, p7.hatAccessory);
    end);
    default.Client:Get("PartyHatSyncHats"):Connect(function(p8) -- Line: 68
        -- upvalues: u5 (copy)
        local function _(p9, p10) -- Line: 70
            -- upvalues: u5 (ref)
            u5:giveHat(p10, p9);
        end;

        for i, v in p8.playerHatMap do
            u5:giveHat(i, v);
        end;
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_SHOT), GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_RELOAD) }, function(p11, u12) -- Line: 78
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), EntityUtil (ref), ItemType (ref), ReplicatedStorage (ref), WeldUtil (ref)
        local Character = p11.Character;

        if not Character then
            return nil;
        end;

        local Animation = u12.Animation;

        if Animation ~= nil then
            Animation = Animation.AnimationId;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_SHOT) then
            local v13 = EntityUtil:getEntity(p11);

            if v13 ~= nil then
                v13 = v13:getHandItemInstanceFromCharacter();
            end;

            if v13 and v13.Name == ItemType.PARTY_HAT_LAUNCHER then
                v13.Handle.Missile.Transparency = 1;

                local function _(p14) -- Line: 98
                    if p14:IsA("ParticleEmitter") then
                        p14:Emit(5);
                    end;
                end;

                for i, descendant in v13:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit(5);
                    end;
                end;
            end;
        end;

        if Animation == GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_RELOAD) then
            local u15 = EntityUtil:getEntity(p11);

            if u15 ~= nil then
                u15 = u15:getHandItemInstanceFromCharacter();
            end;

            if u15 and u15.Name == ItemType.PARTY_HAT_LAUNCHER then
                u12:GetMarkerReachedSignal("grab_missile"):Connect(function() -- Line: 116
                    -- upvalues: ReplicatedStorage (ref), ItemType (ref), u12 (copy), u15 (copy), Character (copy), WeldUtil (ref)
                    local u16 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(ItemType.PARTY_HAT_MISSILE):Clone();
                    u12:GetMarkerReachedSignal("insert_missile"):Connect(function() -- Line: 118
                        -- upvalues: u16 (copy), u15 (ref)
                        u16:Destroy();

                        if u15.Parent and u15:FindFirstChild("Handle") then
                            u15.Handle.Missile.Transparency = 0;
                        end;
                    end);
                    local v17 = Character:FindFirstChildWhichIsA("Humanoid");

                    if v17 ~= nil then
                        v17:AddAccessory(u16);
                    end;

                    WeldUtil:weldCharacterAccessories(Character);
                end);
            end;
        end;
    end);
end;

function u2.giveHat(p18, p19, p20) -- Line: 135
    -- upvalues: PlayerUtil (copy), WeldUtil (copy)
    local v21 = p18.playerHatMap[p19] ~= nil and p18.playerHatMap[p19];

    if v21 then
        v21:Destroy();
    end;

    local v22 = PlayerUtil.waitForCharacter(p19);

    if not v22 then
        return nil;
    end;

    local v23 = p20:Clone();
    v23.Parent = v22;
    WeldUtil:weldAccessory(v22, v23);
    p18.playerHatMap[p19] = v23;
end;

KnitClient.CreateController(u2.new());

return nil;