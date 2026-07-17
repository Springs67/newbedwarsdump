-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "ShotByCupidKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 32
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, u11) -- Line: 36
    -- upvalues: u2 (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), KillEffect (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), default (copy), Linear (copy), GameQueryUtil (copy), WeldUtil (copy), RuntimeLib (copy), ModelUtil (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13:PivotTo(u11);
    u13.Parent = Workspace;
    u12:GiveTask(u13);
    local u14 = u13.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.CUPID_BOT_SHOOT_R15_IDLE_START));
    local u15 = u13.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.CUPID_BOT_SHOOT_R15_IDLE_LOOP));
    u15.Looped = true;
    u12:GiveTask(u14);
    u12:GiveTask(u15);
    KillEffect.hideCharacter(p8, p10);
    local u16 = ReplicatedStorage.Assets.Effects.CupidBow:Clone();
    local v17 = CFrame;
    local Position = u11.Position;
    local v18 = CFrame.Angles(0, -2.356194490192345, 0);
    local u19 = v17.lookAt(Position + v18 * u11.LookVector * Vector3.new(8, 0, 8) + Vector3.new(0, 5, 0), u11.Position) * CFrame.Angles(1.5707963267948966, 0, 4.71238898038469);
    u16:PivotTo(u19);
    u16.Parent = Workspace;
    u12:GiveTask(u16);
    local u20 = ReplicatedStorage.Assets.Effects.CupidArrow:Clone();
    u20:PivotTo(u19);
    local PrimaryPart = u20.PrimaryPart;
    PrimaryPart.Anchored = true;
    u20.Parent = Workspace;
    u12:GiveTask(u20);
    SoundManager:playSound(GameSound.BOW_DRAW, {
        position = u19.Position
    });
    local v21 = GameAnimationUtil:playAnimation(u16.AnimationController.Animator, AnimationType.CUPID_BOW_SHOOT, {
        looped = false,
        speed = 2
    });

    if v21 then
        u12:GiveTask(v21:GetMarkerReachedSignal("release"):Connect(function() -- Line: 77
            -- upvalues: SoundManager (ref), GameSound (ref), u19 (copy), GameAnimationUtil (ref), u13 (copy), AnimationType (ref), u12 (copy), u11 (copy), default (ref), Linear (ref), u20 (copy), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), WeldUtil (ref), RuntimeLib (ref), PrimaryPart (copy), u14 (copy), u15 (copy), ModelUtil (ref), u16 (copy)
            SoundManager:playSound(GameSound.BOW_FIRE, {
                position = u19.Position
            });
            local u22 = GameAnimationUtil:playAnimation(u13.Humanoid.Animator, AnimationType.CUPID_BOT_SHOOT_R15_RECOIL);
            u12:GiveTask(task.spawn(function() -- Line: 82
                -- upvalues: u19 (ref), u11 (ref), default (ref), Linear (ref), u20 (ref), u12 (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), WeldUtil (ref), u13 (ref), RuntimeLib (ref), PrimaryPart (ref), u22 (copy), u14 (ref), u15 (ref), ModelUtil (ref), u16 (ref)
                local u23 = u19;
                local u24 = CFrame.new(u11.Position) * u23.Rotation;
                local u26 = default(0.2, Linear, function(p25) -- Line: 87
                    -- upvalues: u20 (ref), u23 (copy), u24 (copy)
                    u20:PivotTo(u23:Lerp(u24, p25));
                end);
                u12:GiveTask(task.spawn(function() -- Line: 90
                    -- upvalues: u26 (copy), SoundManager (ref), GameSound (ref), u24 (copy), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref), u12 (ref), WeldUtil (ref), u13 (ref), RuntimeLib (ref), PrimaryPart (ref), u22 (ref), u14 (ref), u15 (ref), ModelUtil (ref), u20 (ref), u16 (ref)
                    u26:Wait();
                    SoundManager:playSound(GameSound.ARROW_HIT, {
                        position = u24.Position
                    });
                    local u27 = ReplicatedStorage.Assets.Effects.HeartParticle:Clone();
                    GameQueryUtil:setQueryIgnored(u27, true);
                    u27.CFrame = u24;
                    u27.Parent = Workspace;
                    u12:GiveTask(u27);
                    WeldUtil:weldAccessory(u13, (ReplicatedStorage.Assets.Misc.HeartEyes:Clone()));
                    local u30 = RuntimeLib.Promise.defer(function() -- Line: 102
                        -- upvalues: u27 (copy)
                        local v28 = false;
                        local v29 = 0;

                        while true do
                            if v28 then
                                v29 = v29 + 1;
                            else
                                v28 = true;
                            end;

                            if v29 >= 5 then
                                return;
                            end;

                            u27.Attachment.Heart:Emit(10);
                            u27.Attachment.Glow:Emit(10);
                        end;
                    end);
                    u12:GiveTask(function() -- Line: 120
                        -- upvalues: u30 (copy)
                        return u30:cancel();
                    end);
                    local Waist = u13:FindFirstChild("Waist", true);
                    local v31;

                    if Waist == nil then
                        v31 = Waist;
                    else
                        v31 = Waist.Part1;
                    end;

                    if v31 then
                        WeldUtil:weldPartsWithJoint(PrimaryPart, Waist.Part1, "Motor6D");
                        PrimaryPart.Anchored = false;
                    end;

                    if u22 then
                        u12:GiveTask(u22.Stopped:Once(function() -- Line: 133
                            -- upvalues: u14 (ref), u12 (ref), u15 (ref), ModelUtil (ref), u13 (ref), u20 (ref), u16 (ref)
                            u14:Play(0);
                            u12:GiveTask(u14.Stopped:Once(function() -- Line: 135
                                -- upvalues: u15 (ref)
                                u15:Play(0);
                            end));
                            u12:GiveTask(task.delay(2, function() -- Line: 138
                                -- upvalues: ModelUtil (ref), u13 (ref), u20 (ref), u16 (ref)
                                ModelUtil.tweenModelTransparency(u13, 1, 1);
                                ModelUtil.tweenModelTransparency(u20, 1, 1);
                                ModelUtil.tweenModelTransparency(u16, 1, 1);
                            end));
                        end));
                    end;
                end));
                u26:Play();
                u12:GiveTask(function() -- Line: 147
                    -- upvalues: u26 (copy)
                    return u26:Cancel();
                end);
            end));
        end));
    end;

    task.delay(7, function() -- Line: 153
        -- upvalues: u12 (copy)
        u12:DoCleaning();
    end);

    return u12;
end;

return u4;