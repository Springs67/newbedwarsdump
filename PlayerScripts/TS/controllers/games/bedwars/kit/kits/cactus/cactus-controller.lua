-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ConstantManager = v1.ConstantManager;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out", "sync-event-priority").SyncEventPriority;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local Linear = v2.Linear;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CactusBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "cactus-balance").CactusBalance;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "projectile-meta").ProjectileMeta;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u6 = ConstantManager.registerConstants(script, {
    offset = 0.58
});
local u7 = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 2),
    NumberSequenceKeypoint.new(0.1, 3),
    NumberSequenceKeypoint.new(0.2, 5),
    NumberSequenceKeypoint.new(0.3, 10),
    NumberSequenceKeypoint.new(0.4, 15),
    NumberSequenceKeypoint.new(0.5, 20),
    NumberSequenceKeypoint.new(0.6, 25),
    NumberSequenceKeypoint.new(0.7, 30),
    NumberSequenceKeypoint.new(0.8, 30),
    NumberSequenceKeypoint.new(0.9, 30),
    NumberSequenceKeypoint.new(1, 30)
});
local u8 = { 3, 6, 8, 10 };
local u9 = {
    GameSound.CACTUS_ABSORB_1,
    GameSound.CACTUS_ABSORB_2,
    GameSound.CACTUS_ABSORB_3,
    GameSound.CACTUS_ABSORB_4
};
local u10 = setmetatable({}, {
    __tostring = function() -- Line: 48, Name: __tostring
        return "CactusController";
    end,

    __index = BaseKitController
});
u10.__index = u10;

function u10.new(...) -- Line: 54
    -- upvalues: u10 (ref)
    local v11 = setmetatable({}, u10);

    return v11:constructor(...) or v11;
end;

function u10.constructor(p12) -- Line: 58
    -- upvalues: BedwarsKit (copy), AnimationType (copy), GameSound (copy), u9 (copy), BaseKitController (copy), u3 (copy)
    local CACTUS = BedwarsKit.CACTUS;
    local v13 = {
        animations = { AnimationType.CACTUS_CAST }
    };
    local v14 = { GameSound.CACTUS_ATTACH, GameSound.CACTUS_LOOP };
    table.move(u9, 1, #u9, #v14 + 1, v14);
    v13.sounds = v14;
    BaseKitController.constructor(p12, CACTUS, v13);
    p12.Name = "CactusController";
    p12.chargeMaid = u3.new();
    p12.buttonMaid = u3.new();
    p12.linkMap = {};
    p12.linkCount = {};
    p12.loopSoundMap = {};
end;

function u10.KnitStart(p15) -- Line: 76
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p15);
end;

function u10.onKitLocalActivated(u16, p17) -- Line: 79
    -- upvalues: Flamework (copy), AbilityId (copy), AbilityMeta (copy), ClientSyncEvents (copy), SyncEventPriority (copy), CactusBalance (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.CACTUS_FIRE, AbilityMeta[AbilityId.CACTUS_FIRE].triggerConfig):andThen(function(p18) -- Line: 81
        -- upvalues: u16 (copy)
        u16.buttonMaid:GiveTask(p18);
        u16.abilityRef = p18;
    end);
    u16.enabledAbility = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(AbilityId.CACTUS_FIRE);
    p17:GiveTask(ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGHEST):connect(function(p19) -- Line: 87
        -- upvalues: CactusBalance (ref)
        p19.attackSpeed = p19.attackSpeed + CactusBalance.ATTACK_SPEED_MODIFY;
        p19.config = {
            respectAttackSpeedOverride = true
        };
    end));
    p17:GiveTask(ClientSyncEvents.SwordSwing:setPriority(SyncEventPriority.HIGHEST):connect(function(p20) -- Line: 93
        p20.config = {
            respectAttackSpeedOverride = true
        };
    end));
end;

function u10.onKitLocalDeactivated(p21) -- Line: 99
end;

function u10.onKitReplicationActivated(u22, p23) -- Line: 101
    -- upvalues: default2 (copy), EntityUtil (copy)
    p23:GiveTask(default2.Client:Get("CactusLinkStart"):Connect(function(p24) -- Line: 102
        -- upvalues: EntityUtil (ref), u22 (copy)
        local victim = p24.victim;

        if not victim then
            return nil;
        end;

        local v25 = EntityUtil:getEntity(victim);

        if v25 then
            u22:createLink(p24.user, v25, true, p24.id);
        end;
    end));
    p23:GiveTask(default2.Client:Get("CactusLinkBreak"):Connect(function(p26) -- Line: 112
        -- upvalues: u22 (copy)
        u22:removeLink(p26.id, p26.user);
    end));
    p23:GiveTask(default2.Client:Get("CactusGainMaxHealth"):Connect(function(p27) -- Line: 115
        -- upvalues: u22 (copy)
        u22:createSiphonEffect(p27.user, p27.victim, p27.effectSize);
    end));
end;

function u10.onKitReplicationDeactivated(p28) -- Line: 119
end;

function u10.onInnateAbilityEnabled(p29, p30, p31) -- Line: 121
end;

function u10.onAbilityUsed(p32, p33, p34) -- Line: 123
    -- upvalues: AbilityId (copy), ReplicatedStorage (copy), GameSound (copy), SoundManager (copy), Workspace (copy), u7 (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p34.ability == AbilityId.CACTUS_FIRE then
        local PrimaryPart = p33.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        p32:cactusEffect(p33);
        local u35 = ReplicatedStorage.Assets.Effects.CactusPulse:Clone();
        local v36 = p32:getKitSkinData(p33);

        if v36 ~= nil then
            v36 = v36.cactusAttachSound;
        end;

        if v36 == nil then
            v36 = GameSound.CACTUS_ATTACH;
        end;

        SoundManager:playSound(v36, {
            rollOffMaxDistance = 220,
            position = PrimaryPart.Position
        });

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.CFrame;
        end;

        u35:PivotTo(PrimaryPart);
        u35.Parent = Workspace;

        local function _(p37) -- Line: 153
            -- upvalues: u7 (ref)
            if p37:IsA("ParticleEmitter") then
                p37.Size = u7;
                p37:Emit(1);
            end;
        end;

        for i, child in u35:WaitForChild("1", 1):GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") then
                child.Size = u7;
                child:Emit(1);
            end;
        end;

        task.delay(0.65, function() -- Line: 162
            -- upvalues: u35 (copy)
            return u35:Destroy();
        end);
        AnimationUtil:playAnimation(p33, GameAnimationUtil:getAssetId(AnimationType.CACTUS_CAST));
    end;
end;

function u10.createAimLine(u38) -- Line: 168
    -- upvalues: Players (copy), Workspace (copy), u4 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), DeviceUtil (copy), CollectionService (copy), RunService (copy), ProjectileMeta (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u38.aimLineOrigin = u4("Part", {
        Transparency = 1,
        CanCollide = false,
        Anchored = false,
        Parent = Workspace
    });
    local u39 = ReplicatedStorage.Assets.Effects.SorcererHitIndicator:Clone();
    u39.Parent = Workspace;
    u38.aimLineEnd = u39;
    u38.aimLineOrigin:PivotTo(Players.LocalPlayer.Character:GetPivot());
    local v40 = u4("WeldConstraint", {
        Part0 = u38.aimLineOrigin,
        Part1 = Players.LocalPlayer.Character.PrimaryPart,
        Parent = Players.LocalPlayer.Character
    });
    u38.chargeMaid:GiveTask(v40);
    GameQueryUtil:setQueryIgnored(u38.aimLineOrigin, true);
    GameQueryUtil:setQueryIgnored(u38.aimLineEnd, true);
    local v41 = u4("Attachment", {
        Parent = u38.aimLineOrigin
    });
    local v42 = u4("Attachment", {
        Parent = u38.aimLineEnd
    });
    local u43 = DeviceUtil.isMobileControls() and 3 or 1;
    local u44 = u4("Beam", {
        FaceCamera = true,
        Segments = 300,
        Brightness = 1,
        Attachment0 = v41,
        Attachment1 = v42,
        Color = ColorSequence.new(Color3.fromRGB(0, 82, 5)),
        Transparency = NumberSequence.new(0),
        Width0 = u43 * 0.08,
        Width1 = u43 * 0.08,
        Parent = Workspace
    });
    CollectionService:AddTag(u44, "projectile-preview-beam");
    u38.chargeMaid:GiveTask(u44);
    local u45 = 0;
    local v52 = RunService.Heartbeat:Connect(function() -- Line: 217
        -- upvalues: ProjectileMeta (ref), u45 (ref), Workspace (ref), u38 (copy), Players (ref), CollectionService (ref), u44 (copy), u43 (copy), u39 (copy)
        local cactus = ProjectileMeta.cactus;
        local launchVelocity = cactus.launchVelocity;
        local lifetimeSec = cactus.lifetimeSec;
        u45 = (launchVelocity == nil and 120 or launchVelocity) * (lifetimeSec == nil and 2.8 or lifetimeSec);
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local aimLineOrigin = u38.aimLineOrigin;

        if aimLineOrigin ~= nil then
            aimLineOrigin = aimLineOrigin.Position;
        end;

        if not aimLineOrigin then
            return nil;
        end;

        if not u38.aimLineEnd then
            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot().Position;
        end;

        if not Character2 then
            return nil;
        end;

        local v46 = u38:getProjectileDirection();
        local v47 = RaycastParams.new();
        local v48 = {};
        local v49 = CollectionService:GetTagged("DontBlockAbilityRaycast");
        table.move(v49, 1, #v49, #v48 + 1, v48);
        v47.FilterDescendantsInstances = v48;
        v47.FilterType = Enum.RaycastFilterType.Exclude;
        local v50 = Workspace:Raycast(Character2 + v46 * 5, v46 * u45, v47);

        if v50 then
            local aimLineEnd = u38.aimLineEnd;

            if aimLineEnd ~= nil then
                aimLineEnd:PivotTo(CFrame.new(v50.Position));
            end;

            u44.Color = ColorSequence.new(Color3.fromRGB(255, 36, 247));
            u44.Width0 = u43 * 0.1;
            u44.Width1 = u43 * 0.1;
            u44.Transparency = NumberSequence.new(0);
            u38.aimLineEnd.Color = Color3.new(1, 0.03, 0.9);
            u38.aimLineEnd.Transparency = 0;
            u39.Attachment.ParticleEmitter.Enabled = true;

            return;
        end;

        local v51 = u38.aimLineOrigin.Position + v46 * u45;
        local aimLineEnd = u38.aimLineEnd;

        if aimLineEnd ~= nil then
            aimLineEnd:PivotTo(CFrame.new(v51));
        end;

        u44.Color = ColorSequence.new(Color3.fromRGB(255, 242, 255));
        u44.Transparency = NumberSequence.new(0.3);
        u44.Width0 = u43 * 0.08;
        u44.Width1 = u43 * 0.08;
        u38.aimLineEnd.Color = Color3.new(1, 0.95, 1);
        u38.aimLineEnd.Transparency = 0.8;
        u39.Attachment.ParticleEmitter.Enabled = false;
    end);
    u38.chargeMaid:GiveTask(v52);
end;

function u10.getProjectileDirection(p53) -- Line: 300
    -- upvalues: Workspace (copy), KnitClient (copy)
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.3, LookVector.Z);
    end;

    return LookVector;
end;

function u10.createLink(u54, p55, p56, p57, u58) -- Line: 308
    -- upvalues: Players (copy), GameSound (copy), u4 (copy), Workspace (copy), ReplicatedStorage (copy), RunService (copy), CactusBalance (copy)
    local v59 = u54:spikeEffect(p55, p56:getInstance());
    local Character = p55.Character;
    local u60 = p56:getInstance();
    local u61 = ColorSequence.new(Color3.fromRGB(0, 69, 10));

    if p55.Team ~= Players.LocalPlayer.Team then
        u61 = ColorSequence.new(Color3.fromRGB(250, 0, 0));
    end;

    if not (Character and u60) then
        return nil;
    end;

    if u54.loopSoundMap[p55] == nil then
        local v62 = u54:getKitSkinData(p55.Character);

        if v62 ~= nil then
            v62 = v62.cactusLoopSound;
        end;

        if v62 == nil then
            v62 = GameSound.CACTUS_LOOP;
        end;

        local v63 = u4("Sound", {
            RollOffMinDistance = 20,
            RollOffMaxDistance = 40,
            Volume = 1,
            Playing = true,
            Looped = true,
            SoundId = v62,
            Parent = Character.PrimaryPart
        });
        u54.loopSoundMap[p55] = v63;
    end;

    local UpperTorso = Character:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("BodyBackAttachment");
    end;

    local u64 = u4("Model", {
        Parent = Workspace
    });

    if v59 then
        v59.Parent = u64;
    end;

    if u60 ~= nil then
        u60 = u60:WaitForChild("UpperTorso", 1);

        if u60 ~= nil then
            u60 = u60:WaitForChild("BodyFrontAttachment", 1);
        end;
    end;

    local u65 = {};

    if UpperTorso and u60 then
        local v66 = ReplicatedStorage.Assets.Effects.CactusLine:Clone();
        v66.Parent = u64;

        local function _(p67) -- Line: 370
            -- upvalues: u65 (copy), u60 (copy), UpperTorso (copy), u61 (ref)
            if p67:IsA("Beam") then
                table.insert(u65, p67);
                p67.Attachment0 = u60;
                p67.Attachment1 = UpperTorso;
                p67.Color = u61;
            end;
        end;

        for i, child in v66:GetChildren() do
            local _ = i - 1;

            if child:IsA("Beam") then
                table.insert(u65, child);
                child.Attachment0 = u60;
                child.Attachment1 = UpperTorso;
                child.Color = u61;
            end;
        end;

        task.delay((UpperTorso.WorldPosition - u60.WorldPosition).Magnitude / 5 * 0.1 + 0.1, function() -- Line: 387
            -- upvalues: u65 (copy)
            local function _(p68) -- Line: 388
                p68.Enabled = true;
            end;

            for i, v in u65 do
                local _ = i - 1;
                v.Enabled = true;
            end;
        end);
        local u69 = nil;
        u69 = RunService.Heartbeat:Connect(function(p70) -- Line: 396
            -- upvalues: u54 (copy), u58 (copy), u69 (ref), u64 (copy), Workspace (ref), UpperTorso (copy), u60 (copy), CactusBalance (ref), u65 (copy)
            if u54.linkMap[u58] == nil then
                u69:Disconnect();

                return nil;
            end;

            if u64.Parent ~= Workspace then
                u69:Disconnect();

                return nil;
            end;

            if not (UpperTorso and u60) then
                u69:Disconnect();

                return nil;
            end;

            local Magnitude = (UpperTorso.WorldPosition - u60.WorldPosition).Magnitude;

            if CactusBalance.LINK_DISTANCE < Magnitude then
                local function _(p71) -- Line: 415
                    p71.Width0 = 0;
                    p71.Width1 = 0;
                end;

                for i, v in u65 do
                    local _ = i - 1;
                    v.Width0 = 0;
                    v.Width1 = 0;
                end;

                return;
            end;

            local u72 = math.min(5, (1.05 - Magnitude / CactusBalance.LINK_DISTANCE) * 10);

            local function _(p73) -- Line: 424
                -- upvalues: u72 (copy)
                p73.Width0 = u72;
                p73.Width1 = u72;
            end;

            for i, v in u65 do
                local _ = i - 1;
                v.Width0 = u72;
                v.Width1 = u72;
            end;
        end);
        u54.linkMap[u58] = u64;
        local v74 = u54.linkCount[p55];
        u54.linkCount[p55] = (v74 == nil and 0 or v74) + 1;
    end;
end;

function u10.removeLink(p75, p76, p77) -- Line: 449
    local v78 = p75.linkMap[p76];

    if v78 then
        v78:Destroy();
    end;

    p75.linkMap[p76] = nil;
    local v79 = p75.linkCount[p77];
    local v80 = (v79 == nil and 1 or v79) - 1;
    p75.linkCount[p77] = v80;

    if v80 <= 0 and p75.loopSoundMap[p77] ~= nil then
        local v81 = p75.loopSoundMap[p77];

        if v81 ~= nil then
            v81:Destroy();
        end;

        p75.loopSoundMap[p77] = nil;
    end;
end;

function u10.createSiphonEffect(p82, u83, u84, p85) -- Line: 488
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), u6 (copy), u3 (copy), u8 (copy), u9 (copy), SoundManager (copy), RunService (copy)
    local u86 = ReplicatedStorage.Assets.Effects.CactusSiphon:Clone();
    u86.Parent = Workspace;

    local function _(p87) -- Line: 492
        -- upvalues: u6 (ref)
        if p87:IsA("Beam") then
            p87:SetTextureOffset(u6.offset);
            p87.TextureSpeed = 1.1;
        end;
    end;

    for i, descendant in u86:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Beam") then
            descendant:SetTextureOffset(u6.offset);
            descendant.TextureSpeed = 1.1;
        end;
    end;

    local u88 = u3.new();
    local Character = u83.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    local v89 = (table.find(u8, p85) or 0) - 1;
    local v90 = u86.destination:GetChildren();
    local v91 = false;
    local v92 = 0;

    while true do
        if v91 then
            v92 = v92 + 1;
        else
            v91 = true;
        end;

        if v92 > v89 then
            if Character and v89 >= 0 then
                local v93 = p82:getKitSkinData(u83.Character);

                if v93 ~= nil then
                    v93 = v93.orderedCactusAbsorbSounds;
                end;

                if v93 == nil then
                    v93 = u9;
                end;

                SoundManager:playSound(v93[v89 + 1], {
                    rollOffMaxDistance = 220,
                    position = Character
                });
            end;

            u88:GiveTask(u86);
            u88:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 548
                -- upvalues: u84 (copy), u83 (copy), u88 (copy), u86 (copy)
                local Character2 = u84.Character;

                if Character2 ~= nil then
                    Character2 = Character2.PrimaryPart;
                end;

                local v94 = not Character2;

                if not v94 then
                    local Character3 = u83.Character;

                    if Character3 ~= nil then
                        Character3 = Character3.PrimaryPart;
                    end;

                    v94 = not Character3;
                end;

                if v94 then
                    u88:DoCleaning();

                    return nil;
                end;

                u86.Position = u83.Character.PrimaryPart.Position;

                for _, child in u86:GetChildren() do
                    if child:IsA("Attachment") then
                        local Character3 = u84.Character;

                        if Character3 ~= nil then
                            Character3 = Character3.PrimaryPart.Position;
                        end;

                        if child.Name == "destination" then
                            Character3 = u83.Character.PrimaryPart.Position;
                        end;

                        child.WorldPosition = Character3;
                    end;
                end;
            end));
            task.delay(0.7, function() -- Line: 581
                -- upvalues: u88 (copy)
                u88:DoCleaning();
            end);

            return;
        end;

        if v90[v92 + 1]:IsA("Beam") then
            v90[v92 + 1].CurveSize0 = math.random(-20, 20);
            v90[v92 + 1].CurveSize1 = math.random(-10, 10);
            v90[v92 + 1].Enabled = true;
        end;
    end;
end;

function u10.spikeEffect(p95, p96, u97) -- Line: 585
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), default (copy), InQuad (copy), u4 (copy)
    local PrimaryPart = u97.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    local u98 = PrimaryPart;

    if not u98 then
        return nil;
    end;

    local u99 = p95:getKitSkinData(p96.Character);

    if u99 ~= nil then
        u99 = u99.spikeMesh;

        if u99 ~= nil then
            u99 = u99:Clone();
        end;
    end;

    if u99 == nil then
        u99 = ReplicatedStorage.Assets.Effects.CactusSpike:Clone();
    end;

    u99:SetAttribute("FirstPersonVisible", false);
    CollectionService:AddTag(u99, "FirstPersonHidden");
    u99.Parent = Workspace;
    local Character = p96.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local Unit = (u98 - Character).Unit;
    u99:PivotTo(CFrame.new(Character, u98));
    local v100 = (u98 - Character).Magnitude / 80;
    default(v100, InQuad, function(p101) -- Line: 626
        -- upvalues: u99 (copy)
        u99:PivotTo(p101);
    end, u99.CFrame, CFrame.new(u98, u98 + Unit));
    local u102 = u99:Clone();
    task.delay(v100, function() -- Line: 630
        -- upvalues: u97 (copy), u98 (ref), u102 (copy), Unit (copy), u99 (copy), u4 (ref)
        local PrimaryPart2 = u97.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        u98 = PrimaryPart2;

        if not u98 then
            return nil;
        end;

        u102.Anchored = false;
        local v103 = math.random();
        local v104 = math.random();
        local v105 = Vector3.new(v103, v104, math.random());
        u102:PivotTo(CFrame.new(u98 - Unit * 2 + v105, u98 + Unit));
        u99:Destroy();
        u4("WeldConstraint", {
            Part0 = u102,
            Part1 = u97.PrimaryPart,
            Parent = u102
        });
    end);

    return u102;
end;

function u10.cactusEffect(p106, u107) -- Line: 656
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), RunService (copy), default (copy), OutQuad (copy), Linear (copy)
    local u108 = p106:getKitSkinData(u107);

    if u108 ~= nil then
        u108 = u108.ballMesh;

        if u108 ~= nil then
            u108 = u108:Clone();
        end;
    end;

    if u108 == nil then
        u108 = ReplicatedStorage.Assets.Effects.CactusBall:Clone();
    end;

    u108:SetAttribute("FirstPersonVisible", false);
    u108:SetAttribute("InitialTransparency", 0.55);
    CollectionService:AddTag(u108, "FirstPersonHidden");
    u108.Transparency = 0.55;
    local PrimaryPart = u107.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    local u109 = PrimaryPart;

    if not u109 then
        return nil;
    end;

    u108:PivotTo(CFrame.new(u109));
    u108.Parent = Workspace;
    local u110 = nil;
    u110 = RunService.Heartbeat:Connect(function(p111) -- Line: 685
        -- upvalues: u107 (copy), u109 (ref), u110 (ref), u108 (copy)
        local PrimaryPart2 = u107.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        u109 = PrimaryPart2;

        if not u109 then
            u110:Disconnect();

            return nil;
        end;

        u108.Position = u109;
    end);

    if u108.Transparency ~= 1 then
        u108.Transparency = 0.55;
    end;

    u108.Size = u108.Size * 2.5;
    local u112 = u108.Size * 1.3;
    local v113 = u108.Size * 0.8;
    task.delay(0.4, function() -- Line: 703
        -- upvalues: u110 (ref), u108 (copy)
        u110:Disconnect();
        u108:Destroy();
    end);
    default(0.2, OutQuad, function(p114) -- Line: 707
        -- upvalues: u108 (copy)
        u108.Size = p114;
    end, u108.Size, v113);
    task.delay(0.2, function() -- Line: 710
        -- upvalues: default (ref), Linear (ref), u108 (copy), u112 (copy)
        default(0.3, Linear, function(p115) -- Line: 711
            -- upvalues: u108 (ref)
            u108.Size = p115;
        end, u108.Size, u112);
    end);
end;

function u10.getKitSkinData(p116, p117) -- Line: 716
    -- upvalues: KnitClient (copy), BedwarsKitSkinMeta (copy)
    if not p117 then
        return nil;
    end;

    local v118 = BedwarsKitSkinMeta[KnitClient.Controllers.KitSkinController:getKitSkin(p117)];

    if v118.cactus then
        return v118.cactus;
    end;
end;

KnitClient.CreateController(u10.new());

return nil;