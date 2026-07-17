-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local RunService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SkeletonAnimationController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SkeletonAnimationController";
end;

function u2.KnitStart(u5) -- Line: 34
    -- upvalues: KnitController (copy), default (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), WatchCollectionTag (copy), MonsterType (copy), RunService (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("SkeletonAttack"):Connect(function(p6) -- Line: 36
        -- upvalues: SoundManager (ref), RandomUtil (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local v7;

        if p6 == nil then
            v7 = p6;
        else
            v7 = p6:WaitForChild("Humanoid", 3);

            if v7 ~= nil then
                v7 = v7:WaitForChild("Animator");
            end;
        end;

        if not v7 then
            return nil;
        end;

        SoundManager:playSound(RandomUtil.fromList(GameSound.SKELETON_ATTACK_1, GameSound.SKELETON_ATTACK_2, GameSound.SKELETON_ATTACK_3), {
            volumeMultiplier = 0.3,
            rollOffMaxDistance = 45,
            position = p6:GetPrimaryPartCFrame().Position
        });
        AnimationUtil:playAnimation(v7, GameAnimationUtil:getAssetId(AnimationType.SWORD_SWING));
    end);
    WatchCollectionTag("Monster", function(u8) -- Line: 55
        -- upvalues: MonsterType (ref), SoundManager (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u5 (copy), RunService (ref), RandomUtil (ref)
        if u8:GetAttribute("MonsterType") ~= MonsterType.SKELETON then
            return nil;
        end;

        task.spawn(function() -- Line: 59
            -- upvalues: u8 (copy), SoundManager (ref), GameSound (ref)
            if not u8.PrimaryPart then
                u8:GetPropertyChangedSignal("PrimaryPart"):Wait();
            end;

            if u8.PrimaryPart then
                SoundManager:playSound(GameSound.SKELETON_EMERGE, {
                    rollOffMaxDistance = 120,
                    rollOffMinDistance = 50,
                    position = u8:GetPrimaryPartCFrame().Position
                });
            end;
        end);
        local Humanoid = u8:WaitForChild("Humanoid", 3);
        AnimationUtil:playAnimation(Humanoid:WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.SKELETON_SPAWN));
        local u9 = nil;
        local u10 = u5:setUpAnimationTrack(Humanoid);
        local u11 = -1;
        local u15 = RunService.Heartbeat:Connect(function() -- Line: 78
            -- upvalues: u8 (copy), u9 (ref), u10 (copy), u11 (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            local v12 = u8;

            if not v12 then
                return nil;
            end;

            local HumanoidRootPart = v12.HumanoidRootPart;

            if HumanoidRootPart ~= nil then
                HumanoidRootPart = HumanoidRootPart.AssemblyLinearVelocity.Magnitude;
            end;

            if HumanoidRootPart < 1 and u9 ~= u10.idle then
                local v13 = u9;

                if v13 ~= nil then
                    v13:Stop();
                end;

                u10.idle:Play();
                u9 = u10.idle;
                u11 = time() + math.random(6, 12);

                return;
            end;

            local HumanoidRootPart2 = v12.HumanoidRootPart;

            if HumanoidRootPart2 ~= nil then
                HumanoidRootPart2 = HumanoidRootPart2.AssemblyLinearVelocity.Magnitude;
            end;

            if not (HumanoidRootPart2 > 1 and u9 ~= u10.walk) then
                if u9 == u10.idle and (u11 > 0 and u11 < time()) then
                    u11 = time() + math.random(10, 20);
                    SoundManager:playSound(RandomUtil.fromList(GameSound.SKELETON_IDLE_1, GameSound.SKELETON_IDLE_2, GameSound.SKELETON_IDLE_3, GameSound.SKELETON_IDLE_4), {
                        position = v12:GetPivot().Position
                    });
                end;

                return;
            end;

            local v14 = u9;

            if v14 ~= nil then
                v14:Stop();
            end;

            local walk = u10.walk;

            if walk ~= nil then
                walk:Play();
            end;

            u9 = u10.walk;
            u11 = -1;
        end);

        if u8 then
            u8.Destroying:Once(function() -- Line: 130
                -- upvalues: u15 (copy)
                u15:Disconnect();
            end);
        else
            u15:Disconnect();
        end;
    end);
end;

function u2.setUpAnimationTrack(p16, p17) -- Line: 136
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local Animator = p17:WaitForChild("Animator");
    local v18 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKELETON_WALK));
    v18.Priority = Enum.AnimationPriority.Action;
    local v19 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SKELETON_IDLE));
    v19.Priority = Enum.AnimationPriority.Action;

    return {
        walk = v18,
        idle = v19
    };
end;

KnitClient.CreateController(u2.new());

return nil;