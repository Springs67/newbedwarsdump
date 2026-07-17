-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local FireworkType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "FireworkCrateController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "FireworkCrateController";
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u5);
    default2.Client:Get("FireworkLaunch"):Connect(function(p6) -- Line: 34
        -- upvalues: u5 (copy)
        u5:launchFirework(p6.block.Position);
    end);
    default2.Client:Get("FireworkCratePlaced"):Connect(function(p7) -- Line: 38
        -- upvalues: SoundManager (ref), GameSound (ref)
        SoundManager:playSound(GameSound.TNT_HISS_1, {
            fadeOutTime = 2,
            position = p7.position
        });
    end);
end;

function u2.launchFirework(p8, u9) -- Line: 45
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), default (copy), Linear (copy), SoundManager (copy), GameSound (copy), KnitClient (copy), FireworkType (copy)
    local u10 = u9 + Vector3.new(0, 48, 0);
    local u11 = ReplicatedStorage.Assets.Effects.NewYearsFireworkRocket:Clone();
    u11.Parent = Workspace;
    u11:PivotTo(CFrame.new(u9));
    default(1, Linear, function(p12) -- Line: 52
        -- upvalues: u9 (copy), u10 (copy), u11 (copy)
        local v13 = u9:Lerp(u10, p12);
        u11:PivotTo(CFrame.new(v13));
        u11.Transparency = p12;
    end):Play();
    SoundManager:playSound(GameSound.FIREWORK_LAUNCH, {
        position = u9
    });
    local u14 = SoundManager:playSound(GameSound.FIREWORK_TRAIL, {
        looped = true,
        position = u11.CFrame.Position
    });
    task.delay(1, function() -- Line: 65
        -- upvalues: u14 (copy), u11 (copy), KnitClient (ref), u10 (copy), FireworkType (ref)
        local v15 = u14;

        if v15 ~= nil then
            v15:Destroy();
        end;

        u11:Destroy();
        KnitClient.Controllers.FireworkController:playFireworkEffect(u10, FireworkType.FIREWORK_CRATE, {
            sizeMultiplier = 0.9,
            volumeMultiplier = 0.6,
            popSoundPlaybackSpeedMultiplier = 1
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;