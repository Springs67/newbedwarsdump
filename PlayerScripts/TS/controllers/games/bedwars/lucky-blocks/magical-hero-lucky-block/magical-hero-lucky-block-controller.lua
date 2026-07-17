-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BreakBlockEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").BreakBlockEventZap;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local HVFaction = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "hero-villain-types").HVFaction;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = { GameSound.MAGICAL_HERO_LB_HIT_1, GameSound.MAGICAL_HERO_LB_HIT_2, GameSound.MAGICAL_HERO_LB_HIT_3 };
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "MagicalHeroLuckyBlockController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "MagicalHeroLuckyBlockController";
    p7.effectMaidMap = {};
end;

function u5.KnitStart(u8) -- Line: 41
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), u4 (copy), ClientSyncEvents (copy), SoundManager (copy), RandomUtil (copy), BlockEngine (copy), BreakBlockEventZap (copy), default (copy), HVFaction (copy)
    KnitController.KnitStart(u8);
    local PreloadController = KnitClient.Controllers.PreloadController;
    local MAGICAL_HERO_LUCKY_BLOCK = ItemType.MAGICAL_HERO_LUCKY_BLOCK;
    local v9 = {};
    local v10 = { GameSound.MAGICAL_HERO_LB_BREAK, GameSound.MAGICAL_VILLAIN_LB_SPAWN };
    table.move(u4, 1, #u4, #v10 + 1, v10);
    v9.sounds = v10;
    PreloadController:preloadForItemType(MAGICAL_HERO_LUCKY_BLOCK, v9);
    ClientSyncEvents.DamageBlock:connect(function(p11) -- Line: 52
        -- upvalues: ItemType (ref), SoundManager (ref), RandomUtil (ref), u4 (ref), BlockEngine (ref)
        if p11.blockType ~= ItemType.MAGICAL_HERO_LUCKY_BLOCK then
            return nil;
        end;

        SoundManager:playSound(RandomUtil.fromList(unpack(u4)), {
            position = BlockEngine:getWorldPosition(p11.blockPosition)
        });
    end);
    BreakBlockEventZap.On(function(p12, p13, p14, p15, p16) -- Line: 60
        -- upvalues: ItemType (ref), BlockEngine (ref), SoundManager (ref), GameSound (ref), u8 (copy)
        if p13 ~= ItemType.MAGICAL_HERO_LUCKY_BLOCK then
            return nil;
        end;

        local v17 = BlockEngine:getWorldPosition(p12);
        SoundManager:playSound(GameSound.MAGICAL_HERO_LB_BREAK, {
            position = v17
        });
        local v18 = u8.effectMaidMap[v17];

        if v18 ~= nil then
            v18:DoCleaning();
        end;
    end);
    default.Client:Get("HeroLuckyBlockSpawn"):Connect(function(p19) -- Line: 87
        -- upvalues: u8 (copy), ItemType (ref), KnitClient (ref), HVFaction (ref)
        u8:spawnMagicalHeroLuckyBlock(ItemType.MAGICAL_HERO_LUCKY_BLOCK, p19.initialSpawnPosition, p19.targetPosition, p19.arriveTime);
        local v20 = u8:applySpawnEffects(KnitClient.Controllers.HeroVillainAssignmentController:getLocalHeroVillainAssignment() or HVFaction.HERO, p19.targetPosition);
        u8.effectMaidMap[p19.targetPosition] = v20;
    end);
end;

function u5.applySpawnEffects(p21, p22, p23) -- Line: 96
    -- upvalues: u2 (copy), HVFaction (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), CollectionService (copy)
    local v24 = u2.new();

    if p22 == HVFaction.VILLAIN then
        SoundManager:playSound(GameSound.MAGICAL_VILLAIN_LB_SPAWN, {
            position = p23
        });
        local v25 = ReplicatedStorage.Assets.Effects.VillainLuckyBlock:Clone();
        v25.Parent = Workspace;
        v25:MoveTo((Vector3.new(p23.X, p23.Y + 2.65, p23.Z)));
        v24:GiveTask(v25);
        local Moon = v25.Moon;
        Moon:PivotTo(CFrame.new(p23.X, p23.Y + 9, p23.Z));
        Moon:SetAttribute("RotationSpeed", 50);
        CollectionService:AddTag(Moon, "RotatingObject");

        return v24;
    end;

    SoundManager:playSound(GameSound.MAGICAL_HERO_LB_SPAWN, {
        position = p23
    });
    local v26 = ReplicatedStorage.Assets.Effects.HeroLuckyBlock:Clone();
    v26.Parent = Workspace;
    v26:MoveTo((Vector3.new(p23.X, p23.Y + 2.65, p23.Z)));
    v24:GiveTask(v26);
    local Star = v26.Star;
    Star:PivotTo(CFrame.new(p23.X, p23.Y + 9, p23.Z));
    Star:SetAttribute("RotationSpeed", 50);
    CollectionService:AddTag(Star, "RotatingObject");

    return v24;
end;

function u5.spawnMagicalHeroLuckyBlock(p27, p28, p29, p30, p31) -- Line: 127
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), TweenService (copy)
    local u32 = ReplicatedStorage.Assets.Blocks:FindFirstChild(p28);

    if u32 ~= nil then
        u32 = u32:Clone();
    end;

    u32.Parent = Workspace;
    SoundManager:playSound(GameSound.COSMIC_LUCKY_BLOCK_BOUNCE_2, {
        rollOffMaxDistance = 120,
        rollOffMinDistance = 10,
        parent = u32.PrimaryPart
    });
    u32.PrimaryPart:PivotTo(CFrame.new(p29));
    local v33 = TweenInfo.new(p31, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out);
    TweenService:Create(u32.PrimaryPart, v33, {
        CFrame = CFrame.new(p30)
    }):Play();
    task.delay(p31, function() -- Line: 144
        -- upvalues: u32 (copy)
        u32:Destroy();
    end);
end;

KnitClient.CreateController(u5.new());

return nil;