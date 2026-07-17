-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BreakBlockEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").BreakBlockEventZap;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "RainbowLuckyBlockController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: KnitController (copy), ReplicatedStorage (copy)
    KnitController.constructor(p5);
    p5.Name = "RainbowLuckyBlockController";
    p5.currentRainbowArch = ReplicatedStorage.Assets.Effects.RainbowArch:Clone();
end;

function u3.KnitStart(u6) -- Line: 39
    -- upvalues: KnitController (copy), BreakBlockEventZap (copy), ItemType (copy), default2 (copy), u1 (copy), ReplicatedStorage (copy), BLOCK_SIZE (copy), Workspace (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy), Players (copy), KnitClient (copy), EffectUtil (copy)
    KnitController.KnitStart(u6);
    BreakBlockEventZap.On(function(p7, p8, p9, p10, p11) -- Line: 41
        -- upvalues: ItemType (ref), u6 (copy)
        if p8 == ItemType.RAINBOW_LUCKY_BLOCK then
            u6:rainbowBlockDestroyEffects(p7);

            return;
        end;

        if p8 ~= ItemType.RAINBOW_POT_OF_GOLD then
            return nil;
        end;

        if u6.currentRainbowArch then
            u6.currentRainbowArch:Destroy();
        end;

        u6:rainbowBlockDestroyEffects(p7);
    end);
    default2.Client:Get("RainbowLuckyBlockSpawn"):Connect(function(u12) -- Line: 75
        -- upvalues: u1 (ref), ReplicatedStorage (ref), BLOCK_SIZE (ref), Workspace (ref), ItemType (ref), SoundManager (ref), GameSound (ref), default (ref), Linear (ref), Players (ref), KnitClient (ref), EffectUtil (ref)
        local u13 = u1.new();
        local v14 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock.Ground:Clone();
        local u15 = u12.position + Vector3.new(BLOCK_SIZE / 2, -BLOCK_SIZE / 2, BLOCK_SIZE / 2);
        v14.Position = u15;
        v14.Parent = Workspace;
        u13:GiveTask(v14);
        local u16 = ReplicatedStorage.Assets.Blocks:FindFirstChild(ItemType.RAINBOW_LUCKY_BLOCK);

        if u16 ~= nil then
            u16 = u16:Clone();
        end;

        u13:GiveTask(u16);
        u16.Parent = Workspace;
        local v17 = math.random() * 3.141592653589793 * 2;
        local v18 = CFrame.new(u12.position);
        local v19 = math.cos(v17) * 15;
        local v20 = math.sin(v17) * 15;
        local u21 = v18 + Vector3.new(v19, 450, v20);
        u16:PivotTo(u21);
        local u22 = SoundManager:playSound(GameSound.RAINBOW_LB_AMBIENT_LOOP, {
            rollOffMaxDistance = 1000,
            rollOffMinDistance = 150,
            looped = true,
            parent = u16.PrimaryPart
        });
        local v23 = u12.arriveTime - Workspace:GetServerTimeNow();
        local u24 = nil;
        u24 = default(v23, Linear, function(p25) -- Line: 104
            -- upvalues: u16 (copy), u24 (ref), u21 (copy), u12 (copy)
            local PrimaryPart = u16.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Parent;
            end;

            if not PrimaryPart then
                u24:Cancel();

                return nil;
            end;

            u16:PivotTo(u21:Lerp(CFrame.new(u12.position), (math.pow(p25, 2) + math.pow(p25, 8)) / 2));
        end);
        task.delay(v23, function() -- Line: 115
            -- upvalues: u13 (copy), Players (ref), u15 (copy), KnitClient (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u22 (copy)
            u13:DoCleaning();
            local Character = Players.LocalPlayer.Character;
            local v26;

            if Character == nil then
                v26 = Character;
            else
                v26 = Character.PrimaryPart;

                if v26 ~= nil then
                    v26 = v26.CFrame;
                end;
            end;

            if not (Character and v26) then
                return nil;
            end;

            local Magnitude = (v26.Position - u15).Magnitude;
            local v27 = Magnitude == nil and 250 or Magnitude;

            if v27 < 200 then
                KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    magnitude = 0.4 * v27 / 200
                });
            end;

            SoundManager:playSound(GameSound.LUCKY_BLOCK_SLAM, {
                rollOffMinDistance = 20,
                rollOffMaxDistance = 200,
                volumeMultiplier = 0.2,
                position = u15
            });
            local v28 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock.Impact:Clone();
            v28.Position = u15;
            v28.Parent = Workspace;
            EffectUtil:playEffects({ v28 }, nil, {
                destroyAfterSec = 3
            });

            if u22 then
                SoundManager:tweenSoundVolume(u22, 0, 1);
            end;
        end);
    end);
    default2.Client:Get("RainbowPotOfGoldBlockSpawn"):Connect(function(u29) -- Line: 156
        -- upvalues: u1 (ref), ReplicatedStorage (ref), BLOCK_SIZE (ref), Workspace (ref), ItemType (ref), default (ref), Linear (ref), Players (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref), u6 (copy)
        local u30 = u1.new();
        local v31 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock.Ground:Clone();
        local u32 = u29.targetPosition + Vector3.new(BLOCK_SIZE - BLOCK_SIZE / 2, -BLOCK_SIZE / 2, BLOCK_SIZE - BLOCK_SIZE / 2);
        v31.Position = u32;
        v31.Parent = Workspace;
        u30:GiveTask(v31);
        local u33 = ReplicatedStorage.Assets.Blocks:WaitForChild(ItemType.RAINBOW_POT_OF_GOLD);

        if u33 ~= nil then
            u33 = u33:Clone();
        end;

        u30:GiveTask(u33);
        u33.Parent = Workspace;
        local v34 = math.random() * 3.141592653589793 * 2;
        local v35 = CFrame.new(u29.targetPosition);
        local v36 = math.cos(v34) * 15;
        local v37 = math.sin(v34) * 15;
        local u38 = v35 + Vector3.new(v36, 450, v37);
        u33:PivotTo(u38);
        local v39 = u29.arriveTime - Workspace:GetServerTimeNow();
        local u40 = nil;
        u40 = default(v39, Linear, function(p41) -- Line: 179
            -- upvalues: u33 (copy), u40 (ref), u38 (copy), u29 (copy)
            local PrimaryPart = u33.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Parent;
            end;

            if not PrimaryPart then
                u40:Cancel();

                return nil;
            end;

            u33:PivotTo(u38:Lerp(CFrame.new(u29.targetPosition), (math.pow(p41, 2) + math.pow(p41, 8)) / 2));
        end);
        task.delay(v39, function() -- Line: 190
            -- upvalues: u30 (copy), Players (ref), u32 (copy), KnitClient (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref), u6 (ref), u29 (copy)
            u30:DoCleaning();
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = (Character:GetPrimaryPartCFrame().Position - u32).Magnitude;
            end;

            local v42 = Character == nil and 250 or Character;

            if v42 < 200 then
                KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    magnitude = 0.4 * v42 / 200
                });
            end;

            SoundManager:playSound(GameSound.LUCKY_BLOCK_SLAM, {
                rollOffMinDistance = 20,
                rollOffMaxDistance = 200,
                volumeMultiplier = 0.2,
                position = u32
            });
            local v43 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock.Impact:Clone();
            v43.Position = u32;
            v43.Parent = Workspace;
            EffectUtil:playEffects({ v43 }, nil, {
                destroyAfterSec = 3
            });
            u6:initRainbowArch(u29.initialPosition, u29.targetPosition);
        end);
    end);
end;

function u3.rainbowBlockDestroyEffects(p44, p45) -- Line: 222
    -- upvalues: ReplicatedStorage (copy), BlockEngine (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local v46 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock:FindFirstChild("Destroy"):Clone();
    local v47 = BlockEngine:getWorldPosition(p45);
    v46.Position = v47;
    v46.Parent = Workspace;
    EffectUtil:playEffects({ v46 }, nil, {
        destroyAfterSec = 4
    });
    SoundManager:playSound(GameSound.FIREWORK_CRACKLE_2, {
        position = v47
    });
    SoundManager:playSound(GameSound.FIREWORK_EXPLODE_2, {
        position = v47
    });
    local v48 = false;
    local v49 = 0;

    while true do
        if v48 then
            v49 = v49 + 1;
        else
            v48 = true;
        end;

        if v49 >= 7 then
            return;
        end;

        SoundManager:playSound(GameSound.BALLOON_POP, {
            playbackSpeedMultiplier = v49 / 7 / 4 + 1.2,
            position = v47
        });
        task.wait(0.2);
    end;
end;

function u3.initRainbowArch(p50, p51, p52) -- Line: 256
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    local v53 = ReplicatedStorage.Assets.Effects.RainbowArch:Clone();
    p50.currentRainbowArch = v53;
    local Start = v53:WaitForChild("Start");
    local End = v53:WaitForChild("End");
    local Start2 = v53:WaitForChild("Start");

    if Start2 ~= nil then
        Start2 = Start2:FindFirstChild("Attachment");
    end;

    local End2 = v53:WaitForChild("End");

    if End2 ~= nil then
        End2 = End2:FindFirstChild("Attachment");
    end;

    v53.Parent = Workspace;
    Start:PivotTo(CFrame.new(p51));
    End:PivotTo(CFrame.new(p52));
    SoundManager:playSound(GameSound.RAINBOW_INIT, {
        rollOffMinDistance = 20,
        rollOffMaxDistance = 200,
        volumeMultiplier = 1.2,
        position = p51
    });
    local v54 = SoundManager:playSound(GameSound.RAINBOW_AMBIENT_LOOP, {
        rollOffMaxDistance = 1200,
        rollOffMinDistance = 150,
        looped = true,
        volumeMultiplier = 1.2,
        parent = v53.PrimaryPart
    });

    if v54 then
        SoundManager:tweenSoundVolume(v54, 1, 1);
    end;
end;

KnitClient.CreateController(u3.new());

return nil;