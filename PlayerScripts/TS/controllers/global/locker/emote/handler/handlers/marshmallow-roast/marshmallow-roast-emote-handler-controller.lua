-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutExpo;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local AccessoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "accessory-util").AccessoryUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "MarshmallowRoastEmoteHandlerController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "MarshmallowRoastEmoteHandlerController";
end;

function u2.KnitStart(p5) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), AccessoryUtil (copy), WeldUtil (copy), Workspace (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), default (copy), InOutExpo (copy), TweenService (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local MARSHMALLOW_ROAST = EmoteType.MARSHMALLOW_ROAST;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 45, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 51
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 55
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, p12, p13, u14) -- Line: 58
        -- upvalues: ReplicatedStorage (ref), AccessoryUtil (ref), WeldUtil (ref), Workspace (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), default (ref), InOutExpo (ref), TweenService (ref)
        if not p12.PrimaryPart then
            return nil;
        end;

        local u15 = ReplicatedStorage.Assets.Misc.MarshmallowRoast.marshmallow:Clone();
        AccessoryUtil:addAccessory(p12, u15);
        u14:GiveTask(u15);
        local u16 = ReplicatedStorage.Assets.Misc.MarshmallowRoast.stick:Clone();
        AccessoryUtil:addAccessory(p12, u16);
        u14:GiveTask(u16);
        WeldUtil:weldCharacterAccessories(p12);
        local u17 = ReplicatedStorage.Assets.Misc.MarshmallowRoast.campfire:Clone();
        local u18 = p12.PrimaryPart.CFrame - Vector3.new(0, p12.Humanoid.HipHeight + p12.PrimaryPart.Size.Y / 2, 0) + p12.PrimaryPart.CFrame.LookVector * Vector3.new(2, 0, 2) - Vector3.new(0, 3, 0);

        local function _(p19) -- Line: 78
            if p19:IsA("BasePart") then
                p19.Transparency = 1;
            end;
        end;

        for i, descendant in u17:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.Transparency = 1;
            end;
        end;

        u17:ScaleTo(0.7);
        u17:PivotTo(u18);
        u17.Parent = Workspace;
        u14:GiveTask(u17);
        local u20 = p12:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.MARSHMALLOW_ROAST_ACTION));
        u20:Play();
        u14:GiveTask(u20:GetMarkerReachedSignal("marshmallow_stuck"):Connect(function() -- Line: 93
            -- upvalues: u15 (copy), u16 (copy), WeldUtil (ref), SoundManager (ref), GameSound (ref)
            local Handle = u15.Handle;
            Handle.RightGripAttachment:Destroy();
            Handle.Parent = u16;
            u15:Destroy();
            WeldUtil:weldParts(Handle, u16.Handle);
            SoundManager:playSound(GameSound.BAGUETTE_HIT, {
                volumeMultiplier = 0.5,
                playbackSpeedMultiplier = 1.5,
                position = Handle.Position
            });
        end));
        u14:GiveTask(u20:GetMarkerReachedSignal("campfire_spawn"):Connect(function() -- Line: 105
            -- upvalues: default (ref), InOutExpo (ref), u17 (copy), u18 (copy), u14 (copy), TweenService (ref), SoundManager (ref), GameSound (ref)
            local u22 = default(1, InOutExpo, function(p21) -- Line: 106
                -- upvalues: u17 (ref), u18 (ref)
                u17:PivotTo(u18:Lerp(u18 + Vector3.new(0, 3, 0), p21));
            end);
            u14:GiveTask(function() -- Line: 112
                -- upvalues: u22 (copy)
                return u22:Cancel();
            end);
            local v23 = u17:GetChildren();

            local function v26(p24) -- Line: 116
                -- upvalues: TweenService (ref), u14 (ref)
                if p24:IsA("BasePart") then
                    local v25 = TweenService:Create(p24, TweenInfo.new(1), {
                        Transparency = 0
                    });
                    v25:Play();
                    u14:GiveTask(v25);
                end;
            end;

            for i, v in v23 do
                v26(v, i - 1, v23);
            end;

            u14:GiveTask(task.spawn(function() -- Line: 128
                -- upvalues: u22 (copy), u17 (ref), u14 (ref), SoundManager (ref), GameSound (ref)
                if u22.Running then
                    u22:Wait();
                end;

                local function _(p27) -- Line: 133
                    if p27:IsA("ParticleEmitter") then
                        p27.Enabled = true;
                    end;
                end;

                for i, descendant in u17.fire:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = true;
                    end;
                end;

                u14:GiveTask(SoundManager:playSound(GameSound.FIRE_LOOP, {
                    volumeMultiplier = 0.5,
                    looped = true,
                    position = u17:GetPivot().Position
                }));
            end));
        end));
        u14:GiveTask(function() -- Line: 148
            -- upvalues: u20 (copy)
            u20:Stop();
            u20:Destroy();
        end);
    end;

    function u7.onDisable(p28, p29, p30, p31) -- Line: 153
    end;

    EmoteHandlerController:registerHandler(MARSHMALLOW_ROAST, u7);
end;

KnitClient.CreateController(u2.new());

return nil;