-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = {
    Color3.fromRGB(255, 115, 115),
    Color3.fromRGB(255, 188, 105),
    Color3.fromRGB(251, 255, 124),
    Color3.fromRGB(150, 255, 129),
    Color3.fromRGB(101, 201, 255),
    Color3.fromRGB(140, 120, 255),
    Color3.fromRGB(255, 139, 255)
};
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "RainbowBowController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "RainbowBowController";
end;

function u3.KnitStart(u6) -- Line: 33
    -- upvalues: KnitController (copy), ClientSyncEvents (copy), KnitClient (copy), default (copy)
    KnitController.KnitStart(u6);
    ClientSyncEvents.ProjectileRender:connect(function(p7) -- Line: 36
        if p7.projectile.Name == "rainbow_arrow" then
            p7.cframe = p7.cframe * CFrame.Angles(0, p7.totalTime * 0.5 * 3.141592653589793, 0);
        end;
    end);
    ClientSyncEvents.ProjectileLaunched:connect(function(p8) -- Line: 44
        -- upvalues: KnitClient (ref)
        if p8.projectile.Name ~= "rainbow_arrow" then
            return nil;
        end;

        if not p8:isLocalShooter() then
            return nil;
        end;

        if KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            local Handle = p8.projectile:FindFirstChild("Handle");

            if Handle ~= nil then
                local function _(p9) -- Line: 55
                    if p9:IsA("Trail") then
                        p9.Lifetime = p9.Lifetime / 2;
                        p9.Transparency = NumberSequence.new(0.6);
                    end;
                end;

                for i, child in Handle:GetChildren() do
                    local _ = i - 1;

                    if child:IsA("Trail") then
                        child.Lifetime = child.Lifetime / 2;
                        child.Transparency = NumberSequence.new(0.6);
                    end;
                end;
            end;
        end;
    end);
    default.Client:WaitFor("RainbowExplode"):andThen(function(p10) -- Line: 69
        -- upvalues: u6 (copy)
        p10:Connect(function(p11) -- Line: 70
            -- upvalues: u6 (ref)
            u6:playExplosion(p11.position, 2, Color3.fromRGB(255, 255, 255));
            u6:playSplitEffects(p11.position, p11.offsets, p11.duration, p11.explosionDelay);
        end);
    end);
end;

function u3.playExplosion(p12, p13, p14, u15) -- Line: 77
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy)
    local u16 = ReplicatedStorage.Assets.Effects.RainbowExplosion:Clone();
    u16.Parent = Workspace;

    local function _(p17) -- Line: 81
        -- upvalues: u15 (copy)
        if p17.Name == "Color" then
            p17.Color = ColorSequence.new(u15);
        end;
    end;

    for i, child in u16.ParticleAttachment:GetChildren() do
        local _ = i - 1;

        if child.Name == "Color" then
            child.Color = ColorSequence.new(u15);
        end;
    end;

    EffectUtil:playEffects({ u16 }, nil, {
        sizeMultiplier = p14
    });
    u16:PivotTo(CFrame.new(p13));
    SoundManager:playSound(GameSound.RAINBOW_EXPLODE, {
        rollOffMaxDistance = 300,
        position = p13
    });
    task.delay(2, function() -- Line: 98
        -- upvalues: u16 (copy)
        u16:Destroy();
    end);
end;

function u3.playSplitEffects(u18, p19, p20, u21, u22) -- Line: 102
    -- upvalues: ReplicatedStorage (copy), u2 (copy), Workspace (copy), TweenService (copy)
    local u23 = 0;
    local v24 = false;

    while true do
        if v24 then
            u23 = u23 + 1;
        else
            v24 = true;
        end;

        if u23 >= #p20 then
            return;
        end;

        local u25 = ReplicatedStorage.Assets.Misc.RainbowSplit:Clone();
        local u26 = u2[u23 + 1] or u2[1];
        u25.CFrame = CFrame.new(p19);
        local Neon = u25:FindFirstChild("Neon");
        Neon.Color = u26;
        Neon.CFrame = CFrame.new(p19);
        Neon:FindFirstChild("Trail").Color = ColorSequence.new(u26);
        u25.Parent = Workspace;
        local u27 = Neon.Position + p20[u23 + 1];
        local u28 = u27 - Vector3.new(1, 3, -1);
        local u29 = u27 - Vector3.new(-1, 2, 1);
        task.spawn(function() -- Line: 135
            -- upvalues: u23 (ref), u22 (copy), TweenService (ref), Neon (ref), u21 (copy), u28 (copy), u29 (copy), u27 (copy)
            task.wait(u23 * u22);
            TweenService:Create(Neon, TweenInfo.new(u21 / 3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Position = u28,
                Size = Neon.Size * 0.1
            }):Play();
            task.wait(u21 / 3);
            TweenService:Create(Neon, TweenInfo.new(u21 / 3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Position = u29,
                Size = Neon.Size * 0.1
            }):Play();
            task.wait(u21 / 3);
            TweenService:Create(Neon, TweenInfo.new(u21 / 3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Position = u27,
                Size = Neon.Size * 0.1
            }):Play();
        end);
        task.delay(u21 + u23 * u22, function() -- Line: 153
            -- upvalues: u18 (copy), u27 (copy), u26 (copy), u25 (copy)
            u18:playExplosion(u27, 1, u26);
            u25:Destroy();
        end);
        u23 = u23;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;