-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
Color3.fromRGB(237, 74, 74);
Color3.fromRGB(0, 0, 0);
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "TennisRacketController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p5);
    p5.Name = "TennisRacketController";
end;

function u3.isRelevantItem(p6, p7) -- Line: 39
    -- upvalues: ItemType (copy)
    return p7.itemType == ItemType.TENNIS_RACKET;
end;

function u3.onEnable(p8, p9, p10) -- Line: 42
    -- upvalues: u1 (copy), Flamework (copy), CooldownId (copy)
    p8:setupYield(function() -- Line: 43
        -- upvalues: u1 (ref), Flamework (ref), CooldownId (ref)
        local u11 = u1.new();
        u11:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.TENNIS_RACKET));

        return function() -- Line: 46
            -- upvalues: u11 (copy)
            u11:DoCleaning();
        end;
    end);
end;

function u3.onDisable(p12) -- Line: 51
end;

function u3.KnitStart(u13) -- Line: 53
    -- upvalues: HandKnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), GameSound (copy), ClientSyncEvents (copy), Flamework (copy), CooldownId (copy), getItemMeta (copy), Workspace (copy), default (copy)
    HandKnitController.KnitStart(u13);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.TENNIS_RACKET, {
        animations = { AnimationType.TENNIS_RACKET_IDLE, AnimationType.TENNIS_RACKET_HIT },
        sounds = { GameSound.TENNIS_BALL_HIT_1, GameSound.TENNIS_BALL_HIT_2 }
    });
    ClientSyncEvents.ProjectileLaunched:connect(function(p14) -- Line: 59
        -- upvalues: Flamework (ref), CooldownId (ref), getItemMeta (ref), ItemType (ref), Workspace (ref)
        if p14:isLocalShooter() and p14.projectileType == "tennis_ball" then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.TENNIS_RACKET, getItemMeta(ItemType.TENNIS_RACKET).projectileSource.fireDelaySec, {
                cooldownBar = {
                    color = Color3.fromRGB(156, 222, 84)
                }
            });
            local Trail = p14.projectile:FindFirstChild("Handle"):FindFirstChild("Trail");

            if Trail then
                Trail.Parent = Workspace;
            end;

            task.spawn(function() -- Line: 70
                -- upvalues: Trail (copy)
                task.wait(3);

                if Trail then
                    Trail:Destroy();
                end;
            end);
        end;
    end);
    default.Client:Get("TennisBallExplode"):Connect(function(p15) -- Line: 78
        -- upvalues: u13 (copy)
        u13:playExplosion(p15.position);
    end);
end;

function u3.playExplosion(p16, p17) -- Line: 82
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local u18 = ReplicatedStorage.Assets.Effects.Explosion:Clone();
    u18.Parent = Workspace;
    EffectUtil:playEffects({ u18 }, nil, {
        sizeMultiplier = 0.75
    });
    SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
        volumeMultiplier = 1.1,
        rollOffMinDistance = 50,
        rollOffMaxDistance = 400,
        position = p17
    });
    u18.CFrame = CFrame.new(p17);
    task.delay(1, function() -- Line: 95
        -- upvalues: u18 (copy)
        u18:Destroy();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;