-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ExplosionType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local VehicleType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "UfoController";
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
    p6.Name = "UfoController";
end;

function u4.watchUfoVehicle(p7, p8) -- Line: 37
    -- upvalues: WatchCollectionTag (copy), u2 (copy), GameSound (copy), Players (copy), Workspace (copy), SoundManager (copy), TweenService (copy)
    WatchCollectionTag(p8, function(u9) -- Line: 38
        -- upvalues: u2 (ref), GameSound (ref), Players (ref), Workspace (ref), SoundManager (ref), TweenService (ref)
        if not u9.PrimaryPart then
            u9:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local u10 = u2("Sound", {
            Name = "HoverSound",
            Looped = true,
            Volume = 0.7,
            SoundId = GameSound.UFO_ENGINE_LOOP,
            Parent = u9.PrimaryPart
        });
        local u11 = u2("Sound", {
            Name = "AbducteeHeld",
            Looped = true,
            Volume = 1,
            SoundId = GameSound.UFO_HOLDING_ABDUCTEE,
            Parent = u9.PrimaryPart
        });
        local u12 = u2("Sound", {
            Name = "TractorBeamSound",
            Looped = true,
            Volume = 1.2,
            SoundId = GameSound.TRACTOR_BEAM_LOOP,
            Parent = u9.PrimaryPart
        });
        u10:Play();
        u9:GetAttributeChangedSignal("TractorBeamEnabled"):Connect(function() -- Line: 64
            -- upvalues: u9 (copy), u12 (copy)
            if u9:GetAttribute("TractorBeamEnabled") then
                u12:Play();

                return;
            end;

            u12:Pause();
        end);
        u9:GetAttributeChangedSignal("PlayerAbducted"):Connect(function() -- Line: 71
            -- upvalues: u9 (copy), Players (ref), Workspace (ref), u11 (copy)
            if u9:GetAttribute("PlayerAbducted") then
                local v13 = u9:GetAttribute("AbductedPlayerUserID");

                if v13 == Players.LocalPlayer.UserId then
                    Workspace.CurrentCamera.CameraSubject = u9.PrimaryPart;
                end;

                u11:Play();

                if v13 ~= 0 and (v13 == v13 and v13) then
                end;
            else
                u11:Pause();

                if u9:GetAttribute("AbductedPlayerUserID") == Players.LocalPlayer.UserId then
                    Workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character.Humanoid;
                end;
            end;
        end);

        local function u15() -- Line: 89
            -- upvalues: u9 (copy), SoundManager (ref), GameSound (ref), TweenService (ref), u10 (copy)
            local v14 = u9:GetAttribute("EngineOn");
            local SpinShell = u9.Root:WaitForChild("SpinShell", 1);

            if v14 == true then
                SpinShell:ApplyImpulse(Vector3.new(0, 5000, 5000));

                if SpinShell then
                    SpinShell.HingeConstraint.AngularVelocity = 2;
                end;

                SoundManager:playSound(GameSound.UFO_ENTER, {
                    rollOffMaxDistance = 300,
                    position = u9.Root.Position
                });
            else
                if SpinShell then
                    SpinShell.HingeConstraint.AngularVelocity = 0;
                end;

                SoundManager:playSound(GameSound.UFO_EXIT, {
                    rollOffMaxDistance = 300,
                    position = u9.Root.Position
                });
            end;

            TweenService:Create(u10, TweenInfo.new(0.7), {
                Volume = v14 == true and 0.6 or 0
            }):Play();
        end;

        u9:GetAttributeChangedSignal("EngineOn"):Connect(function() -- Line: 114
            -- upvalues: u15 (copy)
            u15();
        end);
        u15();
    end);
end;

function u4.KnitStart(p16) -- Line: 121
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), ExplosionType (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), VehicleType (copy)
    KnitController.KnitStart(p16);
    ClientSyncEvents.ExplosionEffect:connect(function(p17) -- Line: 123
        -- upvalues: ExplosionType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        if p17.explosionType == ExplosionType.UFO then
            local u18 = ReplicatedStorage.Assets.Effects.GuidedMissileExplosion:Clone();
            u18.Position = p17.position;
            u18.Parent = Workspace;
            u18.Debris1:Emit(5);
            u18.Debris2:Emit(5);
            u18.ExplosionFlames:Emit(50);
            SoundManager:playSound(GameSound.MINICOPTER_EXPLODE, {
                rollOffMaxDistance = 160,
                position = p17.position
            });
            task.delay(5, function() -- Line: 135
                -- upvalues: u18 (copy)
                u18:Destroy();
            end);
        end;
    end);
    p16:watchUfoVehicle(VehicleType.UFO);
end;

KnitClient.CreateController(u4.new());

return nil;