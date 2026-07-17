-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v1.InQuad;
local OutQuad = v1.OutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SymbolMinigameEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "SymbolMinigameEffectController";
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: KnitController (copy), CollectionService (copy), KnitClient (copy), u2 (copy), SoundManager (copy), GameSound (copy), default (copy), InQuad (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), OutQuad (copy), RunService (copy), MapUtil (copy)
    KnitController.KnitStart(p7);
    CollectionService:GetInstanceAddedSignal("HWSymbolGame"):Connect(function(u8) -- Line: 39
        -- upvalues: KnitClient (ref), u2 (ref), SoundManager (ref), GameSound (ref), default (ref), InQuad (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), OutQuad (ref), RunService (ref), MapUtil (ref)
        KnitClient.Controllers.PoisonFogEffectController:enablePoisonCountdownSound();

        if not u8:IsA("Model") then
            return nil;
        end;

        u8:WaitForChild("FinishedSetup");

        if not u8.PrimaryPart then
            u8:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        local u9 = u2.new();
        local u10 = u8:GetPrimaryPartCFrame();
        local u11 = u8:GetPrimaryPartCFrame() + Vector3.new(0, -20, 0);
        local u12 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
            volumeMultiplier = 1.1,
            rollOffMaxDistance = 400,
            rollOffMinDistance = 80,
            fadeInTime = 0.1,
            position = u10.Position
        });
        task.delay(3, function() -- Line: 60
            -- upvalues: u12 (copy), SoundManager (ref)
            if u12 then
                local u13 = SoundManager:tweenSoundVolume(u12, 0, 0.5);
                u13.Completed:Connect(function() -- Line: 63
                    -- upvalues: u12 (ref), u13 (copy)
                    u12:Stop();
                    u12:Destroy();
                    u13:Destroy();
                end);
            end;
        end);
        task.delay(9.65, function() -- Line: 70
            -- upvalues: u8 (copy), default (ref), InQuad (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
            local v14 = u8:GetAttribute("WinningClue");

            for _, child in u8:GetChildren() do
                if child:IsA("Model") then
                    if child:GetAttribute("ClueType") == v14 then
                        task.delay(4, function() -- Line: 78
                            -- upvalues: child (copy)
                            local v15 = child:GetDescendants();

                            local function v20(u16) -- Line: 80
                                if u16:IsA("BasePart") then
                                    u16.Anchored = false;
                                    u16.CanCollide = false;
                                    u16.CanQuery = false;
                                    local v17 = math.random() * 3.141592653589793 * 2;
                                    local v18 = math.sin(v17) * 10;
                                    local v19 = math.cos(v17) * 10;
                                    u16:ApplyImpulse(Vector3.new(v18, 10, v19) * u16.Mass);
                                    task.delay(1, function() -- Line: 90
                                        -- upvalues: u16 (copy)
                                        u16:Destroy();
                                    end);
                                end;
                            end;

                            for i, v in v15 do
                                v20(v, i - 1, v15);
                            end;
                        end);
                    else
                        for _, child2 in child:GetChildren() do
                            if child2.Name == "Clue" then
                                child2:Destroy();
                            end;
                        end;

                        local Pillar = child:FindFirstChild("Pillar");
                        local v21;

                        if Pillar == nil then
                            v21 = Pillar;
                        else
                            v21 = Pillar:IsA("BasePart");
                        end;

                        if v21 then
                            local CFrame = Pillar.CFrame;
                            local u22 = CFrame + Vector3.new(0, -9.643, 0);
                            default(0.2, InQuad, function(p23) -- Line: 115
                                -- upvalues: Pillar (copy), CFrame (copy), u22 (copy)
                                Pillar.CFrame = CFrame:Lerp(u22, p23);
                            end);
                            task.delay(0.25, function() -- Line: 119
                                -- upvalues: SoundManager (ref), GameSound (ref), u22 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), child (copy)
                                SoundManager:playSound(GameSound.HALLOWEEN_BOSS_ROCK_CRUMBLE, {
                                    rollOffMinDistance = 50,
                                    rollOffMaxDistance = 120,
                                    volumeMultiplier = 0.2,
                                    position = u22.Position
                                });
                                local v24 = ReplicatedStorage.Assets.Effects.HalloweenExplosion:Clone();
                                v24.Position = u22.Position;
                                v24.Parent = Workspace;
                                EffectUtil:playEffects({ v24 }, nil, {
                                    destroyAfterSec = 4,
                                    sizeMultiplier = 0.39999999999999997
                                });
                                child:Destroy();
                            end);
                        else
                            task.delay(0.35, function() -- Line: 136
                                -- upvalues: child (copy)
                                child:Destroy();
                            end);
                        end;
                    end;
                end;
            end;
        end);
        local u26 = default(3.5, OutQuad, function(p25) -- Line: 142
            -- upvalues: u8 (copy), u11 (copy), u10 (copy)
            u8:PivotTo(u11:Lerp(u10, p25));
        end);
        u9:GiveTask(function() -- Line: 145
            -- upvalues: u26 (copy)
            return u26:Cancel();
        end);
        local u27 = {};
        local u28 = 0;
        RunService:BindToRenderStep("pillar-pre-camera", Enum.RenderPriority.Camera.Value - 1, function(p29) -- Line: 150
            -- upvalues: u28 (ref), u8 (copy), MapUtil (ref), u27 (copy)
            u28 = u28 + p29;

            for _, child in u8:GetChildren() do
                for _, child2 in child:GetChildren() do
                    if child2.Name == "Pillar" and child2:IsA("BasePart") then
                        local v30 = MapUtil.getOrCreate(u27, child2, {
                            offset = math.random()
                        });
                        v30.lastFrame = child2.CFrame;
                        local CFrame = child2.CFrame;
                        local v31 = math.sin(u28 + v30.offset * 3.141592653589793 * 2) * 1.4;
                        child2.CFrame = CFrame + Vector3.new(0, v31, 0);
                    end;
                end;
            end;
        end);
        u9:GiveTask(function() -- Line: 166
            -- upvalues: RunService (ref)
            return RunService:UnbindFromRenderStep("pillar-pre-camera");
        end);
        RunService:BindToRenderStep("pillar-post-camera", Enum.RenderPriority.Camera.Value - 1, function(p32) -- Line: 169
            -- upvalues: u27 (copy)
            for i, v in u27 do
                if v.lastFrame then
                    i.CFrame = v.lastFrame;
                end;
            end;
        end);
        u9:GiveTask(function() -- Line: 176
            -- upvalues: RunService (ref)
            return RunService:UnbindFromRenderStep("pillar-post-camera");
        end);
        u9:GiveTask(u8.AncestryChanged:Connect(function() -- Line: 179
            -- upvalues: u8 (copy), u9 (copy)
            if not u8.Parent then
                u9:DoCleaning();
            end;
        end));
    end);
end;

KnitClient.CreateController(u4.new());

return nil;