-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "MeteorKillEffect";
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

function u4.onKill(p8, p9, p10, u11) -- Line: 31
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), u2 (copy), SoundManager (copy), GameSound (copy), RunService (copy), EffectUtil (copy)
    local u12 = u1.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13.Parent = Workspace;
    local PrimaryPart = u13.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if not PrimaryPart then
        u13:Destroy();

        return u12;
    end;

    KillEffect.hideCharacter(p8, p10);
    local v14 = Random.new(math.random());
    local Position = u11.Position;
    local v15 = math.random(-20, 20);
    local v16 = Position + Vector3.new(v15, 45, math.random(-20, 20));
    local u17 = ReplicatedStorage.Assets.Effects.Meteor:Clone();
    local u18 = CFrame.new(v16);
    local u19 = Workspace:GetServerTimeNow();
    local u20 = u19 + 1;
    u17:PivotTo(u18);
    u17.Parent = Workspace;
    local u21 = u2("Part", {
        Anchored = true,
        Name = "Meteor",
        Size = Vector3.new(4, 4, 4),
        CanCollide = false,
        CFrame = u18,
        Color = Color3.fromRGB(0, 0, 0),
        Material = Enum.Material.Rock,
        Parent = u17
    });
    local v22 = SoundManager:playSound(GameSound.METEOR_COSMIC_LOOP, {
        looped = true,
        position = u11.Position
    });

    if v22 then
        SoundManager:tweenSoundVolume(v22, 5, 1);
        u12:GiveTask(v22);
    end;

    local u23 = v14:NextNumber(0.2, 0.5);
    local u24 = v14:NextNumber(0.2, 0.5);
    local u25 = v14:NextNumber(0.2, 0.5);
    local u26 = 0;
    u12:GiveTask(RunService.Heartbeat:Connect(function(p27) -- Line: 84
        -- upvalues: u26 (ref), u18 (copy), u11 (copy), Workspace (ref), u19 (copy), u20 (copy), u17 (copy), u23 (copy), u24 (copy), u25 (copy), u21 (copy), u12 (copy)
        u26 = u26 + p27;
        local v28 = u18:Lerp(u11, (Workspace:GetServerTimeNow() - u19) / (u20 - u19));
        local v29 = CFrame.new(v28.Position, u11.Position) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966);
        u17:PivotTo(v29);
        u21.CFrame = v29 * CFrame.Angles(u26 * 3.141592653589793 * 2 * u23, u26 * 3.141592653589793 * 2 * u24, u26 * 3.141592653589793 * 2 * u25);

        if u20 <= Workspace:GetServerTimeNow() then
            u12:DoCleaning();
        end;
    end));
    u12:GiveTask(function() -- Line: 99
        -- upvalues: u17 (copy), u13 (copy), Workspace (ref), u11 (copy), ReplicatedStorage (ref), u11 (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref)
        task.spawn(function() -- Line: 100
            -- upvalues: u17 (ref), u13 (ref), Workspace (ref), u11 (ref), ReplicatedStorage (ref), u11 (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref)
            u17:Destroy();
            u13:BreakJoints();
            local v30 = u13:GetDescendants();

            local function v34(p31) -- Line: 104
                if p31:IsA("Part") or p31:IsA("MeshPart") then
                    local v32 = math.random(-45, 45);
                    local v33 = 15 + math.random() * 10;
                    p31.AssemblyLinearVelocity = Vector3.new(v32, v33, math.random(-45, 45));
                end;
            end;

            for i, v in v30 do
                v34(v, i - 1, v30);
            end;

            local v35 = not Workspace.CurrentCamera and 0 or (u11.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude;
            local v36 = ReplicatedStorage.Assets.Effects.MeteorHitEffect:Clone();
            v36.CFrame = u11;
            v36.Parent = Workspace;
            EffectUtil:playEffects({ v36 }, nil, {
                destroyAfterSec = 3,
                particleMultiplier = v35 > 200 and 0.2 or 1
            });
            SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                rollOffMaxDistance = 300,
                position = u11.Position
            });
            SoundManager:playSound(GameSound.CARROT_LAUNCHER_IMPACT, {
                rollOffMaxDistance = 300,
                position = u11.Position
            });
            task.delay(1, function() -- Line: 133
                -- upvalues: u13 (ref)
                u13:Destroy();
            end);
        end);
    end);

    return u12;
end;

return u4;