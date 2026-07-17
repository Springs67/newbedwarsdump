-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local MountMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").MountMeta;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "MountAnimationController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "MountAnimationController";
    p4.mountAnimations = {};
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), u1 (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(u5);
    ClientSyncEvents.GenericMountMounted:connect(function(u6) -- Line: 31
        -- upvalues: u1 (ref), u5 (copy), GameAnimationUtil (ref), AnimationType (ref)
        local v7 = u6.model:FindFirstChildOfClass("AnimationController");

        if v7 == nil then
            return nil;
        end;

        local u8 = u1.new();
        local v9 = u5.mountAnimations[u6.player];

        if v9 ~= nil then
            v9:DoCleaning();
        end;

        u5.mountAnimations[u6.player] = u8;
        local u10 = u6.character.Humanoid.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.SIT_ON_DODO_BIRD));
        u10.Priority = Enum.AnimationPriority.Movement;
        u10:Play();
        u8:GiveTask(function() -- Line: 49
            -- upvalues: u10 (copy)
            u10:Stop();
        end);
        u5:makeTracksForMount(v7, u6.mountType):andThen(function(u11) -- Line: 52
            -- upvalues: u8 (copy), u6 (copy)
            local u12 = "idle";
            u11.idle:Play();
            u8:GiveTask(function() -- Line: 55
                -- upvalues: u11 (copy)
                for _, v in pairs(u11) do
                    v:Stop();
                    v:Destroy();
                end;
            end);
            u8:GiveTask(u6.character.Humanoid.Running:Connect(function(p13) -- Line: 61
                -- upvalues: u12 (ref), u11 (copy)
                if p13 >= 1 then
                    if tostring(u12) ~= "walk" then
                        u11[u12]:Stop();
                        u12 = "walk";
                        u11.walk:Play();
                    end;
                else
                    u11[u12]:Stop();
                    u12 = "idle";
                    u11.idle:Play();
                end;
            end));
            u8:GiveTask(u6.character.Humanoid.Jumping:Connect(function(p14) -- Line: 74
                -- upvalues: u11 (copy)
                if p14 and u11.jump.IsPlaying == false then
                    u11.jump:Play();
                end;
            end));
            u8:GiveTask(u6.character.Humanoid.StateChanged:Connect(function(p15, p16) -- Line: 79
                -- upvalues: u11 (copy)
                if p16 ~= Enum.HumanoidStateType.Landed and p16 ~= Enum.HumanoidStateType.Running then
                    if p16 == Enum.HumanoidStateType.FallingDown or p16 == Enum.HumanoidStateType.Freefall then
                        u11.fall:Play();
                    end;

                    return;
                end;

                u11.jump:Stop();
                u11.fall:Stop();
            end));
        end);
    end);
    ClientSyncEvents.GenericMountDismounted:connect(function(p17) -- Line: 89
        -- upvalues: u5 (copy)
        local v18 = u5.mountAnimations[p17.player];

        if v18 ~= nil then
            v18:DoCleaning();
        end;

        u5.mountAnimations[p17.player] = nil;
    end);
end;

u2.makeTracksForMount = RuntimeLib.async(function(p19, p20, p21) -- Line: 101
    -- upvalues: MountMeta (copy), GameAnimationUtil (copy)
    local Animator = p20:WaitForChild("Animator", 2);

    if Animator == nil then
        error("Animator was not added to AnimationController in time");
    end;

    local v22 = MountMeta[p21];
    local v23 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(v22.animations.jump));
    v23.Priority = Enum.AnimationPriority.Action;
    local v24 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(v22.animations.fall));
    v24.Priority = Enum.AnimationPriority.Movement;
    local v25 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(v22.animations.walk));
    v25.Priority = Enum.AnimationPriority.Movement;
    v25:AdjustSpeed(2);
    local v26 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(v22.animations.idle));
    v26.Priority = Enum.AnimationPriority.Idle;

    return {
        jump = v23,
        walk = v25,
        idle = v26,
        fall = v24
    };
end);

function u2.playAnimationInMount(p27, p28, p29, p30, p31) -- Line: 123
    -- upvalues: GameAnimationUtil (copy)
    local v32 = p28:FindFirstChildOfClass("AnimationController");

    if v32 == nil then
        return nil;
    end;

    local v33 = v32:FindFirstChildOfClass("Animator");

    if v33 == nil then
        return nil;
    end;

    local v34 = v33:LoadAnimation(GameAnimationUtil:getAnimation(p29));

    if p31 ~= nil then
        v34.Looped = p31;
    end;

    v34:Play();

    if p30 ~= 0 and (p30 == p30 and p30) then
        v34:AdjustSpeed(p30);
    end;

    return v34;
end;

KnitClient.CreateController(u2.new());

return nil;