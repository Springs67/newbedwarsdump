-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "PillowKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 27
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(p8, p9, p10, p11) -- Line: 31
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), RuntimeLib (copy), TweenService (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local v13 = p10:Clone();
    v13.HumanoidRootPart.Anchored = true;
    v13.Parent = Workspace;
    local PrimaryPart = v13.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if not PrimaryPart then
        v13:Destroy();

        return u12;
    end;

    KillEffect.hideCharacter(p8, p10);
    local u14 = ReplicatedStorage.Assets.Effects.PillowKillEffect:Clone();
    u14:PivotTo(PrimaryPart);
    u14.Parent = Workspace;
    u12:GiveTask(u14);
    u12:GiveTask(v13);
    local u30 = RuntimeLib.Promise.new(function() -- Line: 52
        -- upvalues: u14 (copy), u12 (copy), ReplicatedStorage (ref), Workspace (ref), TweenService (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), PrimaryPart (copy), RuntimeLib (ref)
        local Main = u14:WaitForChild("Main", 3);

        if not Main then
            return u12;
        end;

        local u15 = ReplicatedStorage.Assets.Effects.WhiteFeatherEffect:Clone();
        u15.Parent = Workspace;
        local u16 = ReplicatedStorage.Assets.Effects.SmallWhiteFeatherEffect:Clone();
        u16.Parent = Workspace;
        u12:GiveTask(u16);
        u12:GiveTask(u15);
        local v17 = Main:GetChildren();
        table.sort(v17, function(p18, p19) -- Line: 64
            return p18.Name < p19.Name;
        end);

        local function v27(p20) -- Line: 68
            -- upvalues: TweenService (ref), u16 (copy), u12 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            if p20:IsA("Model") then
                local PrimaryPart2 = p20.PrimaryPart;
                local PIllow = p20:WaitForChild("PIllow", 1);

                if not (PrimaryPart2 and PIllow) then
                    return nil;
                end;

                local v21 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential);
                local v22 = {};
                local PrimaryPart3 = p20.PrimaryPart;

                if PrimaryPart3 ~= nil then
                    PrimaryPart3 = PrimaryPart3.CFrame;
                end;

                v22.CFrame = PrimaryPart3;
                local v23 = TweenService:Create(PIllow, v21, v22);
                u16:PivotTo(CFrame.new(PrimaryPart2.Position));
                v23:Play();
                task.wait(0.2);

                local function _(p24) -- Line: 89
                    if p24:IsA("ParticleEmitter") then
                        p24:Emit(3);
                    end;
                end;

                for i, child in u16:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child:Emit(3);
                    end;
                end;

                local v25 = RandomUtil.fromList(GameSound.PILLOW_HIT_1, GameSound.PILLOW_HIT_2, GameSound.PILLOW_HIT_3);
                local v26 = {};
                local PrimaryPart4 = p20.PrimaryPart;

                if PrimaryPart4 ~= nil then
                    PrimaryPart4 = PrimaryPart4.Position;
                end;

                v26.position = PrimaryPart4;
                v26.rollOffMaxDistance = 220;
                u12:GiveTask(SoundManager:playSound(v25, v26));
            end;
        end;

        for i, v in v17 do
            v27(v, i - 1, v17);
        end;

        u15:PivotTo(PrimaryPart);
        local u29 = RuntimeLib.Promise.delay(0.75):andThen(function() -- Line: 116
            -- upvalues: PrimaryPart (ref), u15 (copy), u12 (ref), SoundManager (ref), GameSound (ref), RuntimeLib (ref)
            if PrimaryPart then
                local function _(p28) -- Line: 119
                    if p28:IsA("ParticleEmitter") then
                        p28:Emit(30);
                    end;
                end;

                for i, child in u15:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("ParticleEmitter") then
                        child:Emit(30);
                    end;
                end;

                u12:DoCleaning();
                u12:GiveTask(SoundManager:playSound(GameSound.PILLOW_HIT_3, {
                    rollOffMaxDistance = 220,
                    volumeMultiplier = 1.5,
                    position = PrimaryPart.Position
                }));
                RuntimeLib.Promise.delay(1):andThen(function() -- Line: 134
                    -- upvalues: u15 (ref)
                    u15:Destroy();
                end);
            end;
        end);
        u12:GiveTask(function() -- Line: 141
            -- upvalues: u29 (copy)
            return u29:cancel();
        end);
    end);
    u12:GiveTask(function() -- Line: 145
        -- upvalues: u30 (copy)
        return u30:cancel();
    end);

    return u12;
end;

return u4;