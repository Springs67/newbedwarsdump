-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InCirc = v2.InCirc;
local InExpo = v2.InExpo;
local InOutExpo = v2.InOutExpo;
local Linear = v2.Linear;
local OutCirc = v2.OutCirc;
local OutExpo = v2.OutExpo;
local OutQuint = v2.OutQuint;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "JudgementDayKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 37
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 41
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, u12) -- Line: 45
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), BLOCK_SIZE (copy), ReplicatedStorage (copy), RunService (copy), GameQueryUtil (copy), default (copy), OutCirc (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), InExpo (copy), EffectUtil (copy), Linear (copy), InCirc (copy), OutQuint (copy), InOutExpo (copy), OutExpo (copy)
    local u13 = u3.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14.Parent = Workspace;
    u13:GiveTask(u14);
    KillEffect.hideCharacter(p9, p11);
    u13:GiveTask(SoundManager:playSound(GameSound.GHOST_PILLAR_ERUPT, {
        position = u14:GetPivot().Position
    }));
    local v15 = u12 - u12.LookVector * (BLOCK_SIZE * 4) - Vector3.new(0, 6, 0);
    local u16 = u12 - u12.LookVector * (BLOCK_SIZE * 2);
    local u17 = ReplicatedStorage.Assets.Misc.GrimReaper:Clone();
    u17:PivotTo(v15);
    u17.Parent = Workspace;
    u17.HumanoidRootPart.Anchored = true;
    u13:GiveTask(u17);
    u13:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 73
        -- upvalues: u17 (copy), GameQueryUtil (ref)
        local function _(p18) -- Line: 75
            -- upvalues: GameQueryUtil (ref)
            if p18:IsA("BasePart") and p18.CanCollide then
                p18.CanCollide = false;
                GameQueryUtil:setQueryIgnored(p18, true);
            end;
        end;

        for i, descendant in u17:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") and descendant.CanCollide then
                descendant.CanCollide = false;
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;
    end));
    default(0.5, OutCirc, function(u19) -- Line: 85
        -- upvalues: u17 (copy)
        local function _(p20) -- Line: 87
            -- upvalues: u19 (copy)
            if not p20:IsA("BasePart") then
                if p20:IsA("ParticleEmitter") then
                    p20.Transparency = NumberSequence.new(u19);
                end;

                return;
            end;

            if p20.Transparency == 1 then
                return nil;
            end;

            p20.Transparency = u19;
        end;

        for i, descendant in u17:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                if descendant.Transparency ~= 1 then
                    descendant.Transparency = u19;
                end;
            elseif descendant:IsA("ParticleEmitter") then
                descendant.Transparency = NumberSequence.new(u19);
            end;
        end;
    end, 0.99, 0);
    default(0.25, OutCirc, function(p21) -- Line: 101
        -- upvalues: u17 (copy)
        u17:PivotTo(p21);
    end, v15, u16);
    local Animator = u17.Humanoid.Animator;
    local v22 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.SCYTHE_SWING));

    if v22 then
        u13:GiveTask(v22);
        v22.Stopped:Connect(function() -- Line: 108
            -- upvalues: AnimationUtil (ref), Animator (copy), GameAnimationUtil (ref), AnimationType (ref), u13 (copy)
            local v23 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.SCYTHE_IDLE), {
                looped = true
            });

            if v23 then
                u13:GiveTask(v23);
            end;
        end);
    end;

    u13:GiveTask(SoundManager:playSound(GameSound.SCYTHE_SWING_1));
    u17["3DClothing"].Model:Destroy();
    local v24 = ReplicatedStorage.Assets.Misc.ReaperScythe:Clone();

    local function _(p25) -- Line: 122
        -- upvalues: GameQueryUtil (ref)
        if p25:IsA("BasePart") then
            p25.CanCollide = false;
            GameQueryUtil:setQueryIgnored(p25, true);
        end;
    end;

    for i, descendant in v24:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            GameQueryUtil:setQueryIgnored(descendant, true);
        end;
    end;

    v24.Parent = u17;
    u13:GiveTask(v24);
    u17:ScaleTo(2);
    local u26 = ReplicatedStorage.Assets.Misc.GrimReaperSoul.Spirit:Clone();
    u26.Anchored = true;
    local v27 = u26:GetDescendants();

    local function v30(u28) -- Line: 163
        -- upvalues: default (ref), InExpo (ref), GameQueryUtil (ref)
        if not u28:IsA("ParticleEmitter") then
            if u28:IsA("BasePart") then
                u28.CanCollide = false;
                GameQueryUtil:setQueryIgnored(u28, true);
            end;

            return;
        end;

        u28.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255));
        u28.LightInfluence = 1;
        default(1, InExpo, function(p29) -- Line: 167
            -- upvalues: u28 (copy)
            u28.Transparency = NumberSequence.new(p29);

            return u28.Transparency;
        end, 1, 0.5);
    end;

    for i, v in v27 do
        v30(v, i - 1, v27);
    end;

    u26:PivotTo(u14:GetPivot());
    u26.Parent = Workspace;
    EffectUtil:scaleEffect({ u26 }, 2);
    u13:GiveTask(u26);
    local u31 = 0;
    u13:GiveTask((RunService.Heartbeat:Connect(function(p32) -- Line: 184
        -- upvalues: u31 (ref), u26 (copy)
        u31 = u31 + p32;
        local Position = u26.Position;
        local v33 = math.sin(u31 * 10) / 15;
        local v34 = math.sin(u31 * 5) / 10;
        local v35 = math.cos(u31 * 10) / 15;
        u26.Position = Position + Vector3.new(v33, v34, v35);
    end)));
    task.delay(0.5, function() -- Line: 191
        -- upvalues: default (ref), Linear (ref), u17 (copy), InCirc (ref), u16 (copy), u14 (copy), OutQuint (ref), BLOCK_SIZE (ref), u31 (ref), u26 (copy), InOutExpo (ref), u13 (copy), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), u12 (copy), Workspace (ref), OutExpo (ref)
        task.delay(0.5, function() -- Line: 192
            -- upvalues: default (ref), Linear (ref), u17 (ref), InCirc (ref), u16 (ref)
            default(0.5, Linear, function(u36) -- Line: 193
                -- upvalues: u17 (ref)
                local function _(p37) -- Line: 195
                    -- upvalues: u36 (copy)
                    if not p37:IsA("BasePart") then
                        if p37:IsA("ParticleEmitter") then
                            p37.Transparency = NumberSequence.new(u36);
                        end;

                        return;
                    end;

                    if p37.Transparency == 1 then
                        return nil;
                    end;

                    p37.Transparency = u36;
                end;

                for i, descendant in u17:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        if descendant.Transparency ~= 1 then
                            descendant.Transparency = u36;
                        end;
                    elseif descendant:IsA("ParticleEmitter") then
                        descendant.Transparency = NumberSequence.new(u36);
                    end;
                end;
            end, 0, 1);
            default(0.5, InCirc, function(p38) -- Line: 209
                -- upvalues: u17 (ref)
                u17:PivotTo(p38);
            end, u16, u16 - Vector3.new(0, 3, 0));
        end);
        local v39 = u17.PrimaryPart.CFrame.LookVector * -2;
        local u40 = v39.Magnitude <= 0 and Vector3.new(1, 0, 0) or CFrame.Angles(0, -3.141592653589793, 0):VectorToWorldSpace(v39.Unit);
        u14:BreakJoints();
        local v41 = u14:GetDescendants();

        local function v45(p42) -- Line: 219
            -- upvalues: u40 (copy)
            if p42:IsA("BasePart") then
                p42.CanCollide = false;
                local Unit = (u40 + Vector3.new(0, 1, 0)).Unit;
                local v43 = math.random(50, 100);
                local v44 = math.random(100, 200);
                p42.AssemblyLinearVelocity = Unit * Vector3.new(v43, v44, math.random(50, 100));
            end;
        end;

        for i, v in v41 do
            v45(v, i - 1, v41);
        end;

        default(0.7, OutQuint, function(u46) -- Line: 232
            -- upvalues: u14 (ref)
            local v47 = u14:GetDescendants();

            local function v49(p48) -- Line: 234
                -- upvalues: u46 (copy)
                if p48:IsA("BasePart") and u46 > p48.Transparency then
                    p48.Transparency = u46;

                    return;
                end;

                if p48:IsA("GuiObject") then
                    p48.Transparency = u46;

                    return;
                end;

                if p48:IsA("UIStroke") then
                    p48.Transparency = u46;

                    return;
                end;

                if p48:IsA("Decal") then
                    p48.Transparency = u46;

                    return;
                end;

                if p48:IsA("ParticleEmitter") then
                    p48.Transparency = NumberSequence.new(u46);
                end;
            end;

            for i, v in v47 do
                v49(v, i - 1, v47);
            end;
        end, 0, 1);
        default(0.7, Linear, function(p50) -- Line: 251
            -- upvalues: u14 (ref)
            return u14:PivotTo(p50);
        end, u14:GetPivot(), u14:GetPivot() - Vector3.new(0, BLOCK_SIZE * 1, 0));
        local v51 = math.random();
        local v52 = math.round(v51) * 2 - 1;
        default(3, InOutExpo, function(p53) -- Line: 259
            -- upvalues: u31 (ref), u26 (ref)
            local v54 = math.sin(u31 * 10) / 10;
            local v55 = math.sin(u31 * 5) / 10;
            local v56 = math.cos(u31 * 10) / 10;
            u26.Position = p53 + Vector3.new(v54, v55, v56);
        end, u26.Position, u26.Position + Vector3.new(0, v52 * BLOCK_SIZE * 5, 0));
        local v57 = u26:GetDescendants();

        local function v60(u58) -- Line: 269
            -- upvalues: default (ref), Linear (ref)
            if u58:IsA("ParticleEmitter") then
                u58.Color = ColorSequence.new(Color3.new(255, 255, 255));
                default(3, Linear, function(p59) -- Line: 272
                    -- upvalues: u58 (copy)
                    u58.Transparency = NumberSequence.new(p59);

                    return u58.Transparency;
                end, 0.5, 1);
            end;
        end;

        for i, v in v57 do
            v60(v, i - 1, v57);
        end;

        if v52 > 0 then
            u13:GiveTask(SoundManager:playSound(GameSound.HEAVEN_ASCEND, {
                position = u26.Position
            }));
            task.spawn(function() -- Line: 286
                -- upvalues: default (ref), Linear (ref), u26 (ref), ReplicatedStorage (ref), u12 (ref), BLOCK_SIZE (ref), Workspace (ref), u13 (ref)
                default(1, Linear, function(u61) -- Line: 287
                    -- upvalues: u26 (ref)
                    local function _(p62) -- Line: 289
                        -- upvalues: u61 (copy)
                        if p62:IsA("ParticleEmitter") then
                            p62.Color = ColorSequence.new(u61);
                        end;
                    end;

                    for i, descendant in u26:GetDescendants() do
                        local _ = i - 1;

                        if descendant:IsA("ParticleEmitter") then
                            descendant.Color = ColorSequence.new(u61);
                        end;
                    end;
                end, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 245, 184));
                local u63 = ReplicatedStorage.Assets.Misc.LightBeam:Clone();
                u63.CFrame = u12 + Vector3.new(0, u63.Size.Y / 2 - BLOCK_SIZE, 0);
                u63.Parent = Workspace;
                u13:GiveTask(u63);
                default(2, Linear, function(p64) -- Line: 304
                    -- upvalues: u63 (copy)
                    u63.Transparency = p64;
                end, 1, 0.8):Wait();
                default(2, Linear, function(p65) -- Line: 308
                    -- upvalues: u63 (copy)
                    u63.Transparency = p65;
                end, 0.8, 1);
            end);

            return;
        end;

        local u66 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
            playbackSpeedMultiplier = 0.25,
            position = u26.Position
        });
        u13:GiveTask(u66);
        local u67 = SoundManager:playSound(GameSound.EVIL_LAUGH, {
            volumeMultiplier = 0.02,
            position = u26.Position
        });
        u13:GiveTask(u67);
        default(2.5, Linear, function(p68) -- Line: 324
            -- upvalues: u66 (copy), u67 (copy)
            local v69 = u66:getInstance();
            local v70 = u67:getInstance();

            if not (v69 and v70) then
                return nil;
            end;

            v69.Volume = p68;
            v70.Volume = p68;
        end, 1, 0);
        task.spawn(function() -- Line: 333
            -- upvalues: ReplicatedStorage (ref), u14 (ref), Workspace (ref), u13 (ref), default (ref), OutExpo (ref), u31 (ref), BLOCK_SIZE (ref), Linear (ref), u26 (ref)
            local u71 = ReplicatedStorage.Assets.Misc.MagmaRift:Clone();
            local Position = u14:GetPivot().Position;
            local v72 = Vector3.new(0, u14.Humanoid.HipHeight + u71[1].Size.Y, 0);
            u71:PivotTo(CFrame.new(Position - v72));

            local function _(p73) -- Line: 340
                if p73:IsA("BasePart") then
                    p73.Transparency = 1;
                end;
            end;

            for i, descendant in u71:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                end;
            end;

            u71.Parent = Workspace;
            u13:GiveTask(u71);
            task.spawn(function() -- Line: 350
                -- upvalues: u71 (copy), default (ref), OutExpo (ref), u31 (ref), BLOCK_SIZE (ref), Linear (ref)
                local v74 = false;
                local v75 = 1;

                while true do
                    if v74 then
                        v75 = v75 + 1;
                    else
                        v74 = true;
                    end;

                    if v75 > 3 then
                        task.wait(1);

                        local function _(u76) -- Line: 382
                            -- upvalues: default (ref), Linear (ref)
                            default(0.5, Linear, function(p77) -- Line: 383
                                -- upvalues: u76 (copy)
                                if u76:IsA("BasePart") then
                                    u76.Transparency = p77;

                                    return;
                                end;

                                if u76:IsA("ParticleEmitter") then
                                    u76.Transparency = NumberSequence.new(p77);
                                end;
                            end, 0, 1);
                        end;

                        for i, descendant in u71:GetDescendants() do
                            local _ = i - 1;
                            default(0.5, Linear, function(p78) -- Line: 383
                                -- upvalues: descendant (copy)
                                if descendant:IsA("BasePart") then
                                    descendant.Transparency = p78;

                                    return;
                                end;

                                if descendant:IsA("ParticleEmitter") then
                                    descendant.Transparency = NumberSequence.new(p78);
                                end;
                            end, 0, 1);
                        end;

                        return;
                    end;

                    local u79 = u71[tostring(v75)];
                    default(0.25, OutExpo, function(p80) -- Line: 364
                        -- upvalues: u79 (copy)
                        u79.Transparency = p80;
                    end, 1, 0);
                    default(0.5, Linear, function(p81) -- Line: 367
                        -- upvalues: u79 (copy), u71 (ref), u31 (ref)
                        u79.Position = p81;
                        local v82 = u71:GetPivot();
                        local v83 = math.sin(u31 * 50) / 10;
                        u71:PivotTo(v82 + Vector3.new(0, v83, 0));
                    end, u79.Position - Vector3.new(0, BLOCK_SIZE, 0), u79.Position);
                    task.wait(0.5);
                end;
            end);
            default(1, Linear, function(u84) -- Line: 395
                -- upvalues: u26 (ref)
                local function _(p85) -- Line: 397
                    -- upvalues: u84 (copy)
                    if p85:IsA("ParticleEmitter") then
                        p85.Color = ColorSequence.new(u84);
                    end;
                end;

                for i, descendant in u26:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Color = ColorSequence.new(u84);
                    end;
                end;
            end, Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 100, 100));
        end);
    end);
    default(1, Linear, function(u86) -- Line: 428
        -- upvalues: u26 (copy)
        local function _(p87) -- Line: 430
            -- upvalues: u86 (copy)
            if p87:IsA("ParticleEmitter") then
                p87.LightInfluence = u86;
            end;
        end;

        for i, descendant in u26:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ParticleEmitter") then
                descendant.LightInfluence = u86;
            end;
        end;
    end, 0, 20);
    task.delay(6, function() -- Line: 439
        -- upvalues: u13 (copy)
        u13:DoCleaning();
    end);

    return u13;
end;

return u5;