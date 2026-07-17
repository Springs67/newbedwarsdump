-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "DismantleKillEffect";
    end,

    __index = KillEffect
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (copy)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, p6) -- Line: 28
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p5, p6);
    KillEffect.setPlayDefaultKillEffect(p5, false);
end;

function u3.onKill(p7, p8, p9, u10) -- Line: 32
    -- upvalues: u1 (copy), Workspace (copy), KillEffect (copy), default (copy), ReplicatedStorage (copy), TweenService (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    local u11 = u1.new();
    task.delay(3, function() -- Line: 34
        -- upvalues: u11 (copy)
        u11:DoCleaning();
    end);
    p9.Archivable = true;
    local u12 = p9:Clone();
    u12.Name = "KillEffectCloneLegs";
    u12.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u12.HumanoidRootPart.Anchored = true;
    u12:PivotTo(u10);
    u12.Parent = Workspace;
    u11:GiveTask(u12);
    local u13 = p9:Clone();
    u13.Name = "KillEffectCloneUpper";
    u13.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
    u13.HumanoidRootPart.Anchored = true;
    u13:PivotTo(u10);
    u13.Parent = Workspace;
    u11:GiveTask(u13);
    KillEffect.hideCharacter(p7, p9);
    local v14 = u12:GetDescendants();
    local v15 = u13:GetDescendants();

    local function v18(p16) -- Line: 57
        local function _(p17) -- Line: 59
            if p17:IsA("BillboardGui") and p17.Name == "Nametag" then
                p17:Destroy();
            end;
        end;

        for i, v in p16 do
            local _ = i - 1;

            if v:IsA("BillboardGui") and v.Name == "Nametag" then
                v:Destroy();
            end;
        end;
    end;

    v18(v14);
    v18(v15);

    local function v28(p19, u20, u21) -- Line: 71
        local function _(p22, p23) -- Line: 72
            -- upvalues: u21 (copy), u20 (copy)
            if p22.Name == "LowerTorso" then
                return u21;
            end;

            if p22.Name == "HumanoidRootPart" then
                return false;
            end;

            if u21 then
                return p23 < u20;
            end;

            return u20 <= p23;
        end;

        local function v27(p24) -- Line: 82
            -- upvalues: u21 (copy), u20 (copy)
            if p24:IsA("BasePart") or p24:IsA("MeshPart") then
                local Y = p24.Position.Y;
                local v25;

                if p24.Name == "LowerTorso" then
                    v25 = u21;
                elseif p24.Name == "HumanoidRootPart" then
                    v25 = false;
                elseif u21 then
                    v25 = Y < u20;
                else
                    v25 = u20 <= Y;
                end;

                if v25 then
                    p24.Transparency = 1;
                end;
            else
                local v26 = p24:IsA("Texture") and string.find(p24.Name, "entity-highlight-texture");

                if v26 ~= 0 and (v26 == v26 and v26) then
                    p24:Destroy();

                    return;
                end;

                if p24:IsA("Highlight") then
                    p24:Destroy();

                    return;
                end;

                if p24:IsA("Decal") and (p24.Name == "face" and not u21) then
                    p24:Destroy();
                end;
            end;
        end;

        for i, v in p19 do
            v27(v, i - 1, p19);
        end;
    end;

    local PrimaryPart = u12.PrimaryPart;
    local PrimaryPart2 = u13.PrimaryPart;

    if not (PrimaryPart and PrimaryPart2) then
        default.Debug("Missing legs or upper primary part", PrimaryPart, PrimaryPart2);
        u11:DoCleaning();

        return u11;
    end;

    local v29 = PrimaryPart2.Position.Y - PrimaryPart2.Size.Y / 2;
    v28(v14, PrimaryPart.Position.Y - PrimaryPart.Size.Y / 2, false);
    v28(v15, v29, true);
    task.spawn(function() -- Line: 115
        -- upvalues: u12 (copy), u13 (copy), ReplicatedStorage (ref), Workspace (ref), u10 (copy), u11 (copy), TweenService (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        local Animator = u12.Humanoid.Animator;
        local Animator2 = u13.Humanoid.Animator;
        local u30 = 0;
        local v31 = false;
        local v32 = { Vector3.new(1, 0, 0), Vector3.new(0, 1, 0), Vector3.new(0, 0, 1) };

        while true do
            if v31 then
                u30 = u30 + 1;
            else
                v31 = true;
            end;

            if u30 >= 3 then
                local u33 = GameAnimationUtil:playAnimation(Animator, AnimationType.DISMANTLE_KILL_EFFECT_LOWER);
                local u34 = GameAnimationUtil:playAnimation(Animator2, AnimationType.DISMANTLE_KILL_EFFECT_UPPER);
                SoundManager:playSound(GameSound.KILL_EFFECT_SLASH, {
                    position = u10.Position
                });
                local v35 = u33;

                if v35 ~= nil then
                    v35:GetMarkerReachedSignal("end"):Connect(function() -- Line: 159
                        -- upvalues: u33 (copy)
                        u33:AdjustSpeed(0);
                    end);
                end;

                if u34 ~= nil then
                    u34:GetMarkerReachedSignal("end"):Connect(function() -- Line: 165
                        -- upvalues: u34 (copy)
                        u34:AdjustSpeed(0);
                    end);
                end;

                u11:GiveTask(function() -- Line: 169
                    -- upvalues: u33 (copy)
                    local v36 = u33;

                    if v36 ~= nil then
                        v36:Destroy();
                    end;
                end);
                u11:GiveTask(function() -- Line: 175
                    -- upvalues: u34 (copy)
                    local v37 = u34;

                    if v37 ~= nil then
                        v37:Destroy();
                    end;
                end);

                return;
            end;

            local u38 = ReplicatedStorage.Assets.Effects.SlashEffect:Clone();
            u38.CanCollide = false;
            u38.Anchored = true;
            u38.Parent = Workspace;
            u38.Size = u38.Size * 3;
            u38.Name = "SlashEffect_" .. tostring(u30);
            local u39 = v32[u30 + 1] * 3;
            u38:PivotTo(u10 + u39);
            u11:GiveTask(u38);
            task.spawn(function() -- Line: 143
                -- upvalues: u30 (ref), TweenService (ref), u38 (copy), u10 (ref), u39 (copy)
                task.wait(u30 * 0.15);
                TweenService:Create(u38, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    CFrame = u10 - u39
                }):Play();
            end);
            u30 = u30;
        end;
    end);

    return u11;
end;

return u3;