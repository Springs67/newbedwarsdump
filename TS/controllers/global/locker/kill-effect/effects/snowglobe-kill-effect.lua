-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local MathExtras = v1.MathExtras;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v2.InOutExpo;
local Linear = v2.Linear;
local OutExpo = v2.OutExpo;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "SnowglobeKillEffect";
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

function u5.onKill(p9, p10, p11, u12) -- Line: 37
    -- upvalues: u3 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), default (copy), Linear (copy), MathExtras (copy), TweenService (copy), InOutExpo (copy), SoundManager (copy), GameSound (copy), OutExpo (copy)
    local u13 = u3.new();
    local u14 = p11:Clone();
    u14.Parent = Workspace;

    if u14.PrimaryPart then
        u14.PrimaryPart.Anchored = true;
    end;

    local function _(p15) -- Line: 45
        if p15:IsA("Part") then
            p15.CanCollide = false;
            p15.CanQuery = false;
            p15.CanTouch = false;
        end;
    end;

    for i, descendant in u14:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    KillEffect.hideCharacter(p9, p11);
    local u16 = ReplicatedStorage.Assets.Misc.SnowglobeKillEffect:Clone();
    u16:PivotTo(u12);
    u16.Parent = Workspace;
    u13:GiveTask(u16);
    local u17 = 0;

    local function _(p18, p19, p20) -- Line: 62
        -- upvalues: u17 (ref)
        if not p18:IsA("BasePart") then
            return false;
        end;

        u17 = u17 + p18.Size.Magnitude;
        p18.Transparency = 1;

        return true;
    end;

    local v21 = 0;
    local u22 = {};

    for i, descendant in u16.Root:GetDescendants() do
        local _ = i - 1;
        local v23;

        if descendant:IsA("BasePart") then
            u17 = u17 + descendant.Size.Magnitude;
            descendant.Transparency = 1;
            v23 = true;
        else
            v23 = false;
        end;

        if v23 == true then
            v21 = v21 + 1;
            u22[v21] = descendant;
        end;
    end;

    local function _(p24) -- Line: 81
        local v25 = string.split(p24, "_")[1];
        local v26 = tonumber(v25);

        if v26 == nil then
            error("Invalid name: " .. p24);
        end;

        return v26;
    end;

    local v27 = {};

    for _, v in u22 do
        local v28 = false;

        for _, v3 in v27 do
            local function _(p29) -- Line: 92
                -- upvalues: v (copy)
                local Name = p29.Name;
                local v30 = string.split(Name, "_")[1];
                local v31 = tonumber(v30);

                if v31 == nil then
                    error("Invalid name: " .. Name);
                end;

                local Name2 = v.Name;
                local v32 = string.split(Name2, "_")[1];
                local v33 = tonumber(v32);

                if v33 == nil then
                    error("Invalid name: " .. Name2);
                end;

                return v31 == v33;
            end;

            local v34 = nil;

            for i, v5 in v3 do
                local _ = i - 1;
                local Name = v5.Name;
                local v35 = string.split(Name, "_")[1];
                local v36 = tonumber(v35);

                if v36 == nil then
                    error("Invalid name: " .. Name);
                end;

                local Name2 = v.Name;
                local v37 = string.split(Name2, "_")[1];
                local v38 = tonumber(v37);

                if v38 == nil then
                    error("Invalid name: " .. Name2);
                end;

                if v36 == v38 == true then
                    v34 = v5;
                    break;
                end;
            end;

            if v34 then
                table.insert(v3, v);
                v28 = true;
            end;
        end;

        if not v28 then
            table.insert(v27, { v });
        end;
    end;

    table.sort(v27, function(p39, p40) -- Line: 117
        local Name = p39[1].Name;
        local v41 = string.split(Name, "_")[1];
        local v42 = tonumber(v41);

        if v42 == nil then
            error("Invalid name: " .. Name);
        end;

        local Name2 = p40[1].Name;
        local v43 = string.split(Name2, "_")[1];
        local v44 = tonumber(v43);

        if v44 == nil then
            error("Invalid name: " .. Name2);
        end;

        return v42 < v44;
    end);
    local u45 = v27;
    local u46 = u14:GetScale();
    local u47 = u14:GetPivot();
    local u49 = default(1, Linear, function(p48) -- Line: 124
        -- upvalues: u14 (copy), MathExtras (ref), u46 (copy), u47 (copy)
        u14:ScaleTo(MathExtras:lerp(u46, 0.1, p48));
        u14:PivotTo(u47:Lerp(u47 - Vector3.new(0, 0.4, 0), p48));
    end);
    u13:GiveTask((task.spawn(function() -- Line: 131
        -- upvalues: u49 (copy), u13 (copy), u45 (ref), u17 (ref), TweenService (ref), u14 (copy), u16 (copy), default (ref), InOutExpo (ref), u12 (copy), ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), OutExpo (ref), u22 (copy)
        u49:Wait();
        u13:GiveTask(task.spawn(function() -- Line: 133
            -- upvalues: u45 (ref), u17 (ref), TweenService (ref), u13 (ref)
            for _, v in u45 do
                local function _(p50, p51) -- Line: 135
                    return p50 + p51.Size.Magnitude;
                end;

                local v52 = 0;

                for i = 1, #v do
                    local _ = i - 1;
                    v52 = v52 + v[i].Size.Magnitude;
                end;

                for _, v3 in v do
                    local CFrame2 = v3.CFrame;
                    v3.CFrame = CFrame2 + Vector3.new(0, 5, 0);
                    local v53 = TweenService:Create(v3, TweenInfo.new(1), {
                        Transparency = 0,
                        CFrame = CFrame2
                    });
                    u13:GiveTask(v53);
                    v53:Play();
                end;

                task.wait(v52 / u17 * 3);
            end;
        end));
        task.delay(3.5, function() -- Line: 161
            -- upvalues: u14 (ref), u16 (ref), default (ref), InOutExpo (ref), u12 (ref), ReplicatedStorage (ref), SoundManager (ref), GameSound (ref), OutExpo (ref), TweenService (ref), u22 (ref)
            u14.Parent = u16;
            local v56 = default(1, InOutExpo, function(p54) -- Line: 163
                -- upvalues: u16 (ref), u12 (ref)
                local Angles = CFrame.Angles;
                local v55 = math.sin(p54 * 2 * 3.141592653589793 * 1.5) * 30;
                u16:PivotTo(u12 * Angles(0, 0, (math.rad(v55))));
            end);
            local u57 = ReplicatedStorage.Assets.Effects.Snowflake:Clone();
            u57.Parent = u16.Root["32_globe_outer"];
            u57.Enabled = true;
            u57.Lifetime = NumberRange.new(1.5, 2.5);
            u57.Speed = NumberRange.new(0.25, 0.75);
            u57.Drag = 0.15;
            u57.EmissionDirection = Enum.NormalId.Bottom;
            u57.Size = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.5, 0.25, 0.05), NumberSequenceKeypoint.new(1, 0) });
            u57.Rate = 10;
            SoundManager:playSound(GameSound.SANTA_BELLS, {
                playbackSpeedMultiplier = 1.5,
                position = u12.Position
            });
            v56:Wait();
            task.wait(1.5);
            task.spawn(function() -- Line: 184
                -- upvalues: default (ref), OutExpo (ref), u57 (copy)
                default(1, OutExpo, function(p58) -- Line: 185
                    -- upvalues: u57 (ref)
                    u57.Transparency = NumberSequence.new(p58);
                end);
            end);

            local function _(p59) -- Line: 189
                -- upvalues: TweenService (ref)
                TweenService:Create(p59, TweenInfo.new(1), {
                    Transparency = 1
                }):Play();
            end;

            for i, v in u22 do
                local _ = i - 1;
                TweenService:Create(v, TweenInfo.new(1), {
                    Transparency = 1
                }):Play();
            end;

            local v60 = u14:GetDescendants();

            local function v62(p61) -- Line: 198
                -- upvalues: TweenService (ref)
                if p61:IsA("BasePart") then
                    TweenService:Create(p61, TweenInfo.new(1), {
                        Transparency = 1
                    }):Play();
                end;
            end;

            for i, v in v60 do
                v62(v, i - 1, v60);
            end;

            task.delay(1, function() -- Line: 208
                -- upvalues: u16 (ref)
                return u16:Destroy();
            end);
        end);
    end)));
    u13:GiveTask(function() -- Line: 214
        -- upvalues: u49 (copy)
        u49:Cancel();
    end);

    return u13;
end;

return u5;