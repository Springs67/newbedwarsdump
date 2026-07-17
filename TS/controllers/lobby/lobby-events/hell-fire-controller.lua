-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Lighting = v5.Lighting;
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 38, Name: __tostring
        return "HellFireController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 44
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 48
    -- upvalues: KnitController (copy), u4 (copy), Workspace (copy)
    KnitController.constructor(p8);
    p8.Name = "HellFireController";
    p8.meteorsFolder = u4("Folder", {
        Name = "Meteors",
        Parent = Workspace
    });
    p8.shardMap = {};
end;

function u6.KnitStart(u9) -- Line: 57
    -- upvalues: KnitController (copy), KnitClient (copy), GameSound (copy), default2 (copy), default (copy), InQuad (copy), u4 (copy), Lighting (copy), u3 (copy), ReplicatedStorage (copy), RunService (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), RandomUtil (copy), KnitClient2 (copy), Players (copy)
    KnitController.KnitStart(u9);
    KnitClient.Controllers.PreloadController:runPreload({
        sounds = {
            GameSound.METEOR_LOBBY_MUSIC,
            GameSound.EXPLODING_TANK_BLOCK_EXPLODE_1,
            GameSound.EXPLODING_TANK_BLOCK_EXPLODE_2,
            GameSound.EXPLODING_TANK_BLOCK_EXPLODE_3,
            GameSound.METEOR_HITS,
            GameSound.METEOR_LOOP
        }
    });
    default2.Client:Get("LobbyMeteorStart"):Connect(function(p10) -- Line: 64
        -- upvalues: KnitClient (ref), GameSound (ref), default (ref), InQuad (ref), u9 (copy), u4 (ref), Lighting (ref)
        if p10.cleanUp then
            KnitClient.Controllers.BackgroundMusicController:stopMusic();
            KnitClient.Controllers.BackgroundMusicController:startMusic(GameSound.LOBBY_MUSIC);
            default(4, InQuad, function(p11) -- Line: 68
                -- upvalues: u9 (ref)
                if u9.colorCorrectionEffect then
                    u9.colorCorrectionEffect.Brightness = -0.05 * p11;
                    u9.colorCorrectionEffect.Contrast = 0.05 * p11;
                    u9.colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 255, 255), p11);
                end;

                if u9.atmosphereEffect then
                    u9.atmosphereEffect.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p11);
                    u9.atmosphereEffect.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p11);
                    u9.atmosphereEffect.Glare = 1 * p11;
                    u9.atmosphereEffect.Haze = 4.5 * p11;
                end;
            end, 1, 0);

            return;
        end;

        KnitClient.Controllers.BackgroundMusicController:stopMusic();
        local v12 = KnitClient.Controllers.BackgroundMusicController:startMusic(GameSound.METEOR_LOBBY_MUSIC);

        if v12 then
            local track = v12.track;
            track.Volume = track.Volume * 0.5;
        end;

        u9.colorCorrectionEffect = u4("ColorCorrectionEffect", {
            Parent = Lighting
        });
        u9.atmosphereEffect = Lighting:FindFirstChildWhichIsA("Atmosphere") or u4("Atmosphere", {
            Parent = Lighting
        });
        default(5, InQuad, function(p13) -- Line: 95
            -- upvalues: u9 (ref)
            if u9.colorCorrectionEffect then
                u9.colorCorrectionEffect.Brightness = -0.05 * p13;
                u9.colorCorrectionEffect.Contrast = 0.05 * p13;
                u9.colorCorrectionEffect.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 143, 110), p13);
            end;

            if u9.atmosphereEffect then
                u9.atmosphereEffect.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p13);
                u9.atmosphereEffect.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p13);
                u9.atmosphereEffect.Glare = p13;
                u9.atmosphereEffect.Haze = 4.5 * p13;
            end;
        end, 0, 1);
    end);
    default2.Client:Get("MeteorShardDestroy"):Connect(function(p14) -- Line: 131
        -- upvalues: u9 (copy)
        local v15 = u9.shardMap[p14.secret];

        if v15 ~= nil then
            v15:Destroy();
        end;

        u9.shardMap[p14.secret] = nil;
    end);
    default2.Client:GetNamespace("Disaster"):OnEvent("SpawnMeteor", function(p16, u17, u18, u19, p20, p21) -- Line: 142
        -- upvalues: u3 (ref), ReplicatedStorage (ref), u9 (copy), u4 (ref), GameSound (ref), RunService (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref)
        local v22 = Random.new(p20);
        local u23 = u3.new();
        local u24 = CFrame.new(p16) * CFrame.Angles(v22:NextNumber() * 3.141592653589793 * 2, v22:NextNumber() * 3.141592653589793 * 2, v22:NextNumber() * 3.141592653589793 * 2);
        local u25 = CFrame.new(u17);
        local u26 = ReplicatedStorage.Assets.Effects.Meteor:Clone();
        u26:PivotTo(u24);
        u26.Parent = u9.meteorsFolder;
        local u27 = u4("Part", {
            Anchored = true,
            Name = "Meteor",
            Size = Vector3.new(4, 4, 4),
            CanCollide = false,
            CFrame = u24,
            Color = Color3.fromRGB(0, 0, 0),
            Material = Enum.Material.Rock,
            Parent = u26
        });

        if p21 then
            local u28 = u4("Sound", {
                RollOffMinDistance = 20,
                RollOffMaxDistance = 60,
                Volume = 0.5,
                Playing = false,
                SoundId = GameSound.METEOR_LOOP,
                Parent = u27
            });
            task.delay(u19 - u18 - 3, function() -- Line: 171
                -- upvalues: u28 (copy)
                u28:Play();
            end);
        end;

        local u29 = v22:NextNumber(0.2, 0.5);
        local u30 = v22:NextNumber(0.2, 0.5);
        local u31 = v22:NextNumber(0.2, 0.5);
        local u32 = 0;
        u23:GiveTask(RunService.Heartbeat:Connect(function(p33) -- Line: 182
            -- upvalues: u32 (ref), u24 (copy), u25 (copy), Workspace (ref), u18 (copy), u19 (copy), u17 (copy), u26 (copy), u29 (copy), u30 (copy), u31 (copy), u27 (copy), u23 (copy)
            u32 = u32 + p33;
            local v34 = u24:Lerp(u25, (Workspace:GetServerTimeNow() - u18) / (u19 - u18));
            local v35 = CFrame.new(v34.Position, u17) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966);
            u26:PivotTo(v35);
            u27.CFrame = v35 * CFrame.Angles(u32 * 3.141592653589793 * 2 * u29, u32 * 3.141592653589793 * 2 * u30, u32 * 3.141592653589793 * 2 * u31);

            if u19 <= Workspace:GetServerTimeNow() then
                u23:DoCleaning();
            end;
        end));
        u23:GiveTask(function() -- Line: 197
            -- upvalues: u26 (copy), Workspace (ref), u17 (copy), ReplicatedStorage (ref), u25 (copy), u9 (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
            task.spawn(function() -- Line: 198
                -- upvalues: u26 (ref), Workspace (ref), u17 (ref), ReplicatedStorage (ref), u25 (ref), u9 (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
                u26:Destroy();
                local v36 = not Workspace.CurrentCamera and 0 or (u17 - Workspace.CurrentCamera.CFrame.Position).Magnitude;
                local v37 = ReplicatedStorage.Assets.Effects.MeteorHitEffect:Clone();
                v37.CFrame = u25;
                v37.Parent = u9.meteorsFolder;
                EffectUtil:playEffects({ v37 }, nil, {
                    destroyAfterSec = 3,
                    particleMultiplier = v36 > 200 and 0.2 or 1
                });
                SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                    rollOffMaxDistance = 300,
                    position = u17
                });
                SoundManager:playSound(GameSound.CARROT_LAUNCHER_IMPACT, {
                    rollOffMaxDistance = 300,
                    position = u17
                });
            end);
        end);
    end);
    default2.Client:Get("LargeMeteorSpawned"):Connect(function(u38) -- Line: 225
        -- upvalues: u3 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), u9 (copy), u4 (ref), RunService (ref), KnitClient2 (ref), Players (ref), default2 (ref), EffectUtil (ref)
        local u39 = Random.new(u38.randomFloat);
        local u40 = u3.new();
        SoundManager:playSound(RandomUtil.fromList(GameSound.GUARDIAN_OF_DREAM_PERISH), {
            rollOffMinDistance = 1,
            rollOffMaxDistance = 200,
            position = u38.initialPosition,
            rollOffMode = Enum.RollOffMode.Linear
        });
        local u41 = CFrame.new(u38.initialPosition) * CFrame.Angles(u39:NextNumber() * 3.141592653589793 * 2, u39:NextNumber() * 3.141592653589793 * 2, u39:NextNumber() * 3.141592653589793 * 2);
        local MeteorSpawnPortal = ReplicatedStorage.Assets.Effects.MeteorSpawnPortal;

        if u38.rarity >= 1 then
            MeteorSpawnPortal = ReplicatedStorage.Assets.Effects.CosmicMeteorPortal;
        end;

        local u42 = MeteorSpawnPortal:Clone();
        u42.Parent = Workspace;
        u42:PivotTo(CFrame.new(u38.initialPosition, u38.impactPosition) * CFrame.Angles(1.5707963267948966, 0, 0));
        local u43 = u38.spawnTime + 2;
        task.delay(2, function() -- Line: 248
            -- upvalues: u42 (copy), u38 (copy), ReplicatedStorage (ref), u41 (copy), u9 (ref), u4 (ref), GameSound (ref), u39 (copy), u40 (copy), RunService (ref), Workspace (ref), u43 (copy), KnitClient2 (ref), Players (ref), default2 (ref), SoundManager (ref), EffectUtil (ref)
            task.delay(1, function() -- Line: 249
                -- upvalues: u42 (ref)
                local function _(p44) -- Line: 251
                    if p44:IsA("ParticleEmitter") then
                        p44.Enabled = false;
                    end;
                end;

                for i, descendant in u42:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = false;
                    end;
                end;
            end);
            local u45 = CFrame.new(u38.impactPosition);
            local Meteor = ReplicatedStorage.Assets.Effects.Meteor;

            if u38.rarity >= 1 then
                Meteor = ReplicatedStorage.Assets.Effects.RainbowMeteor;
            end;

            local u46 = Meteor:Clone();
            u46:PivotTo(u41);
            u46.Parent = u9.meteorsFolder;
            local BigFireMeteor = ReplicatedStorage.Assets.Effects.BigFireMeteor;

            if u38.rarity >= 1 then
                BigFireMeteor = ReplicatedStorage.Assets.Effects.BigCosmicMeteor;
            end;

            local u47 = BigFireMeteor:Clone();
            u47:PivotTo(u41);
            u47.Parent = u46;
            u47.Anchored = true;

            local function _(p48) -- Line: 277
                if p48:IsA("MeshPart") then
                    p48.CollisionGroup = "Players";
                end;
            end;

            for i, child in u47:GetChildren() do
                local _ = i - 1;

                if child:IsA("MeshPart") then
                    child.CollisionGroup = "Players";
                end;
            end;

            u9.shardMap[u38.secret] = u46;
            local u49 = u4("Sound", {
                RollOffMinDistance = 60,
                RollOffMaxDistance = 120,
                Volume = 0.25,
                Playing = true,
                Looped = true,
                SoundId = GameSound.METEOR_LOOP,
                Parent = u47
            });
            local u50 = u39:NextNumber(0.2, 0.5);
            local u51 = u39:NextNumber(0.2, 0.5);
            local u52 = u39:NextNumber(0.2, 0.5);
            local u53 = 0;
            u40:GiveTask(RunService.Heartbeat:Connect(function(p54) -- Line: 304
                -- upvalues: u53 (ref), u41 (ref), u45 (copy), Workspace (ref), u43 (ref), u38 (ref), u46 (copy), u50 (copy), u51 (copy), u52 (copy), u47 (copy), u40 (ref)
                u53 = u53 + p54;
                local v55 = u41:Lerp(u45, (Workspace:GetServerTimeNow() - u43) / (u38.impactTime - u43));
                local v56 = CFrame.new(v55.Position, u38.impactPosition) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966);
                u46:PivotTo(v56);
                u47:PivotTo(v56 * CFrame.Angles(u53 * 3.141592653589793 * 2 * u50, u53 * 3.141592653589793 * 2 * u51, u53 * 3.141592653589793 * 2 * u52));

                if Workspace:GetServerTimeNow() >= u38.impactTime then
                    u40:DoCleaning();
                end;
            end));
            u40:GiveTask(function() -- Line: 320
                -- upvalues: u42 (ref), u49 (copy), KnitClient2 (ref), u47 (copy), Players (ref), default2 (ref), u38 (ref), SoundManager (ref), GameSound (ref), u46 (copy), u45 (copy), ReplicatedStorage (ref), Workspace (ref), u9 (ref), EffectUtil (ref)
                task.spawn(function() -- Line: 321
                    -- upvalues: u42 (ref), u49 (ref), KnitClient2 (ref), u47 (ref), Players (ref), default2 (ref), u38 (ref), SoundManager (ref), GameSound (ref), u46 (ref), u45 (ref), ReplicatedStorage (ref), Workspace (ref), u9 (ref), EffectUtil (ref)
                    u42:Destroy();
                    u49:Destroy();
                    local u57 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                        ActionText = "Open",
                        RequiresLineOfSight = false,
                        MaxActivationDistance = 12,
                        ClickablePrompt = true,
                        HoldDuration = 2,
                        Parent = u47
                    });
                    u57.Triggered:Connect(function(p58) -- Line: 333
                        -- upvalues: Players (ref), default2 (ref), u38 (ref), SoundManager (ref), GameSound (ref), u57 (copy), u47 (ref), u46 (ref)
                        if p58 == Players.LocalPlayer then
                            default2.Client:Get("MeteorShardCollected"):SendToServer({
                                secret = u38.secret
                            });
                            SoundManager:playSound(GameSound.MINER_STONE_BREAK);
                            u57:Destroy();
                            local welds = u47:WaitForChild("welds", 1);

                            if welds ~= nil then
                                welds:Destroy();
                            end;

                            local rewardParticles = u47:WaitForChild("rewardParticles", 1);

                            if rewardParticles ~= nil then
                                local function _(p59) -- Line: 347
                                    if p59:IsA("ParticleEmitter") then
                                        p59.Enabled = true;
                                    end;
                                end;

                                for i, child in rewardParticles:GetChildren() do
                                    local _ = i - 1;

                                    if child:IsA("ParticleEmitter") then
                                        child.Enabled = true;
                                    end;
                                end;
                            end;

                            task.delay(1, function() -- Line: 356
                                -- upvalues: u46 (ref)
                                u46:Destroy();
                            end);
                        end;
                    end);
                    SoundManager:playSound(GameSound.METEOR_HITS, {
                        rollOffMinDistance = 110,
                        rollOffMaxDistance = 220,
                        position = u45.Position
                    });
                    KnitClient2.Controllers.ScreenShakeController:shake(u45.Position, Vector3.new(0, -1, 0), {
                        magnitude = 1,
                        cycles = 3,
                        duration = 0.5,
                        zMagnitude = 0.2
                    });
                    local v60 = ReplicatedStorage.Assets.Effects.GroudCrack:Clone();
                    v60.Parent = u46;
                    v60.Position = u38.impactPosition + Vector3.new(0, -1, 0);
                    local v61 = not Workspace.CurrentCamera and 0 or (u38.impactPosition - Workspace.CurrentCamera.CFrame.Position).Magnitude;
                    local v62 = ReplicatedStorage.Assets.Effects.MeteorHitEffect:Clone();
                    v62.CFrame = u45;
                    v62.Parent = u9.meteorsFolder;
                    EffectUtil:playEffects({ v62 }, nil, {
                        destroyAfterSec = 3,
                        particleMultiplier = v61 > 200 and 0.2 or 1
                    });
                    task.delay(60, function() -- Line: 391
                        -- upvalues: u46 (ref)
                        u46:Destroy();
                    end);
                end);
            end);
        end);
    end);
end;

KnitClient.CreateController(u6.new());

return nil;