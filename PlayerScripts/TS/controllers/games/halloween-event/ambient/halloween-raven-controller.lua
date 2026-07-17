-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "HalloweenRavenController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.HALLOWEEN_2024_EVENT, GameType.HALLOWEEN_EVENT, GameType.HALLOWEEN_2025_EVENT_PVE });
    p5.Name = "HalloweenRavenController";
end;

function u3.onGameInit(p6) -- Line: 35
    -- upvalues: KnitClient (copy), AnimationType (copy), GameSound (copy), default2 (copy), SoundManager (copy), RandomUtil (copy), u2 (copy), GameAnimationUtil (copy), BLOCK_SIZE (copy), default (copy), Linear (copy)
    KnitClient.Controllers.PreloadController:runPreload({
        animations = { AnimationType.HALLOWEEN_RAVEN_FLIGHT_LOOP },
        sounds = { GameSound.HALLOWEEN_RAVENS_1, GameSound.HALLOWEEN_RAVENS_2 }
    });
    default2.Client:Get("PlayRavenAmbient"):Connect(function(p7) -- Line: 40
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), u2 (ref), GameAnimationUtil (ref), AnimationType (ref), BLOCK_SIZE (ref), default (ref), Linear (ref)
        SoundManager:playSound(RandomUtil.fromList(GameSound.HALLOWEEN_RAVENS_1, GameSound.HALLOWEEN_RAVENS_2), {
            rollOffMinDistance = 30,
            rollOffMaxDistance = 350,
            position = p7.ravenModel:GetPivot().Position
        });
        local Parent = p7.ravenModel.Parent;

        if not Parent then
            return nil;
        end;

        for _, child in Parent:GetChildren() do
            if child:IsA("Model") then
                local u8 = u2.new();
                u8:GiveTask(task.delay(2.5, function() -- Line: 56
                    -- upvalues: u8 (copy)
                    u8:Destroy();
                end));
                SoundManager:playSound(RandomUtil.fromList(GameSound.HALLOWEEN_RAVENS_1, GameSound.HALLOWEEN_RAVENS_2), {
                    rollOffMaxDistance = 120,
                    volumeMultiplier = 0.7,
                    position = child:GetPivot().Position
                });
                local v9 = child:FindFirstChildWhichIsA("AnimationController");

                if v9 ~= nil then
                    v9 = v9:FindFirstChild("Animator");
                end;

                local u10 = GameAnimationUtil:playAnimation(v9, AnimationType.HALLOWEEN_RAVEN_FLIGHT_LOOP);

                if u10 then
                    u10:Play();
                    u8:GiveTask(function() -- Line: 72
                        -- upvalues: u10 (copy)
                        u10:Stop();
                        u10:Destroy();
                    end);
                end;

                local u11 = child:GetPivot();
                local Position = u11.Position;
                local v12 = u11.LookVector * ((35 + math.random() * 15) * BLOCK_SIZE);
                local v13 = 35 + math.random() * 15;
                local v14 = Vector3.new(0, v13, 0);
                local v15 = Position + v12 + v14;
                local u16 = CFrame.new(v15, v15 + u11.LookVector);
                local u18 = default(2.5, Linear, function(p17) -- Line: 86
                    -- upvalues: child (copy), u11 (copy), u16 (copy)
                    child:PivotTo(u11:Lerp(u16, p17));
                end);
                u18:Play();
                u8:GiveTask(function() -- Line: 90
                    -- upvalues: u18 (copy)
                    u18:Cancel();
                end);
                u8:GiveTask(task.delay(2, function() -- Line: 93
                    -- upvalues: child (copy), default (ref), Linear (ref), u8 (copy)
                    local v19 = child:GetDescendants();

                    local function v23(u20) -- Line: 95
                        -- upvalues: default (ref), Linear (ref), u8 (ref)
                        if not u20:IsA("BasePart") then
                            return nil;
                        end;

                        local Transparency = u20.Transparency;

                        if Transparency == 1 then
                            return nil;
                        end;

                        local u22 = default(0.5, Linear, function(p21) -- Line: 103
                            -- upvalues: u20 (copy), Transparency (copy)
                            if u20.Parent ~= nil then
                                u20.Transparency = p21 * 1 + (1 - p21) * Transparency;
                            end;
                        end);
                        u22:Play();
                        u8:GiveTask(function() -- Line: 109
                            -- upvalues: u22 (copy)
                            u22:Cancel();
                        end);
                    end;

                    for i, v in v19 do
                        v23(v, i - 1, v19);
                    end;
                end));
            end;
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;