-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GolemBossUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-util").GolemBossUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local GooseBossClient = RuntimeLib.import(script, script.Parent, "goose-boss-client").GooseBossClient;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "GooseBossController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 26
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "GooseBossController";
    p3.positionToDangerIndicator = {};
    p3.despawned = false;
    p3.isPreloaded = false;
end;

function u1.KnitStart(u4) -- Line: 37
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), AnimationType (copy), GameSound (copy), WatchCollectionTag (copy), StatefulEntityTag (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("GooseDespawn"):Connect(function() -- Line: 39
        -- upvalues: u4 (copy)
        u4.despawned = true;
    end);
    default.Client:Get("GooseScheduled"):Connect(function() -- Line: 42
        -- upvalues: u4 (copy), KnitClient (ref), AnimationType (ref), GameSound (ref)
        if not u4.isPreloaded then
            KnitClient.Controllers.PreloadController:runPreload({
                animations = { AnimationType.CRAB_BOSS_SPAWN },
                sounds = { GameSound.CRAB_BOSS_SPAWN_GLOBAL, GameSound.CRAB_BOSS_SPAWN_LOCAL }
            });
            KnitClient.Controllers.PreloadController:runPreload({
                animations = {
                    AnimationType.CRAB_BOSS_BARRAGE_ATTACK,
                    AnimationType.CRAB_BOSS_CLAW_ATTACK,
                    AnimationType.CRAB_BOSS_DEATH,
                    AnimationType.CRAB_BOSS_DIG_DOWN,
                    AnimationType.CRAB_BOSS_DIG_UP,
                    AnimationType.CRAB_BOSS_FLIP_GROUND,
                    AnimationType.CRAB_BOSS_IDLE,
                    AnimationType.CRAB_BOSS_WALK,
                    AnimationType.CRAB_BOSS_STAB_50,
                    AnimationType.CRAB_BOSS_STAB_90,
                    AnimationType.CRAB_BOSS_STAB_130,
                    AnimationType.CRAB_BOSS_STAB_230,
                    AnimationType.CRAB_BOSS_STAB_270,
                    AnimationType.CRAB_BOSS_STAB_310
                },
                sounds = {
                    GameSound.CRAB_BOSS_BURROW_IN,
                    GameSound.CRAB_BOSS_BURROW_LOOP,
                    GameSound.CRAB_BOSS_BURROW_OUT,
                    GameSound.CRAB_BOSS_CLAW_ATTACK,
                    GameSound.CRAB_BOSS_DEATH,
                    GameSound.CRAB_BOSS_FLIP,
                    GameSound.CRAB_BOSS_FLIP_BUILDUP,
                    GameSound.CRAB_BOSS_FOOTSTEP_1,
                    GameSound.CRAB_BOSS_FOOTSTEP_2,
                    GameSound.CRAB_BOSS_FOOTSTEP_3,
                    GameSound.CRAB_BOSS_IMPACT_1,
                    GameSound.CRAB_BOSS_IMPACT_2,
                    GameSound.CRAB_BOSS_IMPACT_3,
                    GameSound.CRAB_BOSS_IMPACT_4,
                    GameSound.CRAB_BOSS_LAUNCH_1,
                    GameSound.CRAB_BOSS_LAUNCH_2,
                    GameSound.CRAB_BOSS_LAUNCH_3,
                    GameSound.CRAB_BOSS_LAUNCH_4,
                    GameSound.CRAB_BOSS_POISON_LOOP,
                    GameSound.CRAB_BOSS_STAB_ATTACK
                }
            });
            u4.isPreloaded = true;
        end;
    end);
    WatchCollectionTag(StatefulEntityTag.GOOSE_BOSS, function(p5) -- Line: 56
        -- upvalues: u4 (copy)
        u4:spawnBoss(p5);
    end);
end;

function u1.spawnBoss(p6, p7) -- Line: 60
    -- upvalues: StatefulEntityUtil (copy), GooseBossClient (copy)
    local v8 = StatefulEntityUtil:getEntityFloorCFrame(p7);
    local v9 = p7:GetAttribute("EntityUUID");
    GooseBossClient.new(v8, v9, p7);

    return v8;
end;

function u1.showDangerIndicators(u10, u11) -- Line: 66
    -- upvalues: GolemBossUtil (copy)
    task.spawn(function() -- Line: 67
        -- upvalues: u11 (copy), u10 (copy), GolemBossUtil (ref)
        local v12 = u11;

        local function v17(p13) -- Line: 69
            -- upvalues: u10 (ref), GolemBossUtil (ref)
            local function _(p14) -- Line: 71
                -- upvalues: u10 (ref), GolemBossUtil (ref)
                local v15 = u10.positionToDangerIndicator[p14];

                if v15 then
                    GolemBossUtil:toggleBlockDangerIndicatorVisibility(v15, true);
                end;
            end;

            for i in p13 do
                local v16 = u10.positionToDangerIndicator[i];

                if v16 then
                    GolemBossUtil:toggleBlockDangerIndicatorVisibility(v16, true);
                end;
            end;
        end;

        for i, v in v12 do
            v17(v, i - 1, v12);
        end;
    end);
end;

function u1.vectorToRemoteFormat(p18, p19) -- Line: 88
    return "<Vector3> (" .. tostring(p19.X) .. ", " .. tostring(p19.Y) .. ", " .. tostring(p19.Z) .. ")";
end;

function u1.isGooseDespawned(p20) -- Line: 91
    return p20.despawned;
end;

KnitClient.CreateController(u1.new());

return nil;