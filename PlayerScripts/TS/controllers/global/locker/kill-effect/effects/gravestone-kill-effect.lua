-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v2.Linear;
local OutBounce = v2.OutBounce;
local OutQuad = v2.OutQuad;
local OutSine = v2.OutSine;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "GravestoneKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 29
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 33
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, u10, p11, u12) -- Line: 37
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy), default (copy), OutBounce (copy), Linear (copy), GameQueryUtil (copy), OutQuad (copy), RunService (copy), OutSine (copy)
    local u13 = u3.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14:PivotTo(u12);
    u14.Parent = Workspace;
    KillEffect.hideCharacter(p9, p11);
    u13:GiveTask(u14);
    local u15 = ReplicatedStorage.Assets.Misc.Gravestone:Clone();
    u13:GiveTask(u15);
    local u16 = ReplicatedStorage.Assets.Effects.GroundShakeParticles:Clone();
    u13:GiveTask(u16);
    local u17 = ReplicatedStorage.Assets.Effects.OilPart:Clone();
    u13:GiveTask(u17);
    local u18 = ReplicatedStorage.Assets.Effects.GroundShakeParticles:Clone();
    u13:GiveTask(u18);
    local u47 = RuntimeLib.Promise.new(function() -- Line: 55
        -- upvalues: u13 (copy), SoundManager (ref), GameSound (ref), u14 (copy), default (ref), OutBounce (ref), Linear (ref), u12 (copy), u16 (copy), Workspace (ref), GameQueryUtil (ref), u17 (copy), RuntimeLib (ref), OutQuad (ref), u18 (copy), u15 (copy), u10 (copy), RunService (ref), OutSine (ref)
        task.wait(0.1);
        u13:GiveTask(SoundManager:playSound(GameSound.GHOST_PILLAR_ERUPT, {
            position = u14:GetPivot().Position
        }));
        default(0.3, OutBounce, function(p19) -- Line: 62
            -- upvalues: Linear (ref), u14 (ref), u12 (ref)
            local v20 = Linear(p19, 0, 90, 1);
            u14:PivotTo(u12 * CFrame.Angles(math.rad(v20), 0, 0));
        end, 0, 1):Wait();
        local v21 = CFrame.new(0, -3.5, 0);
        local v22 = CFrame.Angles(0, 1.5707963267948966, 0);
        local v23 = u12 * v21 * v22;
        u16.Parent = Workspace;
        u16.CFrame = v23;
        GameQueryUtil:setQueryIgnored(u16, true);
        u17.Parent = Workspace;
        u17.Color = Color3.fromRGB(77, 59, 43);
        u17.CFrame = v23 * CFrame.new(0, 0.5, 0);
        u17.Size = Vector3.new(0.1, 0.1, 0.1);
        GameQueryUtil:setQueryIgnored(u17, true);
        RuntimeLib.Promise.new(function() -- Line: 83
            -- upvalues: default (ref), OutQuad (ref), u17 (ref), Linear (ref)
            default(0.15, OutQuad, function(p24) -- Line: 85
                -- upvalues: u17 (ref), Linear (ref)
                u17.Size = (Vector3.new(0, 0, 0)):Lerp(Vector3.new(6.5, 0.1, 3), Linear(p24, 0, 1, 1));
            end, 0, 1):Wait();
            task.wait(0.35);
            default(0.1, OutQuad, function(p25) -- Line: 90
                -- upvalues: u17 (ref), Linear (ref)
                u17.Size = (Vector3.new(0.1, 0.1, 0.1)):Lerp(Vector3.new(6.5, 0.1, 3), Linear(p25, 1, -1, 1));
            end, 0, 1):Wait();
            u17.Transparency = 1;
        end);
        local u26 = false;
        default(0.3, Linear, function(p27) -- Line: 97
            -- upvalues: u26 (ref), u16 (ref), u12 (ref), u14 (ref)
            if p27 > 0.3 and u26 == false then
                u26 = true;
                u16.ParticleEmitter:Emit(20);
            end;

            u14:PivotTo(u12:Lerp(u12 - Vector3.new(0, 6, 0), p27) * CFrame.Angles(1.5707963267948966, 0, 0));
        end, 0, 1):Wait();
        u13:GiveTask(SoundManager:playSound(GameSound.TURN_TO_STONE, {
            position = u14:GetPivot().Position
        }));
        u18.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(u18, true);
        u18.Size = Vector3.new(1, 1, 3);
        u18.ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(166, 166, 166));
        u18.ParticleEmitter.Enabled = true;
        u18.ParticleEmitter.LockedToPart = true;
        local v28 = CFrame.new(0, -3.5, 3);
        local v29 = CFrame.Angles(0, 1.5707963267948966, 0);
        u18.CFrame = u12 * v28 * v29;
        local u30 = u12 * CFrame.new(0, -1.5, 3);
        local u31 = u30 * CFrame.new(0, -4, 0);
        u15:PivotTo(u31);
        u15.Parent = Workspace;
        u15.Root.GravestoneModel.Gravestone.SurfaceGui.GravestoneText.Text = u10.DisplayName;
        GameQueryUtil:setQueryIgnored(u15, true);
        local u32 = 0;
        u13:GiveTask((RunService.Heartbeat:Connect(function(p33) -- Line: 133
            -- upvalues: u32 (ref), u12 (ref), u18 (ref)
            u32 = u32 + p33;
            local v34 = CFrame.new(0, -3.5, 3);
            local v35 = CFrame.Angles(0, 1.5707963267948966, 0);
            local v36 = CFrame.new(math.noise(-u32 * 20, -u32 * 20) * 0.15, 0, math.noise((u32 + u32) * 20) * 0.15);
            u18.CFrame = u12 * v34 * v35 * v36;
        end)));
        task.wait(0.6);
        local v37 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
            looped = true,
            fadeOutTime = 1.75,
            position = u17.Position
        });
        u13:GiveTask(v37);
        default(1.5, OutSine, function(p38) -- Line: 150
            -- upvalues: u15 (ref), u31 (copy), u30 (copy)
            local v39 = u31:Lerp(u30, p38);
            local v40 = CFrame.new(math.noise(-p38 * 30) * 0.1, 0, math.noise(-p38 * 30, -8888, -p38 * 30) * 0.1);
            local Angles = CFrame.Angles;
            local v41 = math.noise(-p38 * 30) * 3;
            local v42 = math.rad(v41);
            local v43 = math.noise(0, 0, (-p38 + -p38) * 30) * 3;
            local v44 = math.rad(v43);
            local v45 = math.noise(-p38 * 30, -8888, -p38 * 30) * 3;
            local v46 = Angles(v42, v44, (math.rad(v45)));
            u15:PivotTo(v39 * v40 * v46);
        end, 0, 1):Wait();

        if v37 ~= nil then
            v37:Stop();
        end;

        if v37 ~= nil then
            v37:Destroy();
        end;

        if u18.ParticleEmitter then
            u18.ParticleEmitter.Enabled = false;
        end;
    end);
    u13:GiveTask(function() -- Line: 169
        -- upvalues: u47 (copy)
        return u47:cancel();
    end);
    local u48 = RuntimeLib.Promise.delay(7):andThen(function() -- Line: 173
        -- upvalues: u13 (copy)
        u13:DoCleaning();
    end);
    u13:GiveTask(function() -- Line: 177
        -- upvalues: u48 (copy)
        return u48:cancel();
    end);

    return u13;
end;

return u5;