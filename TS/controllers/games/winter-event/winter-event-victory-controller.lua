-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "WinterEventVictoryController";
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
    p6.Name = "WinterEventVictoryController";
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: KnitController (copy), default2 (copy), KnitClient (copy), default (copy), Linear (copy), FireworkType (copy), SoundManager (copy), GameSound (copy), Players (copy), ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy), RandomUtil (copy)
    KnitController.KnitStart(p7);
    default2.Client:Get("WinWinterEvent"):Connect(function(p8, u9) -- Line: 39
        -- upvalues: KnitClient (ref), default (ref), Linear (ref), FireworkType (ref), SoundManager (ref), GameSound (ref), Players (ref), ReplicatedStorage (ref), Workspace (ref), KnitClient2 (ref), RandomUtil (ref)
        task.delay(5, function() -- Line: 40
            -- upvalues: KnitClient (ref)
            KnitClient.Controllers.WinterEventController:enableThirdPersonMode();
        end);
        KnitClient.Controllers.WinterEventController:tweenWinterEffectStrength(0, 4);
        local u10 = KnitClient.Controllers.WinterEventController:getClimbSoundGroup();
        local Volume = u10.Volume;
        default(4, Linear, function(p11) -- Line: 47
            -- upvalues: u10 (copy), Volume (copy)
            u10.Volume = (1 - p11) * Volume + p11 * 0.15;
        end);
        task.wait(1);
        task.spawn(function() -- Line: 51
            -- upvalues: KnitClient (ref), u9 (copy), FireworkType (ref)
            local v12 = false;
            local v13 = 0;

            while true do
                if v12 then
                    v13 = v13 + 1;
                else
                    v12 = true;
                end;

                if v13 >= 10 then
                    return;
                end;

                local v14 = false;
                local v15 = 0;

                while true do
                    if true then
                        if v14 then
                            v15 = v15 + 1;
                        else
                            v14 = true;
                        end;
                    end;

                    if v15 >= 4 then
                        break;
                    end;

                    local v16 = math.random() * 3.141592653589793 * 2;
                    local v17 = math.random() * 50 + 20;
                    local FireworkController = KnitClient.Controllers.FireworkController;
                    local v18 = math.cos(v16) * v17;
                    local v19 = math.sin(v16) * v17;
                    FireworkController:playFireworkEffect(u9 + Vector3.new(v18, 40, v19), FireworkType.NORMAL);
                    task.wait(0.1);
                end;

                task.wait(2);
            end;
        end);
        task.wait(3);
        SoundManager:playSound(GameSound.WINTER_BOSS_VICTORY_TRACK);

        if table.find(p8, Players.LocalPlayer) ~= nil then
            local u20 = ReplicatedStorage.Assets.Misc.MinigameMountain.WinterRewards:Clone();
            local Present = u20.Present;
            Present.Parent = Workspace;
            Present:PivotTo(CFrame.new(u9));
            KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
                MaxActivationDistance = 20,
                RequiresLineOfSight = false,
                HoldDuration = 1,
                ActionText = "Open",
                ObjectText = "Summit Gift",
                Parent = Present.PrimaryPart
            }).Triggered:Connect(function() -- Line: 109
                -- upvalues: Present (copy), KnitClient (ref), FireworkType (ref), u20 (copy), Workspace (ref), SoundManager (ref), GameSound (ref), RandomUtil (ref)
                local Position = Present:GetPrimaryPartCFrame().Position;
                KnitClient.Controllers.FireworkController:playFireworkEffect(Position, FireworkType.HEART);
                Present:Destroy();

                local function _(p21) -- Line: 116
                    return p21:IsA("BasePart");
                end;

                local v22 = 0;
                local v23 = {};
                local v24 = 0;
                local v25 = 0;

                for i, child in u20:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("BasePart") == true then
                        v22 = v22 + 1;
                        v23[v22] = child;
                    end;
                end;

                for _, v in v23 do
                    if v:IsA("BasePart") then
                        local v26 = v:Clone();
                        v26.Position = Position;
                        v26.Parent = Workspace;
                        local v27 = math.cos(v24) * 33;
                        local v28 = math.sin(v24) * 33;
                        v26.Velocity = Vector3.new(v27, 40, v28);
                        v24 = v24 + 6.283185307179586 / #v23;
                        SoundManager:playSound(GameSound.NEW_EMERALD_PICKUP, {
                            playbackSpeedMultiplier = 1.1 - v25 * 0.1
                        });
                        SoundManager:playSound(RandomUtil.fromList(GameSound.FIREWORK_EXPLODE_1, GameSound.FIREWORK_EXPLODE_2, GameSound.FIREWORK_EXPLODE_3), {
                            playbackSpeedMultiplier = 1.1 - v25 * 0.1
                        });
                        v25 = v25 + 1;
                        SoundManager:playSound(GameSound.EMERALD_GENERATOR_AURA, {
                            rollOffMaxDistance = 120,
                            rollOffMinDistance = 30,
                            volumeMultiplier = 1.5,
                            parent = v26
                        });
                        task.wait(0.2);
                    end;
                end;
            end);
        end;
    end);
end;

KnitClient.CreateController(u4.new());

return nil;