-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants");
local GOLEM_DISLODGE_SOUNDS = v3.GOLEM_DISLODGE_SOUNDS;
local GOLEM_DISLODGE_SOUND_CHANCE = v3.GOLEM_DISLODGE_SOUND_CHANCE;
local GOLEM_PILLAR_BLOCK_TAG = v3.GOLEM_PILLAR_BLOCK_TAG;
local GOLEM_PLATFORM_SIZE_BLOCKS = v3.GOLEM_PLATFORM_SIZE_BLOCKS;
local GROUND_Y_OFFSET = v3.GROUND_Y_OFFSET;
local SHOCKWAVE_INTERVAL = v3.SHOCKWAVE_INTERVAL;
local SpiritGolemBossConstants = v3.SpiritGolemBossConstants;
local VoidGolemBossConstants = v3.VoidGolemBossConstants;
local GolemBossUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-util").GolemBossUtil;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local BhaaBossClient = RuntimeLib.import(script, script.Parent, "bhaa-boss-client").BhaaBossClient;
local GolemBossClient = RuntimeLib.import(script, script.Parent, "golem-boss-client").GolemBossClient;
local SpiritGolemBossClient = RuntimeLib.import(script, script.Parent, "spirit-golem-boss-client").SpiritGolemBossClient;
local VoidGolemBossClient = RuntimeLib.import(script, script.Parent, "void-golem-boss-client").VoidGolemBossClient;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 37, Name: __tostring
        return "GolemBossController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 43
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 47
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "GolemBossController";
    p6.hasbossSpawned = false;
    p6.positionToDummyBlock = {};
    p6.positionToDangerIndicator = {};
    p6.shockwaveTweenCache = {};
    p6.bossPlatformBlockTypes = {};
end;

function u4.KnitStart(u7) -- Line: 56
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), StatefulEntityTag (copy), GROUND_Y_OFFSET (copy), GOLEM_PILLAR_BLOCK_TAG (copy)
    KnitController.KnitStart(u7);
    WatchCollectionTag(StatefulEntityTag.GOLEM_BOSS, function(p8) -- Line: 59
        -- upvalues: u7 (copy), GROUND_Y_OFFSET (ref)
        local v9 = u7:spawnBoss(p8) + GROUND_Y_OFFSET;

        if not u7.hasbossSpawned then
            u7.hasbossSpawned = true;
            u7:createDummyBlocks(v9.Position);
        end;
    end);
    WatchCollectionTag(GOLEM_PILLAR_BLOCK_TAG, function(p10) -- Line: 68
        -- upvalues: u7 (copy)
        u7:animatePillarBlock(p10);
    end);
end;

function u4.animatePillarBlock(p11, p12) -- Line: 72
    -- upvalues: TweenService (copy), BLOCK_SIZE (copy)
    local v13 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true);
    local v14 = {};
    local v15 = p12.Size.X + math.random() * (BLOCK_SIZE / 2);
    local v16 = p12.Size.Y + math.random() * (BLOCK_SIZE / 2);
    local v17 = p12.Size.Z + math.random() * (BLOCK_SIZE / 2);
    v14.Size = Vector3.new(v15, v16, v17);
    TweenService:Create(p12, v13, v14):Play();
end;

function u4.spawnBoss(p18, p19) -- Line: 77
    -- upvalues: StatefulEntityUtil (copy), SpiritGolemBossClient (copy), VoidGolemBossClient (copy), BhaaBossClient (copy), GolemBossClient (copy)
    local v20 = StatefulEntityUtil:getGameEntityCFrame(p19);
    local v21 = p19:GetAttribute("EntityUUID");
    local v22 = p19:GetAttribute("BossType");

    if v22 == "SpiritGolem" then
        SpiritGolemBossClient.new(v20, v21, p19);

        return v20;
    end;

    if v22 == "VoidGolem" then
        VoidGolemBossClient.new(v20, v21, p19);

        return v20;
    end;

    if v22 == "Bhaa" then
        BhaaBossClient.new(v20, v21, p19);

        return v20;
    end;

    p18.bossClient = GolemBossClient.new(v20, v21, p19);

    return v20;
end;

function u4.createDummyBlocks(u23, p24) -- Line: 98
    -- upvalues: BlockEngine (copy), GolemBossUtil (copy), GOLEM_PLATFORM_SIZE_BLOCKS (copy), ItemType (copy)
    local v25 = GolemBossUtil:getBlocksAroundOrigin(BlockEngine:getBlockPosition(p24), GOLEM_PLATFORM_SIZE_BLOCKS);

    if v25 ~= nil then
        v25:andThen(function(p26) -- Line: 103
            -- upvalues: BlockEngine (ref), ItemType (ref), GolemBossUtil (ref), u23 (copy)
            local function v42(p27) -- Line: 105
                -- upvalues: BlockEngine (ref), ItemType (ref), GolemBossUtil (ref), u23 (ref)
                local u28 = 0;

                local function _(u29) -- Line: 108
                    -- upvalues: u28 (ref), BlockEngine (ref), ItemType (ref), GolemBossUtil (ref), u23 (ref)
                    task.spawn(function() -- Line: 109
                        -- upvalues: u28 (ref), BlockEngine (ref), u29 (copy), ItemType (ref), GolemBossUtil (ref), u23 (ref)
                        task.wait(u28 * 0.125);
                        local v30 = BlockEngine:getStore():getBlockAt(u29);
                        local v31;

                        if v30 == nil then
                            v31 = v30;
                        else
                            v31 = v30.Name;
                        end;

                        if v31 == nil then
                            v31 = ItemType.STONE;
                        end;

                        local v32;

                        if v30 == nil then
                            v32 = v30;
                        else
                            v32 = v30.Name;
                        end;

                        local v33 = v32 == ItemType.LADDER;

                        if not v33 then
                            if v30 ~= nil then
                                v30 = v30.Name;
                            end;

                            v33 = v30 == ItemType.VINE_LADDER;
                        end;

                        if v33 then
                            v31 = ItemType.STONE;
                        end;

                        local v34 = GolemBossUtil:createDummyBlockAt(u29, v31);
                        v34.Name = "DummyBlock";
                        GolemBossUtil:toggleDummyBlockVisibility(v34, false);
                        u23.positionToDummyBlock[u29] = v34;
                        u23.bossPlatformBlockTypes[v31] = true;
                        local v35 = GolemBossUtil:createBlockDangerIndicatorAt(u29, Vector3.new(0, 0.15, 0));
                        GolemBossUtil:toggleBlockDangerIndicatorVisibility(v35, false);
                        u23.positionToDangerIndicator[u29] = v35;
                    end);
                    u28 = u28 + 1;
                end;

                for i in p27 do
                    task.spawn(function() -- Line: 109
                        -- upvalues: u28 (ref), BlockEngine (ref), i (copy), ItemType (ref), GolemBossUtil (ref), u23 (ref)
                        task.wait(u28 * 0.125);
                        local v36 = BlockEngine:getStore():getBlockAt(i);
                        local v37;

                        if v36 == nil then
                            v37 = v36;
                        else
                            v37 = v36.Name;
                        end;

                        if v37 == nil then
                            v37 = ItemType.STONE;
                        end;

                        local v38;

                        if v36 == nil then
                            v38 = v36;
                        else
                            v38 = v36.Name;
                        end;

                        local v39 = v38 == ItemType.LADDER;

                        if not v39 then
                            if v36 ~= nil then
                                v36 = v36.Name;
                            end;

                            v39 = v36 == ItemType.VINE_LADDER;
                        end;

                        if v39 then
                            v37 = ItemType.STONE;
                        end;

                        local v40 = GolemBossUtil:createDummyBlockAt(i, v37);
                        v40.Name = "DummyBlock";
                        GolemBossUtil:toggleDummyBlockVisibility(v40, false);
                        u23.positionToDummyBlock[i] = v40;
                        u23.bossPlatformBlockTypes[v37] = true;
                        local v41 = GolemBossUtil:createBlockDangerIndicatorAt(i, Vector3.new(0, 0.15, 0));
                        GolemBossUtil:toggleBlockDangerIndicatorVisibility(v41, false);
                        u23.positionToDangerIndicator[i] = v41;
                    end);
                    u28 = u28 + 1;
                end;
            end;

            for i, v in p26 do
                v42(v, i - 1, p26);
            end;
        end);
    end;
end;

function u4.showDangerIndicators(u43, u44) -- Line: 169
    -- upvalues: GolemBossUtil (copy)
    task.spawn(function() -- Line: 170
        -- upvalues: u44 (copy), u43 (copy), GolemBossUtil (ref)
        local function _(p45) -- Line: 172
            -- upvalues: u43 (ref), GolemBossUtil (ref)
            local v46 = u43.positionToDangerIndicator[p45];

            if v46 then
                GolemBossUtil:toggleBlockDangerIndicatorVisibility(v46, true);
            end;
        end;

        for i, v in u44 do
            local _ = i - 1;
            local v47 = u43.positionToDangerIndicator[v];

            if v47 then
                GolemBossUtil:toggleBlockDangerIndicatorVisibility(v47, true);
            end;
        end;
    end);
end;

function u4.playShockwaveEffect(u48, u49, u50, p51, u52) -- Line: 185
    -- upvalues: SHOCKWAVE_INTERVAL (copy), TweenService (copy), BLOCK_SIZE (copy), GolemBossUtil (copy), GOLEM_DISLODGE_SOUND_CHANCE (copy), RandomUtil (copy), SpiritGolemBossConstants (copy), VoidGolemBossConstants (copy), GOLEM_DISLODGE_SOUNDS (copy), SoundManager (copy)
    if u50 == nil then
        u50 = SHOCKWAVE_INTERVAL;
    end;

    local u53 = p51 == nil and true or p51;
    task.spawn(function() -- Line: 192
        -- upvalues: u49 (copy), u48 (copy), TweenService (ref), u50 (ref), BLOCK_SIZE (ref), GolemBossUtil (ref), GOLEM_DISLODGE_SOUND_CHANCE (ref), u52 (copy), RandomUtil (ref), SpiritGolemBossConstants (ref), VoidGolemBossConstants (ref), GOLEM_DISLODGE_SOUNDS (ref), SoundManager (ref), u53 (ref)
        local v54 = u49;

        local function v71(p55) -- Line: 194
            -- upvalues: u48 (ref), TweenService (ref), u50 (ref), BLOCK_SIZE (ref), GolemBossUtil (ref), GOLEM_DISLODGE_SOUND_CHANCE (ref), u52 (ref), RandomUtil (ref), SpiritGolemBossConstants (ref), VoidGolemBossConstants (ref), GOLEM_DISLODGE_SOUNDS (ref), SoundManager (ref), u53 (ref)
            local function v70(p56) -- Line: 196
                -- upvalues: u48 (ref), TweenService (ref), u50 (ref), BLOCK_SIZE (ref), GolemBossUtil (ref), GOLEM_DISLODGE_SOUND_CHANCE (ref), u52 (ref), RandomUtil (ref), SpiritGolemBossConstants (ref), VoidGolemBossConstants (ref), GOLEM_DISLODGE_SOUNDS (ref), SoundManager (ref), u53 (ref)
                local u57 = u48.positionToDummyBlock[p56];

                if u57 then
                    local v58 = u48.shockwaveTweenCache[p56];
                    local v59;

                    if v58 then
                        v59 = v58;
                    else
                        local v60 = TweenInfo.new(u50, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true);
                        local v61 = {};
                        local v62 = u57.Position.X + math.random() * (BLOCK_SIZE / 2);
                        local v63 = u57.Position.Y + BLOCK_SIZE / 1.5;
                        local v64 = u57.Position.Z + math.random() * (BLOCK_SIZE / 2);
                        v61.Position = Vector3.new(v62, v63, v64);
                        local X = u57.Size.X;
                        local v65 = u57.Size.Y + math.random() * (BLOCK_SIZE / 2);
                        v61.Size = Vector3.new(X, v65, u57.Size.Z);
                        v59 = TweenService:Create(u57, v60, v61);
                    end;

                    if not v58 then
                        u48.shockwaveTweenCache[p56] = v59;
                    end;

                    local u66 = nil;
                    u66 = v59.Completed:Connect(function() -- Line: 216
                        -- upvalues: u66 (ref), GolemBossUtil (ref), u57 (copy)
                        u66:Disconnect();
                        GolemBossUtil:toggleDummyBlockVisibility(u57, false);
                    end);
                    GolemBossUtil:toggleDummyBlockVisibility(u57, true);
                    v59:Play();

                    if math.random(0, 100) <= GOLEM_DISLODGE_SOUND_CHANCE then
                        local v67 = u52;

                        if v67 ~= nil then
                            v67 = v67:GetAttribute("BossType");
                        end;

                        local v68;

                        if v67 == "SpiritGolem" then
                            v68 = RandomUtil.fromList(unpack(SpiritGolemBossConstants.SPIRIT_GOLEM_DISLODGE_SOUNDS));
                        elseif v67 == "VoidGolem" then
                            v68 = RandomUtil.fromList(unpack(VoidGolemBossConstants.VOID_GOLEM_DISLODGE_SOUNDS));
                        elseif v67 == "Bhaa" then
                            v68 = nil;
                        else
                            v68 = RandomUtil.fromList(unpack(GOLEM_DISLODGE_SOUNDS));
                        end;

                        if v68 ~= "" and v68 then
                            SoundManager:playSound(v68, {
                                position = u57.Position
                            });
                        end;
                    end;

                    local u69 = u53 and u48.positionToDangerIndicator[p56];

                    if u69 then
                        task.delay(0.175, function() -- Line: 256
                            -- upvalues: GolemBossUtil (ref), u69 (copy)
                            return GolemBossUtil:toggleBlockDangerIndicatorVisibility(u69, false);
                        end);
                    end;
                end;
            end;

            for i, v in p55 do
                v70(v, i - 1, p55);
            end;

            task.wait(u50 / 2);
        end;

        for i, v in v54 do
            v71(v, i - 1, v54);
        end;
    end);
end;

function u4.hideAllBlockDangerIndicators(p72) -- Line: 273
    -- upvalues: u2 (copy), GolemBossUtil (copy)
    local function _(p73) -- Line: 275
        -- upvalues: GolemBossUtil (ref)
        GolemBossUtil:toggleBlockDangerIndicatorVisibility(p73, false);
    end;

    for i, v in u2.values(p72.positionToDangerIndicator) do
        local _ = i - 1;
        GolemBossUtil:toggleBlockDangerIndicatorVisibility(v, false);
    end;
end;

function u4.vectorToRemoteFormat(p74, p75) -- Line: 282
    return "<Vector3> (" .. tostring(p75.X) .. ", " .. tostring(p75.Y) .. ", " .. tostring(p75.Z) .. ")";
end;

function u4.getBossClient(p76) -- Line: 285
    return p76.bossClient;
end;

KnitClient.CreateController(u4.new());

return nil;