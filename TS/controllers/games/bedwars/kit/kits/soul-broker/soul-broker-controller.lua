-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out", "util", "map-util").MapUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local ColorUtil = v1.ColorUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local TweenService = v6.TweenService;
local Workspace = v6.Workspace;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SoulBrokerConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "soul-broker", "soul-broker-constants").SoulBrokerConstants;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local RaycastUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "raycast", "raycast-util").RaycastUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local SoulLinkIndicator = RuntimeLib.import(script, script.Parent, "ui", "soul-link-indicator").SoulLinkIndicator;
local SoulTarget = RuntimeLib.import(script, script.Parent, "ui", "soul-target").SoulTarget;
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 46, Name: __tostring
        return "SoulBrokerController";
    end,

    __index = BaseKitController
});
u7.__index = u7;

function u7.new(...) -- Line: 52
    -- upvalues: u7 (ref)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 56
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p9, BedwarsKit.SOUL_BROKER);
    p9.Name = "SoulBrokerController";
    p9.soulLinkMaids = {};
    p9.beamMap = {};
    p9.enemyLinksMap = {};
    p9.allyLinksMap = {};
end;

function u7.KnitStart(p10) -- Line: 64
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p10);
end;

function u7.onKitLocalActivated(u11, p12) -- Line: 67
    -- upvalues: KnitClient2 (copy), GameSound (copy), BedwarsImageId (copy), ReplicatedStorage (copy), default2 (copy), Players (copy), EntityUtil (copy), Workspace (copy), TweenService (copy), SoundManager (copy), MapUtil (copy)
    KnitClient2.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.SOUL_LINK_APPLY_ALLY,
            GameSound.SOUL_LINK_APPLY_ENEMY,
            GameSound.SOUL_LINK_DAMAGE_ALLY,
            GameSound.SOUL_LINK_DAMAGE_ENEMY
        },
        imageIds = {
            BedwarsImageId.SKULL_SOLID,
            BedwarsImageId.HEART,
            BedwarsImageId.SOUL_LINK_ICON,
            BedwarsImageId.SOUL_UNLINK_ICON
        },
        instances = {
            ReplicatedStorage.Assets.Effects.SoulLinkOrb,
            ReplicatedStorage.Assets.Effects.SoulLinkEffect,
            ReplicatedStorage.Assets.Effects.SoulGuardEffect,
            ReplicatedStorage.Assets.Effects.SoulLinkBeams
        }
    });
    u11:initializeTargetting(p12);
    p12:GiveTask(default2.Client:Get("SoulLinkRemoved"):Connect(function(u13) -- Line: 75
        -- upvalues: Players (ref), u11 (copy), EntityUtil (ref)
        local v14 = Players.LocalPlayer == u13.broker;

        if u13.guard then
            local v15 = u11.allyLinksMap[u13.broker];

            if not v15 then
                return nil;
            end;

            local v16 = EntityUtil:getEntity(u13.broker);

            if v16 ~= nil then
                v16 = v16:getInstance();
            end;

            if v16 then
                u11:detachBeam(u13.target, v16);
            end;

            local allyLinksMap = u11.allyLinksMap;
            local broker = u13.broker;

            local function _(p17) -- Line: 95
                -- upvalues: u13 (copy)
                return p17 ~= u13.target;
            end;

            local v18 = 0;
            local v19 = {};

            for i, v in v15 do
                local _ = i - 1;

                if v ~= u13.target == true then
                    v18 = v18 + 1;
                    v19[v18] = v;
                end;
            end;

            allyLinksMap[broker] = v19;
        else
            local v20 = u11.enemyLinksMap[u13.broker];

            if not v20 then
                return nil;
            end;

            local function _(p21) -- Line: 116
                -- upvalues: u11 (ref), u13 (copy)
                u11:detachBeam(u13.target, p21);
                u11:detachBeam(p21, u13.target);
            end;

            for i, v in v20 do
                local _ = i - 1;
                u11:detachBeam(u13.target, v);
                u11:detachBeam(v, u13.target);
            end;

            local enemyLinksMap = u11.enemyLinksMap;
            local broker = u13.broker;

            local function _(p22) -- Line: 125
                -- upvalues: u13 (copy)
                return p22 ~= u13.target;
            end;

            local v23 = 0;
            local v24 = {};

            for i, v in v20 do
                local _ = i - 1;

                if v ~= u13.target == true then
                    v23 = v23 + 1;
                    v24[v23] = v;
                end;
            end;

            enemyLinksMap[broker] = v24;
        end;

        if v14 then
            local v25 = u11.soulLinkMaids[u13.target];

            if v25 then
                v25:DoCleaning();
                v25:Destroy();
                u11.soulLinkMaids[u13.target] = nil;
            end;

            if next(u11.soulLinkMaids) == nil and u11.soulUnlinkAbilityRef then
                u11.soulUnlinkAbilityRef.Destroy();
                u11.soulUnlinkAbilityRef = nil;
            end;
        end;
    end));
    p12:GiveTask(default2.Client:Get("SoulLinkDamage"):Connect(function(p26) -- Line: 160
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), TweenService (ref), SoundManager (ref), GameSound (ref), u11 (copy)
        local Position = p26.to:GetPivot().Position;
        local u27 = ReplicatedStorage.Assets.Effects.SoulLinkOrb:Clone();
        u27.Size = Vector3.new(5, 5, 5) * math.clamp(p26.damage / 50, 0.2, 1);
        u27.Parent = Workspace;
        u27.Position = p26.from:GetPivot().Position;
        local v28 = TweenService:Create(u27, TweenInfo.new(0.2, Enum.EasingStyle.Cubic), {
            Position = Position
        });
        v28:Play();
        v28.Completed:Once(function() -- Line: 172
            -- upvalues: u27 (copy)
            u27:Destroy();
        end);
        local v29;

        if p26.guard then
            v29 = GameSound.SOUL_LINK_DAMAGE_ALLY;
        else
            v29 = GameSound.SOUL_LINK_DAMAGE_ENEMY;
        end;

        SoundManager:playSound(v29, {
            position = Position
        });
        local v30 = u11:findBeam(p26.from, p26.to);

        local function v32(u31) -- Line: 179
            -- upvalues: TweenService (ref)
            if u31 then
                TweenService:Create(u31, TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                    Brightness = 8,
                    Width0 = 4,
                    Width1 = 4
                }):Play();
                task.delay(0.1, function() -- Line: 187
                    -- upvalues: TweenService (ref), u31 (copy)
                    TweenService:Create(u31, TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut), {
                        Brightness = 4,
                        Width0 = 1,
                        Width1 = 1
                    }):Play();
                end);
            end;
        end;

        local v33;

        if v30 == nil then
            v33 = v30;
        else
            v33 = v30.beamBack;
        end;

        v32(v33);
        local v34;

        if v30 == nil then
            v34 = v30;
        else
            v34 = v30.beamFront;
        end;

        v32(v34);
        local v35;

        if v30 == nil then
            v35 = v30;
        else
            v35 = v30.beamStream;
        end;

        v32(v35);

        if v30 ~= nil then
            v30 = v30.beamParticle;
        end;

        v32(v30);
    end));
    p12:GiveTask(default2.Client:Get("SoulLinkFormed"):Connect(function(u36) -- Line: 218
        -- upvalues: EntityUtil (ref), MapUtil (ref), u11 (copy)
        if u36.guard then
            local v37 = EntityUtil:getEntity(u36.broker);

            if v37 ~= nil then
                v37 = v37:getInstance();
            end;

            if v37 then
                local v38 = MapUtil.getOrCreate(u11.allyLinksMap, u36.broker, {});
                table.insert(v38, u36.target);
                u11:attachBeam(u36.target, v37, true);
                u11.allyLinksMap[u36.broker] = v38;
            end;
        else
            local v39 = MapUtil.getOrCreate(u11.enemyLinksMap, u36.broker, {});

            local function _(p40) -- Line: 236
                -- upvalues: u11 (ref), u36 (copy)
                u11:attachBeam(u36.target, p40);
            end;

            for i, v in v39 do
                local _ = i - 1;
                u11:attachBeam(u36.target, v);
            end;

            table.insert(v39, u36.target);
            u11.enemyLinksMap[u36.broker] = v39;
        end;
    end));
end;

function u7.onKitLocalDeactivated(p41) -- Line: 250
end;

function u7.onKitReplicationActivated(p42, p43) -- Line: 252
end;

function u7.onKitReplicationDeactivated(p44) -- Line: 254
end;

function u7.onInnateAbilityEnabled(p45, p46, p47) -- Line: 256
end;

function u7.onAbilityUsed(u48, p49, p50) -- Line: 258
    -- upvalues: Players (copy), EntityUtil (copy), AbilityId (copy), default2 (copy), default (copy), u3 (copy), u5 (copy), SoulLinkIndicator (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Flamework (copy), AbilityMeta (copy)
    if p50:isCancelled() then
        return nil;
    end;

    if p49 ~= Players.LocalPlayer.Character then
        return nil;
    end;

    local u51 = EntityUtil:getEntity(Players.LocalPlayer);
    local ability = p50.ability;

    if ability == AbilityId.SOUL_LINK then
        default2.Client:Get("AttemptSoulLink"):CallServerAsync(u48.target):andThen(function(p52) -- Line: 271
            -- upvalues: u51 (copy), EntityUtil (ref), default (ref), u3 (ref), u48 (copy), u5 (ref), SoulLinkIndicator (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), AnimationUtil (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
            if p52 then
                if not p52.result then
                    return nil;
                end;

                local targetEntityInstance = p52.targetEntityInstance;

                if not targetEntityInstance then
                    return nil;
                end;

                if not u51 then
                    return nil;
                end;

                local v53 = EntityUtil:getEntity(targetEntityInstance);

                if not v53 then
                    return nil;
                end;

                local v54;

                if targetEntityInstance == nil then
                    v54 = targetEntityInstance;
                else
                    v54 = targetEntityInstance.Name;
                end;

                default.Info("[SOUL BROKER] Adding soul link " .. v54);
                local v55 = u51:canAttack(v53);
                local v56 = u3.new();
                u48.soulLinkMaids[targetEntityInstance] = v56;
                local u57 = u5.mount(u5.createElement(SoulLinkIndicator, {
                    IsEnemy = v55
                }), targetEntityInstance);
                v56:GiveTask(function() -- Line: 300
                    -- upvalues: u5 (ref), u57 (copy)
                    return u5.unmount(u57);
                end);
                local u58 = u48:highlightLinkedEntity(targetEntityInstance, not v55);
                v56:GiveTask(function() -- Line: 305
                    -- upvalues: u58 (copy)
                    return u58:Destroy();
                end);
                local v59;

                if v55 then
                    v59 = GameSound.SOUL_LINK_APPLY_ENEMY;
                else
                    v59 = GameSound.SOUL_LINK_APPLY_ALLY;
                end;

                SoundManager:playSound(v59);
                local v60;

                if v55 then
                    v60 = ReplicatedStorage.Assets.Effects.SoulLinkEffect:Clone();
                else
                    v60 = ReplicatedStorage.Assets.Effects.SoulGuardEffect:Clone();
                end;

                v60.CFrame = targetEntityInstance:GetPivot();
                v60.Parent = Workspace;
                EffectUtil:playEffects({ v60 }, nil);
                AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.RAVEN_THROW), {
                    looped = false
                });

                if not u48.soulUnlinkAbilityRef then
                    local v61 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
                    local SOUL_UNLINK = AbilityId.SOUL_UNLINK;
                    local v62 = {};

                    for i, v in AbilityMeta[AbilityId.SOUL_UNLINK].triggerConfig do
                        v62[i] = v;
                    end;

                    v61:enableAbility(SOUL_UNLINK, v62):andThen(function(p63) -- Line: 328
                        -- upvalues: u48 (ref)
                        u48.soulUnlinkAbilityRef = p63;
                    end);
                end;
            end;
        end);

        return;
    end;

    if ability == AbilityId.SOUL_UNLINK then
        default.Info("[SOUL BROKER] Attempting soul unlink");
        default2.Client:Get("AttemptSoulUnlink"):CallServerAsync();
    end;
end;

function u7.initializeTargetting(u64, p65) -- Line: 344
    -- upvalues: RunService (copy), Workspace (copy), Players (copy), EntityUtil (copy), GameWorldUtil (copy), SoulBrokerConstants (copy), RaycastUtil (copy), u5 (copy), SoulTarget (copy)
    local u66 = 0;
    p65:GiveTask(RunService.Heartbeat:Connect(function(p67) -- Line: 346
        -- upvalues: u66 (ref), Workspace (ref), u64 (copy), Players (ref), EntityUtil (ref), GameWorldUtil (ref), SoulBrokerConstants (ref), RaycastUtil (ref), u5 (ref), SoulTarget (ref)
        u66 = u66 + p67;

        if u66 < 0.05 then
            return nil;
        end;

        u66 = u66 - 0.05;
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            u64:removeTarget();

            return nil;
        end;

        local Character = Players.LocalPlayer.Character;
        local v68;

        if Character == nil then
            v68 = Character;
        else
            v68 = Character.PrimaryPart;

            if v68 ~= nil then
                v68 = v68.Position;
            end;
        end;

        if not v68 then
            u64:removeTarget();

            return nil;
        end;

        if not EntityUtil:getLocalPlayerEntity() then
            u64:removeTarget();

            return nil;
        end;

        local v69 = GameWorldUtil.getEntitiesWithinRadius(CurrentCamera.Position, SoulBrokerConstants.TARGETTING_RANGE);
        local Unit = Ray.new(CurrentCamera.Position, CurrentCamera.LookVector).Unit;
        local LookVector = CurrentCamera.LookVector;
        local v70 = (1 / 0);
        local v71 = nil;

        for _, v in v69 do
            local v72 = Players:GetPlayerFromCharacter(v:getInstance());
            local v73;

            if v72 == nil then
                v73 = v72;
            else
                v73 = v72:HasTag("PlayerHidden");
            end;

            if not v73 and v72 ~= Players.LocalPlayer then
                local Position = v:getInstance():GetPivot().Position;

                if (Position - CurrentCamera.Position):Dot(LookVector) >= 0 then
                    local v74 = Unit:ClosestPoint(Position);
                    local Magnitude = (Position - v74).Magnitude;

                    if SoulBrokerConstants.TARGETTING_RANGE >= Magnitude then
                        local v75 = Magnitude + (Unit.Origin - v74).Magnitude / 3;

                        if v70 > v75 and RaycastUtil.isUnblocked(Character, v) then
                            v71 = v:getInstance();
                            v70 = v75;
                        end;
                    end;
                end;
            end;
        end;

        if u64.target ~= v71 then
            u64:removeTarget();

            if v71 then
                u64.targetIcon = u5.mount(u5.createElement(SoulTarget), v71.PrimaryPart);
            end;
        end;

        u64:setTarget(v71);
    end));
end;

function u7.removeTarget(p76) -- Line: 430
    -- upvalues: u5 (copy)
    p76.target = nil;

    if p76.targetIcon then
        u5.unmount(p76.targetIcon);
    end;
end;

function u7.setTarget(p77, p78) -- Line: 436
    p77.target = p78;
end;

function u7.attachBeam(u79, u80, u81, u82) -- Line: 439
    -- upvalues: ReplicatedStorage (copy), u4 (copy), ColorUtil (copy), TweenService (copy), u3 (copy), RunService (copy), SoulBrokerConstants (copy)
    if u80 == u81 then
        return nil;
    end;

    local SoulLinkBeams = ReplicatedStorage.Assets.Effects.SoulLinkBeams;
    local u83 = TweenInfo.new(0.33, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, (1 / 0), true);
    local UpperTorso = u80:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
    end;

    local UpperTorso2 = u81:FindFirstChild("UpperTorso");

    if UpperTorso2 ~= nil then
        UpperTorso2 = UpperTorso2:FindFirstChild("BodyFrontAttachment");
    end;

    local u84 = UpperTorso or u4("Attachment", {
        Parent = u80.PrimaryPart
    });
    local u85 = UpperTorso2 or u4("Attachment", {
        Parent = u81.PrimaryPart
    });
    local v86 = {};
    local v87 = {};
    local v88 = ColorSequence.new(Color3.fromRGB(0, 255, 195));
    local v89;

    if u82 then
        v89 = ColorUtil.WHITE;
    else
        v89 = ColorUtil.BLACK;
    end;

    v87[1], v87[2] = v88, ColorSequence.new(v89);
    v86[1] = v87;

    if u84 and u85 then
        local function u96(p90, p91, p92, p93) -- Line: 467
            -- upvalues: u85 (ref), u84 (ref), u80 (copy), TweenService (ref), u83 (copy)
            p90.Color = p91;
            local v94;

            if p93 then
                v94 = u85;
            else
                v94 = u84;
            end;

            p90.Attachment0 = v94;
            local v95;

            if p93 then
                v95 = u84;
            else
                v95 = u85;
            end;

            p90.Attachment1 = v95;
            p90.Parent = u80;
            p90.Brightness = 4;
            TweenService:Create(p90, u83, {
                CurveSize0 = -1,
                CurveSize1 = 1,
                Width0 = 1,
                Width1 = 1
            }):Play();
            p92:GiveTask(p90);

            return p90;
        end;

        local function v106(p97) -- Line: 483
            -- upvalues: u3 (ref), u96 (copy), SoulLinkBeams (copy), u82 (copy), RunService (ref), u80 (copy), u81 (copy), SoulBrokerConstants (ref), u79 (copy)
            local v98 = u3.new();
            local u99 = u96(SoulLinkBeams.Beam1:Clone(), p97[1], v98);
            local u100 = u96(SoulLinkBeams.Beam1:Clone(), p97[2], v98);
            local u101 = u96(SoulLinkBeams.Beam3:Clone(), p97[1], v98, not u82);
            local u102 = u96(SoulLinkBeams.Beam4:Clone(), p97[2], v98, not u82);
            v98:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 489
                -- upvalues: u80 (ref), u81 (ref), u82 (ref), SoulBrokerConstants (ref), u99 (copy), u100 (copy), u101 (copy), u102 (copy)
                local Magnitude = (u80:GetPivot().Position - u81:GetPivot().Position).Magnitude;
                local v103;

                if u82 then
                    v103 = Magnitude / SoulBrokerConstants.SOUL_GUARD_MAX_DISTANCE;
                else
                    v103 = Magnitude / SoulBrokerConstants.SOUL_LINK_MAX_DISTANCE;
                end;

                local v104 = math.max(v103, 0.1);
                u99.Transparency = NumberSequence.new(v104);
                u100.Transparency = NumberSequence.new(v104);
                u101.Transparency = NumberSequence.new(v104);
                u102.Transparency = NumberSequence.new(v104);
            end));
            local v105 = u79.beamMap[u80];

            if v105 then
                table.insert(v105, {
                    target = u81,
                    maid = v98,
                    beamFront = u99,
                    beamBack = u100,
                    beamStream = u101,
                    beamParticle = u102
                });

                return;
            end;

            u79.beamMap[u80] = {
                {
                    target = u81,
                    maid = v98,
                    beamFront = u99,
                    beamBack = u100,
                    beamStream = u101,
                    beamParticle = u102
                }
            };
        end;

        for i, v in v86 do
            v106(v, i - 1, v86);
        end;
    end;
end;

function u7.detachBeam(p107, p108, u109) -- Line: 531
    local v110 = p107.beamMap[p108];
    local v111;

    if v110 == nil then
        v111 = v110;
    else
        local function _(p112) -- Line: 537
            -- upvalues: u109 (copy)
            return p112.target == u109;
        end;

        local v113 = 0;
        v111 = {};

        for i, v in v110 do
            local _ = i - 1;

            if v.target == u109 == true then
                v113 = v113 + 1;
                v111[v113] = v;
            end;
        end;
    end;

    if v110 ~= nil then
        local function _(p114) -- Line: 555
            -- upvalues: u109 (copy)
            return p114.target ~= u109;
        end;

        local v115 = 0;
        v110 = {};

        for i, v in v110 do
            local _ = i - 1;

            if v.target ~= u109 == true then
                v115 = v115 + 1;
                v110[v115] = v;
            end;
        end;
    end;

    if v110 then
        p107.beamMap[p108] = v110;

        if #v110 == 0 then
            p107.beamMap[p108] = nil;
        end;
    end;

    if v111 ~= nil then
        local function _(p116) -- Line: 583
            p116.maid:DoCleaning();
            p116.maid:Destroy();
        end;

        for i, v in v111 do
            local _ = i - 1;
            v.maid:DoCleaning();
            v.maid:Destroy();
        end;
    end;
end;

function u7.findBeam(p117, u118, u119) -- Line: 592
    local v120 = p117.beamMap[u118];

    if v120 ~= nil then
        local function _(p121) -- Line: 598
            -- upvalues: u119 (copy)
            return p121.target == u119;
        end;

        v120 = nil;

        for i, v in v120 do
            local _ = i - 1;

            if v.target == u119 == true then
                v120 = v;
                break;
            end;
        end;
    end;

    local v122 = p117.beamMap[u119];

    if v122 ~= nil then
        local function _(p123) -- Line: 618
            -- upvalues: u118 (copy)
            return p123.target == u118;
        end;

        v122 = nil;

        for i, v in v122 do
            local _ = i - 1;

            if v.target == u118 == true then
                v122 = v;
                break;
            end;
        end;
    end;

    return v120 or v122;
end;

function u7.highlightLinkedEntity(p124, p125, p126) -- Line: 635
    -- upvalues: StatefulEntityUtil (copy), u4 (copy), ColorUtil (copy), SoulBrokerConstants (copy)
    local v127 = p125:GetAttribute("EntityUUID");
    local v128;

    if v127 == "" or not v127 then
        v128 = nil;
    else
        v128 = StatefulEntityUtil:getGameEntity(v127);
    end;

    local v129 = {
        Name = "SoulLinkHighlight",
        FillTransparency = 1,
        Parent = v128 or p125
    };
    local v130;

    if p126 then
        v130 = ColorUtil.WHITE;
    else
        v130 = SoulBrokerConstants.SOUL_LINK_COLOR;
    end;

    v129.OutlineColor = v130;

    return u4("Highlight", v129);
end;

KnitClient.CreateController(u7.new());

return nil;