-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "WeightMinigameEffectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "WeightMinigameEffectController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient (copy), default (copy), OutQuad (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    WatchCollectionTag("HWWeightGame", function(u6) -- Line: 31
        -- upvalues: KnitClient (ref), default (ref), OutQuad (ref), SoundManager (ref), GameSound (ref)
        KnitClient.Controllers.PoisonFogEffectController:enablePoisonCountdownSound();
        u6:WaitForChild("FinishedSetup");

        if not u6.PrimaryPart then
            u6:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local u7 = u6:GetPrimaryPartCFrame();
        local u8 = u6:GetPrimaryPartCFrame() + Vector3.new(0, -10, 0);
        default(2.5, OutQuad, function(p9) -- Line: 41
            -- upvalues: u6 (copy), u8 (copy), u7 (copy)
            u6:PivotTo(u8:Lerp(u7, p9));
        end);

        for _, child in u6:GetChildren() do
            local FloatingRock3 = child:FindFirstChild("FloatingRock3");
            local v10;

            if FloatingRock3 == nil then
                v10 = FloatingRock3;
            else
                v10 = FloatingRock3:IsA("BasePart");
            end;

            if v10 then
                local Position = FloatingRock3.Position;
                FloatingRock3.AncestryChanged:Connect(function() -- Line: 54
                    -- upvalues: SoundManager (ref), GameSound (ref), Position (copy)
                    SoundManager:playSound(GameSound.MINER_STONE_BREAK, {
                        rollOffMaxDistance = 80,
                        rollOffMinDistance = 60,
                        position = Position
                    });
                end);
                local u11 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
                    volumeMultiplier = 1.3,
                    rollOffMaxDistance = 420,
                    rollOffMinDistance = 90,
                    fadeInTime = 0.1,
                    parent = FloatingRock3
                });
                task.delay(3, function() -- Line: 68
                    -- upvalues: u11 (copy), SoundManager (ref)
                    if u11 then
                        local u12 = SoundManager:tweenSoundVolume(u11, 0, 0.5);
                        u12.Completed:Connect(function() -- Line: 71
                            -- upvalues: u11 (ref), u12 (copy)
                            u11:Stop();
                            u11:Destroy();
                            u12:Destroy();
                        end);
                    end;
                end);
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;