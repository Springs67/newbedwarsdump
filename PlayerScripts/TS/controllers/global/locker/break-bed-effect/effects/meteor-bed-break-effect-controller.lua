-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "MeteorBreakBedEffect";
    end,

    __index = BreakBedEffectController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p6, BedBreakEffectType.METEOR);
    p6.Name = "MeteorBreakBedEffect";
end;

function u4.KnitStart(p7) -- Line: 34
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p7);
end;

function u4.onBedBreak(u8, p9, u10, p11) -- Line: 37
    -- upvalues: u1 (copy), ReplicatedStorage (copy), Workspace (copy), TweenService (copy), KnitClient (copy), u2 (copy), SoundManager (copy), GameSound (copy), RunService (copy), EffectUtil (copy)
    local v12 = Random.new(math.random());
    local u13 = u1.new();
    u8.maid:GiveTask(u13);
    local Position = u10.Position;
    local v14 = math.random(-20, 20);
    local v15 = Position + Vector3.new(v14, 45, math.random(-20, 20));
    local u16 = ReplicatedStorage.Assets.Effects.Meteor:Clone();
    local u17 = CFrame.new(v15, u10.Position);
    local u18 = Workspace:GetServerTimeNow();
    local u19 = u18 + 1;
    u16:PivotTo(u17);
    u16.Parent = Workspace;
    u8.maid:GiveTask(u16);
    local u20 = ReplicatedStorage.Assets.Effects.CosmicMeteorIndicator:Clone();
    u20.Position = u10.Position + Vector3.new(0, -1.5, 0) + Vector3.new(0, 0, 0);
    u20.Parent = Workspace;
    u20.Size = Vector3.new(0, 0, 0);
    TweenService:Create(u20, TweenInfo.new(1, Enum.EasingStyle.Linear), {
        Size = Vector3.new(6, 0, 6)
    }):Play();
    u8.maid:GiveTask(u20);
    local SurfaceGui = u20:FindFirstChild("SurfaceGui");

    if SurfaceGui ~= nil then
        SurfaceGui = SurfaceGui:FindFirstChild("ImageLabel");
    end;

    SurfaceGui.ImageTransparency = 1;

    if SurfaceGui then
        TweenService:Create(SurfaceGui, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            ImageTransparency = 0.6
        }):Play();
    end;

    local u21 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p11);
    local u22;

    if u21 == nil then
        u22 = u21;
    else
        u22 = u21:WaitForChild("Root", 1);
    end;

    u21:PivotTo(u10);
    u8.maid:GiveTask(u21);

    if u21 and u22 then
        u21.Parent = Workspace;
        local Root = u21:FindFirstChild("Root");

        if Root ~= nil then
            local function _(p23) -- Line: 89
                if p23:IsA("BasePart") then
                    p23.Transparency = 0.55;
                end;
            end;

            for i, child in Root:GetChildren() do
                local _ = i - 1;

                if child:IsA("BasePart") then
                    child.Transparency = 0.55;
                end;
            end;
        end;

        u8.maid:GiveTask(task.delay(1, function() -- Line: 98
            -- upvalues: u8 (copy), u22 (copy), u21 (copy)
            u8:createBedDebris(u22, true);
            u21:Destroy();
            u21.Parent = nil;
        end));
    end;

    local u24 = u2("Part", {
        Anchored = true,
        Name = "Meteor",
        Size = Vector3.new(2, 2, 2),
        CanCollide = false,
        CastShadow = false,
        CFrame = u17,
        Color = Color3.fromRGB(42, 42, 42),
        Material = Enum.Material.Rock,
        Parent = u16
    });
    local v25 = u2("PointLight", {
        Brightness = 10,
        Range = 8,
        Shadows = false,
        Enabled = true,
        Color = Color3.fromRGB(255, 99, 37),
        Parent = u24
    });
    u8.maid:GiveTask(u24);
    u8.maid:GiveTask(v25);
    TweenService:Create(u24, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        Size = Vector3.new(5, 5, 5)
    }):Play();
    local v26 = SoundManager:playSound(GameSound.METEOR_COSMIC_LOOP, {
        looped = true,
        position = u10.Position
    });

    if v26 then
        SoundManager:tweenSoundVolume(v26, 5, 1);
        u13:GiveTask(v26);
    end;

    local u27 = v12:NextNumber(0.2, 0.5);
    local u28 = v12:NextNumber(0.2, 0.5);
    local u29 = v12:NextNumber(0.2, 0.5);
    local u30 = 0;
    u16:PivotTo(u17);
    u13:GiveTask(RunService.Heartbeat:Connect(function(p31) -- Line: 142
        -- upvalues: u30 (ref), u17 (copy), u10 (copy), Workspace (ref), u18 (copy), u19 (copy), u16 (copy), u27 (copy), u28 (copy), u29 (copy), u24 (copy), u13 (copy)
        u30 = u30 + p31;
        local v32 = u17:Lerp(u10, (Workspace:GetServerTimeNow() - u18) / (u19 - u18));
        u16:PivotTo(CFrame.new(v32.Position, u10.Position) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966));
        u24.CFrame = v32 * CFrame.Angles(u30 * 3.141592653589793 * 2 * u27, u30 * 3.141592653589793 * 2 * u28, u30 * 3.141592653589793 * 2 * u29);

        if u19 <= Workspace:GetServerTimeNow() then
            u13:DoCleaning();
        end;
    end));
    u13:GiveTask(function() -- Line: 157
        -- upvalues: u16 (copy), u20 (copy), Workspace (ref), u10 (copy), ReplicatedStorage (ref), u10 (copy), EffectUtil (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        task.spawn(function() -- Line: 158
            -- upvalues: u16 (ref), u20 (ref), Workspace (ref), u10 (ref), ReplicatedStorage (ref), u10 (ref), EffectUtil (ref), u8 (ref), SoundManager (ref), GameSound (ref)
            u16:Destroy();
            u20:Destroy();
            local v33 = not Workspace.CurrentCamera and 0 or (u10.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude;
            local v34 = ReplicatedStorage.Assets.Effects.MeteorHitEffect:Clone();
            v34.CFrame = u10;
            v34.Parent = Workspace;
            EffectUtil:playEffects({ v34 }, nil, {
                destroyAfterSec = 3,
                particleMultiplier = v33 > 200 and 0.2 or 1
            });
            u8.maid:GiveTask(v34);
            u8.maid:GiveTask(SoundManager:playSound(GameSound.TNT_EXPLODE_1, {
                rollOffMaxDistance = 300,
                position = u10.Position
            }));
            u8.maid:GiveTask(SoundManager:playSound(GameSound.CARROT_LAUNCHER_IMPACT, {
                rollOffMaxDistance = 300,
                position = u10.Position
            }));
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;