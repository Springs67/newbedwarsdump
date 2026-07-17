-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnnouncementVariant = v1.AnnouncementVariant;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v4.Lighting;
local Players = v4.Players;
local RunService = v4.RunService;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local u5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local CircleCountdownAnnouncement = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "components", "circle-countdown-announcement").CircleCountdownAnnouncement;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BattleRoyaleZoneMinimapGUI = RuntimeLib.import(script, script.Parent, "battle-royale-zone-minimap-gui").BattleRoyaleZoneMinimapGUI;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "BattleRoyaleZoneController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 31
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 35
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p8, { GameType.BATTLE_ROYALE });
    p8.Name = "BattleRoyaleZoneController";
    p8.worldSize = Vector3.new(0, 0, 0);
    p8.centerWorldPosition = Vector3.new(0, 0, 0);
    p8.nextZonePosition = Vector3.new(0, 0, 0);
    p8.nextZoneSize = Vector3.new(0, 0, 0);
    p8.cameraEffectsActive = false;
    p8.instancesAlreadyHighlighted = {};
    p8.alreadyInitializedHighlightSystem = false;
end;

function u6.KnitStart(u9) -- Line: 46
    -- upvalues: GameKnitController (copy), default (copy)
    GameKnitController.KnitStart(u9);
    default.Client:Get("BattleRoyaleSetupZoneFromServer"):Connect(function(p10) -- Line: 49
        -- upvalues: u9 (copy)
        u9.zone = p10.zone;
        u9.worldSize = p10.worldSize;
        u9.centerWorldPosition = p10.centerWorldPosition;
        u9:processZoneCameraEffects();
        task.spawn(function() -- Line: 54
            -- upvalues: u9 (ref)
            u9:mountMinimapGui();
        end);
    end);
    default.Client:Get("BattleRoyaleNextZoneFromServer"):Connect(function(p11) -- Line: 58
        -- upvalues: u9 (copy)
        u9.nextZonePosition = p11.nextZonePosition;
        u9.nextZoneSize = p11.nextZoneSize;
    end);
end;

function u6.onGameInit(u12) -- Line: 63
    -- upvalues: Flamework (copy), AnnouncementVariant (copy), CircleCountdownAnnouncement (copy), Players (copy), KnitClient (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/announcement/announcement-controller@AnnouncementController"):setDefaultUI(AnnouncementVariant.countdown.type, CircleCountdownAnnouncement);
    Players.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 67
        -- upvalues: u12 (copy), KnitClient (ref)
        if u12.alreadyInitializedHighlightSystem then
            return nil;
        end;

        u12.alreadyInitializedHighlightSystem = true;
        KnitClient.Controllers.TeammateHighlightController:setupTeamHighlightSystem();
    end);
end;

function u6.mountMinimapGui(p13) -- Line: 75
    -- upvalues: u5 (copy), u3 (copy), BattleRoyaleZoneMinimapGUI (copy), Players (copy)
    local v14 = u5.ViewSizeX();
    local v15 = math.min(v14, u5.ViewSizeY()) * 0.2;
    u3.mount(u3.createElement(BattleRoyaleZoneMinimapGUI, {
        WorldSize = p13.worldSize,
        CenterWorldPosition = p13.centerWorldPosition,
        MinimapWidth = v15,
        Zone = p13.zone
    }), Players.LocalPlayer:WaitForChild("PlayerGui"), "BRZoneTree");
end;

function u6.processZoneCameraEffects(u16) -- Line: 86
    -- upvalues: RunService (copy), u2 (copy), Lighting (copy), Players (copy), SoundManager (copy), GameSound (copy)
    RunService.Heartbeat:Connect(function() -- Line: 87
        -- upvalues: u16 (copy), u2 (ref), Lighting (ref), Players (ref), SoundManager (ref), GameSound (ref)
        local CurrentCamera = game.Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.Position;
        end;

        if not CurrentCamera then
            return nil;
        end;

        if u16:isPositionInSafeZone(CurrentCamera) and u16.cameraEffectsActive then
            u16.cameraEffectsActive = false;

            if u16.colorCorrectionEffect then
                u16.colorCorrectionEffect:Destroy();
            end;

            return nil;
        end;

        if not (u16:isPositionInSafeZone(CurrentCamera) or u16.cameraEffectsActive) then
            u16.cameraEffectsActive = true;
            u16.colorCorrectionEffect = u2("ColorCorrectionEffect", {
                Name = "BattleRoyaleStormColorCorrectionEffect",
                Enabled = true,
                TintColor = Color3.fromRGB(186, 64, 71),
                Parent = Lighting
            });

            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.Position;
            end;
        end;

        if Character then
            local v17 = u16.zone.Size / 2;
            local v18 = u16.zone.Position.X + v17.X;
            local v19 = u16.zone.Position.Z - v17.Z;
            local v20 = u16.zone.Position.Z + v17.Z;
            local v21 = math.abs(Character.X - (u16.zone.Position.X - v17.X));
            local v22 = math.abs(Character.X - v18);
            local v23 = math.min(v21, v22);
            local v24 = math.abs(Character.Z - v19);
            local v25 = math.abs(Character.Z - v20);
            local v26 = math.min(v24, v25);
            local v27 = math.min((1 / 0), v23);
            local v28 = math.min(v27, v26);

            if u16.stormEdgeSound == nil then
                u16.stormEdgeSound = SoundManager:playModifiableSound(GameSound.STORM_EDGE, {
                    looped = true
                });
            end;

            local v29 = math.clamp(1 - v28 / 400, 0, 1) * 1;
            u16.stormEdgeSound.Volume = v29;

            if u16:isPositionInSafeZone(Character) then
                if u16.inStormSound ~= nil then
                    u16.inStormSound:Pause();
                end;
            else
                if u16.inStormSound == nil then
                    u16.inStormSound = SoundManager:playModifiableSound(GameSound.STORM_INSIDE, {
                        looped = true,
                        volumeMultiplier = 1.5
                    });

                    return;
                end;

                u16.inStormSound:Play();
            end;
        end;
    end);
end;

function u6.isPositionInSafeZone(p30, p31) -- Line: 164
    local v32 = p30.zone.Size / 2;
    local v33 = p30.zone.Position.Z + v32.Z;
    local v34;

    if p30.zone.Position.X - v32.X <= p31.X and (p31.X <= p30.zone.Position.X + v32.X and (p30.zone.Position.Y - v32.Y <= p31.Y and (p31.Y <= p30.zone.Position.Y + v32.Y and p30.zone.Position.Z - v32.Z <= p31.Z))) then
        v34 = p31.Z <= v33;
    else
        v34 = false;
    end;

    return v34;
end;

KnitClient.CreateController(u6.new());

return nil;