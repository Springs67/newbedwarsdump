-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = { "arm", "leg", "hand", "foot" };

local function isLimbPart(p4) -- Line: 28
    -- upvalues: u3 (copy)
    local u5 = string.lower(p4.Name);

    local function _(p6) -- Line: 30
        -- upvalues: u5 (copy)
        return string.find(u5, p6) ~= nil;
    end;

    for i, v in u3 do
        local _ = i - 1;

        if string.find(u5, v) ~= nil then
            return true;
        end;
    end;

    return false;
end;

local u7 = setmetatable({}, {
    __tostring = function() -- Line: 49, Name: __tostring
        return "PopKillEffect";
    end,

    __index = KillEffect
});
u7.__index = u7;

function u7.new(...) -- Line: 55
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9, p10) -- Line: 59
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p9, p10);
    KillEffect.setPlayDefaultKillEffect(p9, false);
end;

function u7.onKill(p11, p12, p13, u14) -- Line: 63
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), isLimbPart (copy), RunService (copy), OutQuad (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local u15 = u1.new();
    p13.Archivable = true;
    local u16 = p13:Clone();
    u16.Name = "PopKillEffectCharacterClone";
    u16:PivotTo(u14);
    u16.Parent = Workspace;
    u15:GiveTask(u16);

    if not u16.PrimaryPart then
        return u15;
    end;

    KillEffect.hideCharacter(p11, p13);
    local Position = u14.Position;
    local u17 = SoundManager:playSound(GameSound.BED_INFLATE_SOUND, {
        position = Position
    });

    if u17 then
        u15:GiveTask(function() -- Line: 81
            -- upvalues: u17 (copy)
            return u17:Destroy();
        end);
    end;

    local u18 = u16:GetPivot();
    local u19 = {};
    local u20 = (1 / 0);
    local v21 = u16:GetDescendants();

    local function v25(p22) -- Line: 89
        -- upvalues: u18 (copy), isLimbPart (ref), u19 (copy), u20 (ref)
        if p22:IsA("BasePart") then
            p22.Anchored = true;
            p22.CanCollide = false;
            p22.CanQuery = false;
            p22.CanTouch = false;
            local v23 = u18:ToObjectSpace(p22.CFrame);
            u19[p22] = {
                initialSize = p22.Size,
                initialLocalCFrame = v23,
                isLimb = isLimbPart(p22)
            };
            local v24 = v23.Position.Y - p22.Size.Y / 2;

            if v24 < u20 then
                u20 = v24;
            end;
        end;
    end;

    for i, v in v21 do
        v25(v, i - 1, v21);
    end;

    local u26 = 0;
    local u49 = RunService.Heartbeat:Connect(function(p27) -- Line: 114
        -- upvalues: u26 (ref), OutQuad (ref), u20 (ref), u18 (copy), u14 (copy), u19 (copy)
        u26 = u26 + p27;
        local v28 = math.min(1, u26 / 3);
        local v29 = OutQuad(math.min(u26, 3), 0, 1, 3);
        local u30 = math.lerp(1, 2.200000047683716, v29);
        local u31 = math.lerp(1, 1.7999999523162842, v29);
        local u32 = math.lerp(1, 2.200000047683716, v29);
        local u33 = math.lerp(1, 1.8, v29);
        local v34 = math.lerp(0, 0.25, v28) + (u20 >= 0 and 0 or (u31 - 1) * -u20);
        local v35 = math.pow(v28, 2.2);
        local v36 = math.pow(v28, 2.4);
        local v37 = v35 * math.lerp(1, 0.82, v36);
        local v38 = math.lerp(2.2, 22, v37);
        local v39 = math.lerp(0.042, 0.24, v37);
        local v40 = math.lerp(0.0020943951023931952, 0.01832595714594046, v37);
        local v41 = u26;
        local u42 = CFrame.new(math.sin(v41 * v38 * 1.07) * v39, math.cos(v41 * v38 * 0.93) * v39 * 0.55 + v34, math.sin(v41 * v38 * 0.71 + 1.2) * v39) * CFrame.Angles(math.cos(v41 * v38 * 1.21) * v40 * 0.5, math.sin(v41 * v38 * 0.88) * v40 * 0.5, math.cos(v41 * v38 * 0.76 + 0.5) * v40 * 0.5);

        local function v48(p43, p44) -- Line: 134
            -- upvalues: u33 (copy), u32 (copy), u30 (copy), u31 (copy), u18 (ref), u14 (ref), u42 (copy)
            local v45;

            if p43.isLimb then
                v45 = u33;
            else
                v45 = u32;
            end;

            local initialLocalCFrame = p43.initialLocalCFrame;
            local Position2 = initialLocalCFrame.Position;
            local v46 = Vector3.new(Position2.X * u30, Position2.Y * u31, Position2.Z * v45);
            local v47 = initialLocalCFrame - initialLocalCFrame.Position;
            p44.CFrame = u14:ToWorldSpace(u42 * u14:ToObjectSpace((u18:ToWorldSpace(CFrame.new(v46) * v47))));
            p44.Size = Vector3.new(p43.initialSize.X * u30, p43.initialSize.Y * u31, p43.initialSize.Z * v45);
        end;

        for i, v in u19 do
            v48(v, i, u19);
        end;
    end);
    u15:GiveTask(function() -- Line: 150
        -- upvalues: u49 (copy)
        return u49:Disconnect();
    end);
    task.delay(2.7, function() -- Line: 153
        -- upvalues: u17 (copy), SoundManager (ref), GameSound (ref), Position (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local v50 = u17;

        if v50 ~= nil then
            v50:Stop();
        end;

        SoundManager:playSound(GameSound.BED_POP_SOUND, {
            position = Position
        });
        local v51 = ReplicatedStorage.Assets.Effects.BedPopExplosion:Clone();
        v51.Parent = Workspace;
        v51.CFrame = CFrame.new(Position);
        EffectUtil:playEffects({ v51 }, nil, {
            sizeMultiplier = 2,
            destroyAfterSec = 3
        });
    end);
    task.delay(2.8499999999999996, function() -- Line: 169
        -- upvalues: u49 (copy), u16 (copy)
        u49:Disconnect();
        u16:Destroy();
    end);
    task.delay(6, function() -- Line: 173
        -- upvalues: u15 (copy)
        u15:DoCleaning();
    end);

    return u15;
end;

return u7;