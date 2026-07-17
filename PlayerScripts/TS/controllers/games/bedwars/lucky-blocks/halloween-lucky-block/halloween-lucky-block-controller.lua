-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutElastic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutElastic;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "blocks", "halloween-lucky-block-meta");
local HLBBounceDuration = v4.HLBBounceDuration;
local HLBGrowthStage = v4.HLBGrowthStage;
local HLBStage1Duration = v4.HLBStage1Duration;
local HLBStage2Duration = v4.HLBStage2Duration;
local HLBStage3Duration = v4.HLBStage3Duration;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "HalloweenLuckyBlockController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "HalloweenLuckyBlockController";
    p7.halloweenBlockMap = {};
    p7.halloweenBlockMaidMap = {};
end;

function u5.KnitStart(u8) -- Line: 45
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), ItemType (copy), u2 (copy), HLBGrowthStage (copy), CollectionService (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u8);
    WatchCollectionTag("GrowingHalloweenLuckyBlock", function(p9) -- Line: 47
        -- upvalues: ItemType (ref), u8 (copy), u2 (ref), HLBGrowthStage (ref)
        if p9.Name ~= ItemType.GROWING_HALLOWEEN_LUCKY_BLOCK then
            return nil;
        end;

        local Position = p9:GetPivot().Position;

        if u8:isClientPrediction(p9) then
            return nil;
        end;

        if u8.halloweenBlockMap[Position] ~= nil then
            return nil;
        end;

        local v10 = u2.new();
        u8.halloweenBlockMap[Position] = HLBGrowthStage.STAGE_1;
        u8.halloweenBlockMaidMap[Position] = v10;
        u8:beginGrowSequence(p9, Position, v10);
        p9.Destroying:Connect(function() -- Line: 64
            -- upvalues: u8 (ref), Position (copy)
            u8.halloweenBlockMap[Position] = nil;
            local v11 = u8.halloweenBlockMaidMap[Position];

            if v11 ~= nil then
                v11:DoCleaning();
            end;

            u8.halloweenBlockMaidMap[Position] = nil;
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("HalloweenLuckyBlock"):Connect(function(p12) -- Line: 73
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_BREAK, {
            rollOffMaxDistance = 70,
            rollOffMinDistance = 20,
            position = p12.Position
        });
    end);
end;

function u5.beginGrowSequence(u13, p14, u15, p16) -- Line: 83
    -- upvalues: SoundManager (copy), GameSound (copy), HLBStage1Duration (copy), EffectUtil (copy), HLBGrowthStage (copy), HLBStage2Duration (copy), HLBStage3Duration (copy)
    local stage_1 = p14:WaitForChild("stage_1");
    local stage_2 = p14:WaitForChild("stage_2");
    local stage_3 = p14:WaitForChild("stage_3");
    local GrowEffect = p14:WaitForChild("GrowEffect");

    if not (stage_1 and (stage_2 and (stage_3 and GrowEffect))) then
        return nil;
    end;

    SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_PLANT, {
        rollOffMaxDistance = 70,
        rollOffMinDistance = 20,
        position = u15
    });
    local _ = stage_1.Size;
    local _ = stage_2.Size;
    local _ = stage_3.Size;
    task.delay(HLBStage1Duration, function() -- Line: 112
        -- upvalues: u13 (copy), u15 (copy), EffectUtil (ref), GrowEffect (copy), stage_1 (copy), stage_2 (copy), SoundManager (ref), GameSound (ref), HLBGrowthStage (ref)
        if u13.halloweenBlockMap[u15] == nil then
            return nil;
        end;

        EffectUtil:playEffects(GrowEffect:GetDescendants(), nil, {
            sizeMultiplier = 0.8
        });
        stage_1.Transparency = 1;
        stage_2.Transparency = 0;
        SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_GROW_1, {
            position = u15
        });
        u13.halloweenBlockMap[u15] = HLBGrowthStage.STAGE_2;
    end);
    task.delay(HLBStage1Duration + HLBStage2Duration, function() -- Line: 133
        -- upvalues: u13 (copy), u15 (copy), EffectUtil (ref), GrowEffect (copy), stage_2 (copy), stage_3 (copy), SoundManager (ref), GameSound (ref), HLBGrowthStage (ref)
        if u13.halloweenBlockMap[u15] == nil then
            return nil;
        end;

        EffectUtil:playEffects(GrowEffect:GetDescendants(), nil, {
            sizeMultiplier = 1.2
        });
        stage_2.Transparency = 1;
        stage_3.Transparency = 0;
        SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_GROW_2, {
            position = u15
        });
        u13.halloweenBlockMap[u15] = HLBGrowthStage.STAGE_3;
    end);
    task.delay(HLBStage1Duration + HLBStage2Duration + HLBStage3Duration, function() -- Line: 153
        -- upvalues: u13 (copy), u15 (copy), EffectUtil (ref), GrowEffect (copy), SoundManager (ref), GameSound (ref)
        if u13.halloweenBlockMap[u15] == nil then
            return nil;
        end;

        EffectUtil:playEffects(GrowEffect:GetDescendants(), nil, {
            sizeMultiplier = 1.2
        });
        SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_GROW_3, {
            position = u15
        });
        u13:harvestLuckyBlock(CFrame.new(u15));
    end);
end;

function u5.harvestLuckyBlock(p17, u18) -- Line: 168
    -- upvalues: KnitClient (copy), RandomUtil (copy), ReplicatedStorage (copy), Workspace (copy), HLBBounceDuration (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), default (copy), OutElastic (copy)
    local v19 = false;
    local v20 = 0;

    while true do
        if v19 then
            v20 = v20 + 1;
        else
            v19 = true;
        end;

        if v20 >= 6 then
            local v21 = u18 - Vector3.new(0, 3, 0);
            local u22 = ReplicatedStorage.Assets.Effects.PumpkinExplosion:Clone();
            u22:ScaleTo(0.75);
            u22:PivotTo(v21);
            u22.Parent = Workspace;
            task.delay(HLBBounceDuration / 2.5, function() -- Line: 194
                -- upvalues: EffectUtil (ref), u22 (copy), SoundManager (ref), GameSound (ref), u18 (copy)
                EffectUtil:playEffects(u22:GetDescendants(), nil, {
                    sizeMultiplier = 1.5
                });
                SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_EXPLODE, {
                    position = u18.Position
                });
            end);
            task.delay(HLBBounceDuration / 3, function() -- Line: 202
                -- upvalues: SoundManager (ref), GameSound (ref), u18 (copy)
                SoundManager:playSound(GameSound.HALLOWEEN_LUCKY_BLOCK_BOUNCE, {
                    position = u18.Position
                });
            end);
            default(HLBBounceDuration, OutElastic, function(p23) -- Line: 207
                -- upvalues: u22 (copy)
                u22:ScaleTo(p23);
            end, 0.75, 1):Play();
            default(HLBBounceDuration, OutElastic, function(p24) -- Line: 210
                -- upvalues: u22 (copy)
                u22:PivotTo(p24);
            end, v21, u18):Play():Wait();
            u22:Destroy();

            return;
        end;

        local BlockDebrisController = KnitClient.Controllers.BlockDebrisController;
        local Position = u18.Position;
        local fromList = RandomUtil.fromList;
        local v25 = { Color3.fromRGB(89, 54, 41), Color3.fromRGB(54, 29, 20) };
        local v26 = fromList(unpack(v25));
        local v27 = {};
        local v28 = 0.3 + math.random() * 0.2;
        local v29 = 0.3 + math.random() * 0.2;
        v27.size = Vector3.new(0.3, v28, v29);
        BlockDebrisController:createDebris(Position, v26, Vector3.new(0, 0, 0), v27);
    end;
end;

function u5.isClientPrediction(p30, p31) -- Line: 215
    return p31:GetAttribute("ClientPlaced");
end;

KnitClient.CreateController(u5.new());

return nil;