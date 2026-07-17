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
        return "SnowballBreakBedEffect";
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
    BreakBedEffectController.constructor(p6, BedBreakEffectType.SNOWBALL);
    p6.Name = "SnowballBreakBedEffect";
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
    local v14 = math.random(-35, 15) + 10;
    local v15 = math.random(-35, 15) + 10;
    local v16 = Position + Vector3.new(v14, 45, v15);
    local u17 = ReplicatedStorage.Assets.Effects.SnowballEffect:Clone();
    local u18 = CFrame.new(v16, u10.Position);
    local u19 = Workspace:GetServerTimeNow();
    local u20 = u19 + 1;
    u17:PivotTo(u18);
    u17.Parent = Workspace;
    u8.maid:GiveTask(u17);
    local u21 = ReplicatedStorage.Assets.Effects.CosmicMeteorIndicator:Clone();
    u21.Position = u10.Position + Vector3.new(0, -1.5, 0) + Vector3.new(0, 0, 0);
    u21.Parent = Workspace;
    u21.Size = Vector3.new(0, 0, 0);
    TweenService:Create(u21, TweenInfo.new(1, Enum.EasingStyle.Linear), {
        Size = Vector3.new(6, 0, 6)
    }):Play();
    u8.maid:GiveTask(u21);
    local u22 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p11);
    local u23;

    if u22 == nil then
        u23 = u22;
    else
        u23 = u22:WaitForChild("Root", 1);
    end;

    u22:PivotTo(u10);
    u8.maid:GiveTask(u22);

    if u22 and u23 then
        u22.Parent = Workspace;
        local Root = u22:FindFirstChild("Root");

        if Root ~= nil then
            local function _(p24) -- Line: 78
                if p24:IsA("BasePart") then
                    p24.Transparency = 0.55;
                end;
            end;

            for i, child in Root:GetChildren() do
                local _ = i - 1;

                if child:IsA("BasePart") then
                    child.Transparency = 0.55;
                end;
            end;
        end;

        u8.maid:GiveTask(task.delay(1, function() -- Line: 87
            -- upvalues: u8 (copy), u23 (copy), u22 (copy)
            u8:createBedDebris(u23, false);
            u22:Destroy();
            u22.Parent = nil;
        end));
    end;

    local v25 = u2("PointLight", {
        Brightness = 10,
        Range = 8,
        Shadows = false,
        Enabled = true,
        Color = Color3.fromRGB(255, 99, 37),
        Parent = u17.PrimaryPart
    });
    u8.maid:GiveTask(v25);
    TweenService:Create(u17.PrimaryPart, TweenInfo.new(1, Enum.EasingStyle.Quad), {
        Size = Vector3.new(10, 10, 10)
    }):Play();
    local v26 = SoundManager:playSound(GameSound.SNOWBALL_FALL, {
        looped = false,
        position = u10.Position
    });

    if v26 then
        SoundManager:tweenSoundVolume(v26, 5, 1);
        u13:GiveTask(v26);
    end;

    v12:NextNumber(0.2, 0.5);
    v12:NextNumber(0.2, 0.5);
    v12:NextNumber(0.2, 0.5);
    local u27 = 0;
    u17:PivotTo(u18);
    u13:GiveTask(RunService.Heartbeat:Connect(function(p28) -- Line: 119
        -- upvalues: u27 (ref), u18 (copy), u10 (copy), Workspace (ref), u19 (copy), u20 (copy), u17 (copy), u13 (copy)
        u27 = u27 + p28;
        local v29 = u18:Lerp(u10, (Workspace:GetServerTimeNow() - u19) / (u20 - u19));
        u17:PivotTo(CFrame.new(v29.Position, u10.Position) * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966));

        if u20 <= Workspace:GetServerTimeNow() then
            u13:DoCleaning();
        end;
    end));
    u13:GiveTask(function() -- Line: 130
        -- upvalues: u17 (copy), u21 (copy), Workspace (ref), u10 (copy), ReplicatedStorage (ref), u10 (copy), EffectUtil (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        task.spawn(function() -- Line: 131
            -- upvalues: u17 (ref), u21 (ref), Workspace (ref), u10 (ref), ReplicatedStorage (ref), u10 (ref), EffectUtil (ref), u8 (ref), SoundManager (ref), GameSound (ref)
            u17:Destroy();
            u21:Destroy();
            local v30 = not Workspace.CurrentCamera and 0 or (u10.Position - Workspace.CurrentCamera.CFrame.Position).Magnitude;
            local v31 = ReplicatedStorage.Assets.Effects.SnowExplosion:Clone();
            v31.CFrame = u10;
            v31.Parent = Workspace;
            EffectUtil:playEffects({ v31 }, nil, {
                destroyAfterSec = 3,
                particleMultiplier = v30 > 200 and 0.2 or 1
            });
            u8.maid:GiveTask(v31);
            u8.maid:GiveTask(SoundManager:playSound(GameSound.SNOWBALL_CRUSH, {
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