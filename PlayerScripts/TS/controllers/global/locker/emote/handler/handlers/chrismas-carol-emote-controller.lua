-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "ChrismasCarolEmoteController";
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
    p4.Name = "ChrismasCarolEmoteController";
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), Workspace (copy), RunService (copy), default (copy), InQuad (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local CHRISTMAS_CAROL = EmoteType.CHRISTMAS_CAROL;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 42, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 48
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 52
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, u12, p13, u14) -- Line: 55
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), RunService (ref), default (ref), InQuad (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref)
        local u15 = ReplicatedStorage.Assets.Effects.Book:Clone();
        u14:GiveTask(u15);
        u15.Parent = Workspace;
        p10:setupInstance(u15);
        u14:GiveTask(RunService.Heartbeat:Connect(function(p16) -- Line: 61
            -- upvalues: u12 (copy), Workspace (ref), u15 (copy)
            if u12.Parent ~= Workspace then
                return nil;
            end;

            local PrimaryPart = u12.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.CFrame;
            end;

            if not PrimaryPart then
                return nil;
            end;

            u15:PivotTo(PrimaryPart + PrimaryPart.LookVector * 1.5);
        end));
        local left = u15.PrimaryPart:FindFirstChild("left");
        local right = u15.PrimaryPart:FindFirstChild("right");
        local leftTarget = u15.PrimaryPart:FindFirstChild("leftTarget");
        local rightTarget = u15.PrimaryPart:FindFirstChild("rightTarget");

        if left and right then
            left.PivotOffset = CFrame.new(Vector3.new(-0.5, 0, 0));
            local _ = left.CFrame;
            local _ = right.CFrame;
            default(2, InQuad, function(p17) -- Line: 96
                -- upvalues: left (copy), leftTarget (copy), right (copy), rightTarget (copy)
                left.CFrame = left.CFrame:Lerp(leftTarget.CFrame, p17);
                right.CFrame = right.CFrame:Lerp(rightTarget.CFrame, p17);
            end, 0, 1);
        end;

        local u18 = AnimationUtil:playAnimation(u12, GameAnimationUtil:getAssetId(AnimationType.BOOK_OPEN));

        if not u18 then
            return nil;
        end;

        u14:GiveTask(task.delay(u18.Length - 0.1, function() -- Line: 106
            -- upvalues: u18 (ref), AnimationUtil (ref), u12 (copy), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), u14 (copy)
            u18 = AnimationUtil:playAnimation(u12, GameAnimationUtil:getAssetId(AnimationType.SING_ALONG));

            local function _(p19) -- Line: 110
                -- upvalues: u12 (ref), u14 (ref)
                if p19:IsA("ParticleEmitter") then
                    p19.Parent = u12.PrimaryPart;
                    u14:GiveTask(p19);
                end;
            end;

            for i, child in ReplicatedStorage.Assets.Effects.MusicParticles:Clone():GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child.Parent = u12.PrimaryPart;
                    u14:GiveTask(child);
                end;
            end;
        end));
        u14:GiveTask(function() -- Line: 120
            -- upvalues: u18 (ref)
            local v20 = u18;

            if v20 ~= nil then
                v20:Stop();
            end;

            local v21 = u18;

            if v21 ~= nil then
                v21:Destroy();
            end;
        end);
    end;

    function u7.onDisable(p22, p23, p24, p25) -- Line: 132
    end;

    EmoteHandlerController:registerHandler(CHRISTMAS_CAROL, u7);
end;

KnitClient.CreateController(u2.new());

return nil;