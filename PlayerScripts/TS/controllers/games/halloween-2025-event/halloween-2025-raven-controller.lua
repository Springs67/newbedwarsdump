-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local Halloween2025MapConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "maps", "halloween-2025", "halloween-2025-map-config").Halloween2025MapConfig;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "Halloween2025RavenController";
    end,

    __index = GameKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: GameKnitController (copy), GameType (copy), default2 (copy)
    GameKnitController.constructor(p6, { GameType.BEDWARS });
    p6.Name = "Halloween2025RavenController";
    p6.setRavenGroupAmbient = default2.Client:Get("SetRavenGroupAmbient");
    p6.getAllRavenGroupsAmbient = default2.Client:Get("GetAllRavenGroupsAmbient");
    p6.ravenGroupMap = {};
end;

function u4.KnitStart(u7) -- Line: 42
    -- upvalues: GameKnitController (copy), Halloween2025MapConfig (copy)
    GameKnitController.KnitStart(u7);

    if not Halloween2025MapConfig.ENABLED_RAVEN_SPAWNS then
        return nil;
    end;

    local function _(p8, p9) -- Line: 48
        -- upvalues: u7 (copy)
        u7:spawnRavenGroup(p9, p8.otherPositions);
    end;

    for i, v in u7.getAllRavenGroupsAmbient:CallServer() do
        u7:spawnRavenGroup(i, v.otherPositions);
    end;
end;

function u4.onGameInit(u10) -- Line: 55
    -- upvalues: Halloween2025MapConfig (copy), KnitClient (copy), u2 (copy), AnimationType (copy), GameSound (copy), SoundManager (copy), RandomUtil (copy), GameAnimationUtil (copy), BLOCK_SIZE (copy), default (copy), Linear (copy)
    if not Halloween2025MapConfig.ENABLED_RAVEN_SPAWNS then
        return nil;
    end;

    if KnitClient.Controllers.MatchController:getCustomMatchConfig() then
        return nil;
    end;

    u10.maid = u2.new();
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.HALLOWEEN_RAVEN_FLIGHT_LOOP },
        sounds = { GameSound.HALLOWEEN_RAVENS_1, GameSound.HALLOWEEN_RAVENS_2 }
    });
    u10.maid:GiveTask(function() -- Line: 68
        -- upvalues: u10 (copy)
        table.clear(u10.ravenGroupMap);
    end);
    u10.maid:GiveTask(u10.setRavenGroupAmbient:Connect(function(p11, u12, p13) -- Line: 71
        -- upvalues: u10 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref), BLOCK_SIZE (ref), default (ref), Linear (ref)
        if p11 then
            u10:spawnRavenGroup(u12, p13 or {});

            return;
        end;

        local u14 = u10.ravenGroupMap[u12];

        if not u14 then
            return nil;
        end;

        u14.maid:GiveTask(task.delay(2.5, function() -- Line: 82
            -- upvalues: u14 (copy), u10 (ref), u12 (copy)
            u14.maid:Destroy();
            u10.ravenGroupMap[u12] = nil;
        end));
        SoundManager:playSound(RandomUtil.fromList(GameSound.HALLOWEEN_RAVENS_1, GameSound.HALLOWEEN_RAVENS_2), {
            rollOffMaxDistance = 120,
            volumeMultiplier = 0.7,
            position = u12
        });
        local models = u14.models;

        local function v30(u15) -- Line: 94
            -- upvalues: GameAnimationUtil (ref), AnimationType (ref), u14 (copy), BLOCK_SIZE (ref), default (ref), Linear (ref)
            local u16 = GameAnimationUtil:playAnimation(u15.AnimationController.Animator, AnimationType.HALLOWEEN_RAVEN_FLIGHT_LOOP);

            if u16 then
                u16:Play();
                u14.maid:GiveTask(function() -- Line: 98
                    -- upvalues: u16 (copy)
                    u16:Stop();
                    u16:Destroy();
                end);
            end;

            local u17 = u15:GetPivot();
            local Position = u17.Position;
            local v18 = u17.LookVector * ((35 + math.random() * 15) * BLOCK_SIZE);
            local v19 = 35 + math.random() * 15;
            local v20 = Vector3.new(0, v19, 0);
            local v21 = Position + v18 + v20;
            local u22 = CFrame.new(v21, v21 + u17.LookVector);
            local u24 = default(2.5, Linear, function(p23) -- Line: 112
                -- upvalues: u15 (copy), u17 (copy), u22 (copy)
                u15:PivotTo(u17:Lerp(u22, p23));
            end);
            u24:Play();
            u14.maid:GiveTask(function() -- Line: 116
                -- upvalues: u24 (copy)
                u24:Cancel();
            end);
            u14.maid:GiveTask(task.delay(2, function() -- Line: 119
                -- upvalues: u15 (copy), default (ref), Linear (ref), u14 (ref)
                local v25 = u15:GetDescendants();

                local function v29(u26) -- Line: 121
                    -- upvalues: default (ref), Linear (ref), u14 (ref)
                    if not u26:IsA("BasePart") then
                        return nil;
                    end;

                    local Transparency = u26.Transparency;

                    if Transparency == 1 then
                        return nil;
                    end;

                    local u28 = default(0.5, Linear, function(p27) -- Line: 129
                        -- upvalues: u26 (copy), Transparency (copy)
                        if u26.Parent ~= nil then
                            u26.Transparency = p27 * 1 + (1 - p27) * Transparency;
                        end;
                    end);
                    u28:Play();
                    u14.maid:GiveTask(function() -- Line: 135
                        -- upvalues: u28 (copy)
                        u28:Cancel();
                    end);
                end;

                for i, v in v25 do
                    v29(v, i - 1, v25);
                end;
            end));
        end;

        for i, v in models do
            v30(v, i - 1, models);
        end;
    end));
end;

function u4.spawnRavenGroup(u31, p32, p33) -- Line: 150
    -- upvalues: u2 (copy)
    local u34 = u2.new();
    local v35 = { u31:spawnRavenModel(p32, u34) };

    local function _(p36) -- Line: 155
        -- upvalues: u31 (copy), u34 (copy)
        return u31:spawnRavenModel(p36, u34);
    end;

    local v37 = table.create(#p33);

    for i, v in p33 do
        local _ = i - 1;
        v37[i] = u31:spawnRavenModel(v, u34);
    end;

    table.move(v37, 1, #v37, #v35 + 1, v35);

    local function _(p38) -- Line: 166
        -- upvalues: u34 (copy)
        u34:GiveTask(p38);
    end;

    for i, v in v35 do
        local _ = i - 1;
        u34:GiveTask(v);
    end;

    u31.ravenGroupMap[p32] = {
        otherPositions = p33,
        models = v35,
        maid = u34
    };
end;

function u4.spawnRavenModel(p39, p40, p41) -- Line: 181
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy)
    local v42 = ReplicatedStorage.Assets.Misc.Raven:Clone();
    local v43 = CFrame.new(p40 - Vector3.new(0, 0.8, 0));
    local Angles = CFrame.Angles;
    local v44 = 360 * math.random();
    v42:PivotTo(v43 * Angles(0, math.rad(v44), 0));
    v42.Parent = Workspace;
    local u45 = GameAnimationUtil:playAnimation(v42.AnimationController.Animator, AnimationType.HALLOWEEN_RAVEN_IDLE_LOOP);

    if u45 then
        u45:Play();
        p41:GiveTask(function() -- Line: 193
            -- upvalues: u45 (copy)
            u45:Stop();
            u45:Destroy();
        end);
    end;

    return v42;
end;

KnitClient.CreateController(u4.new());

return nil;