-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "MeteorShowerService";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "MeteorShowerService";
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: KnitController (copy), default2 (copy), u1 (copy), ReplicatedStorage (copy), BLOCK_SIZE (copy), Workspace (copy), TweenService (copy), scaleModel (copy), SoundManager (copy), GameSound (copy), default (copy), OutQuad (copy), Players (copy), KnitClient (copy), EffectUtil (copy)
    KnitController.KnitStart(p6);
    default2.Client:OnEvent("MeteorSummon", function(u7) -- Line: 39
        -- upvalues: u1 (ref), ReplicatedStorage (ref), BLOCK_SIZE (ref), Workspace (ref), TweenService (ref), scaleModel (ref), SoundManager (ref), GameSound (ref), default (ref), OutQuad (ref), Players (ref), KnitClient (ref), EffectUtil (ref)
        local u8 = u1.new();
        local v9 = ReplicatedStorage.Assets.Effects.CosmicMeteorIndicator:Clone();
        local u10 = u7.position + Vector3.new(BLOCK_SIZE, -BLOCK_SIZE / 2, BLOCK_SIZE);
        v9.Position = u10 + Vector3.new(0, BLOCK_SIZE / 2, 0);
        v9.Parent = Workspace;
        v9.Size = Vector3.new(0, 0, 0);
        TweenService:Create(v9, TweenInfo.new(u7.duration, Enum.EasingStyle.Linear), {
            Size = Vector3.new(9, 0, 9)
        }):Play();
        u8:GiveTask(v9);
        local u11 = ReplicatedStorage.Assets.Misc.CosmicMeteor:Clone();
        u8:GiveTask(u11);
        scaleModel(u11, 0.8 + math.random(0, 2) * 0.2);
        local v12 = math.random() * 3.141592653589793 * 2;
        local v13 = CFrame.new(u7.position);
        local v14 = math.cos(v12) * 15;
        local v15 = math.sin(v12) * 15;
        local v16 = Vector3.new(v14, 450, v15);
        local v17 = math.random(-90, 90);
        local v18 = Vector3.new(v17, 0, math.random(-90, 90));
        local u19 = v13 + v16 + v18;
        u11:PivotTo(u19);
        u11.Parent = Workspace;
        local v20 = SoundManager:playSound(GameSound.METEOR_COSMIC_LOOP, {
            looped = true,
            position = u7.position
        });

        if v20 then
            SoundManager:tweenSoundVolume(v20, 5, u7.duration);
            u8:GiveTask(v20);
        end;

        local u21 = nil;
        u21 = default(u7.duration, OutQuad, function(p22) -- Line: 78
            -- upvalues: u11 (copy), u21 (ref), u19 (copy), u7 (copy)
            local PrimaryPart = u11.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Parent;
            end;

            if not PrimaryPart then
                u21:Cancel();

                return nil;
            end;

            u11:PivotTo(u19:Lerp(CFrame.new(u7.position), (math.pow(p22, 2) + math.pow(p22, 8)) / 2));
        end);
        task.delay(u7.duration, function() -- Line: 90
            -- upvalues: scaleModel (ref), u11 (copy), u8 (copy), Players (ref), u10 (copy), KnitClient (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
            scaleModel(u11, 0);
            task.delay(0.1, function() -- Line: 92
                -- upvalues: u8 (ref)
                u8:DoCleaning();
            end);
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = (Character:GetPrimaryPartCFrame().Position - u10).Magnitude;
            end;

            local v23 = Character == nil and 250 or Character;

            if v23 < 200 then
                KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    magnitude = 0.4 * v23 / 200
                });
            end;

            SoundManager:playSound(GameSound.METEOR_HITS, {
                rollOffMaxDistance = 200,
                position = u10
            });
            local v24 = ReplicatedStorage.Assets.Effects.CosmicMeteorExplosion:Clone();
            v24.Position = u10;
            v24.Parent = Workspace;
            EffectUtil:playEffects({ v24 }, nil, {
                sizeMultiplier = 1.3,
                destroyAfterSec = 3
            });
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;