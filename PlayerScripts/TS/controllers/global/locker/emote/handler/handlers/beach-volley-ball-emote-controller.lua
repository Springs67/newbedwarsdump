-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BeachVolleyBallEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "BeachVolleyBallEmoteController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), RandomUtil (copy), SoundManager (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local BEACH_VOLLEY_BALL = EmoteType.BEACH_VOLLEY_BALL;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 42, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 48
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 52
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, p13, p14, p15) -- Line: 55
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), RandomUtil (ref), SoundManager (ref)
        if not p13.PrimaryPart then
            return nil;
        end;

        local u16 = ReplicatedStorage.Assets.Misc.BeachVolleyBall:Clone();

        local function _(p17) -- Line: 61
            -- upvalues: u16 (copy)
            if p17:IsA("BasePart") then
                p17.Transparency = 1;
                u16.ball.Anchored = true;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Transparency = 1;
                u16.ball.Anchored = true;
            end;
        end;

        u16.Parent = Workspace;

        local function _(p18) -- Line: 72
            if p18:IsA("BasePart") then
                p18.Transparency = 0;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Transparency = 0;
            end;
        end;

        local v19 = p13:GetPivot();
        local v20 = Vector3.new(0, p13.Humanoid.HipHeight + p13.PrimaryPart.Size.Y / 2, 0);
        local v21 = CFrame.Angles(0, 3.141592653589793, 0);
        u16:PivotTo((v19 - v20) * v21);
        local u22 = u16.AnimationController.Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.BEACH_VOLLEY_BALL_BALL));
        local u23 = {
            GameSound.BEACH_VOLLEY_BALL_HIT_1,
            GameSound.BEACH_VOLLEY_BALL_HIT_2,
            GameSound.BEACH_VOLLEY_BALL_HIT_3,
            GameSound.BEACH_VOLLEY_BALL_HIT_4
        };
        p15:GiveTask(u22:GetMarkerReachedSignal("bounce"):Connect(function() -- Line: 88
            -- upvalues: RandomUtil (ref), u23 (copy), SoundManager (ref), u16 (copy)
            SoundManager:playSound(RandomUtil.fromList(unpack(u23)), {
                volumeMultiplier = 0.7,
                position = u16:GetPivot().Position
            });
        end));
        u22:Play();
        p15:GiveTask(function() -- Line: 96
            -- upvalues: u22 (copy)
            u22:Stop();
            u22:Destroy();
        end);
        p15:GiveTask(u16);
    end;

    function u8.onDisable(p24, p25, p26, p27) -- Line: 102
    end;

    EmoteHandlerController:registerHandler(BEACH_VOLLEY_BALL, u8);
end;

KnitClient.CreateController(u3.new());

return nil;