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
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local WarlockBossConstants = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "halloween-2023", "warlock-boss-constants").WarlockBossConstants;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "WarlockBossLifeSiphonController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "WarlockBossLifeSiphonController";
end;

function u4.KnitStart(p7) -- Line: 39
    -- upvalues: KnitController (copy), EntityDamageEventZap (copy), Players (copy), SoundManager (copy), GameSound (copy), u2 (copy), KnitClient (copy), WatchCollectionTag (copy), EntityUtil (copy), AnimatorAdded (copy), GameAnimationUtil (copy), AnimationType (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy), WarlockBossConstants (copy)
    KnitController.KnitStart(p7);
    local u8 = nil;
    EntityDamageEventZap.On(function(p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22) -- Line: 42
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
                task.delay(5, function() -- Line: 66
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
    WatchCollectionTag("WarlockBoss", function(p26) -- Line: 76
        -- upvalues: EntityUtil (ref), AnimatorAdded (ref), u2 (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref), WarlockBossConstants (ref)
        local BeamTarget = p26:WaitForChild("BeamTarget");
        local Humanoid = p26:WaitForChild("Humanoid");
        local LaserSource = p26:WaitForChild("staff"):WaitForChild("Handle"):WaitForChild("Neon"):WaitForChild("LaserSource");
        local u27 = EntityUtil:getEntity(p26);
        AnimatorAdded(Humanoid, function(p28) -- Line: 81
            -- upvalues: u2 (ref), GameAnimationUtil (ref), AnimationType (ref), u27 (copy), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref), LaserSource (copy), Humanoid (copy), WarlockBossConstants (ref), BeamTarget (copy)
            p28.AnimationPlayed:Connect(function(p29) -- Line: 82
                -- upvalues: u2 (ref), GameAnimationUtil (ref), AnimationType (ref), u27 (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref), LaserSource (ref), Humanoid (ref), WarlockBossConstants (ref), BeamTarget (ref)
                local Animation = p29.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                local u30 = u2.new();
                u30:GiveTask(p29.Stopped:Connect(function() -- Line: 89
                    -- upvalues: u30 (copy)
                    u30:DoCleaning();
                end));
                u30:GiveTask(p29);

                if Animation == GameAnimationUtil:getAssetId(AnimationType.HALLOWEEN_BOSS_CAST_BEAM) then
                    u30:GiveTask(p29:GetMarkerReachedSignal("BeamEnd"):Connect(function() -- Line: 94
                        -- upvalues: u30 (copy)
                        u30:DoCleaning();
                    end));
                    u30:GiveTask(p29:GetMarkerReachedSignal("BeamBegin"):Connect(function() -- Line: 97
                        -- upvalues: u27 (ref), u30 (copy), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), RunService (ref), LaserSource (ref), Humanoid (ref), WarlockBossConstants (ref), BeamTarget (ref)
                        local v31 = u27;

                        if v31 ~= nil then
                            v31 = v31:isDead();
                        end;

                        if v31 then
                            u30:DoCleaning();
                        end;

                        local function handleTarget(u32) -- Line: 105
                            -- upvalues: ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref), u30 (ref), RunService (ref), u27 (ref), LaserSource (ref), Humanoid (ref), WarlockBossConstants (ref)
                            local u33;

                            if u32 == nil then
                                u33 = u32;
                            else
                                u33 = u32:FindFirstChild("UpperTorso");

                                if u33 ~= nil then
                                    u33 = u33:FindFirstChild("BodyFrontAttachment");
                                end;
                            end;

                            if not u33 then
                                return nil;
                            end;

                            local u34 = ReplicatedStorage.Assets.Effects.HwBossLaser:Clone();
                            u34.CanCollide = false;
                            u34.CanQuery = false;
                            u34.Parent = Workspace;
                            SoundManager:playSound(GameSound.DRAIN_HEALTH_LOOP, {
                                rollOffMaxDistance = 400,
                                parent = u34
                            });
                            u30:GiveTask(u34);
                            u30:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 126
                                -- upvalues: u27 (ref), u30 (ref), u33 (copy), LaserSource (ref), u34 (copy), Humanoid (ref), u32 (copy), WarlockBossConstants (ref)
                                local v35 = u27;

                                if v35 ~= nil then
                                    v35 = v35:isDead();
                                end;

                                if v35 then
                                    u30:DoCleaning();
                                end;

                                local v36 = u33.WorldPosition - LaserSource.WorldPosition;
                                local v37 = CFrame.lookAt(Vector3.new(0, 0, 0), v36);
                                local Magnitude = v36.Magnitude;
                                local v38 = Vector3.new(Magnitude, 3, 3);
                                local v39 = v37 * Vector3.new(0, 0, -Magnitude / 2);
                                local v40 = CFrame.new(v39 + LaserSource.WorldCFrame.Position) * (v37 * CFrame.Angles(0, -1.5707963267948966, 0));
                                u34.Size = v38;
                                u34.CFrame = v40;
                                local Magnitude2 = (Humanoid.Parent:GetPivot().Position - u32:GetPivot().Position).Magnitude;

                                if WarlockBossConstants.LifeSiphonMaxHealLength < Magnitude2 then
                                    local v41 = u34:GetChildren();

                                    local function v43(p42) -- Line: 154
                                        -- upvalues: Magnitude2 (copy), WarlockBossConstants (ref)
                                        if p42:IsA("Beam") or p42:IsA("ParticleEmitter") then
                                            p42.Color = ColorSequence.new(Color3.fromRGB(255, 184, 48):Lerp(Color3.fromRGB(252, 56, 56), (Magnitude2 - WarlockBossConstants.LifeSiphonMaxHealLength) / (135 - WarlockBossConstants.LifeSiphonMaxHealLength)));
                                        end;
                                    end;

                                    for i, v in v41 do
                                        v43(v, i - 1, v41);
                                    end;
                                end;
                            end));
                        end;

                        handleTarget(BeamTarget.Value);
                        u30:GiveTask(BeamTarget.Changed:Connect(function() -- Line: 166
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