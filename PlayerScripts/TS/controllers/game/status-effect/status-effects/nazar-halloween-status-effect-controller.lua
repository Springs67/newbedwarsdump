-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "NazarHalloweenStatusEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "NazarHalloweenStatusEffectController";
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), default2 (copy), u1 (copy), default (copy), Linear (copy), Players (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u6);
    default2.Client:GetNamespace("Halloween2024Remotes"):Get("NazarEntityPunched"):Connect(function(u7) -- Line: 36
        -- upvalues: u1 (ref), default (ref), Linear (ref), Players (ref), SoundManager (ref), GameSound (ref), u6 (copy)
        if not u7.target.PrimaryPart then
            return nil;
        end;

        u1.new();
        local Position = u7.target.PrimaryPart.Position;
        local Position2 = (u7.destination - Position).Position;
        local Unit = Vector3.new(Position2.X, 0, Position2.Z).Unit;
        local v8 = CFrame.lookAt(Vector3.new(0, 0, 0), Unit) * CFrame.Angles(0, 3.141592653589793, 0);
        u7.target:GetPivot();
        local u9 = CFrame.new(Position) * v8;
        local u10 = CFrame.new(u7.destination.Position) * v8;
        default(u7.knockbackDuration, Linear, function(p11) -- Line: 50
            -- upvalues: u7 (copy), u9 (copy), u10 (copy)
            if not u7.target.PrimaryPart then
                return nil;
            end;

            u7.target:PivotTo(u9:Lerp(u10, p11));
        end);
        local u12 = u7.target == Players.LocalPlayer.Character;
        task.delay(math.max(0, u7.knockbackDuration - 0.1), function() -- Line: 57
            -- upvalues: u12 (copy), u7 (copy), SoundManager (ref), GameSound (ref), u6 (ref)
            if u12 or u7.target.PrimaryPart then
                local v13 = {};
                local v14;

                if u12 then
                    v14 = nil;
                else
                    v14 = u7.target:GetPrimaryPartCFrame().Position;
                end;

                v13.position = v14;
                SoundManager:playSound(GameSound.KALIYAH_WALL_HIT, v13);
                local KALIYAH_EXPLOSION = GameSound.KALIYAH_EXPLOSION;
                local v15 = {
                    rollOffMaxDistance = 80,
                    rollOffMinDistance = 30,
                    volumeMultiplier = 0.5
                };

                for i, v in v13 do
                    v15[i] = v;
                end;

                SoundManager:playSound(KALIYAH_EXPLOSION, v15);

                if u7.target.PrimaryPart then
                    u6:playKnockbackStrikeEffect(u7.target.PrimaryPart.Position);
                end;
            end;
        end);
    end);
end;

function u3.playKnockbackStrikeEffect(p16, p17) -- Line: 82
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local v18 = ReplicatedStorage.Assets.Effects.NazarKnockbackStrike:Clone();
    v18.Parent = Workspace;
    v18.CFrame = CFrame.new(p17);
    EffectUtil:playEffects({ v18 }, nil, {
        destroyAfterSec = 1
    });
end;

KnitClient.CreateController(u3.new());

return nil;