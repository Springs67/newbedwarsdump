-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "FireworkRocketLauncherEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "FireworkRocketLauncherEffectController";
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), PlaceUtil (copy), u2 (copy), FireworkType (copy), KnitClient (copy), RandomUtil (copy), ExplosionType (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), EntityUtil (copy), ItemType (copy), ReplicatedStorage (copy), WeldUtil (copy)
    KnitController.KnitStart(p6);
    ClientSyncEvents.LocalProjectileImpact:connect(function(p7) -- Line: 40
        -- upvalues: PlaceUtil (ref), u2 (ref), FireworkType (ref), KnitClient (ref), RandomUtil (ref)
        if not PlaceUtil.isLobbyServer() then
            return nil;
        end;

        if p7.projectile.Name ~= "firework_rocket_missile" then
            return nil;
        end;

        local v8 = u2.values(FireworkType);
        KnitClient.Controllers.FireworkController:playFireworkEffect(p7.hitPosition, RandomUtil.fromList(unpack(v8)), {
            sizeMultiplier = 1,
            volumeMultiplier = 0.8
        });
    end);
    ClientSyncEvents.ExplosionEffect:connect(function(p9) -- Line: 54
        -- upvalues: ExplosionType (ref), PlaceUtil (ref), u2 (ref), FireworkType (ref), KnitClient (ref), RandomUtil (ref)
        if p9.explosionType == ExplosionType.FIREWORK_ROCKET and PlaceUtil.isGameServer() then
            local v10 = u2.values(FireworkType);
            KnitClient.Controllers.FireworkController:playFireworkEffect(p9.position, RandomUtil.fromList(unpack(v10)), {
                sizeMultiplier = 1.2,
                volumeMultiplier = 0.8
            });
        end;
    end);
    WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_SHOT), GameAnimationUtil:getAssetId(AnimationType.ROCKET_LAUNCHER_RELOAD) }, function(p11, u12) -- Line: 64
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

            if v13 and v13.Name == ItemType.FIREWORK_ROCKET_LAUNCHER then
                v13.Handle.Missile.Transparency = 1;

                local function _(p14) -- Line: 84
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

            if u15 and u15.Name == ItemType.FIREWORK_ROCKET_LAUNCHER then
                u12:GetMarkerReachedSignal("grab_missile"):Connect(function() -- Line: 102
                    -- upvalues: ReplicatedStorage (ref), ItemType (ref), u12 (copy), u15 (copy), Character (copy), WeldUtil (ref)
                    local u16 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(ItemType.FIREWORK_ROCKET_MISSILE):Clone();
                    u12:GetMarkerReachedSignal("insert_missile"):Connect(function() -- Line: 104
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

KnitClient.CreateController(u3.new());

return nil;