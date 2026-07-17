-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Acceleration = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Acceleration;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "game", "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local GOLEM_HEAL_TOTEM_SPAWN_DELAY = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match-event", "golem-boss", "golem-boss-constants").GOLEM_HEAL_TOTEM_SPAWN_DELAY;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatefulEntityTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "SpiritGolemBossController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 36
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 40
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SpiritGolemBossController";
end;

function u4.KnitStart(u7) -- Line: 44
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), StatefulEntityTag (copy), u2 (copy), CollectionService (copy), Flamework (copy), default2 (copy), SoundManager (copy), GameSound (copy), BLOCK_SIZE (copy), ReplicatedStorage (copy), ItemType (copy), Workspace (copy), default (copy), GOLEM_HEAL_TOTEM_SPAWN_DELAY (copy), Acceleration (copy)
    KnitController.KnitStart(u7);
    WatchCollectionTag(StatefulEntityTag.GOLEM_BOSS, function(p8) -- Line: 47
        -- upvalues: u2 (ref), u7 (copy)
        u7.golemBossBeamAttachment = u2("Attachment", {
            Parent = p8:WaitForChild("Titan")
        });
    end);
    WatchCollectionTag("titanHealBeam", function(p9) -- Line: 54
        -- upvalues: u7 (copy)
        p9.Attachment1 = u7.golemBossBeamAttachment;
    end);
    WatchCollectionTag("entity", function(p10) -- Line: 57
        -- upvalues: u7 (copy)
        if p10.Name ~= "TitanHealTotem" then
            return nil;
        end;

        u7:createEntityHealthbar(p10);
    end);
    CollectionService:GetInstanceRemovedSignal("entity"):Connect(function(p11) -- Line: 63
        -- upvalues: Flamework (ref)
        if p11.Name ~= "TitanHealTotem" then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("StatefulEntityHpBarBillboard_" .. tostring(p11:GetAttribute("UUID")));
    end);
    default2.Client:Get("TitanHealTotemSpawn"):Connect(function(p12) -- Line: 69
        -- upvalues: SoundManager (ref), GameSound (ref), BLOCK_SIZE (ref), u7 (copy), ReplicatedStorage (ref), ItemType (ref), Workspace (ref), default (ref), GOLEM_HEAL_TOTEM_SPAWN_DELAY (ref), Acceleration (ref)
        SoundManager:playSound(GameSound.FALLING_ROCKS, {
            playbackSpeedMultiplier = 0.5,
            fadeOutTime = 0.25,
            position = p12.position
        });
        u7:playStoneCrumbleEffect((Vector3.new(p12.position.X, p12.position.Y - 0.5 * BLOCK_SIZE, p12.position.Z)));
        local u13 = ReplicatedStorage.Assets.Blocks:FindFirstChild(ItemType.TITAN_HEAL_TOTEM);

        if u13 ~= nil then
            u13 = u13:Clone();
        end;

        u13.Parent = Workspace;
        u13:SetAttribute("NoNametag", true);
        local v14 = Vector3.new(p12.position.X, p12.position.Y - 2 * BLOCK_SIZE, p12.position.Z);
        u13:PivotTo(CFrame.new(v14));
        local Position = u13:GetPivot().Position;
        local Rotation = u13:GetPivot().Rotation;
        default(GOLEM_HEAL_TOTEM_SPAWN_DELAY, Acceleration, function(p15) -- Line: 88
            -- upvalues: u13 (copy), Rotation (copy)
            u13:PivotTo(CFrame.new((Vector3.new(p15.X, p15.Y, p15.Z))) * Rotation);
        end, Position, p12.position):Wait();
        task.delay(GOLEM_HEAL_TOTEM_SPAWN_DELAY, function() -- Line: 91
            -- upvalues: u13 (copy)
            u13:Destroy();
        end);
    end);
end;

function u4.createEntityHealthbar(p16, p17) -- Line: 96
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        app = StatefulEntityHpBarBillboard,
        appId = "StatefulEntityHpBarBillboard_" .. tostring(p17:GetAttribute("UUID"))
    }, {
        hpBarOffset = Vector3.new(0, 4.25, 0),
        gameEntity = p17,
        serverInstance = p17
    }, nil, p17);
end;

function u4.playStoneCrumbleEffect(p18, p19) -- Line: 106
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), GOLEM_HEAL_TOTEM_SPAWN_DELAY (copy)
    local u20 = ReplicatedStorage.Assets.Effects.HealTotemSummonEffect:Clone();
    u20.Parent = Workspace;
    u20:PivotTo(CFrame.new(p19));
    task.delay(GOLEM_HEAL_TOTEM_SPAWN_DELAY, function() -- Line: 110
        -- upvalues: u20 (copy)
        local function _(p21) -- Line: 112
            if p21:IsA("ParticleEmitter") then
                p21.Enabled = false;
            end;
        end;

        for i, descendant in u20:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.Enabled = false;
            end;
        end;
    end);
    task.delay(GOLEM_HEAL_TOTEM_SPAWN_DELAY + 1, function() -- Line: 121
        -- upvalues: u20 (copy)
        u20:Destroy();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;