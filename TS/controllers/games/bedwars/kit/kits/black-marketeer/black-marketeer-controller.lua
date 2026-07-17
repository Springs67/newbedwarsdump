-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ComponentUtil = v1.ComponentUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local SyncEventPriority = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v3.Linear;
local OutBack = v3.OutBack;
local OutExpo = v3.OutExpo;
local OutSine = v3.OutSine;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v6.CollectionService;
local Players = v6.Players;
local ReplicatedStorage = v6.ReplicatedStorage;
local RunService = v6.RunService;
local Workspace = v6.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local u7 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic");
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local snapBlockRotation = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").snapBlockRotation;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "shop-component").default;
local PlayerEntity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u8 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "BlackMarketeerController";
    end,

    __index = BaseKitController
});
u8.__index = u8;

function u8.new(...) -- Line: 56
    -- upvalues: u8 (ref)
    local v9 = setmetatable({}, u8);

    return v9:constructor(...) or v9;
end;

function u8.constructor(p10) -- Line: 60
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), GameSound (copy), BedwarsImageId (copy), AnimationType (copy)
    BaseKitController.constructor(p10, BedwarsKit.BLACK_MARKET_TRADER, {
        sounds = { GameSound.WREN_PANFLUTE_SUMMON, GameSound.WREN_PANFLUTE_UNSUMMON },
        imageIds = { BedwarsImageId.OPEN_BLACK_MARKET_ABILITY_ICON, BedwarsImageId.CLOSE_BLACK_MARKET_ABILITY_ICON },
        animations = { AnimationType.SLIME_TAMER_FLUTE_USE, AnimationType.SLIME_TAMER_FLUTE_USE_FP }
    });
    p10.Name = "BlackMarketeerController";
end;

function u8.KnitStart(p11) -- Line: 68
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p11);
end;

function u8.onKitLocalActivated(p12, p13) -- Line: 71
    -- upvalues: KnitClient2 (copy), default3 (copy), Players (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    local u14 = KnitClient2.Controllers.BlackMarketeerCoinController:listenToPickup();

    if u14 then
        p13:GiveTask(function() -- Line: 74
            -- upvalues: u14 (copy)
            return u14.Destroy();
        end);
    end;

    p13:GiveTask(default3.Client:Get("BlackMarketBlockBreak"):Connect(function(p15) -- Line: 78
        -- upvalues: Players (ref), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        if p15.shopOwnerUserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.CLOSE_BLACK_MARKET);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OPEN_BLACK_MARKET, AbilityMeta[AbilityId.OPEN_BLACK_MARKET].triggerConfig);
    end));
end;

function u8.onKitLocalDeactivated(p16) -- Line: 87
end;

function u8.onKitReplicationActivated(u17, p18) -- Line: 89
    -- upvalues: default3 (copy), Players (copy), ClientSyncEvents (copy), SyncEventPriority (copy), AbilityId (copy), Flamework (copy), AbilityMeta (copy), BlockEngine (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), KnitClient2 (copy)
    p18:GiveTask((default3.Client:Get("BlackMarketPlaceShop"):Connect(function(u19) -- Line: 90
        -- upvalues: Players (ref), ClientSyncEvents (ref), SyncEventPriority (ref), AbilityId (ref), Flamework (ref), AbilityMeta (ref), BlockEngine (ref), ReplicatedStorage (ref), u17 (copy), Workspace (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref), KnitClient2 (ref)
        if not u19.blockPosition then
            if u19.shopOwnerUserId == Players.LocalPlayer.UserId then
                local u20 = nil;
                u20 = ClientSyncEvents.AbilityUsed:setPriority(SyncEventPriority.MONITOR + 1):connect(function(p21) -- Line: 95
                    -- upvalues: Players (ref), AbilityId (ref), Flamework (ref), AbilityMeta (ref), u20 (ref)
                    if p21.userCharacter ~= Players.LocalPlayer.Character then
                        return nil;
                    end;

                    if p21.ability ~= AbilityId.OPEN_BLACK_MARKET then
                        return nil;
                    end;

                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(AbilityId.CLOSE_BLACK_MARKET);
                    Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.OPEN_BLACK_MARKET, AbilityMeta[AbilityId.OPEN_BLACK_MARKET].triggerConfig);
                    u20:Destroy();
                end);
            end;

            return nil;
        end;

        local v22 = BlockEngine:getWorldPosition(u19.blockPosition);
        local u23 = CFrame.new(v22 - Vector3.new(0, 1.5, 0));
        local MatchLevelUp = ReplicatedStorage.Assets.Effects.MatchLevelUp;
        local v24 = Players:GetPlayerByUserId(u19.shopOwnerUserId);

        if v24 then
            MatchLevelUp = u17:getSummonEffect(v24) or MatchLevelUp;
        end;

        local v25 = MatchLevelUp:Clone();
        v25:PivotTo(u23);
        v25.Parent = Workspace;
        SoundManager:playSound(GameSound.MATCH_LEVEL_UP_1, {
            position = u23.Position
        });
        EffectUtil:playInstanceEffects({ v25 }, {
            destroyAfterSec = 3
        });
        task.delay(1, function() -- Line: 130
            -- upvalues: Players (ref), u19 (copy), KnitClient2 (ref), u17 (ref), u23 (copy)
            local v26 = Players:GetPlayerByUserId(u19.shopOwnerUserId);

            if v26 ~= nil then
                v26 = v26.Character;
            end;

            if not v26 then
                return nil;
            end;

            local v27 = KnitClient2.Controllers.KitController:getKitSkin(v26);
            local u28 = u17:createPortalEffect(u23, u23.Position, v27);
            task.delay(4, function() -- Line: 142
                -- upvalues: u28 (copy)
                return u28:DoCleaning();
            end);
        end);
    end)));
end;

function u8.onKitReplicationDeactivated(p29) -- Line: 149
end;

function u8.onInnateAbilityEnabled(p30, p31, p32) -- Line: 151
end;

function u8.onAbilityUsed(p33, p34, p35) -- Line: 153
    -- upvalues: AbilityId (copy)
    local ability = p35.ability;

    if ability == AbilityId.OPEN_BLACK_MARKET then
        p33:playFluteEffect(p34, true);

        return;
    end;

    if ability ~= AbilityId.CLOSE_BLACK_MARKET then
        return;
    end;

    p33:playFluteEffect(p34, false);
end;

function u8.getShopComponent(p36, p37) -- Line: 166
    -- upvalues: CollectionService (copy), ComponentUtil (copy), default2 (copy)
    local v38 = CollectionService:GetTagged("BLackMarketShop");
    local u39 = "BLACKMARKET_" .. tostring(p37.UserId);
    local u40 = nil;

    local function _(p41) -- Line: 170
        -- upvalues: ComponentUtil (ref), default2 (ref), u39 (copy), u40 (ref)
        local v42 = ComponentUtil:getComponent(p41, default2);
        local v43;

        if v42 == nil then
            v43 = v42;
        else
            v43 = v42.attributes.Id;
        end;

        if v43 == u39 then
            u40 = v42;

            return true;
        end;
    end;

    for i, v in v38 do
        local _ = i - 1;
        local v44 = ComponentUtil:getComponent(v, default2);
        local v45;

        if v44 == nil then
            v45 = v44;
        else
            v45 = v44.attributes.Id;
        end;

        local v46;

        if v45 == u39 then
            u40 = v44;
            v46 = true;
        else
            v46 = nil;
        end;

        if v46 == true then
            break;
        end;
    end;

    return u40;
end;

function u8.playFluteEffect(p47, p48, p49) -- Line: 192
    -- upvalues: Players (copy), EntityUtil (copy), RuntimeLib (copy), PlayerEntity (copy), KnitClient2 (copy), BedwarsKitSkin (copy), ReplicatedStorage (copy), WeldUtil (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy)
    local v50 = Players:GetPlayerFromCharacter(p48);
    local u51 = EntityUtil:getEntity(p48);

    if not RuntimeLib.instanceof(u51, PlayerEntity) then
        return nil;
    end;

    if u51 ~= nil then
        u51 = u51:getHandItemInstanceFromCharacter();

        if u51 ~= nil then
            u51 = u51:WaitForChild("Handle", 0.6);
        end;
    end;

    if u51 then
        u51.Transparency = 1;
    end;

    local v52 = KnitClient2.Controllers.KitController:getKitSkin(p48);
    local u53;

    if v52 == BedwarsKitSkin.HALLOWEEN_WREN then
        u53 = ReplicatedStorage.Assets.Misc.BlackMarketTraderPanFluteHalloween:Clone();
    elseif v52 == BedwarsKitSkin.HOLIDAY_WREN then
        u53 = ReplicatedStorage.Assets.Misc.BlackMarketTraderPanFluteHoliday:Clone();
    elseif v52 == BedwarsKitSkin.TIDAL_WREN then
        u53 = ReplicatedStorage.Assets.Misc.BlackMarketTraderPanFluteTidal:Clone();
    else
        local _ = v52 == BedwarsKitSkin.DEFAULT;
        u53 = ReplicatedStorage.Assets.Misc.BlackMarketTraderPanFlute:Clone();
    end;

    if not u53 then
        return nil;
    end;

    local v54 = p48:FindFirstChildWhichIsA("Humanoid");

    if v54 ~= nil then
        v54:AddAccessory(u53);
    end;

    WeldUtil:weldCharacterAccessories(p48);

    if v50 then
        GameAnimationUtil:playAnimation(v50, AnimationType.SLIME_TAMER_FLUTE_USE);

        if v50 == Players.LocalPlayer then
            KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.SLIME_TAMER_FLUTE_USE_FP);
        end;
    end;

    local v55;

    if p49 then
        v55 = GameSound.WREN_PANFLUTE_SUMMON;
    else
        v55 = GameSound.WREN_PANFLUTE_UNSUMMON;
    end;

    SoundManager:playSound(v55, {
        position = p48:GetPivot().Position
    });
    task.delay(0.65, function() -- Line: 257
        -- upvalues: u53 (ref), u51 (copy)
        local v56 = u53;

        if v56 ~= nil then
            v56:Destroy();
        end;

        if u51 then
            u51.Transparency = 0;
        end;
    end);
end;

function u8.createPortalEffect(p57, p58, p59, p60) -- Line: 267
    -- upvalues: u4 (copy), u5 (copy), Workspace (copy), GameQueryUtil (copy), u7 (copy), ReplicatedStorage (copy), BedwarsKitSkin (copy), snapBlockRotation (copy), GameSound (copy), SoundManager (copy), default (copy), OutBack (copy), EffectUtil (copy), OutSine (copy), Linear (copy), OutExpo (copy), RunService (copy)
    local u61 = u4.new();
    local u62 = u5("Part", {
        Size = Vector3.new(0.0001, 7, 7),
        Rotation = Vector3.new(0, -90, -90),
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Shape = Enum.PartType.Cylinder,
        Position = p59,
        Parent = Workspace
    });
    GameQueryUtil:setQueryIgnored(u62, true);
    u61:GiveTask(u62);
    local Size = u62.Size;
    local u63 = u7.createFaces(u62, nil, { Enum.NormalId.Left });
    task.spawn(function() -- Line: 285
        -- upvalues: u63 (copy), ReplicatedStorage (ref), u5 (ref)
        for _, v in u63 do
            ReplicatedStorage.Assets.Effects.PortalKillEffect.ViewportSkybox:Clone().Parent = v.slice.viewportFrame;
            u5("UICorner", {
                CornerRadius = UDim.new(1, 0),
                Parent = v.slice.viewportFrame
            });
        end;
    end);
    local u64 = nil;

    if p60 == BedwarsKitSkin.HALLOWEEN_WREN then
        u64 = ReplicatedStorage.Assets.Blocks.halloween_black_market_shop:Clone();
    elseif p60 == BedwarsKitSkin.HOLIDAY_WREN then
        u64 = ReplicatedStorage.Assets.Blocks.holiday_black_market_shop:Clone();
    elseif p60 == BedwarsKitSkin.TIDAL_WREN then
        u64 = ReplicatedStorage.Assets.Blocks.tidal_black_market_shop:Clone();
    end;

    if not u64 then
        return u61;
    end;

    local u65 = {};

    local function _(p66) -- Line: 318
        -- upvalues: u65 (copy)
        if p66.Name == "Root" then
            return nil;
        end;

        if p66:IsA("BasePart") then
            u65[p66.Name] = p66.Transparency;
            p66.Transparency = 1;
        end;
    end;

    for i, descendant in u64:GetDescendants() do
        local _ = i - 1;

        if descendant.Name ~= "Root" then
            if descendant:IsA("BasePart") then
                u65[descendant.Name] = descendant.Transparency;
                descendant.Transparency = 1;
            end;
        end;
    end;

    GameQueryUtil:setQueryIgnored(u64, true);
    local v67 = { p58:ToOrientation() };
    local v68 = CFrame.new(p58.Position + (p60 == BedwarsKitSkin.HOLIDAY_WREN and Vector3.new(0, 1.5, 0) or Vector3.new(0, 0, 0)));
    local Angles = CFrame.Angles;
    local v69 = snapBlockRotation((math.deg(v67[2])));
    local v70 = v68 * Angles(0, math.rad(v69), 0);
    u64:PivotTo(v70);
    u64.Parent = Workspace;
    local u71 = nil;

    if p60 == BedwarsKitSkin.HALLOWEEN_WREN then
        u71 = ReplicatedStorage.Assets.Effects.PortalParticlesHalloween:Clone();
    elseif p60 == BedwarsKitSkin.HOLIDAY_WREN then
        u71 = ReplicatedStorage.Assets.Effects.PortalParticlesHoliday:Clone();
    elseif p60 == BedwarsKitSkin.TIDAL_WREN then
        u71 = ReplicatedStorage.Assets.Effects.PortalParticlesTidal:Clone();
    end;

    if not u71 then
        return u61;
    end;

    u61:GiveTask(u71);
    u71:PivotTo(CFrame.new(u62:GetPivot().Position) * CFrame.Angles(0, 0, 1.5707963267948966));
    u71.Parent = u62;
    local v72 = nil;

    if p60 == BedwarsKitSkin.HALLOWEEN_WREN then
        v72 = GameSound.HALLOWEEN_BLACK_MARKET_SHOP_SUMMON;
    elseif p60 == BedwarsKitSkin.HOLIDAY_WREN then
        v72 = GameSound.HOLIDAY_BLACK_MARKET_SHOP_SUMMON;
    elseif p60 == BedwarsKitSkin.TIDAL_WREN then
        v72 = GameSound.TIDAL_BLACK_MARKET_SHOP_SUMMON;
    end;

    if v72 == "" or not v72 then
        return u61;
    end;

    SoundManager:playSound(v72, {
        position = u62:GetPivot().Position
    });
    local u73 = SoundManager:playSound(GameSound.CURSE_SUMMON_MOB_PORTAL_LOOP, {
        rollOffMaxDistance = 100,
        looped = true,
        position = u62:GetPivot().Position
    });
    u61:GiveTask(function() -- Line: 396
        -- upvalues: u73 (copy)
        local v74 = u73;

        if v74 ~= nil then
            v74:Stop();
        end;

        local v75 = u73;

        if v75 ~= nil then
            v75:Destroy();
        end;
    end);
    default(0.7, OutBack, function(p76) -- Line: 407
        -- upvalues: u62 (copy), Size (copy)
        local v77 = math.noise(os.clock() * 15) * 1.5;
        u62.Size = Vector3.new((Size.X + v77) * p76, (Size.Y + v77) * p76, Size.Z);
    end, 0, 1):Wait();
    EffectUtil:playEffects({ u71.OnOpen }, nil);
    EffectUtil:playEffects({ u71.OnOpened }, nil);
    SoundManager:playSound(GameSound.GLITCH_KILL_EFFECT, {
        position = p59
    });
    default(0.6, OutSine, function(u78) -- Line: 418
        -- upvalues: u64 (ref), u65 (copy)
        local v79 = u64;

        if v79 ~= nil then
            local function _(p80) -- Line: 422
                -- upvalues: u65 (ref), u78 (copy)
                if p80.Name == "Root" then
                    return nil;
                end;

                if p80:IsA("BasePart") then
                    local v81 = u65[p80.Name];
                    p80.Transparency = 1 - u78 + u78 * (v81 == nil and 0 or v81);
                end;
            end;

            for i, descendant in v79:GetDescendants() do
                local _ = i - 1;

                if descendant.Name ~= "Root" then
                    if descendant:IsA("BasePart") then
                        local v82 = u65[descendant.Name];
                        descendant.Transparency = 1 - u78 + u78 * (v82 == nil and 0 or v82);
                    end;
                end;
            end;
        end;
    end);
    default(0.6, OutBack, function(p83) -- Line: 442
        -- upvalues: u64 (ref)
        local v84 = u64;

        if v84 ~= nil then
            v84:PivotTo(p83);
        end;
    end, v70 - Vector3.new(0, 3, 0), v70);
    task.delay(1.6, function() -- Line: 452
        -- upvalues: u64 (ref)
        local v85 = u64;

        if v85 ~= nil then
            v85:Destroy();
        end;
    end);
    task.spawn(function() -- Line: 458
        -- upvalues: default (ref), Linear (ref), u71 (ref), OutBack (ref), u62 (copy), Size (copy), OutExpo (ref), u61 (copy)
        task.wait(2);
        local u86 = nil;
        u86 = default(1, Linear, function(u87) -- Line: 462
            -- upvalues: u71 (ref), u86 (ref)
            local v88 = u71;

            if v88 ~= nil then
                v88 = v88.OnOpened;
            end;

            if not v88 then
                u86:Cancel();

                return nil;
            end;

            local v89 = u71;

            if v89 ~= nil then
                local v90 = v89.OnOpened:GetDescendants();

                local function v94(p91) -- Line: 474
                    -- upvalues: u87 (copy)
                    if not (p91:IsA("ParticleEmitter") or p91:IsA("Beam")) then
                        if p91:IsA("ImageLabel") and p91.ImageTransparency < u87 then
                            p91.ImageTransparency = u87;
                        end;

                        return;
                    end;

                    local u92 = 1;

                    local function _(p93) -- Line: 478
                        -- upvalues: u92 (ref)
                        if p93.Value < u92 then
                            u92 = p93.Value;
                        end;
                    end;

                    for i, v in p91.Transparency.Keypoints do
                        local _ = i - 1;

                        if v.Value < u92 then
                            u92 = v.Value;
                        end;
                    end;

                    if u92 < u87 then
                        p91.Transparency = NumberSequence.new(u87);
                    end;
                end;

                for i, v in v90 do
                    v94(v, i - 1, v90);
                end;
            end;
        end);
        default(1, OutBack, function(p95) -- Line: 501
            -- upvalues: u62 (ref), Size (ref)
            local v96 = math.noise(os.clock() * 15) * 1.5;
            u62.Size = Vector3.new((Size.X + v96) * p95, (Size.Y + v96) * p95, Size.Z);
        end, 1, 0.3):Wait();
        task.wait(0.2);
        default(0.2, OutExpo, function(p97) -- Line: 506
            -- upvalues: u62 (ref), Size (ref)
            local v98 = math.random() * 3;
            u62.Size = Vector3.new((Size.X + v98) * p97, (Size.Y + v98) * p97, Size.Z);
        end, 0.3, 0);
        task.delay(1, function() -- Line: 510
            -- upvalues: u61 (ref)
            u61:DoCleaning();
        end);
    end);
    u61:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 515
        -- upvalues: u63 (copy), u7 (ref)
        for _, v in u63 do
            u7.update(v.surfaceGui, {
                viewportFrame = v.slice.viewportFrame,
                camera = v.slice.camera
            });
        end;
    end));
    u61:GiveTask(function() -- Line: 523
        -- upvalues: u63 (copy)
        for _, v in u63 do
            v.surfaceGui:Destroy();
        end;
    end);

    return u61;
end;

function u8.getSkin(p99, p100) -- Line: 530
    -- upvalues: KnitClient (copy)
    local v101;

    if p100.Character then
        v101 = KnitClient.Controllers.KitSkinController:getKitSkin(p100.Character);
    else
        v101 = nil;
    end;

    return v101;
end;

function u8.getSummonEffect(p102, p103) -- Line: 537
    -- upvalues: BedwarsKitSkinMeta (copy)
    local v104 = p102:getSkin(p103);

    if not v104 then
        return nil;
    end;

    local wren = BedwarsKitSkinMeta[v104].wren;

    if wren ~= nil then
        wren = wren.summonEffect;
    end;

    if wren then
        return wren;
    end;
end;

KnitClient.CreateController(u8.new());

return nil;