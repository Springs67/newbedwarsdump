-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuad = v2.InQuad;
local Linear = v2.Linear;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CFrameUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local MathUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = { "arm", "leg", "hand", "foot" };

local function isLimbPart(p6) -- Line: 26
    -- upvalues: u5 (copy)
    local u7 = string.lower(p6.Name);

    local function _(p8) -- Line: 28
        -- upvalues: u7 (copy)
        return string.find(u7, p8) ~= nil;
    end;

    for i, v in u5 do
        local _ = i - 1;

        if string.find(u7, v) ~= nil then
            return true;
        end;
    end;

    return false;
end;

local u9 = setmetatable({}, {
    __tostring = function() -- Line: 72, Name: __tostring
        return "BeeStingKillEffect";
    end,

    __index = KillEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 78
    -- upvalues: u9 (copy)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11, p12) -- Line: 82
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p11, p12);
    KillEffect.setPlayDefaultKillEffect(p11, false);
end;

function u9.onKill(p13, p14, p15, p16) -- Line: 86
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), SoundManager (copy), GameSound (copy), RunService (copy), MathExtras (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), MathUtil (copy), default (copy), InQuad (copy), Linear (copy), isLimbPart (copy), RuntimeLib (copy), CFrameUtil (copy)
    local u17 = u3.new();
    p15.Archivable = true;
    local u18 = p15:Clone();
    local HumanoidRootPart = u18.HumanoidRootPart;
    HumanoidRootPart.Anchored = true;
    u18.Parent = Workspace;
    u17:GiveTask(u18);
    local u19 = task.delay(30, function() -- Line: 95
        -- upvalues: u17 (copy)
        u17:Destroy();
    end);
    u17:GiveTask(function() -- Line: 98
        -- upvalues: u19 (copy)
        return task.cancel(u19);
    end);
    local _DamageHighlight_ = u18:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    KillEffect.hideCharacter(p13, p15);
    local u20 = SoundManager:playModifiableSound(GameSound.ANGRY_BEE, {
        volumeMultiplier = 2,
        rollOffMaxDistance = 80,
        looped = true,
        parent = HumanoidRootPart
    });
    u17:GiveTask(u20);
    local u21 = false;

    local function _() -- Line: 117
        -- upvalues: u21 (ref), u20 (copy), RunService (ref), MathExtras (ref), u17 (copy)
        if u21 then
            return nil;
        end;

        u21 = true;
        local Volume = u20.Volume;
        local u22 = 0;
        local u23 = nil;
        u23 = RunService.Heartbeat:Connect(function(p24) -- Line: 125
            -- upvalues: u22 (ref), u20 (ref), MathExtras (ref), Volume (copy), u23 (ref)
            u22 = u22 + p24;
            local v25 = math.clamp(u22 / 2, 0, 1);
            u20.Volume = MathExtras:lerp(Volume, 0, v25);

            if v25 >= 1 then
                u23:Disconnect();
                u20:Stop();
            end;
        end);
        u17:GiveTask(u23);
    end;

    local u26 = u18.PrimaryPart.Position + Vector3.new(0, 0, 0);
    local u27 = 0;
    local v28 = false;

    while true do
        if v28 then
            u27 = u27 + 1;
        else
            v28 = true;
        end;

        if u27 >= 5 then
            task.wait(2);
            u17:GiveTask((SoundManager:playSound(GameSound.BED_INFLATE_SOUND, {
                volumeMultiplier = 1,
                playbackSpeedMultiplier = 2,
                rollOffMaxDistance = 80,
                parent = HumanoidRootPart
            })));
            local v29 = u18:GetDescendants();
            local u30 = {};

            local function v33(p31) -- Line: 238
                -- upvalues: isLimbPart (ref), u30 (copy)
                if not p31:IsA("BasePart") then
                    return nil;
                end;

                p31.CanCollide = false;
                p31.CanQuery = false;
                p31.CanTouch = false;
                local v32 = {
                    part = p31,
                    originalSize = p31.Size,
                    isLimb = isLimbPart(p31)
                };
                table.insert(u30, v32);
            end;

            for i, v in v29 do
                v33(v, i - 1, v29);
            end;

            local u40 = default(3, Linear, function(u34) -- Line: 255
                -- upvalues: MathExtras (ref), u30 (copy)
                local function v39(p35) -- Line: 256
                    -- upvalues: MathExtras (ref), u34 (copy)
                    local v36 = p35.isLimb and 2.05 or 2.4;
                    local v37 = MathExtras:lerp(p35.originalSize.X, p35.originalSize.X * 2.4, u34);
                    local v38 = MathExtras:lerp(p35.originalSize.Z, p35.originalSize.Z * v36, u34);
                    p35.part.Size = Vector3.new(v37, p35.originalSize.Y, v38);
                end;

                for i, v in u30 do
                    v39(v, i - 1, u30);
                end;
            end, 0, 1);
            u40:Play();
            u17:GiveTask(function() -- Line: 267
                -- upvalues: u40 (copy)
                u40:Cancel();
            end);
            local u54 = RuntimeLib.Promise.new(function() -- Line: 270
                -- upvalues: MathUtil (ref), RunService (ref), u18 (copy), u17 (copy), SoundManager (ref), GameSound (ref), HumanoidRootPart (copy), CFrameUtil (ref)
                task.wait(3.5);
                local v41 = MathUtil.randomFloatMaxInclusive(1, 3.5);
                local v42 = MathUtil.randomFloatMaxInclusive(1, 3.5);
                local v43 = MathUtil.randomFloatMaxInclusive(1, 3.5);
                local u44 = Vector3.new(v41, v42, v43);
                local u46 = RunService.Heartbeat:Connect(function(p45) -- Line: 278
                    -- upvalues: u18 (ref), u44 (copy)
                    local PrimaryPart = u18.PrimaryPart;

                    if PrimaryPart then
                        PrimaryPart.CFrame = PrimaryPart.CFrame * CFrame.Angles(u44.X * p45, u44.Y * p45, u44.Z * p45);
                    end;
                end);
                u17:GiveTask(function() -- Line: 286
                    -- upvalues: u46 (copy)
                    u46:Disconnect();
                end);
                local u47 = SoundManager:playModifiableSound(GameSound.WIND_LOOP, {
                    volumeMultiplier = 1,
                    rollOffMaxDistance = 80,
                    looped = true,
                    parent = HumanoidRootPart
                });
                local u48 = 1;
                local u49 = nil;
                u49 = RunService.Heartbeat:Connect(function(p50) -- Line: 298
                    -- upvalues: u48 (ref), u47 (copy), u49 (ref)
                    u48 = u48 - p50 / 5;
                    u47.Volume = u48;

                    if u48 <= 0 then
                        u49:Disconnect();
                        u47:Stop();
                        u47:Destroy();
                    end;
                end);
                u17:GiveTask(u47);
                u17:GiveTask(u49);
                local u53 = RunService.Heartbeat:Connect(function(p51) -- Line: 310
                    -- upvalues: u18 (ref), CFrameUtil (ref)
                    local PrimaryPart = u18.PrimaryPart;

                    if not PrimaryPart then
                        return nil;
                    end;

                    local Position = PrimaryPart.Position;
                    local v52 = Vector3.new(0, 18 * p51, 0);
                    CFrameUtil.setPosition(PrimaryPart, Position + v52);
                end);
                u17:GiveTask(function() -- Line: 320
                    -- upvalues: u53 (copy)
                    u53:Disconnect();
                end);
            end);
            u17:GiveTask(function() -- Line: 324
                -- upvalues: u54 (copy)
                return u54:cancel();
            end);

            return u17;
        end;

        task.spawn(function() -- Line: 153
            -- upvalues: u27 (ref), u26 (copy), ReplicatedStorage (ref), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), MathUtil (ref), default (ref), InQuad (ref), u21 (ref), u20 (copy), RunService (ref), MathExtras (ref), u17 (copy), Linear (ref)
            local v55 = u27 / 5 * 3.141592653589793 * 2;
            local v56 = math.cos(v55) * 8;
            local v57 = math.sin(v55) * 8;
            local v58 = u26 + Vector3.new(v56, 3, v57);
            local u59 = ReplicatedStorage.Assets.Effects.KillEffectBee:Clone();
            u59:PivotTo(CFrame.lookAt(v58, u26));
            u59.Parent = Workspace;
            local v60 = u59:FindFirstChildOfClass("AnimationController");

            if v60 ~= nil then
                local v61 = v60:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BEE_FLAP));
                v61.Looped = true;
                v61:Play();
            end;

            local v62 = MathUtil.randomFloatMaxInclusive(0, 1);
            local v63 = u26 + Vector3.new(0, v62, 0);
            local v64 = false;
            local v65 = 0;
            local v66 = true;

            while true do
                if v64 then
                    v65 = v65 + 1;
                else
                    v64 = true;
                end;

                if v65 >= 10 then
                    if not u21 then
                        u21 = true;
                        local Volume = u20.Volume;
                        local u67 = 0;
                        local u68 = nil;
                        u68 = RunService.Heartbeat:Connect(function(p69) -- Line: 125
                            -- upvalues: u67 (ref), u20 (ref), MathExtras (ref), Volume (copy), u68 (ref)
                            u67 = u67 + p69;
                            local v70 = math.clamp(u67 / 2, 0, 1);
                            u20.Volume = MathExtras:lerp(Volume, 0, v70);

                            if v70 >= 1 then
                                u68:Disconnect();
                                u20:Stop();
                            end;
                        end);
                        u17:GiveTask(u68);
                    end;

                    local Position = u59:GetPivot().Position;
                    local v71 = MathUtil.randomFloatMaxInclusive(-5, 5);
                    local v72 = MathUtil.randomFloatMaxInclusive(30, 38);
                    local u73 = Position + Vector3.new(v71, v72, MathUtil.randomFloatMaxInclusive(-5, 5));
                    local u74 = MathUtil.randomFloatMaxInclusive(3, 4);
                    local Unit = (u73 - Position).Unit;
                    default(u74, Linear, function(p75) -- Line: 212
                        -- upvalues: u59 (copy), Position (copy), u73 (copy), u74 (copy), Unit (copy)
                        local v76 = Position:Lerp(u73, p75);
                        u59:PivotTo(CFrame.new(v76, u73 + Unit * (p75 * u74 * 10)));
                    end):Play():Wait();
                    u59:Destroy();

                    return;
                end;

                local v77;

                if v66 then
                    v77 = v58;
                else
                    v77 = v63;
                end;

                local v78 = MathUtil.randomFloatMaxInclusive(0, 0.4);
                local v79 = MathUtil.randomFloatMaxInclusive(0, 0.4);
                local u80 = v77 + Vector3.new(v78, v79, MathUtil.randomFloatMaxInclusive(0, 0.4));
                local v81;

                if v66 then
                    v81 = v63;
                else
                    v81 = v58;
                end;

                local v82 = MathUtil.randomFloatMaxInclusive(0, 0.3, true);
                local u83 = v81 + Vector3.new(0, v82, 0);
                local v84;

                if v66 then
                    v84 = MathUtil.randomFloatMaxInclusive(0.3, 0.4);
                else
                    v84 = MathUtil.randomFloatMaxInclusive(0.4, 0.5);
                end;

                default(v84, InQuad, function(p85) -- Line: 194
                    -- upvalues: u80 (copy), u83 (copy), u59 (copy)
                    local v86 = u80:Lerp(u83, p85);
                    u59:PivotTo(CFrame.new(v86, u83 + (u83 - u80).Unit));
                end, 0, 1):Play():Wait();
                v66 = not v66;
            end;
        end);
        u27 = u27;
    end;
end;

return u9;