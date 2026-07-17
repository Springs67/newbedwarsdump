-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local DropPianoConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "drop-piano", "drop-piano-constants").DropPianoConstants;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "DropPianoController";
    end
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: u1 (copy)
    p5.maid = u1.new();
end;

function u3.onStart(u6) -- Line: 30
    -- upvalues: default (copy), DropPianoConstants (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), RunService (copy)
    default.Client:OnEvent("DropPiano", function(p7) -- Line: 31
        -- upvalues: DropPianoConstants (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), u6 (copy), RunService (ref)
        local DROP_DURATION = DropPianoConstants.DROP_DURATION;
        local target = p7.target;

        if not (target and (target.Character and target.Character.PrimaryPart)) then
            return nil;
        end;

        local Position = target.Character.PrimaryPart.Position;
        local u8 = ReplicatedStorage.Assets.Misc.Piano:Clone();
        u8.Parent = Workspace;
        local u9 = CFrame.new(Position + Vector3.new(0, 100, 0));
        u8:PivotTo(u9);
        local u10 = SoundManager:playSound(GameSound.SLIDE_WHISTLE_FALLING, {
            fadeInTime = 0.2
        });

        if u10 then
            SoundManager:tweenSoundVolume(u10, 3, DropPianoConstants.DROP_DURATION);
        end;

        u6.maid:GiveTask(function() -- Line: 51
            -- upvalues: u10 (copy)
            if u10 then
                u10:Destroy();
            end;
        end);
        local u11 = 0;
        u6.maid:GiveTask(RunService.Heartbeat:Connect(function(p12) -- Line: 57
            -- upvalues: u11 (ref), u8 (copy), u6 (ref), target (copy), DROP_DURATION (copy), u9 (copy)
            u11 = u11 + p12;

            if not u8.Parent then
                u6.maid:DoCleaning();

                return nil;
            end;

            if not (target and (target.Character and target.Character.PrimaryPart)) then
                return nil;
            end;

            local v13 = u9:Lerp(target.Character.PrimaryPart.CFrame, (math.clamp(u11 / DROP_DURATION, 0, 1)));
            u8:PivotTo(v13);

            if DROP_DURATION <= u11 then
                u6:crashPiano(u8, v13.Position);

                return nil;
            end;
        end));
    end);
end;

function u3.crashPiano(p14, u15, p16) -- Line: 77
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    p14.maid:DoCleaning();

    for _, descendant in u15:GetDescendants() do
        if descendant:IsA("BasePart") then
            descendant.Anchored = false;
            descendant:ApplyImpulse(Vector3.new(2, 6, 2) * descendant.Mass);
            descendant.CanCollide = true;
            descendant.CollisionGroup = "Players";
        end;
    end;

    task.delay(1, function() -- Line: 90
        -- upvalues: u15 (copy)
        u15:Destroy();
    end);
    local u17 = ReplicatedStorage.Assets.Effects.LandmineExplosion:Clone();
    u17.Parent = Workspace;
    EffectUtil:playEffects({ u17 }, nil, {
        sizeMultiplier = 3
    });
    SoundManager:playSound(GameSound.PIANO_CRASH, {
        rollOffMaxDistance = 300,
        position = p16
    });
    u17.CFrame = CFrame.new(p16);
    task.delay(0.7, function() -- Line: 104
        -- upvalues: u17 (copy)
        u17:Destroy();
    end);
end;

Reflect.defineMetadata(u3, "identifier", "client/controllers/games/bedwars/lucky-blocks/drop-piano/drop-piano-controller@DropPianoController");
Reflect.defineMetadata(u3, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u3, "$:flamework@Controller", Controller, { {} });

return {
    default = u3
};