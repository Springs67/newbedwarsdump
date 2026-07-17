-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local LuckyBlockSmelterUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block-smelter", "lucky-block-smelter-util").LuckyBlockSmelterUtil;
local LuckyBlockRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
ConstantManager.registerConstants(script, {
    P1XRange = NumberRange.new(-30, 30),
    P1YRange = NumberRange.new(0, 15),
    P1ZRange = NumberRange.new(-15, 15)
});
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "SmelterController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 41
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 45
    -- upvalues: KnitController (copy), LuckyBlockRarity (copy)
    KnitController.constructor(p6);
    p6.Name = "SmelterController";
    p6.random = Random.new();
    p6.particleMap = {};
    p6.neonPartMap = {};
    p6.localSmelterChestFolder = nil;
    p6.currentRarity = LuckyBlockRarity.COMMON;
end;

function u4.KnitStart(u7) -- Line: 54
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), ReplicatedStorage (copy), Players (copy), LuckyBlockSmelterUtil (copy), LuckyBlockRarity (copy), default2 (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitController.KnitStart(u7);
    CollectionTagAdded("smelter-block", function(p8) -- Line: 56
        -- upvalues: u7 (copy), ReplicatedStorage (ref), Players (ref), LuckyBlockSmelterUtil (ref), LuckyBlockRarity (ref)
        local function _(p9) -- Line: 58
            return p9:IsA("ParticleEmitter");
        end;

        local v10 = 0;
        local v11 = {};

        for i, child in p8:WaitForChild("Smelter"):WaitForChild("FireAttachment"):GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") == true then
                v10 = v10 + 1;
                v11[v10] = child;
            end;
        end;

        local function _(p12) -- Line: 73
            return p12:IsA("ParticleEmitter");
        end;

        local v13 = 0;
        local v14 = {};

        for i, child in p8:WaitForChild("Smelter"):WaitForChild("SpiralAttachment"):GetChildren() do
            local _ = i - 1;

            if child:IsA("ParticleEmitter") == true then
                v13 = v13 + 1;
                v14[v13] = child;
            end;
        end;

        local v15 = p8:GetAttribute("Team");
        u7.neonPartMap[v15] = p8.Neon;
        local particleMap = u7.particleMap;
        local v16 = {};
        local v17 = #v16;
        local v18 = #v11;
        table.move(v11, 1, v18, v17 + 1, v16);
        table.move(v14, 1, #v14, v17 + v18 + 1, v16);
        particleMap[v15] = v16;
        u7:recolorSmelterRarityEffects(u7.currentRarity);
        local v19 = u7.localSmelterChestFolder == nil and ReplicatedStorage:WaitForChild("Inventories"):FindFirstChild(Players.LocalPlayer.Name .. "_smelter");

        if v19 then
            u7.localSmelterChestFolder = v19;
            v19:GetAttributeChangedSignal("SmeltPoints"):Connect(function() -- Line: 104
                -- upvalues: u7 (ref), LuckyBlockSmelterUtil (ref), LuckyBlockRarity (ref)
                local localSmelterChestFolder = u7.localSmelterChestFolder;

                if localSmelterChestFolder ~= nil then
                    localSmelterChestFolder = localSmelterChestFolder:GetAttribute("SmeltPoints");
                end;

                if localSmelterChestFolder == nil then
                    return nil;
                end;

                local v20 = LuckyBlockSmelterUtil.getGuaranteedLowestRarityFromSmeltPoints(localSmelterChestFolder);

                if v20 == nil then
                    u7.currentRarity = LuckyBlockRarity.COMMON;
                    u7:recolorSmelterRarityEffects(LuckyBlockRarity.COMMON);

                    return nil;
                end;

                if v20 == u7.currentRarity then
                    return nil;
                end;

                u7.currentRarity = v20;
                u7:recolorSmelterRarityEffects(v20);
            end);
        end;
    end);
    default2.Client:OnEvent("ChestContentsSmelted", function(p21) -- Line: 129
        -- upvalues: Players (ref), Flamework (ref), BedwarsAppIds (ref), u7 (copy), LuckyBlockRarity (ref)
        if p21.player == Players.LocalPlayer then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CHEST_INVENTORY);
        end;

        local Character = p21.player.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.CFrame.Position;
            end;
        end;

        if not Character then
            return nil;
        end;

        local v22 = u7:getNearestSmelter(Character);

        if v22 ~= nil then
            v22 = v22.CFrame;
        end;

        if not v22 then
            return nil;
        end;

        local v23 = v22.Position + Vector3.new(0, -0.5, 0);
        u7:playSounds(p21.guaranteedLowestRarity, p21.receivedItemRarity, v23);
        local v24 = CFrame.new(v23);
        u7:playEffects(p21.guaranteedLowestRarity, p21.receivedItemRarity, v24);
        u7:playGiveItemEffect(p21.itemSmelted, v24.Position, p21.player);
        u7.currentRarity = LuckyBlockRarity.COMMON;
        u7:recolorSmelterRarityEffects(LuckyBlockRarity.COMMON);
    end);
end;

function u4.recolorSmelterRarityEffects(p25, p26) -- Line: 163
    -- upvalues: LuckyBlockSmelterUtil (copy), ColorUtil (copy)
    local u27 = LuckyBlockSmelterUtil.RarityEffectColors[p26];

    if u27 then
        local particleMap = p25.particleMap;

        local function v31(p28, p29) -- Line: 169
            -- upvalues: ColorUtil (ref), u27 (copy)
            local function _(p30) -- Line: 171
                -- upvalues: ColorUtil (ref), u27 (ref)
                if p30.Name == "TopFire" then
                    p30.Color = ColorSequence.new(ColorUtil.darken(u27, 0.4));

                    return;
                end;

                p30.Color = ColorSequence.new(u27);
            end;

            for i, v in p28 do
                local _ = i - 1;

                if v.Name == "TopFire" then
                    v.Color = ColorSequence.new(ColorUtil.darken(u27, 0.4));
                else
                    v.Color = ColorSequence.new(u27);
                end;
            end;
        end;

        for i, v in particleMap do
            v31(v, i, particleMap);
        end;
    end;

    local u32 = LuckyBlockSmelterUtil.NeonEffectColors[p26];

    if u32 then
        local function _(p33, p34) -- Line: 191
            -- upvalues: u32 (copy)
            p33.Color = u32;
        end;

        for _, v in p25.neonPartMap do
            v.Color = u32;
        end;
    end;
end;

function u4.playSounds(p35, p36, p37, u38) -- Line: 199
    -- upvalues: GameSound (copy), LuckyBlockRarity (copy), SoundManager (copy)
    local SMELTER_SMELTING_TIER_1 = GameSound.SMELTER_SMELTING_TIER_1;
    local SMELTER_ITEM_REVEAL_TIER_1 = GameSound.SMELTER_ITEM_REVEAL_TIER_1;

    if p36 == LuckyBlockRarity.COMMON then
        SMELTER_SMELTING_TIER_1 = GameSound.SMELTER_SMELTING_TIER_1;
    elseif p36 == LuckyBlockRarity.UNCOMMON then
        SMELTER_SMELTING_TIER_1 = GameSound.SMELTER_SMELTING_TIER_2;
    elseif p36 == LuckyBlockRarity.RARE then
        SMELTER_SMELTING_TIER_1 = GameSound.SMELTER_SMELTING_TIER_3;
    elseif p36 == LuckyBlockRarity.EPIC then
        SMELTER_SMELTING_TIER_1 = GameSound.SMELTER_SMELTING_TIER_4;
    elseif p36 == LuckyBlockRarity.LEGENDARY then
        SMELTER_SMELTING_TIER_1 = GameSound.SMELTER_SMELTING_TIER_5;
    end;

    if p37 == LuckyBlockRarity.COMMON then
        SMELTER_ITEM_REVEAL_TIER_1 = GameSound.SMELTER_ITEM_REVEAL_TIER_1;
    elseif p37 == LuckyBlockRarity.UNCOMMON then
        SMELTER_ITEM_REVEAL_TIER_1 = GameSound.SMELTER_ITEM_REVEAL_TIER_2;
    elseif p37 == LuckyBlockRarity.RARE then
        SMELTER_ITEM_REVEAL_TIER_1 = GameSound.SMELTER_ITEM_REVEAL_TIER_3;
    elseif p37 == LuckyBlockRarity.EPIC then
        SMELTER_ITEM_REVEAL_TIER_1 = GameSound.SMELTER_ITEM_REVEAL_TIER_4;
    elseif p37 == LuckyBlockRarity.LEGENDARY then
        SMELTER_ITEM_REVEAL_TIER_1 = GameSound.SMELTER_ITEM_REVEAL_TIER_5;
    end;

    SoundManager:playSound(SMELTER_SMELTING_TIER_1, {
        position = u38
    });
    task.delay(0.5, function() -- Line: 249
        -- upvalues: SoundManager (ref), SMELTER_ITEM_REVEAL_TIER_1 (ref), u38 (copy)
        SoundManager:playSound(SMELTER_ITEM_REVEAL_TIER_1, {
            position = u38
        });
    end);
end;

function u4.playEffects(p39, p40, p41, p42) -- Line: 255
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), LuckyBlockRarity (copy)
    local u43 = ReplicatedStorage.Assets.Effects.SmelterEffect:Clone();
    u43.Parent = Workspace;
    u43.CFrame = p42;
    local Specs = u43.ParticleTop.Specs;
    u43.ParticleTop.EnergyImplosion:Emit(10);
    local SpecExplosion1 = u43.ParticleTop.SpecExplosion1;
    local SpecExplosion2 = u43.ParticleTop.SpecExplosion2;
    local OutlineExplosion = u43.ParticleTop.OutlineExplosion;
    local Stars = u43.ParticleTop.Stars;
    local TwinkleStars = u43.ParticleTop.TwinkleStars;
    local Sparks = u43.ParticleTop.Sparks;
    local u44 = 2;
    local u45 = 4;
    local u46 = 8;
    local u47 = 20;
    local u48 = ColorSequence.new(Color3.new(1, 1, 1));

    if p41 == LuckyBlockRarity.COMMON then
        u48 = ColorSequence.new(Color3.new(1, 1, 1));
        u46 = 8;
        u45 = 4;
        u44 = 2;
        u47 = 20;
    elseif p41 == LuckyBlockRarity.UNCOMMON then
        u48 = ColorSequence.new(Color3.new(0.25, 0.94, 0.22));
        u46 = 10;
        u45 = 6;
        u44 = 3;
        u47 = 30;
    elseif p41 == LuckyBlockRarity.RARE then
        u48 = ColorSequence.new(Color3.new(0.13, 0.61, 0.87));
        u46 = 15;
        u45 = 8;
        u44 = 4;
        u47 = 40;
    elseif p41 == LuckyBlockRarity.EPIC then
        u48 = ColorSequence.new(Color3.new(0.87, 0.24, 0.85));
        u46 = 20;
        u45 = 15;
        u44 = 7;
        u47 = 70;
    elseif p41 == LuckyBlockRarity.LEGENDARY then
        u48 = ColorSequence.new(Color3.new(0.85, 0.7, 0.09));
        u46 = 30;
        u45 = 25;
        u44 = 9;
        u47 = 90;
    end;

    task.delay(0.5, function() -- Line: 318
        -- upvalues: OutlineExplosion (copy), u48 (ref), TwinkleStars (copy), Sparks (copy), Specs (copy), SpecExplosion1 (copy), u47 (ref), SpecExplosion2 (copy), u46 (ref), u45 (ref), Stars (copy), u44 (ref)
        OutlineExplosion.Color = u48;
        TwinkleStars.Color = u48;
        Sparks.Color = u48;
        Specs.Enabled = false;
        SpecExplosion1:Emit(u47);
        SpecExplosion2:Emit(u47);
        OutlineExplosion:Emit(1);
        TwinkleStars:Emit(u46);
        Sparks:Emit(u45);
        Stars:Emit(u44);
    end);
    task.delay(1.5, function() -- Line: 330
        -- upvalues: u43 (copy)
        u43:Destroy();
    end);
end;

function u4.getNearestSmelter(p49, p50) -- Line: 334
    -- upvalues: CollectionService (copy)
    local v51 = (1 / 0);
    local v52 = nil;

    for _, v in CollectionService:GetTagged("smelter-block") do
        local Magnitude = (v.Position - p50).Magnitude;

        if Magnitude < v51 then
            v52 = v;
            v51 = Magnitude;
        end;
    end;

    return v52;
end;

function u4.playGiveItemEffect(p53, p54, u55, u56) -- Line: 348
    -- upvalues: ReplicatedStorage (copy), ItemUtil (copy), GameQueryUtil (copy), Workspace (copy), u2 (copy), default (copy), InOutQuad (copy)
    local function _() -- Line: 349
        -- upvalues: u56 (copy)
        local Character = u56.Character;

        if Character ~= nil then
            Character = Character.PrimaryPart;

            if Character ~= nil then
                Character = Character.CFrame.Position + Vector3.new(0, 6, 0);
            end;
        end;

        if Character then
            return CFrame.new(Character);
        end;

        return nil;
    end;

    local Character = u56.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.CFrame.Position + Vector3.new(0, 6, 0);
        end;
    end;

    local u57;

    if Character then
        u57 = CFrame.new(Character);
    else
        u57 = nil;
    end;

    if not u57 then
        return false;
    end;

    local v58 = ReplicatedStorage:WaitForChild("Items"):WaitForChild(p54);
    local u59 = ItemUtil.cloneItemIntoModel(v58):Clone();

    local function _(p60) -- Line: 370
        -- upvalues: GameQueryUtil (ref)
        return GameQueryUtil:setQueryIgnored(p60, true);
    end;

    for i, descendant in u59:GetDescendants() do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(descendant, true);
    end;

    u59.Parent = Workspace;
    u2("BodyForce", {
        Name = "AntiGravity",
        Force = Vector3.new(0, Workspace.Gravity * u59.PrimaryPart.AssemblyMass, 0),
        Parent = u59.PrimaryPart
    });
    default(1, InOutQuad, function(p61) -- Line: 383
        -- upvalues: u56 (copy), u55 (copy), u57 (copy), u59 (ref)
        local Character2 = u56.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.CFrame.Position + Vector3.new(0, 6, 0);
            end;
        end;

        local v62;

        if Character2 then
            v62 = CFrame.new(Character2);
        else
            v62 = nil;
        end;

        if v62 ~= nil then
            v62 = v62.Position;
        end;

        if not v62 then
            return nil;
        end;

        local v63 = u55:Lerp(u57.Position, p61):Lerp(u57.Position:Lerp(v62, p61), p61);
        u59:PivotTo(CFrame.new(v63) * CFrame.Angles(0, 6.283185307179586 * p61, 0));
    end, 0, 1):Wait();

    local function _() -- Line: 400
        -- upvalues: u56 (copy)
        local Character2 = u56.Character;

        if Character2 ~= nil then
            Character2 = Character2.PrimaryPart;

            if Character2 ~= nil then
                Character2 = Character2.CFrame;
            end;
        end;

        return Character2;
    end;

    local Character2 = u56.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.CFrame;
        end;
    end;

    task.delay(1.1, function() -- Line: 411
        -- upvalues: Character2 (copy), u59 (ref), default (ref), InOutQuad (ref), u56 (copy)
        if not Character2 then
            return nil;
        end;

        local Position = u59.PrimaryPart.Position;
        default(0.3, InOutQuad, function(p64) -- Line: 416
            -- upvalues: u56 (ref), Position (copy), Character2 (ref), u59 (ref)
            local Character3 = u56.Character;

            if Character3 ~= nil then
                Character3 = Character3.PrimaryPart;

                if Character3 ~= nil then
                    Character3 = Character3.CFrame;
                end;
            end;

            if Character3 ~= nil then
                Character3 = Character3.Position;
            end;

            if not Character3 then
                return nil;
            end;

            local v65 = Position:Lerp(Character2.Position, p64):Lerp(Character2.Position:Lerp(Character3, p64), p64);
            u59:PivotTo(CFrame.new(v65) * CFrame.Angles(0, 6.283185307179586 * p64, 0));
        end, 0, 1):Wait();
    end);
    task.delay(1.5, function() -- Line: 434
        -- upvalues: u59 (ref)
        u59:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;