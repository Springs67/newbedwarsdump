-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local ConstantManager = v1.ConstantManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local RunService = v4.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local u5 = ConstantManager.registerConstants(script, {
    DodoSquawkFrequencyRange = NumberRange.new(15, 30)
});
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "DodoBirdAnimationController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 30
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8, ...);
    p8.Name = "DodoBirdAnimationController";
    p8.dodoBirdMountMaids = {};
    p8.dodoBirdAnimationData = {};
end;

function u6.KnitStart(u9) -- Line: 40
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), Players (copy), u3 (copy), RunService (copy), u5 (copy), KnitClient2 (copy), CollectionService (copy)
    KnitController.KnitStart(u9);
    CollectionTagAdded("dodo-bird-mount", function(u10) -- Line: 42
        -- upvalues: Players (ref), u3 (ref), u9 (copy), RunService (ref), u5 (ref), KnitClient2 (ref)
        local Parent = u10.Parent;

        if Parent ~= nil and Players:GetPlayerFromCharacter(Parent) ~= nil then
            local u11 = u3.new();
            u9.dodoBirdMountMaids[u10] = u11;
            u9:makeTracksForDodoBirdMount(u10):andThen(function(u12) -- Line: 49
                -- upvalues: u11 (copy), Parent (copy), RunService (ref), u10 (copy), u5 (ref), KnitClient2 (ref)
                local u13 = "idle";
                u12.idle:Play();
                u11:GiveTask(function() -- Line: 52
                    -- upvalues: u12 (copy)
                    for _, v in pairs(u12) do
                        v:Destroy();
                    end;
                end);
                u11:GiveTask(Parent.Humanoid.Running:Connect(function(p14) -- Line: 57
                    -- upvalues: u12 (copy), u13 (ref)
                    u12[u13]:Stop();

                    if p14 >= 1 then
                        u13 = "walk";
                        u12.walk:Play();

                        return;
                    end;

                    u13 = "idle";
                    u12.idle:Play();
                end));
                u11:GiveTask(Parent.Humanoid.Jumping:Connect(function(p15) -- Line: 67
                    -- upvalues: u12 (copy)
                    if p15 and u12.jump.IsPlaying == false then
                        u12.jump:Play();
                    end;
                end));
                u11:GiveTask(Parent.Humanoid.StateChanged:Connect(function(p16, p17) -- Line: 72
                    -- upvalues: u12 (copy)
                    if p17 ~= Enum.HumanoidStateType.Landed then
                        if p17 == Enum.HumanoidStateType.FallingDown or p17 == Enum.HumanoidStateType.Freefall then
                            u12.falling:Play();
                        end;

                        return;
                    end;

                    u12.jump:Stop();
                    u12.falling:Stop();
                end));
                u11:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 80
                    -- upvalues: u10 (ref), u5 (ref), u13 (ref), KnitClient2 (ref), u12 (copy)
                    if u10:GetAttribute("NextSquawk") < time() then
                        u10:SetAttribute("NextSquawk", time() + math.random(u5.DodoSquawkFrequencyRange.Min, u5.DodoSquawkFrequencyRange.Max));

                        if u13 == "idle" then
                            KnitClient2.Controllers.DodoBirdEffectController:playSquawkSound(u10);
                            u12.squawk:Play();
                        end;
                    end;
                end));
            end);
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("dodo-bird-mount"):Connect(function(p18) -- Line: 93
        -- upvalues: u9 (copy)
        local v19 = u9.dodoBirdMountMaids[p18];

        if v19 then
            v19:DoCleaning();
            u9.dodoBirdMountMaids[p18] = nil;
        end;
    end);
    CollectionTagAdded("dodo-bird", function(u20) -- Line: 101
        -- upvalues: u9 (copy)
        u9:makeTracksForDodoBird(u20):andThen(function(p21) -- Line: 104
            -- upvalues: u9 (ref), u20 (copy)
            u9.dodoBirdAnimationData[u20] = {
                state = "idle",
                tracks = p21
            };
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("dodo-bird"):Connect(function(p22) -- Line: 114
        -- upvalues: u9 (copy)
        u9.dodoBirdAnimationData[p22] = nil;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 118
        -- upvalues: CollectionService (ref), u9 (copy), u5 (ref), KnitClient2 (ref)
        for _, v in CollectionService:GetTagged("dodo-bird") do
            local v23 = u9.dodoBirdAnimationData[v];

            if v23 ~= nil then
                local state = v23.state;
                local tracks = v23.tracks;

                if v.RootPart.AssemblyLinearVelocity.Magnitude > 1 then
                    v23.state = "walk";
                else
                    v23.state = "idle";
                end;

                if v23.state ~= state then
                    tracks[state]:Stop();
                    tracks[v23.state]:Play();
                end;

                if v:GetAttribute("NextSquawk") < time() then
                    v:SetAttribute("NextSquawk", time() + math.random(u5.DodoSquawkFrequencyRange.Min, u5.DodoSquawkFrequencyRange.Max));

                    if v23.state == "idle" then
                        KnitClient2.Controllers.DodoBirdEffectController:playSquawkSound(v);
                        tracks.squawk:Play();
                    end;
                end;
            end;
        end;
    end);
end;

u6.makeTracksForDodoBirdMount = RuntimeLib.async(function(p24, p25) -- Line: 146
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local AnimationController = p25:WaitForChild("AnimationController", 2);

    if AnimationController == nil then
        error("AnimationController was not added to dodoBirdMount in time");
    end;

    local Animator = AnimationController:WaitForChild("Animator", 2);

    if Animator == nil then
        error("Animator was not added to AnimationController in time");
    end;

    local v26 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_FLUTTER));
    v26.Priority = Enum.AnimationPriority.Action;
    local v27 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_FALL));
    v27.Priority = Enum.AnimationPriority.Movement;
    local v28 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_WALK));
    v28.Priority = Enum.AnimationPriority.Movement;
    v28:AdjustSpeed(2);
    local v29 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_IDLE));
    v29.Priority = Enum.AnimationPriority.Idle;
    local v30 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_SQUAWK));
    v30.Looped = false;
    v30.Priority = Enum.AnimationPriority.Action;

    return {
        jump = v26,
        walk = v28,
        idle = v29,
        falling = v27,
        squawk = v30
    };
end);
u6.makeTracksForDodoBird = RuntimeLib.async(function(p31, p32) -- Line: 175
    -- upvalues: GameAnimationUtil (copy), AnimationType (copy)
    local AnimationController = p32:WaitForChild("AnimationController", 2);

    if AnimationController == nil then
        error("AnimationController was not added to dodoBirdMount in time");
    end;

    local Animator = AnimationController:WaitForChild("Animator", 2);

    if Animator == nil then
        error("Animator was not added to AnimationController in time");
    end;

    local v33 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_SQUAWK));
    v33.Looped = false;

    return {
        walk = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_WALK)),
        idle = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_IDLE)),
        squawk = v33
    };
end);
KnitClient.CreateController(u6.new());

return nil;