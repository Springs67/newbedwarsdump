-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SkullStrikeEffectController";
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
    p5.Name = "SkullStrikeEffectController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), Workspace (copy), u1 (copy), ReplicatedStorage (copy), ModelUtil (copy), default (copy), Linear (copy), EffectUtil (copy)
    KnitController.KnitStart(p6);
    default2.Client:Get("SkullStrike"):Connect(function(u7, u8, u9, p10) -- Line: 36
        -- upvalues: SoundManager (ref), GameSound (ref), Workspace (ref), u1 (ref), ReplicatedStorage (ref), ModelUtil (ref), default (ref), Linear (ref), EffectUtil (ref)
        SoundManager:playSound(GameSound.HALLOWEEN_BOSS_CAST, {
            rollOffMaxDistance = 200,
            rollOffMinDistance = 10,
            position = u8,
            playbackSpeedMultiplier = math.random() * 0.1 + 0.95
        });
        local u11 = u1("Part", {
            CFrame = CFrame.new(u7) * CFrame.Angles(0, 0, 1.5707963267948966),
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            Shape = Enum.PartType.Cylinder,
            Size = Vector3.new(0.5, u9 * 2, u9 * 2),
            Material = Enum.Material.ForceField,
            Transparency = 0.2,
            Color = Color3.fromRGB(255, 41, 0),
            Parent = Workspace
        });
        local u12 = u11:Clone();
        u12.Material = Enum.Material.Neon;
        u12.Size = Vector3.new(0.6, 0, 0);
        u12.Transparency = 0.6;
        u12.Parent = Workspace;
        local v13 = p10 - Workspace:GetServerTimeNow();
        local v14 = math.max(v13, 0.1);
        local u15 = ReplicatedStorage.Assets.Misc.HalloweenSkull:Clone();

        local function _(p16) -- Line: 66
            if p16:IsA("BasePart") then
                p16.CanCollide = false;
                p16.CanQuery = false;
            end;
        end;

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
            end;
        end;

        u15:PivotTo(CFrame.new(u8));
        ModelUtil.scaleModel(u15, u9 * 0.6 / 0.8);
        u15.Parent = Workspace;
        local u17 = (math.random() < 0.5 and -1 or 1) * (0.5235987755982988 + math.random() * 0.5235987755982988);
        local Position = u15:GetPrimaryPartCFrame().Position;
        default(v14, Linear, function(p18) -- Line: 80
            -- upvalues: u12 (copy), u9 (copy), u15 (copy), u7 (copy), u8 (copy), u17 (copy), Position (ref)
            if u12.Parent then
                u12.Size = Vector3.new(0.6, p18 * u9 * 2, p18 * u9 * 2);
            end;

            if u15.Parent then
                local v19 = u7 - u8;
                local v20 = CFrame.lookAt(Vector3.new(0, 0, 0), v19) * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.Angles(0, u17, 0) * Vector3.new(0, 0, 1);
                local v21 = math.pow(9.87 * p18, 0.5);
                local v22 = (u7 - u8) * p18 + u8 + v20 * (math.sin(v21) * 0.16666666666666666 * v19.Magnitude);
                u15:PivotTo(CFrame.new(v22, v22 + (v22 - Position)) * CFrame.Angles(0, 1.5707963267948966, 0));
                Position = v22;
            end;
        end);
        task.delay(v14, function() -- Line: 112
            -- upvalues: u15 (copy), u12 (copy), u11 (copy), ReplicatedStorage (ref), u7 (copy), Workspace (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref), u9 (copy)
            u15:Destroy();
            u12:Destroy();
            u11:Destroy();
            local v23 = ReplicatedStorage.Assets.Effects.HalloweenExplosion:Clone();
            v23.Position = u7;
            v23.Parent = Workspace;
            SoundManager:playSound(GameSound.HALLOWEEN_BOSS_RUNE_EXPLODE, {
                rollOffMaxDistance = 200,
                rollOffMinDistance = 10,
                position = u7,
                playbackSpeedMultiplier = math.random() * 0.1 + 0.95
            });
            EffectUtil:playEffects({ v23 }, nil, {
                destroyAfterSec = 4,
                sizeMultiplier = 1.2 * u9 / 12
            });
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;