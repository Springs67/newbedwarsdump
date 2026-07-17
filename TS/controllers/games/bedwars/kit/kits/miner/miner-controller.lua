-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local ExpireList = v1.ExpireList;
local GameQueryUtil = v1.GameQueryUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuart = v3.InOutQuart;
local Linear = v3.Linear;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v5.CollectionService;
local MaterialService = v5.MaterialService;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local v6 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller");
local InteractionCategory = v6.InteractionCategory;
local InteractionPriority = v6.InteractionPriority;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ArmorSlot = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u7 = Color3.fromRGB(120, 120, 120);
local u8 = { "Head" };
local u9 = { "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperArm", "LeftLowerArm", "LeftHand", "Right Arm", "Left Arm" };
local u10 = { "UpperTorso", "Torso" };
local u11 = { "LowerTorso", "RightUpperLeg", "RightLowerLeg", "RightFoot", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "Right Leg", "Left Leg" };
local u12 = setmetatable({}, {
    __tostring = function() -- Line: 50, Name: __tostring
        return "MinerController";
    end,

    __index = BaseKitController
});
u12.__index = u12;

function u12.new(...) -- Line: 56
    -- upvalues: u12 (ref)
    local v13 = setmetatable({}, u12);

    return v13:constructor(...) or v13;
end;

function u12.constructor(p14) -- Line: 60
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), ExpireList (copy)
    BaseKitController.constructor(p14, BedwarsKit.MINER);
    p14.Name = "MinerController";
    p14.mineCooldowns = ExpireList.new(2);
end;

function u12.onKitLocalActivated(p15, p16) -- Line: 65
    -- upvalues: u4 (copy)
    if not p15.minerPromptMaid then
        p15.minerPromptMaid = u4.new();
    end;

    p15.minerPromptMaid:GiveTask(p15:setupMinerPrompts(2.5));
    p16:GiveTask(p15.minerPromptMaid);
end;

function u12.onKitLocalDeactivated(p17) -- Line: 72
end;

function u12.onKitReplicationActivated(u18, u19) -- Line: 74
    -- upvalues: default3 (copy), Players (copy), default (copy), KnitClient2 (copy), EntityUtil (copy), Workspace (copy), CollectionService (copy), GameQueryUtil (copy), SoundManager (copy), GameSound (copy), u7 (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), MaterialService (copy), ArmorSlot (copy), default2 (copy), InOutQuart (copy), Linear (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy)
    default3.Client:OnEvent("PetrifiedPlayerDestroyed", function(p20) -- Line: 75
        -- upvalues: Players (ref), default (ref), u18 (copy), KnitClient2 (ref), EntityUtil (ref)
        local v21 = p20.destroyer == Players.LocalPlayer;
        default.Debug("Petrified player was destroyed");
        local v22 = u18:getPetrifyModel(p20.petrifyId);
        local v23;

        if v22 == nil then
            v23 = v22;
        else
            v23 = v22.PrimaryPart;
        end;

        if v23 == nil then
            return nil;
        end;

        if p20.destroyer then
            local destroyer = p20.destroyer;
            KnitClient2.Controllers.ReceiveItemEffectController:playEffectForItems(p20.rewards, v22.PrimaryPart.Position, function() -- Line: 88
                -- upvalues: EntityUtil (ref), destroyer (copy)
                local v24 = EntityUtil:getEntity(destroyer);

                if v24 == nil then
                    return nil;
                end;

                return v24:getInstance():GetPrimaryPartCFrame();
            end, v21 and "PlayLocally" or "PlayGlobally", 1);
        end;

        u18:destroyPetrifyModel(v22, p20.destroyer);
    end):andThen(function(p25) -- Line: 97
        -- upvalues: u19 (copy)
        u19:GiveTask(p25);
    end);
    default3.Client:OnEvent("Petrified", function(p26) -- Line: 101
        -- upvalues: Workspace (ref), EntityUtil (ref), CollectionService (ref), GameQueryUtil (ref), SoundManager (ref), GameSound (ref), u7 (ref), KnitClient (ref), BedwarsKitSkinMeta (ref), MaterialService (ref), ArmorSlot (ref), default2 (ref), InOutQuart (ref), Linear (ref)
        p26.to.Archivable = true;
        local v27 = p26.to:Clone();
        v27.Parent = Workspace;
        v27.HumanoidRootPart.Anchored = true;
        local v28 = p26.to:GetAttribute("Team");
        v27:SetAttribute("Team", v28);
        local PrimaryPart = v27.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart:SetAttribute("Team", v28);
        end;

        local v29 = EntityUtil:getEntity(p26.to);

        if v29 ~= nil then
            v29 = v29:getPlayer();
        end;

        v27:SetAttribute("PetrifyId", p26.petrifyId);
        CollectionService:AddTag(v27, "petrified-player");
        CollectionService:AddTag(v27.PrimaryPart, "MinerInteraction");
        CollectionService:AddTag(v27, "petrified-player:" .. p26.petrifyId);

        for _, descendant in p26.to:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Transparency = 1;
            end;
        end;

        for _, descendant in v27:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.Anchored = true;
                descendant.CanCollide = false;
                GameQueryUtil:setQueryIgnored(descendant, true);
            elseif descendant:IsA("BillboardGui") then
                descendant:Destroy();
            elseif descendant:IsA("Highlight") then
                descendant:Destroy();
            elseif not descendant:IsA("Accessory") then
                if descendant:IsA("ParticleEmitter") then
                    descendant:Destroy();
                elseif descendant:IsA("Sound") then
                    descendant:Destroy();
                elseif descendant:IsA("ParticleEmitter") then
                    descendant:Destroy();
                elseif descendant:IsA("Beam") then
                    descendant:Destroy();
                else
                    descendant:IsA("Attachment");
                end;
            end;
        end;

        SoundManager:playSound(GameSound.TURN_TO_STONE, {
            position = v27:GetPrimaryPartCFrame().Position
        });
        local v30 = u7;
        local v31 = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(p26.killer)];

        if v31.miner then
            if v31.miner.petrifyStatueColor then
                v30 = v31.miner.petrifyStatueColor;
            end;

            local petrifyStatueMaterial = v31.miner.petrifyStatueMaterial;

            if petrifyStatueMaterial then
                local v32 = v27:GetDescendants();

                local function v36(p33) -- Line: 168
                    -- upvalues: petrifyStatueMaterial (copy), MaterialService (ref)
                    if p33:IsA("BasePart") then
                        if petrifyStatueMaterial.materialVariant ~= nil then
                            local v34 = MaterialService:FindFirstChild(petrifyStatueMaterial.materialVariant);
                            local v35;

                            if v34 == nil then
                                v35 = v34;
                            else
                                v35 = v34:IsA("MaterialVariant");
                            end;

                            if v35 then
                                p33.Material = v34.BaseMaterial;
                            end;

                            p33.MaterialVariant = petrifyStatueMaterial.materialVariant;

                            return;
                        end;

                        if petrifyStatueMaterial.material ~= nil then
                            p33.Material = petrifyStatueMaterial.material;
                            p33.MaterialVariant = "";
                        end;
                    end;
                end;

                for i, v in v32 do
                    v36(v, i - 1, v32);
                end;
            end;
        end;

        local v37 = v27:FindFirstChildWhichIsA("Highlight");

        if v37 ~= nil then
            v37:Destroy();
        end;

        KnitClient.Controllers.EntityHighlightController:highlight(v27, {
            transparency = 0,
            fadeInTime = 1,
            lastsForever = true,
            color = v30,

            shouldApplyToPart = function(p38) -- Line: 202, Name: shouldApplyToPart
                -- upvalues: ArmorSlot (ref)
                local v39 = p38:FindFirstAncestorWhichIsA("Accessory");

                if not v39 or v39:GetAttribute("ArmorSlot") ~= ArmorSlot.HELMET then
                    return true;
                end;

                local function _(p40) -- Line: 207
                    if p40:IsA("Texture") then
                        p40.Transparency = 1;
                    end;
                end;

                for i, descendant in v39:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("Texture") then
                        descendant.Transparency = 1;
                    end;
                end;

                return false;
            end
        });
        local u41 = {};

        for _, v in p26.to.Humanoid.Animator:GetPlayingAnimationTracks() do
            if v.Animation then
                local v42 = v27.Humanoid.Animator:LoadAnimation(v.Animation);
                v42:AdjustWeight(v.WeightTarget);
                v42:AdjustSpeed(v.Speed);
                v42:Play();
                v42.TimePosition = v.TimePosition;
                table.insert(u41, {
                    startingSpeed = v.Speed,
                    animationTrack = v42
                });
            end;
        end;

        default2(1, InOutQuart, function(p43) -- Line: 237
            -- upvalues: u41 (copy), Linear (ref)
            for _, v in u41 do
                v.animationTrack:AdjustSpeed(Linear(1 - p43, v.startingSpeed, -v.startingSpeed, 1));
            end;
        end, 1, 0);
    end):andThen(function(p44) -- Line: 242
        -- upvalues: u19 (copy)
        u19:GiveTask(p44);
    end);
    u19:GiveTask(WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.MINER_MINE_STONE) }, function(p45, p46) -- Line: 246
        -- upvalues: Players (ref), u18 (copy)
        local Character = p45.Character;

        if not Character then
            return nil;
        end;

        if p45.UserId == Players.LocalPlayer.UserId then
            return nil;
        end;

        if u18.mineCooldowns:has(p45.UserId) and p45.UserId ~= Players.LocalPlayer.UserId then
            return nil;
        end;

        u18.mineCooldowns:add(p45.UserId);
        local PrimaryPart = Character.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local v47 = u18:getClosestPetrifiedPlayer(PrimaryPart);

        if not v47 then
            return nil;
        end;

        u18:setupMineAnimationEffects(p45, p46, v47);
    end));
end;

function u12.onKitReplicationDeactivated(p48) -- Line: 273
end;

function u12.onInnateAbilityEnabled(p49, p50, p51) -- Line: 275
end;

function u12.onAbilityUsed(p52, p53, p54) -- Line: 277
end;

function u12.setupMineAnimationEffects(u55, p56, p57, u58) -- Line: 279
    -- upvalues: EntityUtil (copy), u4 (copy), Players (copy), ReplicatedStorage (copy), KnitClient (copy), BedwarsKitSkinMeta (copy), WeldUtil (copy), Workspace (copy), GameQueryUtil (copy), GameSound (copy), KnitClient2 (copy), u8 (copy), EffectUtil (copy), SoundManager (copy), u9 (copy), u10 (copy), u11 (copy)
    local Character = p56.Character;

    if not Character then
        return nil;
    end;

    local v59 = EntityUtil:getEntity(p56);
    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    if not PrimaryPart then
        return nil;
    end;

    local u60 = u4.new();

    if v59 ~= nil then
        v59 = v59:getItemInHandClient();
    end;

    if v59 then
        for _, descendant in v59:GetDescendants() do
            if descendant:IsA("BasePart") then
                local Transparency = descendant.Transparency;
                descendant.Transparency = 1;
                u60:GiveTask(function() -- Line: 304
                    -- upvalues: descendant (copy), Transparency (copy)
                    descendant.Transparency = Transparency;
                end);
            end;
        end;
    end;

    local u61 = Character == Players.LocalPlayer.Character;
    local MinerPickaxe = ReplicatedStorage.Assets.Effects.MinerPickaxe;
    local u62 = BedwarsKitSkinMeta[KnitClient.Controllers.KitController:getKitSkin(Character)];

    if u62.miner then
        MinerPickaxe = ReplicatedStorage.Assets.Effects:FindFirstChild(u62.miner.pickaxeSkinName) or MinerPickaxe;
    end;

    local u63 = MinerPickaxe:Clone();
    u63.Parent = Character;
    WeldUtil:weldCharacterAccessories(Character);
    local u64 = ReplicatedStorage.Assets.Effects.MinerStoneHit:Clone();
    local PrimaryPart2 = u58.PrimaryPart;

    if PrimaryPart2 ~= nil then
        PrimaryPart2 = PrimaryPart2.CFrame;
    end;

    if PrimaryPart2 == nil then
        PrimaryPart2 = CFrame.new();
    end;

    u64.CFrame = PrimaryPart2;
    u64.Anchored = true;
    u64.Parent = Workspace;
    GameQueryUtil:setQueryIgnored(u64, true);
    u60:GiveTask(function() -- Line: 337
        -- upvalues: u64 (copy)
        task.delay(3, function() -- Line: 339
            -- upvalues: u64 (ref)
            u64:Destroy();
        end);
    end);
    local u65 = { GameSound.MINER_STONE_HIT_1, GameSound.MINER_STONE_HIT_2, GameSound.MINER_STONE_HIT_3 };
    local MINER_STONE_BREAK = GameSound.MINER_STONE_BREAK;

    if u62.miner then
        if u62.miner.hitParticleColor then
            local function _(p66) -- Line: 350
                -- upvalues: u62 (copy)
                if p66:IsA("ParticleEmitter") then
                    p66.Color = u62.miner.hitParticleColor;
                end;
            end;

            for i, descendant in u64:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Color = u62.miner.hitParticleColor;
                end;
            end;
        end;

        if u62.miner.pickaxeHitSounds then
            u65 = u62.miner.pickaxeHitSounds;
        end;

        local statueBreakSound = u62.miner.statueBreakSound;

        if statueBreakSound ~= "" and statueBreakSound then
            MINER_STONE_BREAK = u62.miner.statueBreakSound;
        end;
    end;

    local function u68(p67) -- Line: 367
        -- upvalues: u61 (copy), Character (copy), KnitClient2 (ref)
        if u61 then
            local PrimaryPart3 = Character.PrimaryPart;

            if PrimaryPart3 ~= nil then
                PrimaryPart3 = PrimaryPart3.CFrame;
            end;

            if PrimaryPart3 then
                KnitClient2.Controllers.ScreenShakeController:shake(PrimaryPart3.Position, PrimaryPart3 * Vector3.new(-0.25, -1, -1) - PrimaryPart3.Position, {
                    duration = 0.15,
                    cycles = 2,
                    magnitude = 0.07 * p67
                });
            end;
        end;
    end;

    local u69 = nil;
    u69 = p57:GetMarkerReachedSignal("hammer_1"):Connect(function() -- Line: 389
        -- upvalues: u69 (ref), u55 (copy), PrimaryPart (copy), u58 (copy), u8 (ref), u60 (copy), EffectUtil (ref), u64 (copy), SoundManager (ref), u65 (ref), u61 (copy), Character (copy), u68 (copy)
        u69:Disconnect();
        u55:playMinedPartEffect(PrimaryPart, u58, u8, u60);
        EffectUtil:playEffects({ u64 }, nil);
        local v70 = u65[1];
        local v71 = {};
        local v72;

        if u61 then
            v72 = nil;
        else
            v72 = Character.PrimaryPart;

            if v72 ~= nil then
                v72 = v72.Position;
            end;
        end;

        v71.position = v72;
        SoundManager:playSound(v70, v71);
        u68(1);
    end);
    local u73 = nil;
    u73 = p57:GetMarkerReachedSignal("hammer_2"):Connect(function() -- Line: 412
        -- upvalues: u73 (ref), u55 (copy), PrimaryPart (copy), u58 (copy), u9 (ref), u60 (copy), EffectUtil (ref), u64 (copy), SoundManager (ref), u65 (ref), u61 (copy), Character (copy), u68 (copy)
        u73:Disconnect();
        u55:playMinedPartEffect(PrimaryPart, u58, u9, u60);
        EffectUtil:playEffects({ u64 }, nil);
        local v74 = u65[2];
        local v75 = {};
        local v76;

        if u61 then
            v76 = nil;
        else
            v76 = Character.PrimaryPart;

            if v76 ~= nil then
                v76 = v76.Position;
            end;
        end;

        v75.position = v76;
        SoundManager:playSound(v74, v75);
        u68(1.25);
    end);
    local u77 = nil;
    u77 = p57:GetMarkerReachedSignal("hammer_3"):Connect(function() -- Line: 435
        -- upvalues: u77 (ref), u55 (copy), PrimaryPart (copy), u58 (copy), u10 (ref), u60 (copy), EffectUtil (ref), u64 (copy), SoundManager (ref), u65 (ref), u61 (copy), Character (copy), u68 (copy)
        u77:Disconnect();
        u55:playMinedPartEffect(PrimaryPart, u58, u10, u60);
        EffectUtil:playEffects({ u64 }, nil);
        local v78 = u65[3];
        local v79 = {};
        local v80;

        if u61 then
            v80 = nil;
        else
            v80 = Character.PrimaryPart;

            if v80 ~= nil then
                v80 = v80.Position;
            end;
        end;

        v79.position = v80;
        SoundManager:playSound(v78, v79);
        u68(1.25);
    end);
    local u81 = nil;
    u81 = p57:GetMarkerReachedSignal("hammer_4"):Connect(function() -- Line: 458
        -- upvalues: u81 (ref), u55 (copy), PrimaryPart (copy), u58 (copy), u11 (ref), u60 (copy), EffectUtil (ref), u64 (copy), SoundManager (ref), MINER_STONE_BREAK (ref), u61 (copy), Character (copy), u68 (copy)
        u81:Disconnect();
        u55:playMinedPartEffect(PrimaryPart, u58, u11, u60);
        EffectUtil:playEffects({ u64 }, nil, {
            particleMultiplier = 3
        });
        local v82 = {};
        local v83;

        if u61 then
            v83 = nil;
        else
            v83 = Character.PrimaryPart;

            if v83 ~= nil then
                v83 = v83.Position;
            end;
        end;

        v82.position = v83;
        SoundManager:playSound(MINER_STONE_BREAK, v82);
        u68(2);
    end);
    p57.Stopped:Connect(function() -- Line: 483
        -- upvalues: u63 (ref), u60 (copy)
        u63:Destroy();
        u60:DoCleaning();
    end);
    p57.Destroying:Connect(function() -- Line: 487
        -- upvalues: u63 (ref), u60 (copy)
        u63:Destroy();
        u60:DoCleaning();
    end);
end;

function u12.playMinedPartEffect(u84, p85, u86, p87, p88) -- Line: 492
    -- upvalues: GameQueryUtil (copy), Workspace (copy), CollectionService (copy)
    for _, v in u84:getChipParts(u86, p87) do
        local u89 = v:Clone();
        u84:destroyClonedPartJoints(u89);
        u89.CFrame = v.CFrame;
        u89.Anchored = false;
        u89.CanCollide = true;
        GameQueryUtil:setQueryIgnored(u89, false);
        u89.Parent = Workspace;
        local Parent = v.Parent;
        local CFrame2 = v.CFrame;
        local Transparency = v.Transparency;
        v.Transparency = 1;
        v.Parent = nil;
        p88:GiveTask(function() -- Line: 506
            -- upvalues: Parent (copy), CollectionService (ref), u86 (copy), v (copy), CFrame2 (copy), Transparency (copy), u89 (copy)
            task.delay(1, function() -- Line: 507
                -- upvalues: Parent (ref), CollectionService (ref), u86 (ref), v (ref), CFrame2 (ref), Transparency (ref)
                if not (Parent and CollectionService:HasTag(u86, "petrified-player")) then
                    v:Destroy();

                    return;
                end;

                v.Parent = Parent;
                v.CFrame = CFrame2;
                v.Transparency = Transparency;
            end);
            task.delay(3, function() -- Line: 516
                -- upvalues: u89 (ref)
                u89:Destroy();
            end);
        end);
        u84:throwPart(p85, u89);
        task.delay(1.5, function() -- Line: 521
            -- upvalues: u84 (copy), u89 (copy)
            u84:despawnPart(u89);
        end);
    end;
end;

function u12.getChipParts(p90, p91, p92) -- Line: 526
    local v93 = {};
    local v94 = {};

    for _, v in p92 do
        local v95 = p91:FindFirstChild(v);
        local v96;

        if v95 == nil then
            v96 = v95;
        else
            v96 = v95:IsA("BasePart");
        end;

        if v96 then
            v93[v95] = true;
            v94[v95] = true;
        end;
    end;

    for i in v93 do
        for _, v in i:GetConnectedParts(false) do
            if v93[v] ~= nil or p90:shouldChipConnectedPart(p91, v) then
                v94[v] = true;
            end;
        end;
    end;

    local u97 = {};

    local function _(p98) -- Line: 548
        -- upvalues: u97 (copy)
        table.insert(u97, p98);

        return #u97;
    end;

    for i in v94 do
        table.insert(u97, i);
        local _ = #u97;
    end;

    return u97;
end;

function u12.shouldChipConnectedPart(p99, p100, p101) -- Line: 558
    if not p101:IsDescendantOf(p100) then
        return false;
    end;

    if p101.Parent == p100 then
        return false;
    end;

    return p101:FindFirstAncestorWhichIsA("Accessory") ~= nil and true or p101:FindFirstAncestor("3DClothing") ~= nil;
end;

function u12.destroyClonedPartJoints(p102, p103) -- Line: 567
    for _, descendant in p103:GetDescendants() do
        if descendant:IsA("JointInstance") or (descendant:IsA("Constraint") or descendant:IsA("ProximityPrompt")) then
            descendant:Destroy();
        end;
    end;
end;

function u12.throwPart(p104, p105, p106) -- Line: 574
    local v107 = p106.Position - p105;
    local v108 = Vector3.new(v107.X, 0, v107.Z);
    p106:ApplyImpulse(((v108.Magnitude <= 0 and Vector3.new(0, 0, -20) or v108.Unit * 20) + Vector3.new(0, 30, 0)) * p106.AssemblyMass);
    p106:ApplyAngularImpulse(Vector3.new(5, 10, 5) * p106.AssemblyMass);
end;

function u12.despawnPart(u109, p110) -- Line: 592
    -- upvalues: RandomUtil (copy), GameSound (copy), SoundManager (copy)
    if not p110.Parent then
        return nil;
    end;

    SoundManager:playSound(RandomUtil.fromList(GameSound.ROCK_CRUMBLE_1, GameSound.ROCK_CRUMBLE_2, GameSound.ROCK_CRUMBLE_3), {
        volumeMultiplier = 0.2,
        position = p110.Position
    });
    local u111 = p110:GetConnectedParts(false);
    p110:Destroy();
    task.delay(0.12, function() -- Line: 603
        -- upvalues: u109 (copy), u111 (copy)
        local function _(p112) -- Line: 604
            -- upvalues: u109 (ref)
            u109:despawnPart(p112);
        end;

        for i, v in u111 do
            local _ = i - 1;
            u109:despawnPart(v);
        end;
    end);
end;

function u12.releasePetrifyModel(p113, p114) -- Line: 612
    -- upvalues: Workspace (copy), GameQueryUtil (copy)
    local Model = Instance.new("Model");
    Model.Name = p114.Name .. "_Debris";
    Model.Parent = Workspace;

    for _, descendant in p114:GetDescendants() do
        if descendant:IsA("BasePart") then
            local v115 = descendant:Clone();
            p113:destroyClonedPartJoints(v115);
            v115.CFrame = descendant.CFrame;
            v115.Anchored = false;
            v115.CanCollide = descendant.Transparency < 1;
            GameQueryUtil:setQueryIgnored(v115, false);
            v115.Parent = Model;
        end;
    end;

    p114:Destroy();
    task.delay(3, function() -- Line: 628
        -- upvalues: Model (copy)
        Model:Destroy();
    end);
end;

function u12.removePetrifyInteraction(p116, p117) -- Line: 632
    -- upvalues: CollectionService (copy)
    CollectionService:RemoveTag(p117, "petrified-player");
    local v118 = p117:GetAttribute("PetrifyId");

    if type(v118) == "string" then
        CollectionService:RemoveTag(p117, "petrified-player:" .. v118);
    end;

    local PrimaryPart = p117.PrimaryPart;

    if PrimaryPart then
        CollectionService:RemoveTag(PrimaryPart, "MinerInteraction");
    end;
end;

function u12.destroyPetrifyModel(p119, p120, p121) -- Line: 643
    p119:removePetrifyInteraction(p120);

    if not p121 then
        p120:Destroy();

        return nil;
    end;

    p119:releasePetrifyModel(p120);
end;

function u12.getPetrifyModel(p122, p123) -- Line: 651
    -- upvalues: CollectionService (copy)
    local function _(p124) -- Line: 653
        return true;
    end;

    for i, v in CollectionService:GetTagged("petrified-player:" .. p123) do
        local _ = i - 1;

        if true == true then
            return v;
        end;
    end;

    return nil;
end;

function u12.getClosestPetrifiedPlayer(p125, u126) -- Line: 667
    -- upvalues: CollectionService (copy)
    local function _(p127) -- Line: 669
        return p127.PrimaryPart ~= nil;
    end;

    local v128 = 0;
    local v129 = {};

    for i, v in CollectionService:GetTagged("petrified-player") do
        local _ = i - 1;

        if v.PrimaryPart ~= nil == true then
            v128 = v128 + 1;
            v129[v128] = v;
        end;
    end;

    table.sort(v129, function(p130, p131) -- Line: 682
        -- upvalues: u126 (copy)
        return (p130.PrimaryPart.Position - u126).Magnitude < (p131.PrimaryPart.Position - u126).Magnitude;
    end);

    local function _(p132) -- Line: 691
        return true;
    end;

    local v133 = nil;

    for i, v in v129 do
        local _ = i - 1;

        if true == true then
            v133 = v;
            break;
        end;
    end;

    return v133;
end;

function u12.setupMinerPrompts(u134, p135) -- Line: 706
    -- upvalues: KnitClient (copy), DeviceUtil (copy), InteractionPriority (copy), InteractionCategory (copy), default3 (copy), ClientStore (copy), Flamework (copy), u4 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    local minerPromptMaid = u134.minerPromptMaid;

    if minerPromptMaid ~= nil then
        minerPromptMaid:Destroy();
    end;

    return KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        interactionLabel = "Gather",
        interactionObjectText = "Petrified Player",
        interactionTag = "MinerInteraction",
        maxActivationDistance = 6,
        removePromptOnInteract = false,
        holdDuration = p135,
        clickablePrompt = DeviceUtil.isMobileControls(),
        priority = InteractionPriority.ABILITY,
        category = InteractionCategory.ABILITY,

        onInteracted = function(p136, p137, p138) -- Line: 721, Name: onInteracted
            -- upvalues: default3 (ref)
            local Parent = p137.Parent;

            if Parent == nil or not Parent:IsA("Model") then
                return nil;
            end;

            default3.Client:Get("DestroyPetrifiedPlayer"):SendToServer({
                petrifyId = Parent:GetAttribute("PetrifyId")
            });
        end,

        promptButtonHoldBegan = function(p139, p140, p141) -- Line: 730, Name: promptButtonHoldBegan
            -- upvalues: ClientStore (ref), Flamework (ref), u4 (ref), GameAnimationUtil (ref), Players (ref), AnimationType (ref), u134 (copy)
            local v142 = p140:GetAttribute("Team");
            local myTeam = ClientStore:getState().Game.myTeam;

            if myTeam ~= nil then
                myTeam = myTeam.id;
            end;

            if v142 == myTeam then
                p141:InputHoldEnd();
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You cannot mine your teammates!"
                });

                return nil;
            end;

            local u143 = u4.new();
            local u144 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.MINER_MINE_STONE);

            if not p140:IsA("Model") then
                p140 = p140.Parent;
            end;

            local v145;

            if u144 then
                if p140 == nil then
                    v145 = p140;
                else
                    v145 = p140:IsA("Model");
                end;
            else
                v145 = u144;
            end;

            if v145 then
                u134:setupMineAnimationEffects(Players.LocalPlayer, u144, p140);
            end;

            u143:GiveTask(function() -- Line: 758
                -- upvalues: u144 (copy)
                local v146 = u144;

                if v146 ~= nil then
                    v146:Stop();
                end;

                local v147 = u144;

                if v147 ~= nil then
                    v147:Destroy();
                end;
            end);
            p141.PromptButtonHoldEnded:Connect(function() -- Line: 768
                -- upvalues: u143 (copy)
                u143:DoCleaning();
            end);
        end
    });
end;

KnitClient.CreateController(u12.new());

return nil;