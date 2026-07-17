-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimatorAdded = v1.AnimatorAdded;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityDamageEventZap = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "HalloweenLaserController";
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
    p6.Name = "HalloweenLaserController";
end;

function u4.KnitStart(p7) -- Line: 37
    -- upvalues: KnitController (copy), EntityDamageEventZap (copy), Players (copy), SoundManager (copy), GameSound (copy), u2 (copy), KnitClient (copy), WatchCollectionTag (copy), AnimatorAdded (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy)
    KnitController.KnitStart(p7);
    local u8 = nil;
    EntityDamageEventZap.On(function(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22) -- Line: 40
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), u8 (ref), u2 (ref), KnitClient (ref)
        local v23 = p9 == Players.LocalPlayer.Character;
        local PrimaryPart = p9.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if p16 ~= nil then
            p16 = p16.halloweenLaser;
        end;

        if p16 then
            if v23 or PrimaryPart then
                local BURN_HIT = GameSound.BURN_HIT;
                local v24 = {
                    rollOffMaxDistance = 60,
                    rollOffMinDistance = 30
                };

                if v23 then
                    PrimaryPart = nil;
                end;

                v24.position = PrimaryPart;
                SoundManager:playSound(BURN_HIT, v24);
            end;

            if v23 and not u8 then
                u8 = u2.new();
                u8:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    moveSpeedMultiplier = 0.75
                }));
                task.delay(5, function() -- Line: 64
                    -- upvalues: u8 (ref)
                    local v25 = u8;

                    if v25 ~= nil then
                        v25:DoCleaning();
                    end;

                    u8 = nil;
                end);
            end;
        end;
    end);
    WatchCollectionTag("CryptBoss", function(p26) -- Line: 74
        -- upvalues: AnimatorAdded (ref), u2 (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref)
        local BeamTarget = p26:WaitForChild("BeamTarget");
        local Humanoid = p26:WaitForChild("Humanoid");
        local LaserSource = p26:WaitForChild("staff"):WaitForChild("Handle"):WaitForChild("Neon"):WaitForChild("LaserSource");
        AnimatorAdded(Humanoid, function(p27) -- Line: 78
            -- upvalues: u2 (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref), LaserSource (copy), BeamTarget (copy)
            p27.AnimationPlayed:Connect(function(p28) -- Line: 79
                -- upvalues: u2 (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref), LaserSource (ref), BeamTarget (ref)
                local Animation = p28.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                local u29 = u2.new();
                u29:GiveTask(p28.Stopped:Connect(function() -- Line: 86
                    -- upvalues: u29 (copy)
                    u29:DoCleaning();
                end));
                u29:GiveTask(p28);

                if Animation == GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_BOSS_CAST_BEAM) then
                    u29:GiveTask(p28:GetMarkerReachedSignal("BeamEnd"):Connect(function() -- Line: 91
                        -- upvalues: u29 (copy)
                        u29:DoCleaning();
                    end));
                    u29:GiveTask(p28:GetMarkerReachedSignal("BeamBegin"):Connect(function() -- Line: 94
                        -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), u29 (copy), RunService (ref), LaserSource (ref), BeamTarget (ref)
                        local function handleTarget(u30) -- Line: 95
                            -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), u29 (ref), RunService (ref), LaserSource (ref)
                            if u30 ~= nil then
                                u30 = u30:FindFirstChild("UpperTorso");

                                if u30 ~= nil then
                                    u30 = u30:FindFirstChild("BodyFrontAttachment");
                                end;
                            end;

                            if not u30 then
                                return nil;
                            end;

                            local u31 = ReplicatedStorage.Assets.Effects.HwBossLaser:Clone();
                            u31.CanCollide = false;
                            u31.CanQuery = false;
                            u31.Parent = Workspace;
                            SoundManager:playSound(GameSound.HALLOWEEN_BOSS_BEAM, {
                                rollOffMaxDistance = 400,
                                parent = u31
                            });
                            u29:GiveTask(u31);
                            u29:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 116
                                -- upvalues: u30 (copy), LaserSource (ref), u31 (copy)
                                local v32 = u30.WorldPosition - LaserSource.WorldPosition;
                                local v33 = CFrame.lookAt(Vector3.new(0, 0, 0), v32);
                                local Magnitude = v32.Magnitude;
                                local v34 = Vector3.new(Magnitude, 3, 3);
                                local v35 = v33 * Vector3.new(0, 0, -Magnitude / 2);
                                local v36 = CFrame.new(v35 + LaserSource.WorldCFrame.Position) * (v33 * CFrame.Angles(0, -1.5707963267948966, 0));
                                u31.Size = v34;
                                u31.CFrame = v36;
                            end));
                        end;

                        handleTarget(BeamTarget.Value);
                        u29:GiveTask(BeamTarget.Changed:Connect(function() -- Line: 135
                            -- upvalues: handleTarget (copy), BeamTarget (ref)
                            handleTarget(BeamTarget.Value);
                        end));
                    end));
                end;
            end);
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;