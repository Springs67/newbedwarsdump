-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "MapContestWinnerEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "MapContestWinnerEmoteController";
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), u1 (copy), Workspace (copy), default (copy), Linear (copy), GameAnimationUtil (copy), AnimationType (copy), Players (copy), GameSound (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local MAP_CONTEST_WINNER = EmoteType.MAP_CONTEST_WINNER;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 43, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 49
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 53
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, p13, p14, u15) -- Line: 56
        -- upvalues: ReplicatedStorage (ref), u1 (ref), Workspace (ref), default (ref), Linear (ref), GameAnimationUtil (ref), AnimationType (ref), Players (ref), GameSound (ref)
        math.random(10, 15);
        local u16 = ReplicatedStorage.Assets.Misc.trophy:Clone();
        u16.Parent = p13;
        local u17 = u1("Motor6D", {
            Name = "trophy",
            Enabled = true,
            Parent = p13.RightHand,
            C0 = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)),
            C1 = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)),
            Part0 = p13.RightHand,
            Part1 = u16
        });
        local u18 = u1("Part", {
            Name = "EmotePart",
            Transparency = 1,
            Size = Vector3.new(1, 1, 1),
            Parent = Workspace,
            Position = p13.Head.Position + Vector3.new(0, 6, 0),
            Anchored = true,
            CanCollide = false
        });
        local u19 = ReplicatedStorage.Assets.Misc.TrophyParticles:Clone();
        u19.Parent = u18;
        u19.Enabled = false;
        local u20 = u1("PointLight", {
            Name = "EmotePointLight",
            Brightness = 0,
            Range = 10,
            Enabled = true,
            Parent = u18,
            Color = Color3.fromRGB(255, 184, 74)
        });
        local u22 = default(1, Linear, function(p21) -- Line: 93
            -- upvalues: u20 (copy)
            u20.Brightness = p21;
        end, 0, 2.5);
        local Animator = p13.Humanoid.Animator;
        local u23 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.MAP_TROPHY_THROW));
        local u24 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.MAP_TROPHY_HOLD));
        u23:Play();
        u22:Play();

        if p12 == Players.LocalPlayer.UserId then
            u19.Enabled = true;
        end;

        local u25 = p11:playSound(GameSound.TROPHY_SPARKLES, p12, {
            position = nil,
            looped = true,
            volumeMultiplier = 0.4
        });
        u15:GiveTask(function() -- Line: 109
            -- upvalues: u16 (copy), u17 (copy), u18 (copy), u19 (copy), u20 (copy), u22 (copy), u23 (copy), u25 (copy)
            u16:Destroy();
            u17:Destroy();
            u18:Destroy();
            u19:Destroy();
            u20:Destroy();
            u22:Cancel();
            u23:Stop();
            u23:Destroy();
            u25:Destroy();
        end);
        u23:GetMarkerReachedSignal("freeze"):Connect(function() -- Line: 120
            -- upvalues: u23 (copy), u24 (copy), u15 (copy)
            u23:AdjustSpeed(0);
            u24:Play();
            u23:Stop(1);
            u15:GiveTask(function() -- Line: 124
                -- upvalues: u24 (ref)
                u24:Stop();
                u24:Destroy();
            end);
        end);
    end;

    function u8.onDisable(p26, p27, p28, p29) -- Line: 130
    end;

    EmoteHandlerController:registerHandler(MAP_CONTEST_WINNER, u8);
end;

KnitClient.CreateController(u3.new());

return nil;