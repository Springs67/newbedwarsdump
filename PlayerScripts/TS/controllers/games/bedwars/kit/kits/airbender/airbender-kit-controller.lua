-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local AirbenderKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "airbender", "airbender-kit-balance").AirbenderKitBalance;
local AirbenderKitUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "airbender", "airbender-kit-util").AirbenderKitUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = ConstantManager.registerConstants(script, {
    groundForceMultiplier = AirbenderKitBalance.GROUND_FORCE_MULTIPLIER,
    airForceMultiplier = AirbenderKitBalance.AIR_FORCE_MULTIPLIER
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "AirbenderKitController";
    end,

    __index = BaseKitController
});
u6.__index = u6;

function u6.new(...) -- Line: 50
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 54
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p8, BedwarsKit.AIRBENDER);
    p8.Name = "AirbenderKitController";
    p8.tornadoes = {};
    p8.tornadoesLocalPlayerIsIn = {};
end;

function u6.KnitStart(p9) -- Line: 60
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p9);
end;

function u6.onKitLocalActivated(p10, p11) -- Line: 63
end;

function u6.onKitLocalDeactivated(p12) -- Line: 65
end;

function u6.onKitReplicationActivated(u13, p14) -- Line: 67
    -- upvalues: default2 (copy), Players (copy), RunService (copy), EntityUtil (copy), StatusEffectUtil (copy), StatusEffectType (copy), u5 (copy), ClientSyncEvents (copy), SyncEventPriority (copy), CollectionService (copy), GameQueryUtil (copy)
    p14:GiveTask(default2.Client:Get("Airbender_PlayerEnteredTornado"):Connect(function(p15) -- Line: 68
        -- upvalues: Players (ref), u13 (copy)
        if p15.player ~= Players.LocalPlayer then
            return nil;
        end;

        local u16 = u13:getTornadoData(p15.tornadoUUID);

        if not u16 then
            return nil;
        end;

        if not u16.alive then
            return nil;
        end;

        local function _(p17) -- Line: 81
            -- upvalues: u16 (copy)
            return p17.uuid == u16.uuid;
        end;

        local v18 = nil;

        for i, v in u13.tornadoesLocalPlayerIsIn do
            local _ = i - 1;

            if v.uuid == u16.uuid == true then
                v18 = v;
                break;
            end;
        end;

        if v18 then
            return nil;
        end;

        table.insert(u13.tornadoesLocalPlayerIsIn, u16);

        if u13.vectorForce ~= nil and (u13.vectorForce.Parent ~= nil and not u13.vectorForce.Enabled) then
            u13.vectorForce.Enabled = true;
        end;

        local v19 = u13.vectorForce == nil;

        if not v19 then
            local vectorForce = u13.vectorForce;

            if vectorForce ~= nil then
                vectorForce = vectorForce.Parent;
            end;

            v19 = vectorForce == nil;
        end;

        if v19 then
            u13:createVectorForce();
        end;
    end));
    p14:GiveTask(default2.Client:Get("Airbender_PlayerExitedTornado"):Connect(function(u20) -- Line: 129
        -- upvalues: Players (ref), u13 (copy)
        if u20.player ~= Players.LocalPlayer then
            return nil;
        end;

        local function _(p21) -- Line: 134
            -- upvalues: u20 (copy)
            return p21.uuid ~= u20.tornadoUUID;
        end;

        local v22 = 0;
        local v23 = {};

        for i, v in u13.tornadoesLocalPlayerIsIn do
            local _ = i - 1;

            if v.uuid ~= u20.tornadoUUID == true then
                v22 = v22 + 1;
                v23[v22] = v;
            end;
        end;

        u13.tornadoesLocalPlayerIsIn = v23;

        if #u13.tornadoesLocalPlayerIsIn == 0 and u13.vectorForce then
            u13.vectorForce.Enabled = false;
            u13.vectorForce.Force = Vector3.new(0, 0, 0);
        end;
    end));
    p14:GiveTask(default2.Client:Get("Airbender_PlayerExitAllTornadoes"):Connect(function() -- Line: 159
        -- upvalues: u13 (copy)
        u13.tornadoesLocalPlayerIsIn = {};

        if u13.vectorForce then
            u13.vectorForce.Enabled = false;
            u13.vectorForce.Force = Vector3.new(0, 0, 0);
        end;
    end));
    p14:GiveTask(RunService.Heartbeat:Connect(function(p24) -- Line: 170
        -- upvalues: u13 (copy), EntityUtil (ref), StatusEffectUtil (ref), StatusEffectType (ref), Players (ref), u5 (ref)
        if #u13.tornadoesLocalPlayerIsIn == 0 then
            return nil;
        end;

        if not u13.vectorForce then
            return nil;
        end;

        local v25 = EntityUtil:getLocalPlayerEntity();

        if v25 and StatusEffectUtil:isActive(v25:getInstance(), StatusEffectType.WEAK_ARMOR) then
            return nil;
        end;

        local Character = Players.LocalPlayer.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;
        end;

        if not Character then
            return nil;
        end;

        local v26 = u13:getLocalHumanoid();

        if v26 ~= nil then
            v26 = v26:GetState();
        end;

        if not v26 then
            return nil;
        end;

        local v27 = u13.tornadoesLocalPlayerIsIn[1];
        local Unit = (Vector3.new(v27.currentPosition.X, 0, v27.currentPosition.Z) - Vector3.new(Character.Position.X, 0, Character.Position.Z)).Unit;
        local v28;

        if v26 == Enum.HumanoidStateType.Running and true or v26 == Enum.HumanoidStateType.Landed then
            v28 = u5.groundForceMultiplier;
        else
            v28 = u5.airForceMultiplier;
        end;

        u13.vectorForce.Force = Unit * v28 * Character.AssemblyMass;
    end));
    p14:GiveTask(default2.Client:Get("Airbender_UseTornadoFromServer"):Connect(function(u29) -- Line: 212
        -- upvalues: u13 (copy)
        task.spawn(function() -- Line: 213
            -- upvalues: u13 (ref), u29 (copy)
            u13:playerUsedTornado(u29.tornadoData);
        end);
    end));
    p14:GiveTask(default2.Client:Get("Airbender_EndTornadoFromServer"):Connect(function(u30) -- Line: 217
        -- upvalues: u13 (copy)
        local v31 = u13:getTornadoData(u30.tornadoData.uuid);

        if v31 then
            v31.maid:DoCleaning();
        end;

        local function _(p32) -- Line: 224
            -- upvalues: u30 (copy)
            return p32.uuid ~= u30.tornadoData.uuid;
        end;

        local v33 = 0;
        local v34 = {};

        for i, v in u13.tornadoesLocalPlayerIsIn do
            local _ = i - 1;

            if v.uuid ~= u30.tornadoData.uuid == true then
                v33 = v33 + 1;
                v34[v33] = v;
            end;
        end;

        u13.tornadoesLocalPlayerIsIn = v34;

        local function _(p35) -- Line: 239
            -- upvalues: u30 (copy)
            return p35.uuid ~= u30.tornadoData.uuid;
        end;

        local v36 = 0;
        local v37 = {};

        for i, v in u13.tornadoes do
            local _ = i - 1;

            if v.uuid ~= u30.tornadoData.uuid == true then
                v36 = v36 + 1;
                v37[v36] = v;
            end;
        end;

        u13.tornadoes = v37;

        if #u13.tornadoesLocalPlayerIsIn == 0 and u13.vectorForce then
            u13.vectorForce.Enabled = false;
            u13.vectorForce.Force = Vector3.new(0, 0, 0);
        end;
    end));
    p14:GiveTask(ClientSyncEvents.ProjectileHit:setPriority(SyncEventPriority.HIGHEST):connect(function(p38) -- Line: 264
        if p38:isCancelled() then
            return nil;
        end;

        local part = p38.hitData.part;

        if not part then
            return nil;
        end;

        local shooter = p38.shooter;

        if shooter ~= nil then
            shooter = shooter:getPlayer();
        end;

        if not shooter then
            return nil;
        end;

        local Team = shooter.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        local v39 = part:GetAttribute("TornadoTeam");

        if v39 == "" or not v39 then
            return nil;
        end;

        if Team == v39 then
            p38:setCancelled(true);
        end;
    end));
    p14:GiveTask(CollectionService:GetInstanceAddedSignal("airbender-tornado-collider"):Connect(function(p40) -- Line: 294
        -- upvalues: Players (ref), GameQueryUtil (ref)
        local v41 = p40:GetAttribute("TornadoTeam");

        if v41 == "" or not v41 then
            return nil;
        end;

        local Team = Players.LocalPlayer.Team;

        if Team ~= nil then
            Team = Team.Name;
        end;

        if Team == "" or not Team then
            return nil;
        end;

        if v41 == Team then
            GameQueryUtil:setQueryIgnored(p40, true);
        end;
    end));
end;

function u6.onKitReplicationDeactivated(p42) -- Line: 313
end;

function u6.onInnateAbilityEnabled(p43, p44, p45) -- Line: 315
end;

function u6.onAbilityUsed(p46, p47, p48) -- Line: 317
    -- upvalues: Players (copy), AbilityId (copy), Workspace (copy), default2 (copy)
    if p47 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    if p48.ability == AbilityId.AIRBENDER_MOVING_TORNADO then
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame.LookVector;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local Unit = Vector3.new(CurrentCamera.X, 0, CurrentCamera.Z).Unit;
        default2.Client:Get("Airbender_RequestMovingTornado"):SendToServer({
            direction = Unit
        });
    end;
end;

function u6.getLocalHumanoid(p49) -- Line: 338
    -- upvalues: Players (copy)
    if p49.localHumanoid and p49.localHumanoid.Parent ~= nil then
        return p49.localHumanoid;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:FindFirstChildOfClass("Humanoid");
    end;

    p49.localHumanoid = Character;

    return p49.localHumanoid;
end;

function u6.playerUsedTornado(u50, u51) -- Line: 349
    -- upvalues: u2 (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), AirbenderKitBalance (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), Workspace (copy), GameSound (copy), SoundManager (copy), AirbenderKitUtil (copy), default (copy), Linear (copy), MathExtras (copy), default2 (copy), RunService (copy), CFrameUtil (copy)
    local owner = u51.owner;

    if not owner then
        return nil;
    end;

    local Character = owner.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local u52 = u2.new();
    u51.maid = u52;
    u52:GiveTask(function() -- Line: 365
        -- upvalues: u51 (copy)
        u51.alive = false;
    end);

    if owner == Players.LocalPlayer then
        AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.AIRBENDER_CAST));
    end;

    local u53 = Vector3.new(0, AirbenderKitBalance.TORNADO_HEIGHT - 6.5, 0);
    local u54;

    if u50:getKitSkin(owner) == BedwarsKitSkin.SHARK_RAMIL then
        u54 = ReplicatedStorage.Assets.Misc.Ramil_WaterTornado:Clone();
    else
        u54 = ReplicatedStorage.Assets.Misc.Airbender_SandTunnel:Clone();
    end;

    local u55;

    if owner.Team == Players.LocalPlayer.Team then
        u54.Pivot.Cylinder.TextureID = "";
        u54.Pivot.Inside.TextureID = "";
        u54.Pivot.Outside.TextureID = "";
        u55 = 0.6;
    else
        u55 = 0;
    end;

    if u51.isMoving and u51.direction ~= nil then
        local v56 = Workspace:GetServerTimeNow() - u51.creationServerTime;
        local v57 = u51.startPosition + u51.direction * (AirbenderKitBalance.MOVING_TORNADO_SPEED * v56);
        u54:PivotTo(CFrame.new(v57, v57 + Vector3.new(0, 1, 0)));
    else
        u54:PivotTo(CFrame.new(Character.Position + u53, Character.Position + Vector3.new(0, 1, 0)));
    end;

    u51.currentPosition = u54.Pivot.Position;
    local v58;

    if u50:getKitSkin(owner) == BedwarsKitSkin.SHARK_RAMIL then
        v58 = GameSound.SHARK_RAMIL_TORNADO_LOOP;
    else
        v58 = GameSound.AIRBENDER_SANDSTORM_LOOP;
    end;

    local u59 = SoundManager:playModifiableSound(v58, {
        looped = true,
        volumeMultiplier = 0,
        position = u54.Pivot.Position,
        parent = u54.PrimaryPart
    });
    local v60 = AirbenderKitUtil.getScaleLengthForZoneModel(AirbenderKitBalance.TORNADO_HEIGHT);
    u54.Pivot.Cylinder.Size = Vector3.new(0.01, u54.Pivot.Cylinder.Size.Y * v60, 0.01);
    u54.Pivot.Inside.Size = Vector3.new(0.01, u54.Pivot.Inside.Size.Y * v60, 0.01);
    u54.Pivot.Outside.Size = Vector3.new(0.01, u54.Pivot.Outside.Size.Y * v60, 0.01);
    default(0.35, Linear, function(p61) -- Line: 423
        -- upvalues: MathExtras (ref), u51 (copy), AirbenderKitBalance (ref), u50 (copy), u54 (copy), u59 (copy)
        local v62;

        if u51.isMoving then
            v62 = AirbenderKitBalance.MOVING_TORNADO_RADIUS;
        else
            v62 = AirbenderKitBalance.TORNADO_RADIUS;
        end;

        u50:setTornadoRadius(u54, (MathExtras:lerp(0.01, v62, p61)));
        u59.Volume = MathExtras:lerp(0, 1, p61);
    end, 0, 1):Play();
    u54.Parent = Workspace;
    local u63 = false;

    if u51.isMoving then
        u52:GiveTask((default2.Client:Get("Airbender_TornadoStoppedMoving"):Connect(function(p64) -- Line: 435
            -- upvalues: u63 (ref), u54 (copy)
            u63 = true;
            u54:PivotTo(CFrame.new(p64.position, p64.position + Vector3.new(0, 1, 0)));
        end)));
    end;

    local Pivot = u54:FindFirstChild("Pivot");

    if Pivot ~= nil then
        Pivot = Pivot:FindFirstChild("Inside");

        if Pivot ~= nil then
            Pivot = Pivot:FindFirstChild("RamilShark");
        end;
    end;

    local u65 = 0;
    local u66;

    if Pivot == nil then
        u66 = nil;
    else
        u66 = Pivot:GetPivot().Position - u54:GetPivot().Position;
    end;

    local Transparency = u54.Pivot.Cylinder.Transparency;
    local Transparency2 = u54.Pivot.Inside.Transparency;
    local Transparency3 = u54.Pivot.Outside.Transparency;
    local u67 = 0;
    local u68 = 0;
    local u74 = RunService.Heartbeat:Connect(function(p69) -- Line: 471
        -- upvalues: Character (copy), u52 (copy), u51 (copy), u63 (ref), u54 (copy), AirbenderKitBalance (ref), u53 (copy), CFrameUtil (ref), Workspace (ref), u68 (ref), u67 (ref), MathExtras (ref), Transparency (copy), u55 (ref), Transparency2 (copy), Transparency3 (copy), Pivot (copy), u66 (copy), u65 (ref)
        if not Character or Character.Parent == nil then
            u52:DoCleaning();

            return nil;
        end;

        if u51.isMoving and u51.direction ~= nil then
            if not u63 then
                local v70 = u54:GetPivot().Position + u51.direction * (AirbenderKitBalance.MOVING_TORNADO_SPEED * p69);
                u54:PivotTo(CFrame.new(v70, v70 + Vector3.new(0, 1, 0)));
            end;
        else
            local v71 = Character.Position + u53;
            u54:PivotTo(CFrame.new(v71, v71 + Vector3.new(0, 1, 0)));
        end;

        u51.currentPosition = u54:GetPivot().Position;
        CFrameUtil.rotateLocalDegrees(u54.Pivot.Cylinder, (Vector3.new(0, AirbenderKitBalance.CYLINDER_SPIN_SPEED * AirbenderKitBalance.SPIN_MULTIPLIER * p69, 0)));
        CFrameUtil.rotateLocalDegrees(u54.Pivot.Inside, (Vector3.new(0, AirbenderKitBalance.INSIDE_SPIN_SPEED * AirbenderKitBalance.SPIN_MULTIPLIER * p69, 0)));
        CFrameUtil.rotateLocalDegrees(u54.Pivot.Outside, (Vector3.new(0, AirbenderKitBalance.OUTSIDE_SPIN_SPEED * AirbenderKitBalance.SPIN_MULTIPLIER * p69, 0)));
        local Magnitude = (u54.Pivot.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude;
        u68 = u68 + p69;

        if u68 > 0.25 then
            u68 = 0;
            local v72 = u67;
            u67 = MathExtras:rangeMap(Magnitude, { AirbenderKitBalance.CAMERA_DISTANCE_FOR_MAX_TRANSPARENCY, AirbenderKitBalance.CAMERA_DISTANCE_FOR_NORMAL_TRANSPARENCY }, { 0.9, 0 });
            u67 = math.clamp(u67, 0, 0.9);

            if u67 ~= v72 then
                u54.Pivot.Cylinder.Transparency = MathExtras:lerp(Transparency + u55, 1, u67);
                u54.Pivot.Inside.Transparency = MathExtras:lerp(Transparency2 + u55, 1, u67);
                u54.Pivot.Outside.Transparency = MathExtras:lerp(Transparency3 + u55, 1, u67);
            end;
        end;

        if Pivot and u66 then
            local PrimaryPart = Pivot.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart:GetPivot().Position;
            end;

            u65 = u65 + p69;
            local v73;

            if math.sin(u65 * 2) * 1 < 0 then
                v73 = Vector3.new(0, -1 * p69, 0);
            else
                v73 = Vector3.new(0, 1 * p69, 0);
            end;

            if PrimaryPart then
                CFrameUtil.setPosition(Pivot, PrimaryPart + v73);
            end;
        end;
    end);
    table.insert(u50.tornadoes, u51);
    u52:GiveTask(function() -- Line: 544
        -- upvalues: default (ref), Linear (ref), MathExtras (ref), u51 (copy), AirbenderKitBalance (ref), u50 (copy), u54 (copy), u59 (copy), u74 (copy)
        task.spawn(function() -- Line: 545
            -- upvalues: default (ref), Linear (ref), MathExtras (ref), u51 (ref), AirbenderKitBalance (ref), u50 (ref), u54 (ref), u59 (ref), u74 (ref)
            default(0.35, Linear, function(p75) -- Line: 547
                -- upvalues: MathExtras (ref), u51 (ref), AirbenderKitBalance (ref), u50 (ref), u54 (ref), u59 (ref)
                local v76;

                if u51.isMoving then
                    v76 = AirbenderKitBalance.MOVING_TORNADO_RADIUS;
                else
                    v76 = AirbenderKitBalance.TORNADO_RADIUS;
                end;

                u50:setTornadoRadius(u54, (MathExtras:lerp(v76, 0.01, p75)));
                u59.Volume = MathExtras:lerp(1, 0, p75);
            end, 0, 1):Play():Wait();
            u74:Disconnect();
            u54:Destroy();
            u59:Destroy();
        end);
    end);
end;

function u6.getTornadoData(p77, u78) -- Line: 562
    local function _(p79) -- Line: 564
        -- upvalues: u78 (copy)
        return p79.uuid == u78;
    end;

    for i, v in p77.tornadoes do
        local _ = i - 1;

        if v.uuid == u78 == true then
            return v;
        end;
    end;

    return nil;
end;

function u6.setTornadoRadius(p80, p81, p82) -- Line: 578
    p81.Pivot.Cylinder.Size = Vector3.new(p82, p81.Pivot.Cylinder.Size.Y, p82);
    p81.Pivot.Inside.Size = Vector3.new(p82, p81.Pivot.Inside.Size.Y, p82);
    p81.Pivot.Outside.Size = Vector3.new(p82, p81.Pivot.Outside.Size.Y, p82);
end;

function u6.createVectorForce(p83) -- Line: 583
    -- upvalues: u3 (copy)
    local v84 = p83:getLocalHumanoid();

    if v84 ~= nil then
        v84 = v84.RootPart;
    end;

    if not v84 then
        return nil;
    end;

    if p83.vectorForce ~= nil then
        local vectorForce = p83.vectorForce;

        if vectorForce ~= nil then
            vectorForce:Destroy();
        end;
    end;

    if p83.vectorForceAttachment ~= nil then
        local vectorForceAttachment = p83.vectorForceAttachment;

        if vectorForceAttachment ~= nil then
            vectorForceAttachment:Destroy();
        end;
    end;

    p83.vectorForceAttachment = u3("Attachment", {
        Name = "TornadoVectorForceAttachment",
        Parent = v84
    });
    p83.vectorForce = u3("VectorForce", {
        Name = "TornadoVectorForce",
        ApplyAtCenterOfMass = true,
        Force = Vector3.new(0, 0, 0),
        Enabled = true,
        RelativeTo = Enum.ActuatorRelativeTo.World,
        Attachment0 = p83.vectorForceAttachment,
        Parent = v84
    });
end;

function u6.getKitSkin(p85, p86) -- Line: 619
    -- upvalues: KnitClient (copy)
    return KnitClient.Controllers.KitController:getKitSkin(p86);
end;

KnitClient.CreateController(u6.new());

return nil;