-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutQuad = v2.InOutQuad;
local InQuad = v2.InQuad;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "JellyfishKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 36
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(u9, p10, u11, u12) -- Line: 40
    -- upvalues: u3 (copy), RuntimeLib (copy), Workspace (copy), KillEffect (copy), GameSound (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), OutQuad (copy), SoundManager (copy), RandomUtil (copy), InOutQuad (copy), InQuad (copy)
    local u13 = u3.new();
    local u29 = RuntimeLib.Promise.new(function() -- Line: 42
        -- upvalues: u11 (copy), Workspace (ref), u13 (copy), KillEffect (ref), u9 (copy), GameSound (ref), ReplicatedStorage (ref), u12 (copy), GameAnimationUtil (ref), AnimationType (ref), default (ref), OutQuad (ref), SoundManager (ref), RandomUtil (ref), InOutQuad (ref), InQuad (ref)
        u11.Archivable = true;
        local v14 = u11:Clone();
        v14.HumanoidRootPart.Anchored = true;
        v14.Parent = Workspace;
        u13:GiveTask(v14);
        local _DamageHighlight_ = v14:FindFirstChild("_DamageHighlight_");

        if _DamageHighlight_ then
            _DamageHighlight_:Destroy();
        end;

        KillEffect.hideCharacter(u9, u11);
        local v15 = { GameSound.JELLYFISH_DEPLOY_1, GameSound.JELLYFISH_DEPLOY_2, GameSound.JELLYFISH_DEPLOY_3 };
        local _ = { GameSound.JELLYFISH_ZAP_1, GameSound.JELLYFISH_ZAP_2 };
        local _ = {
            GameSound.JELLYFISH_PULSE_2,
            GameSound.JELLYFISH_PULSE_3,
            GameSound.JELLYFISH_PULSE_4,
            GameSound.JELLYFISH_PULSE_5
        };
        local u16 = ReplicatedStorage.Assets.Misc.Jellyfish:Clone();
        u13:GiveTask(u16);
        u16:ScaleTo(4);
        u16:WaitForChild("RootPart");

        local function _(p17) -- Line: 66
            if p17:IsA("MeshPart") then
                p17.LocalTransparencyModifier = 1;
            end;
        end;

        for i, child in u16:GetChildren() do
            local _ = i - 1;

            if child:IsA("MeshPart") then
                child.LocalTransparencyModifier = 1;
            end;
        end;

        u16:PivotTo(CFrame.new(u12.Position + Vector3.new(0, 15, 0)));
        u16.Parent = Workspace;
        local AnimationController = Instance.new("AnimationController");
        AnimationController.Parent = u16;
        local Animator = Instance.new("Animator");
        Animator.Parent = AnimationController;
        Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_SPAWN));
        local v18 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_MOUNT_IDLE));
        Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.JELLYFISH_ATTACK));
        v18:Play();
        task.spawn(function() -- Line: 92
            -- upvalues: u16 (copy), default (ref), OutQuad (ref)
            local v19 = u16:GetChildren();

            local function v22(u20) -- Line: 94
                -- upvalues: default (ref), OutQuad (ref)
                if u20:IsA("MeshPart") then
                    u20.LocalTransparencyModifier = 1;
                    default(1.5, OutQuad, function(p21) -- Line: 97
                        -- upvalues: u20 (copy)
                        u20.LocalTransparencyModifier = p21;

                        return u20.LocalTransparencyModifier;
                    end, 1, 0):Play();
                end;
            end;

            for i, v in v19 do
                v22(v, i - 1, v19);
            end;
        end);
        local Position = u16:GetPivot().Position;
        SoundManager:playSound(RandomUtil.fromList(unpack(v15)), {
            position = Position
        });
        local u23 = u12.Position + Vector3.new(0, 0, 0);
        default(2, InOutQuad, function(p24) -- Line: 116
            -- upvalues: Position (copy), u23 (copy), u16 (copy)
            local v25 = Position:Lerp(u23, p24);
            u16:PivotTo(CFrame.new(v25));
        end, 0, 1):Play():Wait();
        v14.Parent = u16;
        local u26 = u23 + Vector3.new(0, 200, 0);
        default(4.5, InQuad, function(p27) -- Line: 125
            -- upvalues: u23 (copy), u26 (copy), u16 (copy)
            local v28 = u23:Lerp(u26, p27);
            u16:PivotTo(CFrame.new(v28));
        end, 0, 1):Play():Wait();
        u13:Destroy();
    end);
    u13:GiveTask(function() -- Line: 132
        -- upvalues: u29 (copy)
        return u29:cancel();
    end);

    return u13;
end;

return u5;