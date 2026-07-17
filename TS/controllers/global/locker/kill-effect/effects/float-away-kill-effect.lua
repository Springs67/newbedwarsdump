-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local PhysicsService = v4.PhysicsService;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalloonSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "balloon", "balloon-skin").BalloonSkin;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "FloatAwayKillEffect";
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

function u5.onKill(u9, p10, p11, p12) -- Line: 37
    -- upvalues: u2 (copy), Workspace (copy), KillEffect (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), TweenService (copy), RuntimeLib (copy)
    local u13 = u2.new();
    p11.Archivable = true;
    local u14 = p11:Clone();
    u14.HumanoidRootPart.Anchored = true;
    u14:PivotTo(p12);
    u14.Parent = Workspace;
    KillEffect.hideCharacter(u9, p11);
    u13:GiveTask(u14);
    local _DamageHighlight_ = u14:FindFirstChild("_DamageHighlight_");

    if _DamageHighlight_ then
        _DamageHighlight_:Destroy();
    end;

    local function _(p15) -- Line: 54
        if p15:IsA("GuiObject") then
            p15.Transparency = 1;

            return;
        end;

        if p15:IsA("UIStroke") then
            p15.Transparency = 1;

            return;
        end;

        if p15:IsA("Decal") then
            p15.Transparency = 1;
        end;
    end;

    for i, descendant in u14:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("GuiObject") then
            descendant.Transparency = 1;
        elseif descendant:IsA("UIStroke") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    local Animator = u14:FindFirstChild("Humanoid"):FindFirstChild("Animator");
    local u16 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.FLOAT_AWAY_HIT), {
        looped = false
    });
    u13:GiveTask(function() -- Line: 71
        -- upvalues: u16 (copy)
        local v17 = u16;

        if v17 ~= nil then
            v17 = v17:Destroy();
        end;

        return v17;
    end);

    if u16 ~= nil then
        u16.Stopped:Connect(function() -- Line: 80
            -- upvalues: AnimationUtil (ref), Animator (copy), GameAnimationUtil (ref), AnimationType (ref), u13 (copy)
            local v18 = AnimationUtil:playAnimation(Animator, GameAnimationUtil:getAssetId(AnimationType.FLOAT_AWAY_LOOP), {
                looped = true
            });

            if v18 then
                u13:GiveTask(v18);
            end;
        end);
    end;

    local PrimaryPart = u14.PrimaryPart;

    if not PrimaryPart then
        return u13;
    end;

    local v19 = TweenService:Create(PrimaryPart, TweenInfo.new(5, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
        CFrame = p12 + Vector3.new(0, 200, 0)
    });
    v19:Play();
    u13:GiveTask(v19);
    v19.Completed:Connect(function() -- Line: 101
        -- upvalues: u13 (copy)
        u13:DoCleaning();
    end);
    local u30 = RuntimeLib.Promise.new(function() -- Line: 105
        -- upvalues: u9 (copy), u14 (copy), u13 (copy), TweenService (ref), PrimaryPart (copy)
        local v20 = false;
        local v21 = 0;
        local u22 = {};

        while true do
            if v20 then
                v21 = v21 + 1;
            else
                v20 = true;
            end;

            if v21 >= 3 then
                task.delay(4, function() -- Line: 127
                    -- upvalues: u14 (ref), TweenService (ref), PrimaryPart (ref), u22 (copy)
                    local v23 = u14:GetDescendants();

                    local function v25(p24) -- Line: 129
                        -- upvalues: TweenService (ref), PrimaryPart (ref)
                        if p24:IsA("BasePart") or p24:IsA("Decal") then
                            TweenService:Create(PrimaryPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                                Transparency = 1
                            }):Play();
                        end;
                    end;

                    for i, v in v23 do
                        v25(v, i - 1, v23);
                    end;

                    local v26 = u22;

                    local function v28(p27) -- Line: 140
                        -- upvalues: TweenService (ref)
                        TweenService:Create(p27.Balloon, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            Transparency = 1
                        }):Play();
                    end;

                    for i, v in v26 do
                        v28(v, i - 1, v26);
                    end;
                end);

                return;
            end;

            local v29 = u9:createBalloon(u14);
            table.insert(u22, v29);
            u9:hookBalloon(u14, v29);
            u13:GiveTask(v29);
            task.wait(0.5);
        end;
    end);
    u13:GiveTask(function() -- Line: 150
        -- upvalues: u30 (copy)
        return u30:cancel();
    end);

    return u13;
end;

function u5.createBalloon(p31, p32) -- Line: 155
    -- upvalues: BalloonSkin (copy), RandomUtil (copy), ReplicatedStorage (copy), PhysicsService (copy), u3 (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    local BALLOON_FLOAT_AWAY_SKIN_MODELS = BalloonSkin.BALLOON_FLOAT_AWAY_SKIN_MODELS;
    local v33 = (not BALLOON_FLOAT_AWAY_SKIN_MODELS or #BALLOON_FLOAT_AWAY_SKIN_MODELS <= 0) and "InflatedBalloon" or RandomUtil.fromList(unpack(BALLOON_FLOAT_AWAY_SKIN_MODELS));
    local v34 = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild(v33):Clone();
    v34.Balloon:SetAttribute("IgnoreProjectileCollision", true);
    v34.Balloon:PivotTo(p32.PrimaryPart.CFrame);
    v34.Parent = p32;
    PhysicsService:SetPartCollisionGroup(v34.Balloon, "InflatedBalloons");
    u3("BodyForce", {
        Name = "BodyForce",
        Force = Vector3.new(0, Workspace.Gravity * v34.Balloon.Mass * 1.3, 0),
        Parent = v34.Balloon
    });
    u3("BodyGyro", {
        D = 1000,
        P = 10,
        CFrame = v34.Balloon.CFrame,
        Parent = v34.Balloon
    });
    SoundManager:playSound(GameSound.BALLOON_INFLATE, {
        position = v34.Balloon.Position
    });

    return v34;
end;

function u5.hookBalloon(p35, p36, p37) -- Line: 182
    local RopeConstraint = p37:WaitForChild("RopeConstraint");
    RopeConstraint.Attachment0 = p37.Balloon.Attachment;
    local UpperTorso = p36:FindFirstChild("UpperTorso");

    if UpperTorso ~= nil then
        UpperTorso = UpperTorso:FindFirstChild("BodyBackAttachment");
    end;

    if UpperTorso then
        RopeConstraint.Attachment1 = UpperTorso;
    end;
end;

return u5;