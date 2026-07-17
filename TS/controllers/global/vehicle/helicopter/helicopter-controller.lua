-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local HelicopterMissile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "helicopter", "helicopter-missile").HelicopterMissile;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "HelicopterController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "HelicopterController";
end;

function u4.watchHelicopterVehicle(p7, p8) -- Line: 37
    -- upvalues: WatchCollectionTag (copy), u2 (copy), GameSound (copy), SoundManager (copy), TweenService (copy)
    WatchCollectionTag(p8, function(u9) -- Line: 38
        -- upvalues: u2 (ref), GameSound (ref), SoundManager (ref), TweenService (ref)
        if not u9.PrimaryPart then
            u9:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local u10 = u2("Sound", {
            Name = "HoverSound",
            Looped = true,
            Volume = 0.2,
            SoundId = GameSound.MINICOPTER_LOOP,
            Parent = u9.PrimaryPart
        });
        u10:Play();

        local function u12() -- Line: 50
            -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref), TweenService (ref), u10 (copy)
            local v11 = u9:GetAttribute("EngineOn");

            if v11 == true then
                local Propeller = u9.Root:WaitForChild("Propeller", 1);
                local BackPropeller = u9.Root:WaitForChild("BackPropeller", 1);

                if Propeller then
                    Propeller.HingeConstraint.AngularVelocity = 42;
                end;

                if BackPropeller then
                    BackPropeller.HingeConstraint.AngularVelocity = 42;
                end;

                SoundManager:playSound(GameSound.MINICOPTER_START, {
                    rollOffMaxDistance = 300,
                    position = u9.Root.Position
                });
            else
                local Propeller = u9.Root:WaitForChild("Propeller", 1);
                local BackPropeller = u9.Root:WaitForChild("BackPropeller", 1);

                if Propeller then
                    Propeller.HingeConstraint.AngularVelocity = 0;
                end;

                if BackPropeller then
                    BackPropeller.HingeConstraint.AngularVelocity = 0;
                end;

                SoundManager:playSound(GameSound.MINICOPTER_STOP, {
                    rollOffMaxDistance = 300,
                    position = u9.Root.Position
                });
            end;

            TweenService:Create(u10, TweenInfo.new(0.6), {
                Volume = v11 == true and 0.5 or 0
            }):Play();
        end;

        u9:GetAttributeChangedSignal("EngineOn"):Connect(function() -- Line: 83
            -- upvalues: u12 (copy)
            u12();
        end);
        u12();
    end);
end;

function u4.KnitStart(p13) -- Line: 89
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ExplosionType (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), VehicleType (copy), default (copy), HelicopterMissile (copy)
    KnitController.KnitStart(p13);
    ClientSyncEvents.ExplosionEffect:connect(function(p14) -- Line: 91
        -- upvalues: ExplosionType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        if p14.explosionType == ExplosionType.HELICOPTER then
            local u15 = ReplicatedStorage.Assets.Effects.GuidedMissileExplosion:Clone();
            u15.Position = p14.position;
            u15.Parent = Workspace;
            u15.Debris1:Emit(5);
            u15.Debris2:Emit(5);
            u15.ExplosionFlames:Emit(50);
            SoundManager:playSound(GameSound.MINICOPTER_EXPLODE, {
                rollOffMaxDistance = 160,
                position = p14.position
            });
            task.delay(5, function() -- Line: 103
                -- upvalues: u15 (copy)
                u15:Destroy();
            end);
        end;
    end);
    p13:watchHelicopterVehicle(VehicleType.MINICOPTER);
    p13:watchHelicopterVehicle(VehicleType.ATTACK_HELI);
    default.Client:GetNamespace("Helicopter"):Get("ReplicateMissile"):Connect(function(p16, p17, p18, p19) -- Line: 112
        -- upvalues: HelicopterMissile (ref)
        HelicopterMissile.new(p17, p18, p16):fire(p19, function() -- Line: 114
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;