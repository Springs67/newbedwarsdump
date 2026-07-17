-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local getGuidedProjectileTypeByEncoding = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "encoding", "projectile-type-encoding").getGuidedProjectileTypeByEncoding;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "GuidedMissileController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "GuidedMissileController";
    p4.jumping = Instance.new("BoolValue");
end;

function u2.KnitStart(p5) -- Line: 33
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), EntityDamageEventZap (copy), Players (copy), getGuidedProjectileTypeByEncoding (copy)
    KnitController.KnitStart(p5);
    ClientSyncEvents.GuidedProjectileDetonated:connect(function(p6) -- Line: 35
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        if p6.guidedProjectileType == "guided_missile" then
            local u7 = ReplicatedStorage.Assets.Effects.GuidedMissileExplosion:Clone();
            u7.Position = p6.position;
            u7.Parent = Workspace;
            u7.Debris1:Emit(5);
            u7.Debris2:Emit(5);
            u7.ExplosionFlames:Emit(50);
            SoundManager:playSound(GameSound.GUIDED_MISSILE_EXPLOSION, {
                rollOffMaxDistance = 160,
                position = p6.position
            });
            task.delay(5, function() -- Line: 47
                -- upvalues: u7 (copy)
                u7:Destroy();
            end);
        end;
    end);
    EntityDamageEventZap.On(function(p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21) -- Line: 52
        -- upvalues: Players (ref), getGuidedProjectileTypeByEncoding (ref), SoundManager (ref), GameSound (ref)
        if p8.PrimaryPart and p12 then
            local v22 = Players:GetPlayerFromCharacter(p12) == Players.LocalPlayer;

            if v22 then
                if p15 == nil then
                    v22 = p15;
                else
                    v22 = p15.guidedProjectile;
                end;
            end;

            if v22 ~= 0 and (v22 == v22 and (v22 and getGuidedProjectileTypeByEncoding(p15.guidedProjectile) == "guided_missile")) then
                SoundManager:playSound(GameSound.ARROW_HIT, {
                    volumeMultiplier = 0.3,
                    rollOffMaxDistance = 150,
                    position = p8.PrimaryPart.Position
                });
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;