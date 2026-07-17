-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local DeviceUtil = v1.DeviceUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local SpiderQueenBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "spider-queen-balance").SpiderQueenBalance;
local findSurfacePosition = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").findSurfacePosition;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local SpiderQueenUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spider-queen", "spider-queen-util").SpiderQueenUtil;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "SpiderQueenController";
    end,

    __index = BaseKitController
});
u5.__index = u5;

function u5.new(...) -- Line: 46
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 50
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u2 (copy)
    BaseKitController.constructor(p7, BedwarsKit.SPIDER_QUEEN);
    p7.Name = "SpiderQueenController";
    p7.aimMaid = u2.new();
    p7.initialized = false;
    p7.hasValidAim = false;
end;

function u5.onKitLocalActivated(u8, u9) -- Line: 57
    -- upvalues: KnitClient (copy), GameSound (copy), AnimationType (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy), ClientSyncEvents (copy), SpiderQueenUtil (copy), EntityUtil (copy), Players (copy), BedwarsKit (copy), MatchState (copy), SoundManager (copy), default (copy)
    if u8.initialized then
        return nil;
    end;

    u8.initialized = true;
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = { GameSound.CRYPT_SUMMON_SKELETON },
        animations = { AnimationType.NECROMANCER_SUMMON }
    });
    local v10 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local SPIDER_QUEEN_SUMMON_SPIDERS = AbilityId.SPIDER_QUEEN_SUMMON_SPIDERS;
    local v11 = {};

    for i, v in AbilityMeta[AbilityId.SPIDER_QUEEN_SUMMON_SPIDERS].triggerConfig do
        v11[i] = v;
    end;

    v10:enableAbility(SPIDER_QUEEN_SUMMON_SPIDERS, v11):andThen(function(p12) -- Line: 73
        -- upvalues: u9 (copy)
        u9:GiveTask(p12);
    end);
    local v13 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
    local SPIDER_QUEEN_WEB_BRIDGE_AIM = AbilityId.SPIDER_QUEEN_WEB_BRIDGE_AIM;
    local v14 = {};

    for i, v in AbilityMeta[AbilityId.SPIDER_QUEEN_WEB_BRIDGE_AIM].triggerConfig do
        v14[i] = v;
    end;

    v13:enableAbility(SPIDER_QUEEN_WEB_BRIDGE_AIM, v14):andThen(function(p15) -- Line: 84
        -- upvalues: u9 (copy), u8 (copy)
        u9:GiveTask(p15);
        u8.abilityRef = p15;
    end);
    u9:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p16) -- Line: 89
        -- upvalues: SpiderQueenUtil (ref), EntityUtil (ref), KnitClient (ref), Players (ref), BedwarsKit (ref), MatchState (ref)
        if table.find(SpiderQueenUtil.Abilities, p16.ability) == nil then
            return nil;
        end;

        local v17 = EntityUtil:getEntity(p16.userCharacter);

        if not v17 then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.SPIDER_QUEEN) then
            p16:setCancelled(true);

            return nil;
        end;

        if v17:isDead() then
            p16:setCancelled(true);

            return nil;
        end;

        if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
            p16:setCancelled(true);

            return nil;
        end;
    end));
    u9:GiveTask(ClientSyncEvents.CanUseLocalAbility:connect(function(p18) -- Line: 113
        -- upvalues: AbilityId (ref), KnitClient (ref), Players (ref), BedwarsKit (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        if p18.ability ~= AbilityId.SPIDER_QUEEN_WEB_BRIDGE_FIRE then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.SPIDER_QUEEN) then
            return nil;
        end;

        if not u8.hasValidAim then
            p18:setCancelled(true);
            SoundManager:playSound(GameSound.UI_CLOSE_2, {
                volumeMultiplier = 0.8
            });
        end;
    end));
    u9:GiveTask((default.Client:Get("EntityDeathEvent"):Connect(function(p19) -- Line: 127
        -- upvalues: Players (ref), KnitClient (ref), BedwarsKit (ref), u8 (copy)
        local v20 = Players:GetPlayerFromCharacter(p19.entityInstance);

        if not v20 then
            return nil;
        end;

        if v20 ~= Players.LocalPlayer then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(v20, BedwarsKit.SPIDER_QUEEN) then
            return nil;
        end;

        u8.aimMaid:DoCleaning();
    end)));
end;

function u5.onKitLocalDeactivated(p21) -- Line: 142
end;

function u5.onKitReplicationActivated(u22, u23) -- Line: 144
    -- upvalues: CollectionService (copy), WatchCollectionTag (copy), u2 (copy), TweenService (copy), SpiderQueenBalance (copy), KnitClient (copy), Players (copy), SpiderQueenUtil (copy), ClientSyncEvents (copy), StatusEffectType (copy), SoundManager (copy), GameSound (copy), BedwarsKit (copy), AbilityId (copy), Flamework (copy), AbilityMeta (copy), BedwarsImageId (copy)
    local function _(p24) -- Line: 146
        -- upvalues: u22 (copy)
        u22:setUpWebBlock(p24);
    end;

    for i, v in CollectionService:GetTagged("spider-queen-web-block") do
        local _ = i - 1;
        u22:setUpWebBlock(v);
    end;

    u23:GiveTask(WatchCollectionTag("spider-queen-web-block", function(p25) -- Line: 153
        -- upvalues: u22 (copy)
        u22:setUpWebBlock(p25);
    end));
    u23:GiveTask(WatchCollectionTag("spider-queen-spider", function(u26) -- Line: 157
        -- upvalues: u2 (ref), TweenService (ref), SpiderQueenBalance (ref), KnitClient (ref), Players (ref), SpiderQueenUtil (ref)
        local u27 = u2.new();
        u26.AncestryChanged:Connect(function() -- Line: 159
            -- upvalues: u26 (copy), u27 (copy)
            if not u26.Parent then
                u27:DoCleaning();
            end;
        end);
        u26:WaitForChild("Torso");
        u26:WaitForChild("Eyes");
        u26:WaitForChild("Legs");
        local v28 = u26:GetDescendants();

        local function v30(p29) -- Line: 169
            -- upvalues: TweenService (ref)
            if p29:IsA("MeshPart") then
                p29.Transparency = 1;
                TweenService:Create(p29, TweenInfo.new(1), {
                    Transparency = 0
                }):Play();
            end;
        end;

        for i, v in v28 do
            v30(v, i - 1, v28);
        end;

        u27:GiveTask(task.delay(SpiderQueenBalance.SPIDERLING_LIFETIME - 1, function() -- Line: 181
            -- upvalues: u26 (copy), TweenService (ref)
            local v31 = u26:GetDescendants();

            local function v33(p32) -- Line: 183
                -- upvalues: TweenService (ref)
                if p32:IsA("MeshPart") then
                    p32.Transparency = 0;
                    TweenService:Create(p32, TweenInfo.new(1), {
                        Transparency = 1
                    }):Play();
                end;
            end;

            for i, v in v31 do
                v33(v, i - 1, v31);
            end;
        end));

        local function u37(p34) -- Line: 196
            -- upvalues: KnitClient (ref), Players (ref), SpiderQueenUtil (ref)
            local v35 = p34:GetAttribute("Team");
            local v36 = KnitClient.Controllers.TeamController:getPlayerTeam(Players.LocalPlayer);

            if not v36 or (v35 == "" or not v35) then
                return nil;
            end;

            p34:WaitForChild("Eyes");
            p34:WaitForChild("Torso");

            if v35 == v36.id then
                p34.Eyes.Color = SpiderQueenUtil.AlliedSpiderlingColor;
                p34.Torso.EvilAura.Enabled = false;
                p34.Torso.Attachment.Specs.Enabled = false;

                return;
            end;

            p34.Eyes.Color = SpiderQueenUtil.EnemySpiderlingColor;
            p34.Torso.EvilAura.Enabled = true;
            p34.Torso.Attachment.Specs.Enabled = true;
        end;

        u37(u26);
        u27:GiveTask(u26:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 215
            -- upvalues: u37 (copy), u26 (copy)
            u37(u26);
        end));
        u27:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 218
            -- upvalues: u37 (copy), u26 (copy)
            u37(u26);
        end));
        local v38 = u26:GetAttribute("PlacedByUserId");
        local v39 = v38 ~= 0 and (v38 == v38 and (v38 and Players:GetPlayerByUserId(v38)));

        if v39 then
            u27:GiveTask(v39:GetAttributeChangedSignal("Team"):Connect(function() -- Line: 225
                -- upvalues: u37 (copy), u26 (copy)
                u37(u26);
            end));
        end;
    end));
    u23:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p40) -- Line: 231
        -- upvalues: StatusEffectType (ref), Players (ref), SoundManager (ref), GameSound (ref)
        if p40.statusEffect ~= StatusEffectType.SPIDER_WEB_SLOW then
            return nil;
        end;

        local v41 = p40.entityInstance == Players.LocalPlayer.Character;
        local SPIDER_WEB = GameSound.SPIDER_WEB;
        local v42 = {};
        local v43;

        if v41 then
            v43 = nil;
        else
            v43 = p40.entityInstance.PrimaryPart;

            if v43 ~= nil then
                v43 = v43.Position;
            end;
        end;

        v42.position = v43;
        v42.volumeMultiplier = v41 and 0.7 or 1;
        SoundManager:playSound(SPIDER_WEB, v42);
    end));
    u23:GiveTask(ClientSyncEvents.AbilityUsed:connect(function(u44) -- Line: 254
        -- upvalues: Players (ref), KnitClient (ref), BedwarsKit (ref), AbilityId (ref), u22 (copy), Flamework (ref), AbilityMeta (ref), u23 (copy), BedwarsImageId (ref)
        local v45 = Players:GetPlayerFromCharacter(u44.userCharacter);

        if not v45 then
            return nil;
        end;

        if not KnitClient.Controllers.KitController:isUsingKit(v45, BedwarsKit.SPIDER_QUEEN) then
            return nil;
        end;

        local ability = u44.ability;
        local v46 = false;

        if ability == AbilityId.SPIDER_QUEEN_SUMMON_SPIDERS then
            u22:playSummonSpidersEffect(v45);

            return;
        end;

        if ability ~= AbilityId.SPIDER_QUEEN_WEB_BRIDGE_AIM then
            if ability ~= AbilityId.SPIDER_QUEEN_WEB_BRIDGE_FIRE and not v46 and ability ~= AbilityId.SPIDER_QUEEN_WEB_BRIDGE_CANCEL or u44.userCharacter ~= Players.LocalPlayer.Character then
                return;
            end;

            u22.aimMaid:DoCleaning();

            return;
        end;

        if u44.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        u22:createAimLine();

        if u22.abilityRef ~= nil then
            u22.abilityRef.Destroy();
        end;

        local v47 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController");
        local SPIDER_QUEEN_WEB_BRIDGE_FIRE = AbilityId.SPIDER_QUEEN_WEB_BRIDGE_FIRE;
        local v48 = {};

        for i, v in AbilityMeta[AbilityId.SPIDER_QUEEN_WEB_BRIDGE_FIRE].triggerConfig do
            v48[i] = v;
        end;

        function v48.getExtraData() -- Line: 283
            -- upvalues: u22 (ref)
            return {
                direction = u22:getWebBridgeProjectileDirection()
            };
        end;

        v47:enableAbility(SPIDER_QUEEN_WEB_BRIDGE_FIRE, v48):andThen(function(p49) -- Line: 289
            -- upvalues: u22 (ref), u23 (ref)
            u22.abilityRef = p49;
            u23:GiveTask(p49);
        end);
        u22.aimMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.SPIDER_QUEEN_WEB_BRIDGE_CANCEL, {
            abilityType = "KitTertiary",
            abilityButton = {
                icon = "rbxassetid://16812686987"
            },

            getExtraData = function() -- Line: 299, Name: getExtraData
            end
        }):expect());
        u22.aimMaid:GiveTask(function() -- Line: 301
            -- upvalues: u22 (ref), Flamework (ref), u44 (copy), BedwarsImageId (ref), u23 (ref)
            if u22.abilityRef ~= nil then
                u22.abilityRef.Destroy();
            end;

            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u44.ability, {
                abilityType = "KitPrimary",
                abilityButton = {
                    icon = BedwarsImageId.SPIDER_QUEEN_WEB_BRIDGE_ICON
                },

                getExtraData = function() -- Line: 310, Name: getExtraData
                    -- upvalues: u22 (ref)
                    return {
                        direction = u22:getWebBridgeProjectileDirection()
                    };
                end
            }):andThen(function(p50) -- Line: 316
                -- upvalues: u22 (ref), u23 (ref)
                u22.abilityRef = p50;
                u23:GiveTask(p50);
            end);
        end);
    end));
end;

function u5.onKitReplicationDeactivated(p51) -- Line: 336
end;

function u5.onInnateAbilityEnabled(p52, p53, p54) -- Line: 338
end;

function u5.onAbilityUsed(p55, p56, p57) -- Line: 340
end;

function u5.KnitStart(p58) -- Line: 342
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p58);
end;

function u5.setUpWebBlock(p59, u60) -- Line: 345
    -- upvalues: Players (copy), SpiderQueenUtil (copy), SpiderQueenBalance (copy), TweenService (copy)
    local v61 = u60:GetAttribute("PlacedByUserId");

    if v61 == 0 or (v61 ~= v61 or not v61) then
        return nil;
    end;

    local v62;

    if v61 == Players.LocalPlayer.UserId then
        v62 = SpiderQueenUtil.AlliedWebColor;
    else
        v62 = SpiderQueenUtil.EnemyWebColor;
    end;

    u60:WaitForChild("WebColor");
    u60:WaitForChild("WebPlastic");
    u60.WebColor.Color = v62;
    u60.WebPlastic.Color = v62;
    task.delay(SpiderQueenBalance.WEB_BLOCK_LIFETIME - SpiderQueenBalance.WEB_BLOCK_FADE_DURATION, function() -- Line: 355
        -- upvalues: u60 (copy), TweenService (ref), SpiderQueenBalance (ref)
        if not (u60.WebColor and u60.WebPlastic) then
            return nil;
        end;

        TweenService:Create(u60.WebColor, TweenInfo.new(SpiderQueenBalance.WEB_BLOCK_FADE_DURATION, Enum.EasingStyle.Exponential), {
            Transparency = 1
        }):Play();
        TweenService:Create(u60.WebPlastic, TweenInfo.new(SpiderQueenBalance.WEB_BLOCK_FADE_DURATION, Enum.EasingStyle.Linear), {
            Transparency = 1
        }):Play();
    end);
end;

function u5.playSummonSpidersEffect(p63, u64) -- Line: 367
    -- upvalues: AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy), findSurfacePosition (copy), ReplicatedStorage (copy), Workspace (copy)
    AnimationUtil:playAnimation(u64, GameAnimationUtil:getAssetId(AnimationType.NECROMANCER_SUMMON));
    local CRYPT_SUMMON_SKELETON = GameSound.CRYPT_SUMMON_SKELETON;
    local v65 = {};
    local v66;

    if Players.LocalPlayer == u64 then
        v66 = nil;
    else
        v66 = u64.Character;

        if v66 ~= nil then
            v66 = v66.PrimaryPart;

            if v66 ~= nil then
                v66 = v66.Position;
            end;
        end;
    end;

    v65.position = v66;
    v65.playbackSpeedMultiplier = 1;
    v65.volumeMultiplier = 1;
    SoundManager:playSound(CRYPT_SUMMON_SKELETON, v65);
    task.spawn(function() -- Line: 391
        -- upvalues: u64 (copy), EntityUtil (ref), findSurfacePosition (ref), ReplicatedStorage (ref), Workspace (ref)
        if not u64.Character then
            return nil;
        end;

        if not EntityUtil:getEntity(u64.Character) then
            return nil;
        end;

        local Position = u64.Character:GetPivot().Position;

        if not Position then
            return nil;
        end;

        local v67 = findSurfacePosition(Position);

        if not v67 then
            return nil;
        end;

        local u68 = ReplicatedStorage.Assets.Effects.SummonSpiders:Clone();
        u68.Parent = Workspace;
        u68:PivotTo(CFrame.new(v67 + Vector3.new(0, 0.75, 0)));
        task.spawn(function() -- Line: 412
            -- upvalues: u68 (copy)
            u68.FlatGround.Ground.Center:Emit(2);
            u68.FlatGround.Ground.Dust:Emit(2);
            u68.FlatGround.Ground.Shockwave:Emit(3);
            u68.FlatGround.Ground.Wind:Emit(3);
            u68.FlatGround.Ground.Wind2:Emit(3);
            u68.FlatGround.Ground.Pulse:Emit(1);
            u68.FlatGround.Smoke:Emit(10);
            u68.FlatGround.Smoke2:Emit(10);
            u68.FlatGround.Sparks:Emit(10);
            u68.FlatGround.Summon.SummonCircle:Emit(1);
        end);
    end);
end;

function u5.createAimLine(u69) -- Line: 426
    -- upvalues: Players (copy), Workspace (copy), u3 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), DeviceUtil (copy), SpiderQueenUtil (copy), CollectionService (copy), SpiderQueenBalance (copy), RunService (copy)
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    u69.aimLineOrigin = u3("Part", {
        Transparency = 1,
        CanCollide = false,
        Anchored = false,
        Parent = Workspace
    });
    local u70 = ReplicatedStorage.Assets.Effects.SorcererHitIndicator:Clone();
    u70.Parent = Workspace;
    u69.aimLineEnd = u70;
    u69.aimLineOrigin:PivotTo(Players.LocalPlayer.Character:GetPivot());
    local v71 = u3("WeldConstraint", {
        Part0 = u69.aimLineOrigin,
        Part1 = Players.LocalPlayer.Character.PrimaryPart,
        Parent = Players.LocalPlayer.Character
    });
    u69.aimMaid:GiveTask(v71);
    u69.aimMaid:GiveTask(u70);
    GameQueryUtil:setQueryIgnored(u69.aimLineOrigin, true);
    GameQueryUtil:setQueryIgnored(u69.aimLineEnd, true);
    local v72 = u3("Attachment", {
        Parent = u69.aimLineOrigin
    });
    local v73 = u3("Attachment", {
        Parent = u69.aimLineEnd
    });
    local u74 = DeviceUtil.isMobileControls() and 3 or 1;
    local u75 = u3("Beam", {
        Name = "AimLine",
        FaceCamera = true,
        Segments = 300,
        Brightness = 1,
        Attachment0 = v72,
        Attachment1 = v73,
        Color = ColorSequence.new(SpiderQueenUtil.AimLineIndicatorColor),
        Transparency = NumberSequence.new(0),
        Width0 = u74 * 0.1,
        Width1 = u74 * 0.1,
        Parent = Workspace
    });
    CollectionService:AddTag(u75, "projectile-preview-beam");
    u69.aimMaid:GiveTask(u75);
    local WEB_BRIDGE_MAX_RANGE = SpiderQueenBalance.WEB_BRIDGE_MAX_RANGE;
    local v82 = RunService.Heartbeat:Connect(function() -- Line: 477
        -- upvalues: Workspace (ref), u69 (copy), Players (ref), CollectionService (ref), WEB_BRIDGE_MAX_RANGE (copy), u75 (copy), SpiderQueenUtil (ref), u74 (copy), u70 (copy)
        local CurrentCamera = Workspace.CurrentCamera;

        if CurrentCamera ~= nil then
            CurrentCamera = CurrentCamera.CFrame;
        end;

        if not CurrentCamera then
            return nil;
        end;

        local aimLineOrigin = u69.aimLineOrigin;

        if aimLineOrigin ~= nil then
            aimLineOrigin = aimLineOrigin.Position;
        end;

        if not aimLineOrigin then
            return nil;
        end;

        if not u69.aimLineEnd then
            return nil;
        end;

        local Character2 = Players.LocalPlayer.Character;

        if Character2 ~= nil then
            Character2 = Character2:GetPivot().Position;
        end;

        if not Character2 then
            return nil;
        end;

        local v76 = u69:getWebBridgeProjectileDirection();
        local v77 = RaycastParams.new();
        local v78 = {};
        local v79 = CollectionService:GetTagged("DontBlockAbilityRaycast");
        table.move(v79, 1, #v79, #v78 + 1, v78);
        v77.FilterDescendantsInstances = v78;
        v77.FilterType = Enum.RaycastFilterType.Exclude;
        local v80 = Workspace:Raycast(Character2 + v76 * 5, v76 * WEB_BRIDGE_MAX_RANGE, v77);

        if v80 then
            local aimLineEnd = u69.aimLineEnd;

            if aimLineEnd ~= nil then
                aimLineEnd:PivotTo(CFrame.new(v80.Position));
            end;

            u69.hasValidAim = true;
            u75.Color = ColorSequence.new(SpiderQueenUtil.AimLineIndicatorColor);
            u75.Width0 = u74 * 0.1;
            u75.Width1 = u74 * 0.1;
            u75.Transparency = NumberSequence.new(0);
            u75.Brightness = 1.5;
            u69.aimLineEnd.Color = SpiderQueenUtil.AimLineIndicatorColor;
            u69.aimLineEnd.Transparency = 0;
            u70.Attachment.ParticleEmitter.Enabled = true;

            return;
        end;

        local v81 = u69.aimLineOrigin.Position + v76 * WEB_BRIDGE_MAX_RANGE;
        local aimLineEnd = u69.aimLineEnd;

        if aimLineEnd ~= nil then
            aimLineEnd:PivotTo(CFrame.new(v81));
        end;

        u69.hasValidAim = false;
        u75.Color = ColorSequence.new(Color3.fromRGB(255, 240, 255));
        u75.Transparency = NumberSequence.new(0.25);
        u75.Width0 = u74 * 0.08;
        u75.Width1 = u74 * 0.08;
        u75.Brightness = 1;
        u69.aimLineEnd.Color = Color3.new(1, 0.95, 1);
        u69.aimLineEnd.Transparency = 0.75;
        u70.Attachment.ParticleEmitter:Clear();
        u70.Attachment.ParticleEmitter.Enabled = false;
    end);
    u69.aimMaid:GiveTask(v82);
    u69.aimMaid:GiveTask(function() -- Line: 551
        -- upvalues: u69 (copy)
        u69.hasValidAim = false;
    end);
end;

function u5.getWebBridgeProjectileDirection(p83) -- Line: 555
    -- upvalues: Workspace (copy), KnitClient (copy)
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;

    if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 1 then
        LookVector = Vector3.new(LookVector.X, LookVector.Y + 0.3, LookVector.Z);
    end;

    return LookVector;
end;

KnitClient.CreateController(u5.new());

return nil;