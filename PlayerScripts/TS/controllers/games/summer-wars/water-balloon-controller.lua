-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local WaterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "WaterBalloonController";
    end,

    __index = GameKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p4, { GameType.SUMMER_WARS });
    p4.Name = "WaterBalloonController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p5);
end;

function u2.onGameInit(p6) -- Line: 34
    -- upvalues: default (copy), ReplicatedStorage (copy), WaterType (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    default.Client:Get("WaterBalloonExplosion"):Connect(function(p7) -- Line: 35
        -- upvalues: ReplicatedStorage (ref), WaterType (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        local WaterBalloonEffect = ReplicatedStorage.Assets.Effects.WaterBalloonEffect;

        if p7.waterType == WaterType.SLIME then
            WaterBalloonEffect = ReplicatedStorage.Assets.Effects.SlimeExplosion;
        elseif p7.waterType == WaterType.FROSTY then
            WaterBalloonEffect = ReplicatedStorage.Assets.Effects.FrostWaterBalloonEffect;
        end;

        local u8 = WaterBalloonEffect:Clone();
        print(u8.Name);
        u8.Parent = Workspace;
        u8.Position = p7.position;

        local function _(p9) -- Line: 47
            if p9:IsA("ParticleEmitter") then
                p9:Emit(15);
            end;
        end;

        for i, descendant in u8:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant:Emit(15);
            end;
        end;

        SoundManager:playSound(GameSound.INFERNAL_SURFER_LAND, {
            rollOffMinDistance = 110,
            rollOffMaxDistance = 220,
            position = p7.position
        });
        task.delay(1, function() -- Line: 60
            -- upvalues: u8 (copy)
            u8:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;