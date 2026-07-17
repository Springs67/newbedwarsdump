-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "RavenExplosionKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, p7) -- Line: 31
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, p7);
    p6.ravenPositionMap = {};
    KillEffect.setPlayDefaultKillEffect(p6, false);
end;

function u4.onKill(u8, p9, p10, p11) -- Line: 36
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), RuntimeLib (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), GameQueryUtil (copy)
    local u12 = u2.new();
    p10.Archivable = true;
    local u13 = p10:Clone();
    u13.HumanoidRootPart.Anchored = true;
    u13:PivotTo(p11);
    u13.Parent = Workspace;
    KillEffect.hideCharacter(u8, p10);
    u12:GiveTask(u13);

    local function _(p14) -- Line: 48
        if p14:IsA("GuiObject") then
            p14.Transparency = 1;

            return;
        end;

        if p14:IsA("UIStroke") then
            p14.Transparency = 1;

            return;
        end;

        if p14:IsA("Decal") then
            p14.Transparency = 1;
        end;
    end;

    for i, descendant in u13:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("GuiObject") then
            descendant.Transparency = 1;
        elseif descendant:IsA("UIStroke") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    task.delay(1.2, function() -- Line: 60
        -- upvalues: u13 (copy), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local Humanoid = u13:FindFirstChild("Humanoid");

        if Humanoid ~= nil then
            Humanoid = Humanoid:FindFirstChild("Animator");
        end;

        local v15 = AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.RAVEN_ATTACK_KILL_EFFECT), {
            looped = false
        });

        if v15 ~= nil then
            v15.Stopped:Connect(function() -- Line: 71
                -- upvalues: u13 (ref)
                u13:Destroy();
            end);
        end;
    end);
    local u16 = {};
    local PrimaryPart = u13.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame.LookVector;
    end;

    local PrimaryPart2 = u13.PrimaryPart;

    if PrimaryPart2 ~= nil then
        PrimaryPart2 = PrimaryPart2.CFrame.RightVector;
    end;

    local v17 = false;
    local v18 = 0;

    while true do
        if v17 then
            v18 = v18 + 1;
        else
            v17 = true;
        end;

        if v18 >= 5 then
            local PrimaryPart3 = u13.PrimaryPart;

            if PrimaryPart3 ~= nil then
                PrimaryPart3 = PrimaryPart3.Position;
            end;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart * 15;
            end;

            local v19;

            if PrimaryPart3 == nil then
                v19 = PrimaryPart3;
            else
                v19 = PrimaryPart3 + (PrimaryPart or Vector3.new()) + Vector3.new(0, 10, 0);
            end;

            local v20 = CFrame;
            local v21 = v19 or Vector3.new();
            local PrimaryPart4 = u13.PrimaryPart;

            if PrimaryPart4 ~= nil then
                PrimaryPart4 = PrimaryPart4.Position;
            end;

            if PrimaryPart4 == nil then
                PrimaryPart4 = Vector3.new();
            end;

            local v22 = v20.lookAt(v21, PrimaryPart4);
            local v23 = CFrame;
            local v24 = u16[3];
            local PrimaryPart5 = u13.PrimaryPart;

            if PrimaryPart5 ~= nil then
                PrimaryPart5 = PrimaryPart5.Position;
            end;

            if PrimaryPart5 == nil then
                PrimaryPart5 = Vector3.new();
            end;

            u8:createAndAnimateRaven(v22, v23.lookAt(v24, PrimaryPart5), u12);
            local u35 = RuntimeLib.Promise.delay(2.3):andThen(function() -- Line: 173
                -- upvalues: u16 (copy), PrimaryPart3 (copy), u13 (copy), u8 (copy), u12 (copy)
                local v25 = false;
                local v26 = 0;

                while true do
                    if v25 then
                        v26 = v26 + 1;
                    else
                        v25 = true;
                    end;

                    if v26 >= 5 then
                        return;
                    end;

                    if v26 ~= 2 then
                        local v27 = u16[v26 + 1] - (PrimaryPart3 or Vector3.new());
                        local v28 = v27 / v27.Magnitude * 15;
                        local v29 = PrimaryPart3;

                        if v29 ~= nil then
                            v29 = v29 + v28 + Vector3.new(0, 10, 0);
                        end;

                        local v30 = CFrame;
                        local v31 = v29 or Vector3.new();
                        local PrimaryPart6 = u13.PrimaryPart;

                        if PrimaryPart6 ~= nil then
                            PrimaryPart6 = PrimaryPart6.Position;
                        end;

                        if PrimaryPart6 == nil then
                            PrimaryPart6 = Vector3.new();
                        end;

                        local v32 = v30.lookAt(v31, PrimaryPart6);
                        local v33 = CFrame;
                        local v34 = u16[v26 + 1];
                        local PrimaryPart7 = u13.PrimaryPart;

                        if PrimaryPart7 ~= nil then
                            PrimaryPart7 = PrimaryPart7.Position;
                        end;

                        if PrimaryPart7 == nil then
                            PrimaryPart7 = Vector3.new();
                        end;

                        u8:createAndAnimateRaven(v32, v33.lookAt(v34, PrimaryPart7), u12);
                        task.wait(0.3);
                    end;
                end;
            end);
            u12:GiveTask(function() -- Line: 230
                -- upvalues: u35 (copy)
                return u35:cancel();
            end);
            local u40 = RuntimeLib.Promise.delay(4.6):andThen(function() -- Line: 234
                -- upvalues: u8 (copy), u12 (copy), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref)
                local ravenPositionMap = u8.ravenPositionMap;

                local function v39(p36, p37) -- Line: 236
                    -- upvalues: u12 (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), GameQueryUtil (ref), Workspace (ref)
                    u12:GiveTask(SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                        position = p36
                    }));
                    local v38 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Explosion"):Clone();
                    GameQueryUtil:setQueryIgnored(v38, true);
                    v38.Position = p36;
                    v38.Parent = Workspace;

                    for _, descendant in v38:GetDescendants() do
                        if descendant:IsA("ParticleEmitter") then
                            descendant:Emit(descendant.Rate);
                        end;
                    end;

                    p37:Destroy();
                    u12:GiveTask(v38);
                    task.wait(0.2);
                end;

                for i, v in ravenPositionMap do
                    v39(v, i, ravenPositionMap);
                end;
            end);
            u12:GiveTask(function() -- Line: 258
                -- upvalues: u40 (copy)
                return u40:cancel();
            end);
            task.delay(5.4, function() -- Line: 261
                -- upvalues: u12 (copy)
                u12:DoCleaning();
            end);

            return u12;
        end;

        local v41 = 0.7853981633974483 * v18 - 1.5707963267948966;
        local v42 = math.sin(v41) * 4;
        local v43 = math.cos(v41) * 4;
        local v44;

        if PrimaryPart == nil then
            v44 = PrimaryPart;
        else
            local v45;

            if PrimaryPart2 == nil then
                v45 = PrimaryPart2;
            else
                v45 = PrimaryPart2 * v42;
            end;

            if v45 == nil then
                v45 = Vector3.new();
            end;

            v44 = PrimaryPart * v43 + v45;
        end;

        local PrimaryPart3 = u13.PrimaryPart;

        if PrimaryPart3 ~= nil then
            PrimaryPart3 = PrimaryPart3.Position + (v44 or Vector3.new()) + Vector3.new(0, -1, 0);
        end;

        local v46 = PrimaryPart3 or Vector3.new();
        table.insert(u16, v46);
    end;
end;

function u4.createAndAnimateRaven(p47, p48, p49, p50) -- Line: 266
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), CollectionService (copy), TweenService (copy)
    local v51 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Raven"):WaitForChild("Raven"):Clone();
    v51.Parent = Workspace;

    if v51.PrimaryPart then
        v51.PrimaryPart.CanCollide = false;
        v51.PrimaryPart.Anchored = true;
    end;

    v51:SetAttribute("FromKillEffect", true);
    CollectionService:AddTag(v51, "raven");
    v51:PivotTo(p48);

    if v51.PrimaryPart then
        TweenService:Create(v51.PrimaryPart, TweenInfo.new(2.1, Enum.EasingStyle.Sine), {
            CFrame = p49
        }):Play();
    end;

    p47.ravenPositionMap[v51] = p49.Position;
    p50:GiveTask(v51);
end;

return u4;