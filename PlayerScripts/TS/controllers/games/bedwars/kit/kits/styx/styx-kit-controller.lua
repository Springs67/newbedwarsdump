-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local StyxKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "styx", "styx-kit-balance").StyxKitBalance;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 36, Name: __tostring
        return "StyxKitController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 42
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 46
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u3 (copy), u6 (copy)
    BaseKitController.constructor(p9, BedwarsKit.STYX);
    p9.Name = "StyxKitController";
    p9.culledParts = {};
    p9.entrancePortals = {};
    p9.exitPortals = {};
    p9.ghostStateMaid = u3.new();
    p9.initialCameraMinZoom = 0;
    p9.initialCameraMaxZoom = 0;
    p9.entrancePortalDoorClosedXPosition = 0.8;
    p9.entrancePortalDoorOpenXPosition = 2;
    p9.exitPortalDoorOpenXPosition = 1.8;
    p9.exitPortalCooldownSignal = u6.new();
end;

function u7.onKitLocalActivated(p10, p11) -- Line: 60
    -- upvalues: u4 (copy), Lighting (copy), Players (copy)
    p10.colorCorrectionEffect = u4("ColorCorrectionEffect", {
        Name = "StyxColorCorrectionEffect",
        Saturation = -0.3,
        Enabled = false,
        TintColor = Color3.fromRGB(87, 255, 219),
        Parent = Lighting
    });
    p11:GiveTask(p10.colorCorrectionEffect);
    p10.initialCameraMinZoom = 0;
    p10.initialCameraMaxZoom = Players.LocalPlayer.CameraMaxZoomDistance;
end;

function u7.onKitLocalDeactivated(p12) -- Line: 76
end;

function u7.onKitReplicationActivated(u13, p14) -- Line: 78
    -- upvalues: default2 (copy), Players (copy), KnitClient2 (copy), DeviceUtil (copy), KnitClient (copy), BedwarsKit (copy), BlockEngine (copy), ReplicatedStorage (copy), Workspace (copy), StyxKitBalance (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), u4 (copy), SoundManager (copy), GameSound (copy), ClientStore (copy), default (copy), Linear (copy), RunService (copy)
    p14:GiveTask(default2.Client:Get("StyxSpawnEntrancePortalFromServer"):Connect(function(u15) -- Line: 80
        -- upvalues: u13 (copy), Players (ref), KnitClient2 (ref), DeviceUtil (ref)
        u15.entrancePortalData.blockPosition = u15.entrancePortalData.blockPosition;
        table.insert(u13.entrancePortals, u15.entrancePortalData);

        if u15.entrancePortalData.player == Players.LocalPlayer then
            local exitPortals = u13.exitPortals;

            local function v19(u16) -- Line: 88
                -- upvalues: u15 (copy), KnitClient2 (ref), DeviceUtil (ref), u13 (ref)
                if u16.killingTeamId == u15.entrancePortalData.teamId and u16.proximityPrompt then
                    u16.proximityPrompt:Destroy();
                    u16.proximityPrompt = nil;
                    local v17 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                        ObjectText = "Styx\'s Exit Portal",
                        ActionText = "Connect",
                        AutoLocalize = false,
                        RequiresLineOfSight = false,
                        MaxActivationDistance = 10,
                        ClickablePrompt = DeviceUtil.isMobileControls(),
                        KeyboardKeyCode = Enum.KeyCode.F,
                        Parent = u16.promptParent
                    });

                    if not v17 then
                        return nil;
                    end;

                    u16.proximityPrompt = v17;
                    v17.Triggered:Connect(function(p18) -- Line: 107
                        -- upvalues: u13 (ref), u16 (copy)
                        u13:tryOpenExitPortal(u16);
                    end);
                end;
            end;

            for i, v in exitPortals do
                v19(v, i - 1, exitPortals);
            end;
        end;
    end));
    p14:GiveTask(default2.Client:Get("StyxSpawnExitPortalFromServer"):Connect(function(p20) -- Line: 119
        -- upvalues: KnitClient (ref), Players (ref), BedwarsKit (ref), u13 (copy)
        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.STYX) then
            return nil;
        end;

        u13:spawnExitPortal(p20.exitPortalData, true);
    end));
    p14:GiveTask(default2.Client:Get("StyxDespawnExitPortalFromServer"):Connect(function(u21) -- Line: 127
        -- upvalues: u13 (copy)
        local function _(p22) -- Line: 130
            -- upvalues: u21 (copy)
            return p22.uuid == u21.exitPortalData.uuid;
        end;

        local v23 = nil;

        for i, v in u13.exitPortals do
            local _ = i - 1;

            if v.uuid == u21.exitPortalData.uuid == true then
                v23 = v;
                break;
            end;
        end;

        if not v23 then
            return nil;
        end;

        u13:despawnExitPortal(v23, u21.lastTeleportEndTime);
    end));
    p14:GiveTask(default2.Client:Get("StyxOpenExitPortalFromServer"):Connect(function(u24) -- Line: 149
        -- upvalues: u13 (copy), BlockEngine (ref), ReplicatedStorage (ref), Workspace (ref), KnitClient (ref), Players (ref), KnitClient2 (ref), StyxKitBalance (ref), DeviceUtil (ref)
        local function _(p25) -- Line: 152
            -- upvalues: u24 (copy)
            return p25.uuid == u24.exitPortalData.uuid;
        end;

        local v26 = nil;

        for i, v in u13.exitPortals do
            local _ = i - 1;

            if v.uuid == u24.exitPortalData.uuid == true then
                v26 = v;
                break;
            end;
        end;

        local v27 = v26 or u13:spawnExitPortal(u24.exitPortalData, false);

        if not v27 then
            return nil;
        end;

        v27.connectedEntrancePortalUUID = u24.exitPortalData.connectedEntrancePortalUUID;

        local function _(p28) -- Line: 175
            -- upvalues: u24 (copy)
            return p28.uuid == u24.exitPortalData.uuid;
        end;

        local v29 = nil;

        for i, v in u13.exitPortals do
            local _ = i - 1;

            if v.uuid == u24.exitPortalData.uuid == true then
                v29 = v;
                break;
            end;
        end;

        local connectedEntrancePortalUUID = u24.exitPortalData.connectedEntrancePortalUUID;

        if connectedEntrancePortalUUID == "" or not connectedEntrancePortalUUID then
            return nil;
        end;

        local function _(p30) -- Line: 194
            -- upvalues: u24 (copy)
            return p30.uuid == u24.exitPortalData.connectedEntrancePortalUUID;
        end;

        local u31 = nil;

        for i, v in u13.entrancePortals do
            local _ = i - 1;

            if v.uuid == u24.exitPortalData.connectedEntrancePortalUUID == true then
                u31 = v;
                break;
            end;
        end;

        if not u31 then
            return nil;
        end;

        local v32 = BlockEngine:getStore():getBlockAt(u31.blockPosition);

        if v32 then
            if u31.whirpoolSpinHeartbeatConnection then
                u31.whirpoolSpinHeartbeatConnection:Disconnect();
            end;

            local v33 = u13:openEntrancePortalVisuals(v32, u31);

            if v33 then
                u31.whirpoolSpinHeartbeatConnection = v33;
            end;
        end;

        if v27.model then
            if v27.whirpoolSpinHeartbeatConnection then
                v27.whirpoolSpinHeartbeatConnection:Disconnect();
            end;

            local v34 = u13:openExitPortalVisuals(v27.model, v27);

            if v34 then
                v27.whirpoolSpinHeartbeatConnection = v34;
            end;
        end;

        local worldPosition = u31.worldPosition;
        local model = v27.model;

        if model ~= nil then
            model = model:GetPivot().Position;
        end;

        if model then
            local v35 = ReplicatedStorage.Assets.Misc.StyxPortalBeam:Clone();
            v35.Parent = Workspace;
            v35.BeamPoint1:PivotTo(CFrame.new(worldPosition));
            v35.BeamPoint2:PivotTo(CFrame.new(model));
            u31.beam = v35;
            v27.beam = v35;
        end;

        local killingTeamId = u24.exitPortalData.killingTeamId;
        local v36 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

        if v36 ~= nil then
            v36 = v36.id;
        end;

        if killingTeamId ~= v36 then
            return nil;
        end;

        local v37 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ActionText = "Teleport",
            AutoLocalize = false,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ObjectText = "Styx\'s Portal\n" .. tostring(StyxKitBalance.PORTAL_USE_COUNT_MAX) .. "/" .. tostring(StyxKitBalance.PORTAL_USE_COUNT_MAX) .. " uses remaining",
            ClickablePrompt = DeviceUtil.isMobileControls(),
            KeyboardKeyCode = Enum.KeyCode.F,
            Parent = u24.exitPortalData.connectedEntrancePortalBlock
        });

        if not v37 then
            return nil;
        end;

        u31.proximityPrompt = v37;
        v37.Triggered:Connect(function(p38) -- Line: 271
            -- upvalues: u13 (ref), u31 (copy)
            u13:tryUseEntrancePortal(u31);
        end);

        if v27.proximityPrompt then
            v27.proximityPrompt:Destroy();
            v27.proximityPrompt = nil;
        end;
    end));
    p14:GiveTask(default2.Client:Get("UseStyxPortalFromServer"):Connect(function(u39) -- Line: 281
        -- upvalues: EntityUtil (ref), RuntimeLib (ref), PlayerEntity (ref), u13 (copy), BlockEngine (ref), StyxKitBalance (ref), u4 (ref), Workspace (ref), SoundManager (ref), GameSound (ref), Players (ref), ClientStore (ref), default (ref), Linear (ref)
        local player = u39.player;

        if not player then
            return nil;
        end;

        local v40 = EntityUtil:getEntity(player);

        if not v40 then
            return nil;
        end;

        if not RuntimeLib.instanceof(v40, PlayerEntity) then
            return nil;
        end;

        local Character = player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        local function _(p41) -- Line: 303
            -- upvalues: u39 (copy)
            return u39.entrancePortalData.uuid == p41.uuid;
        end;

        local v42 = nil;

        for i, v in u13.entrancePortals do
            local _ = i - 1;

            if u39.entrancePortalData.uuid == v.uuid == true then
                v42 = v;
                break;
            end;
        end;

        if v42 then
            local proximityPrompt = v42.proximityPrompt;

            if u39.usesRemaining <= 0 then
                local v43 = BlockEngine:getStore():getBlockAt(v42.blockPosition);

                if v43 then
                    u13:closeEntrancePortalVisuals(v43, v42.whirpoolSpinHeartbeatConnection, v42, v42.proximityPrompt);
                end;
            elseif proximityPrompt then
                proximityPrompt.ObjectText = "Styx\'s Portal\n" .. tostring(u39.usesRemaining) .. "/" .. tostring(StyxKitBalance.PORTAL_USE_COUNT_MAX) .. " uses remaining";
            end;
        end;

        local u44 = u4("Part", {
            Size = Vector3.new(1, 1, 1),
            Anchored = true,
            CanCollide = false,
            Transparency = 1,
            CFrame = CFrame.new(u39.startPosition),
            Parent = Workspace
        });
        local v45 = SoundManager:playSound(GameSound.UMBRA_TELEPORT_LOOP, {
            rollOffMaxDistance = 120,
            rollOffMinDistance = 50,
            looped = true,
            volumeMultiplier = 2,
            parent = u44
        });

        if player == Players.LocalPlayer then
            local CurrentCamera = Workspace.CurrentCamera;

            if u44 and CurrentCamera then
                CurrentCamera.CameraSubject = u44;
            end;

            if u44 then
                u44.Anchored = true;
            end;

            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = false
            });

            if u13.colorCorrectionEffect then
                u13.colorCorrectionEffect.Enabled = true;
            end;
        end;

        local _ = (u39.endPosition - u39.startPosition).Unit;
        default(u39.duration, Linear, function(p46) -- Line: 377
            -- upvalues: u44 (copy), u39 (copy)
            u44:PivotTo(CFrame.new(u39.startPosition):Lerp(CFrame.new(u39.endPosition), p46));
        end):Wait();
        v45:Stop();
        u44:Destroy();
    end));
    p14:GiveTask(default2.Client:Get("FinishStyxPortalTeleportFromServer"):Connect(function(p47) -- Line: 386
        -- upvalues: Players (ref), Workspace (ref), u13 (copy), ClientStore (ref)
        if p47.player == Players.LocalPlayer then
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:FindFirstChildOfClass("Humanoid");
            end;

            if Character then
                Workspace.CurrentCamera.CameraSubject = Character;
            end;

            if u13.colorCorrectionEffect then
                u13.colorCorrectionEffect.Enabled = false;
            end;

            ClientStore:dispatch({
                type = "UnequipItemInHand",
                equip = true
            });
        end;
    end));
    p14:GiveTask(default2.Client:Get("StyxDestroyEntrancePortalBlockFromServer"):Connect(function(u48) -- Line: 412
        -- upvalues: u13 (copy)
        local function _(p49) -- Line: 415
            -- upvalues: u48 (copy)
            return p49.connectedEntrancePortalUUID == u48.entrancePortalData.uuid;
        end;

        local v50 = 0;
        local v51 = {};

        for i, v in u13.exitPortals do
            local _ = i - 1;

            if v.connectedEntrancePortalUUID == u48.entrancePortalData.uuid == true then
                v50 = v50 + 1;
                v51[v50] = v;
            end;
        end;

        local function _(p52) -- Line: 429
            -- upvalues: u13 (ref)
            u13:despawnExitPortal(p52);
        end;

        for i, v in v51 do
            local _ = i - 1;
            u13:despawnExitPortal(v);
        end;

        local function _(p53) -- Line: 437
            -- upvalues: u48 (copy)
            return p53.uuid == u48.entrancePortalData.uuid;
        end;

        local v54 = nil;

        for i, v in u13.entrancePortals do
            local _ = i - 1;

            if v.uuid == u48.entrancePortalData.uuid == true then
                v54 = v;
                break;
            end;
        end;

        if not v54 then
            return nil;
        end;

        local function _(p55) -- Line: 455
            -- upvalues: u48 (copy)
            return p55.uuid ~= u48.entrancePortalData.uuid;
        end;

        local v56 = 0;
        local v57 = {};

        for i, v in u13.entrancePortals do
            local _ = i - 1;

            if v.uuid ~= u48.entrancePortalData.uuid == true then
                v56 = v56 + 1;
                v57[v56] = v;
            end;
        end;

        u13.entrancePortals = v57;

        if v54.proximityPrompt then
            v54.proximityPrompt:Destroy();
        end;

        if v54.whirpoolSpinHeartbeatConnection then
            v54.whirpoolSpinHeartbeatConnection:Disconnect();
        end;

        if v54.beam then
            v54.beam:Destroy();
        end;
    end));
    p14:GiveTask(default2.Client:Get("StyxStartGhostStateFromServer"):Connect(function(p58) -- Line: 482
        -- upvalues: Players (ref), u13 (copy), RunService (ref), Workspace (ref), StyxKitBalance (ref)
        if p58.player == Players.LocalPlayer then
            if u13.colorCorrectionEffect then
                u13.colorCorrectionEffect.Enabled = true;
            end;

            local v66 = RunService.Heartbeat:Connect(function() -- Line: 497
                -- upvalues: Players (ref), u13 (ref), Workspace (ref), StyxKitBalance (ref)
                local Character = Players.LocalPlayer.Character;

                if Character ~= nil then
                    Character = Character.PrimaryPart;
                end;

                if not Character then
                    return nil;
                end;

                local v59 = OverlapParams.new();
                v59.FilterType = Enum.RaycastFilterType.Exclude;
                v59.FilterDescendantsInstances = u13.culledParts;
                local v60 = Workspace:GetPartBoundsInBox(Character.CFrame, Vector3.new(1, 1, 1) * StyxKitBalance.BLOCK_CULL_RADIUS, v59);

                local function v65(u61) -- Line: 514
                    -- upvalues: u13 (ref), StyxKitBalance (ref)
                    if u61.CollisionGroup == "StyxGhost" then
                        return nil;
                    end;

                    if not u61:IsA("BasePart") then
                        return nil;
                    end;

                    if u61:GetAttribute("Block") ~= true then
                        return nil;
                    end;

                    table.insert(u13.culledParts, u61);
                    local Transparency = u61.Transparency;
                    u61.Transparency = StyxKitBalance.BLOCK_TRANSPARENCY;
                    local CanCollide = u61.CanCollide;
                    u61.CanCollide = false;
                    u13.ghostStateMaid:GiveTask(function() -- Line: 531
                        -- upvalues: u61 (copy), Transparency (copy), CanCollide (copy)
                        u61.Transparency = Transparency;
                        u61.CanCollide = CanCollide;
                    end);
                    local v62 = u61:GetChildren();

                    local function v64(u63) -- Line: 537
                        -- upvalues: u13 (ref), StyxKitBalance (ref)
                        if not u63:IsA("BasePart") then
                            return nil;
                        end;

                        if table.find(u13.culledParts, u63) ~= nil then
                            return nil;
                        end;

                        table.insert(u13.culledParts, u63);
                        local Transparency2 = u63.Transparency;
                        u63.Transparency = StyxKitBalance.BLOCK_TRANSPARENCY;
                        local CanCollide2 = u63.CanCollide;
                        u63.CanCollide = false;
                        u13.ghostStateMaid:GiveTask(function() -- Line: 553
                            -- upvalues: u63 (copy), Transparency2 (copy), CanCollide2 (copy)
                            u63.Transparency = Transparency2;
                            u63.CanCollide = CanCollide2;
                        end);
                    end;

                    for i, v in v62 do
                        v64(v, i - 1, v62);
                    end;
                end;

                for i, v in v60 do
                    v65(v, i - 1, v60);
                end;
            end);

            if v66 then
                u13.ghostStateMaid:GiveTask(v66);
            end;
        else
            local Character = p58.player.Character;

            if Character then
                Character:SetAttribute("Transparency", 0.6);
            end;
        end;
    end));
    p14:GiveTask(default2.Client:Get("StyxEndGhostStateFromServer"):Connect(function(p67) -- Line: 578
        -- upvalues: Players (ref), u13 (copy)
        if p67.player == Players.LocalPlayer then
            if u13.colorCorrectionEffect then
                u13.colorCorrectionEffect.Enabled = false;
            end;

            u13.ghostStateMaid:DoCleaning();
            table.clear(u13.culledParts);
        end;
    end));
    p14:GiveTask(u13.exitPortalCooldownSignal:Connect(function(u68) -- Line: 592
        -- upvalues: u13 (copy)
        local function _(p69) -- Line: 594
            return p69.proximityPrompt and true or false;
        end;

        local v70 = 0;
        local v71 = {};

        for i, v in u13.exitPortals do
            local _ = i - 1;

            if (v.proximityPrompt and true or false) == true then
                v70 = v70 + 1;
                v71[v70] = v;
            end;
        end;

        local function _(p72) -- Line: 607
            -- upvalues: u13 (ref), u68 (copy)
            p72.proximityPrompt.ActionText = u13:getPortalPromptText(u68);
        end;

        for i, v in v71 do
            local _ = i - 1;
            v.proximityPrompt.ActionText = u13:getPortalPromptText(u68);
        end;
    end));
end;

function u7.onKitReplicationDeactivated(p73) -- Line: 615
end;

function u7.onInnateAbilityEnabled(p74, p75, p76) -- Line: 617
end;

function u7.onAbilityUsed(p77, p78, p79) -- Line: 619
end;

function u7.KnitStart(p80) -- Line: 621
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p80);
end;

function u7.spawnExitPortal(u81, u82, p83) -- Line: 624
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), DeviceUtil (copy)
    table.insert(u81.exitPortals, u82);
    local v84 = ReplicatedStorage.Assets.Misc.StyxPortal:Clone();
    v84.Parent = Workspace;
    v84:PivotTo(CFrame.new(u82.worldPosition));
    u82.model = v84;
    u82.promptParent = v84.Pivot.PromptParent;
    u82.particleEmitter = v84.Pivot.StyxPortalParticleUp.Smoke;

    if p83 then
        if u81:getThisPlayersCurrentEntrancePortal() then
            local v85 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                ObjectText = "Styx\'s Exit Portal",
                AutoLocalize = false,
                RequiresLineOfSight = false,
                MaxActivationDistance = 10,
                ActionText = u81:getPortalPromptText(),
                ClickablePrompt = DeviceUtil.isMobileControls(),
                KeyboardKeyCode = Enum.KeyCode.F,
                Parent = u82.promptParent
            });

            if not v85 then
                return u82;
            end;

            u82.proximityPrompt = v85;
            v85.Triggered:Connect(function(p86) -- Line: 656
                -- upvalues: u81 (copy), u82 (copy)
                u81:tryOpenExitPortal(u82);
            end);

            return u82;
        end;

        local v87 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ObjectText = "Needs an Entrance Portal",
            ActionText = "",
            AutoLocalize = false,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            Parent = u82.promptParent
        });

        if not v87 then
            return u82;
        end;

        u82.proximityPrompt = v87;
    end;

    return u82;
end;

function u7.despawnExitPortal(p88, u89, p90) -- Line: 677
    -- upvalues: BlockEngine (copy), Workspace (copy)
    local function _(p91) -- Line: 680
        -- upvalues: u89 (copy)
        return p91.uuid == u89.connectedEntrancePortalUUID;
    end;

    local v92 = nil;

    for i, v in p88.entrancePortals do
        local _ = i - 1;

        if v.uuid == u89.connectedEntrancePortalUUID == true then
            v92 = v;
            break;
        end;
    end;

    local v93 = v92 and BlockEngine:getStore():getBlockAt(v92.blockPosition);

    if v93 then
        p88:closeEntrancePortalVisuals(v93, v92.whirpoolSpinHeartbeatConnection, v92, v92.proximityPrompt);
    end;

    if p90 ~= 0 and (p90 == p90 and p90) then
        p88:hideExitPortalExceptParticleAndBeam(u89);

        while Workspace:GetServerTimeNow() < p90 do
            task.wait(0.1);
        end;
    end;

    if u89.beam then
        u89.beam:Destroy();
    end;

    local function _(p94) -- Line: 729
        -- upvalues: u89 (copy)
        return p94.uuid ~= u89.uuid;
    end;

    local v95 = 0;
    local v96 = {};

    for i, v in p88.exitPortals do
        local _ = i - 1;

        if v.uuid ~= u89.uuid == true then
            v95 = v95 + 1;
            v96[v95] = v;
        end;
    end;

    p88.exitPortals = v96;

    if u89.model then
        u89.model:Destroy();
    end;
end;

function u7.tryOpenExitPortal(u97, p98) -- Line: 748
    -- upvalues: Flamework (copy), CooldownId (copy), default2 (copy), ClientSyncEvents (copy), StyxKitBalance (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.STYX_ENTRANCE_PORTAL) then
        return nil;
    end;

    if default2.Client:Get("StyxTryOpenExitPortalFromClient"):CallServer(p98.uuid) then
        local cooldown = ClientSyncEvents.AbilityCooldownModifierCheck:fire(StyxKitBalance.PORTAL_OPEN_COOLDOWN_SECONDS).cooldown;
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.STYX_ENTRANCE_PORTAL, cooldown, {
            cooldownBar = {
                color = Color3.fromRGB(80, 80, 255)
            }
        });
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(CooldownId.STYX_ENTRANCE_PORTAL, "styx_entrance_portal_cooldown_update", function() -- Line: 762
            -- upvalues: u97 (copy)
            u97.exitPortalCooldownSignal:Fire(false);
        end);
        u97.exitPortalCooldownSignal:Fire(true);
    end;
end;

function u7.tryUseEntrancePortal(p99, p100) -- Line: 768
    -- upvalues: default2 (copy)
    default2.Client:Get("UseStyxPortalFromClient"):SendToServer({
        entrancePortalData = p100
    });
end;

function u7.getThisPlayersCurrentEntrancePortal(p101) -- Line: 773
    -- upvalues: Players (copy)
    local function _(p102) -- Line: 775
        -- upvalues: Players (ref)
        return p102.player == Players.LocalPlayer;
    end;

    for i, v in p101.entrancePortals do
        local _ = i - 1;

        if v.player == Players.LocalPlayer == true then
            return v;
        end;
    end;

    return nil;
end;

function u7.openEntrancePortalVisuals(p103, p104, p105) -- Line: 789
    -- upvalues: default (copy), Linear (copy), RunService (copy)
    if p104 then
        local Styx_Gate = p104:FindFirstChild("Styx_Gate");

        if Styx_Gate ~= nil then
            Styx_Gate = Styx_Gate:FindFirstChild("Pivot");

            if Styx_Gate ~= nil then
                Styx_Gate = Styx_Gate:FindFirstChild("left cover");
            end;
        end;

        local Styx_Gate2 = p104:FindFirstChild("Styx_Gate");

        if Styx_Gate2 ~= nil then
            Styx_Gate2 = Styx_Gate2:FindFirstChild("Pivot");

            if Styx_Gate2 ~= nil then
                Styx_Gate2 = Styx_Gate2:FindFirstChild("right cover");
            end;
        end;

        if Styx_Gate and Styx_Gate2 then
            local Position = p104:GetPivot().Position;
            local v106 = Styx_Gate.Position - Position;
            local v107 = Styx_Gate2.Position - Position;
            local v108 = Vector3.new(p103.entrancePortalDoorOpenXPosition, v106.Y, v106.Z);
            local v109 = Vector3.new(-p103.entrancePortalDoorOpenXPosition, v107.Y, v107.Z);
            local u110 = CFrame.new(Position + v106);
            local u111 = CFrame.new(Position + v107);
            local u112 = CFrame.new(Position + v108);
            local u113 = CFrame.new(Position + v109);
            default(0.5, Linear, function(p114) -- Line: 822
                -- upvalues: Styx_Gate (copy), u110 (copy), u112 (copy)
                Styx_Gate:PivotTo(u110:Lerp(u112, p114));
            end):Play();
            default(0.5, Linear, function(p115) -- Line: 825
                -- upvalues: Styx_Gate2 (copy), u111 (copy), u113 (copy)
                Styx_Gate2:PivotTo(u111:Lerp(u113, p115));
            end):Play();
        end;

        local Styx_Gate3 = p104:FindFirstChild("Styx_Gate");

        if Styx_Gate3 ~= nil then
            Styx_Gate3 = Styx_Gate3:FindFirstChild("Pivot");

            if Styx_Gate3 ~= nil then
                Styx_Gate3 = Styx_Gate3:FindFirstChild("StyxPortalParticleDown");

                if Styx_Gate3 ~= nil then
                    Styx_Gate3 = Styx_Gate3:FindFirstChild("Smoke");
                end;
            end;
        end;

        if Styx_Gate3 then
            Styx_Gate3.Enabled = true;
        end;

        local Styx_Gate4 = p104:FindFirstChild("Styx_Gate");

        if Styx_Gate4 ~= nil then
            Styx_Gate4 = Styx_Gate4:FindFirstChild("Pivot");

            if Styx_Gate4 ~= nil then
                Styx_Gate4 = Styx_Gate4:FindFirstChild("tornado");
            end;
        end;

        local Styx_Gate5 = p104:FindFirstChild("Styx_Gate");

        if Styx_Gate5 ~= nil then
            Styx_Gate5 = Styx_Gate5:FindFirstChild("Pivot");

            if Styx_Gate5 ~= nil then
                Styx_Gate5 = Styx_Gate5:FindFirstChild("tornado1");
            end;
        end;

        if Styx_Gate4 and Styx_Gate5 then
            return RunService.Heartbeat:Connect(function() -- Line: 862
                -- upvalues: Styx_Gate4 (copy), Styx_Gate5 (copy)
                Styx_Gate4.CFrame = Styx_Gate4.CFrame * CFrame.Angles(0, 0.06981317007977318, 0);
                Styx_Gate5.CFrame = Styx_Gate5.CFrame * CFrame.Angles(0, -0.12217304763960307, 0);
            end);
        end;
    end;

    return nil;
end;

function u7.closeEntrancePortalVisuals(p116, p117, u118, p119, p120) -- Line: 875
    -- upvalues: default (copy), Linear (copy)
    if p117 then
        local Styx_Gate = p117:FindFirstChild("Styx_Gate");

        if Styx_Gate ~= nil then
            Styx_Gate = Styx_Gate:FindFirstChild("Pivot");

            if Styx_Gate ~= nil then
                Styx_Gate = Styx_Gate:FindFirstChild("left cover");
            end;
        end;

        local Styx_Gate2 = p117:FindFirstChild("Styx_Gate");

        if Styx_Gate2 ~= nil then
            Styx_Gate2 = Styx_Gate2:FindFirstChild("Pivot");

            if Styx_Gate2 ~= nil then
                Styx_Gate2 = Styx_Gate2:FindFirstChild("right cover");
            end;
        end;

        if Styx_Gate and Styx_Gate2 then
            local Position = p117:GetPivot().Position;
            local v121 = Styx_Gate.Position - Position;
            local v122 = Styx_Gate2.Position - Position;
            local v123 = Vector3.new(p116.entrancePortalDoorClosedXPosition, v121.Y, v121.Z);
            local v124 = Vector3.new(-p116.entrancePortalDoorClosedXPosition, v122.Y, v122.Z);
            local u125 = CFrame.new(Position + v121);
            local u126 = CFrame.new(Position + v122);
            local u127 = CFrame.new(Position + v123);
            local u128 = CFrame.new(Position + v124);
            default(0.5, Linear, function(p129) -- Line: 908
                -- upvalues: Styx_Gate (copy), u125 (copy), u127 (copy)
                Styx_Gate:PivotTo(u125:Lerp(u127, p129));
            end):Play();
            default(0.5, Linear, function(p130) -- Line: 911
                -- upvalues: Styx_Gate2 (copy), u126 (copy), u128 (copy)
                Styx_Gate2:PivotTo(u126:Lerp(u128, p130));
            end):Play();
        end;

        if u118 then
            task.delay(0.5, function() -- Line: 917
                -- upvalues: u118 (copy)
                if u118 then
                    u118:Disconnect();
                end;
            end);
        end;

        local Styx_Gate3 = p117:FindFirstChild("Styx_Gate");

        if Styx_Gate3 ~= nil then
            Styx_Gate3 = Styx_Gate3:FindFirstChild("Pivot");

            if Styx_Gate3 ~= nil then
                Styx_Gate3 = Styx_Gate3:FindFirstChild("StyxPortalParticleDown");

                if Styx_Gate3 ~= nil then
                    Styx_Gate3 = Styx_Gate3:FindFirstChild("Smoke");
                end;
            end;
        end;

        if Styx_Gate3 then
            Styx_Gate3.Enabled = false;
        end;

        if p120 then
            p120:Destroy();
        end;
    end;

    return nil;
end;

function u7.openExitPortalVisuals(p131, p132, p133) -- Line: 945
    -- upvalues: default (copy), Linear (copy), RunService (copy)
    if p132 then
        local Pivot = p132:FindFirstChild("Pivot");

        if Pivot ~= nil then
            Pivot = Pivot:FindFirstChild("left_cover");
        end;

        local Pivot2 = p132:FindFirstChild("Pivot");

        if Pivot2 ~= nil then
            Pivot2 = Pivot2:FindFirstChild("right_cover");
        end;

        if Pivot and Pivot2 then
            local Position = p132:GetPivot().Position;
            local v134 = Pivot.Position - Position;
            local v135 = Pivot2.Position - Position;
            local v136 = Vector3.new(p131.exitPortalDoorOpenXPosition, v134.Y, v134.Z);
            local v137 = Vector3.new(-p131.exitPortalDoorOpenXPosition, v135.Y, v135.Z);
            local u138 = CFrame.new(Position + v134);
            local u139 = CFrame.new(Position + v135);
            local u140 = CFrame.new(Position + v136);
            local u141 = CFrame.new(Position + v137);
            default(0.5, Linear, function(p142) -- Line: 972
                -- upvalues: Pivot (copy), u138 (copy), u140 (copy)
                Pivot:PivotTo(u138:Lerp(u140, p142));
            end):Play();
            default(0.5, Linear, function(p143) -- Line: 975
                -- upvalues: Pivot2 (copy), u139 (copy), u141 (copy)
                Pivot2:PivotTo(u139:Lerp(u141, p143));
            end):Play();
        end;

        if p133.particleEmitter then
            p133.particleEmitter.Enabled = true;
        end;

        local Pivot3 = p132:FindFirstChild("Pivot");

        if Pivot3 ~= nil then
            Pivot3 = Pivot3:FindFirstChild("tornado");
        end;

        local Pivot4 = p132:FindFirstChild("Pivot");

        if Pivot4 ~= nil then
            Pivot4 = Pivot4:FindFirstChild("tornado1");
        end;

        if Pivot3 and Pivot4 then
            return RunService.Heartbeat:Connect(function() -- Line: 995
                -- upvalues: Pivot3 (copy), Pivot4 (copy)
                Pivot3.CFrame = Pivot3.CFrame * CFrame.Angles(0, 0.06981317007977318, 0);
                Pivot4.CFrame = Pivot4.CFrame * CFrame.Angles(0, -0.12217304763960307, 0);
            end);
        end;
    end;

    return nil;
end;

function u7.getPortalPromptText(p144, p145) -- Line: 1008
    -- upvalues: Flamework (copy), CooldownId (copy)
    if p145 == nil then
        p145 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(CooldownId.STYX_ENTRANCE_PORTAL);
    end;

    return p145 and "On Cooldown" or "Connect";
end;

function u7.hideExitPortalExceptParticleAndBeam(p146, p147) -- Line: 1015
    print(" client hide exit portal");

    if p147.model then
        p146:recursiveHideMeshParts(p147.model);
    end;
end;

function u7.recursiveHideMeshParts(u148, p149) -- Line: 1021
    local function _(p150) -- Line: 1023
        -- upvalues: u148 (copy)
        if p150:IsA("MeshPart") then
            p150.Transparency = 1;
        end;

        u148:recursiveHideMeshParts(p150);
    end;

    for i, child in p149:GetChildren() do
        local _ = i - 1;

        if child:IsA("MeshPart") then
            child.Transparency = 1;
        end;

        u148:recursiveHideMeshParts(child);
    end;
end;

KnitClient.CreateController(u7.new());

return nil;