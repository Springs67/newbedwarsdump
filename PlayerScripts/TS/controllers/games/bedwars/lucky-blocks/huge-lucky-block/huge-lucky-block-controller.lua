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
        return "HugeLuckyBlockController";
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
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "HugeLuckyBlockController";
end;

function u3.KnitStart(p6) -- Line: 38
    -- upvalues: KnitController (copy), BreakBlockEventZap (copy), ItemType (copy), ReplicatedStorage (copy), BlockEngine (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), default2 (copy), u1 (copy), BLOCK_SIZE (copy), default (copy), Linear (copy), Players (copy), KnitClient (copy)
    KnitController.KnitStart(p6);
    BreakBlockEventZap.On(function(p7, p8, p9, p10, p11) -- Line: 40
        -- upvalues: ItemType (ref), ReplicatedStorage (ref), BlockEngine (ref), Workspace (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        if p8 ~= ItemType.HUGE_LUCKY_BLOCK then
            return nil;
        end;

        local v12 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock:FindFirstChild("Destroy"):Clone();
        local v13 = BlockEngine:getWorldPosition(p7);
        v12.Position = v13;
        v12.Parent = Workspace;
        EffectUtil:playEffects({ v12 }, nil, {
            destroyAfterSec = 4
        });
        SoundManager:playSound(GameSound.FIREWORK_CRACKLE_2, {
            position = v13
        });
        SoundManager:playSound(GameSound.FIREWORK_EXPLODE_2, {
            position = v13
        });
        local v14 = false;
        local v15 = 0;

        while true do
            if v14 then
                v15 = v15 + 1;
            else
                v14 = true;
            end;

            if v15 >= 7 then
                return;
            end;

            SoundManager:playSound(GameSound.BALLOON_POP, {
                playbackSpeedMultiplier = v15 / 7 / 4 + 1.2,
                position = v13
            });
            task.wait(0.2);
        end;
    end);
    default2.Client:WaitFor("HugeLuckyBlockEvent"):andThen(function(p16) -- Line: 104
        -- upvalues: u1 (ref), ReplicatedStorage (ref), BLOCK_SIZE (ref), Workspace (ref), ItemType (ref), default (ref), Linear (ref), Players (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
        p16:Connect(function(u17) -- Line: 105
            -- upvalues: u1 (ref), ReplicatedStorage (ref), BLOCK_SIZE (ref), Workspace (ref), ItemType (ref), default (ref), Linear (ref), Players (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
            local u18 = u1.new();
            local v19 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock.Ground:Clone();
            local u20 = u17.position + Vector3.new(BLOCK_SIZE, -BLOCK_SIZE / 2, BLOCK_SIZE);
            v19.Position = u20;
            v19.Parent = Workspace;
            u18:GiveTask(v19);
            local u21 = ReplicatedStorage.Assets.Blocks:FindFirstChild(ItemType.HUGE_LUCKY_BLOCK);

            if u21 ~= nil then
                u21 = u21:Clone();
            end;

            local LuckyBlock = u21:FindFirstChild("LuckyBlock");

            if LuckyBlock ~= nil then
                local Trail = LuckyBlock:FindFirstChild("Trail");

                if Trail ~= nil then
                    local function _(p22) -- Line: 125
                        if p22:IsA("ParticleEmitter") then
                            p22.Enabled = true;
                        end;
                    end;

                    for i, descendant in Trail:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("ParticleEmitter") then
                            descendant.Enabled = true;
                        end;
                    end;
                end;
            end;

            u18:GiveTask(u21);
            local v23 = math.random() * 3.141592653589793 * 2;
            local v24 = CFrame.new(u17.position);
            local v25 = math.cos(v23) * 15;
            local v26 = math.sin(v23) * 15;
            local u27 = v24 + Vector3.new(v25, 450, v26);
            u21:PivotTo(u27);
            u21.Parent = Workspace;
            local v28 = u17.arriveTime - Workspace:GetServerTimeNow();
            local u29 = nil;
            u29 = default(v28, Linear, function(p30) -- Line: 144
                -- upvalues: u21 (copy), u29 (ref), u27 (copy), u17 (copy)
                local PrimaryPart = u21.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Parent;
                end;

                if not PrimaryPart then
                    u29:Cancel();

                    return nil;
                end;

                u21:PivotTo(u27:Lerp(CFrame.new(u17.position), (math.pow(p30, 2) + math.pow(p30, 8)) / 2));
            end);
            task.delay(v28, function() -- Line: 155
                -- upvalues: u18 (copy), Players (ref), u20 (copy), KnitClient (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
                u18:DoCleaning();
                local Character = Players.LocalPlayer.Character;
                local v31;

                if Character == nil then
                    v31 = Character;
                else
                    v31 = Character.PrimaryPart;

                    if v31 ~= nil then
                        v31 = v31.CFrame;
                    end;
                end;

                if not (Character and v31) then
                    return nil;
                end;

                local Magnitude = (v31.Position - u20).Magnitude;
                local v32 = Magnitude == nil and 250 or Magnitude;

                if v32 < 200 then
                    KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                        magnitude = 0.4 * v32 / 200
                    });
                end;

                SoundManager:playSound(GameSound.LUCKY_BLOCK_SLAM, {
                    rollOffMinDistance = 20,
                    rollOffMaxDistance = 200,
                    volumeMultiplier = 0.2,
                    position = u20
                });
                local v33 = ReplicatedStorage.Assets.Effects.HugeLuckyBlock.Impact:Clone();
                v33.Position = u20;
                v33.Parent = Workspace;
                EffectUtil:playEffects({ v33 }, nil, {
                    destroyAfterSec = 3
                });
            end);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;