-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v2.Linear;
local OutBack = v2.OutBack;
local OutCirc = v2.OutCirc;
local OutQuad = v2.OutQuad;
local OutQuint = v2.OutQuint;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v5.ReplicatedStorage;
local Workspace = v5.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 30, Name: __tostring
        return "CurseAllController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 36
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 40
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p8, { GameType.HALLOWEEN_EVENT });
    p8.Name = "CurseAllController";
end;

function u6.KnitStart(u9) -- Line: 44
    -- upvalues: GameKnitController (copy), default2 (copy), Workspace (copy), KnitClient (copy)
    GameKnitController.KnitStart(u9);

    local function calculateMidpoint(p10, p11, p12) -- Line: 46
        return Vector3.new((p10.X + p11.X) / 2, p12, (p10.Z + p11.Z) / 2);
    end;

    default2.Client:GetNamespace("WarlockBoss"):Get("WarlockCurseAll"):Connect(function(p13) -- Line: 50
        -- upvalues: Workspace (ref), u9 (copy), KnitClient (ref)
        local fromPosition = p13.fromPosition;
        local altarPosition = p13.altarPosition;
        local altarShieldRadius = p13.altarShieldRadius;
        local mapInfo = p13.mapInfo;
        local v14 = p13.curseAtTime - Workspace:GetServerTimeNow();
        local u15 = u9:spinMagicCircle(fromPosition, v14);
        local u16 = u9:setupAltar(altarPosition, altarShieldRadius);
        KnitClient.Controllers.PoisonFogEffectController:enablePoisonCountdownSound(v14 / 15);
        local Position = mapInfo.ArenaCorner1.Position;
        local Position2 = mapInfo.ArenaCorner2.Position;
        local v17 = Vector3.new((Position.X + Position2.X) / 2, mapInfo.PlayerSpawn.Y - 3.2, (Position.Z + Position2.Z) / 2);
        local u18 = u9:playDangerEffect(v17, (mapInfo.ArenaCorner1.Position - v17).Magnitude - 55, v14);
        task.delay(v14, function() -- Line: 67
            -- upvalues: u18 (copy), u15 (copy), u16 (copy), KnitClient (ref)
            u18:DoCleaning();
            u15:DoCleaning();
            u16:DoCleaning();
            KnitClient.Controllers.PoisonFogEffectController:disablePoisonEffect();
        end);
    end);
end;

function u6.spinMagicCircle(p19, p20, p21) -- Line: 75
    -- upvalues: u3 (copy), ReplicatedStorage (copy), ColorUtil (copy), Theme (copy), Workspace (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy), default (copy), OutQuint (copy), OutCirc (copy)
    local v22 = u3.new();
    local u23 = ReplicatedStorage.Assets.Effects.Warlock.MagicCircle:Clone();

    local function _(p24) -- Line: 81
        if p24:IsA("BasePart") then
            p24.CanCollide = false;
            p24.CanQuery = false;
            p24.CanTouch = false;
        end;
    end;

    for i, descendant in u23:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    local function _(p25) -- Line: 92
        -- upvalues: ColorUtil (ref), Theme (ref)
        if p25:IsA("UIGradient") then
            p25.Color = ColorSequence.new(ColorUtil.brighten(Theme.mcGreen, 0.1), Theme.mcGreen);
        end;
    end;

    for i, descendant in u23:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("UIGradient") then
            descendant.Color = ColorSequence.new(ColorUtil.brighten(Theme.mcGreen, 0.1), Theme.mcGreen);
        end;
    end;

    u23:PivotTo(CFrame.new(p20 + Vector3.new(-10, 0, 0)) * CFrame.Angles(0, 1.5707963267948966, 0));
    u23.Parent = Workspace;
    SoundManager:playSound(GameSound.MAGIC_CIRCLE_SPAWN, {
        rollOffMaxDistance = 300,
        playbackSpeedMultiplier = 2,
        volumeMultiplier = 4,
        position = p20
    });
    EffectUtil:playEffects({ u23.ChargingEffect }, nil, {
        sizeMultiplier = 2,
        destroyAfterSec = p21 - 1
    });
    default(1.8, OutQuint, function(p26) -- Line: 120
        -- upvalues: u23 (copy)
        u23.Size = p26;
    end, Vector3.new(0, 0, 0.1), Vector3.new(23, 23, 0.1));
    default(p21, OutCirc, function(p27) -- Line: 124
        -- upvalues: u23 (copy)
        u23.Rotation = Vector3.new(p27 * 360 * 2.5, u23.Rotation.Y, u23.Rotation.Z);
    end);
    task.delay(p21 - 1, function() -- Line: 128
        -- upvalues: EffectUtil (ref), u23 (copy)
        EffectUtil:playInstanceEffects({ u23.ReadyEffect }, {
            destroyAfterSec = 1,
            sizeMultiplier = 2
        });
    end);
    v22:GiveTask(function() -- Line: 134
        -- upvalues: EffectUtil (ref), u23 (copy)
        EffectUtil:playInstanceEffects({ u23.BlastEffect }, {
            destroyAfterSec = 0.5,
            sizeMultiplier = 2
        });
        task.delay(0.5, function() -- Line: 139
            -- upvalues: u23 (ref)
            u23:Destroy();
        end);
    end);

    return v22;
end;

function u6.setupAltar(p28, p29, p30) -- Line: 145
    -- upvalues: u3 (copy), ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy), default (copy), OutQuad (copy), OutBack (copy)
    local v31 = u3.new();
    local u32 = ReplicatedStorage.Assets.Effects.Warlock.Altar:Clone();
    local u33 = CFrame.new(p29) + Vector3.new(0, -5, 0);
    local u34 = CFrame.new(p29) + Vector3.new(0, 2.5, 0);
    u32:PivotTo(CFrame.new(p29) + Vector3.new(0, 2.5, 0));

    local function _(p35) -- Line: 159
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p35, true);
    end;

    for i, descendant in u32.forcefield:GetDescendants() do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(descendant, true);
    end;

    u32.Parent = Workspace;
    u32.forcefield.Size = Vector3.new(p30 * 2, p30 * 2, p30 * 2);
    local u36 = SoundManager:playSound(GameSound.ROCK_RUMBLE, {
        volumeMultiplier = 1.3,
        rollOffMaxDistance = 420,
        rollOffMinDistance = 90,
        fadeInTime = 0.1,
        fadeOutTime = 0.3,
        parent = u32
    });
    local u37 = SoundManager:playSound(GameSound.WARLOCK_ALTAR_LOOP, {
        rollOffMaxDistance = 100,
        volumeMultiplier = 4,
        looped = true,
        position = u32:GetPivot().Position
    });
    default(2.5, OutQuad, function(p38) -- Line: 181
        -- upvalues: u32 (copy), u33 (copy), u34 (copy)
        u32:PivotTo(u33:Lerp(u34, p38));
    end);
    task.delay(2.5, function() -- Line: 184
        -- upvalues: u36 (copy), SoundManager (ref)
        if u36 then
            SoundManager:tweenSoundVolume(u36, 0, 1);
        end;
    end);
    v31:GiveTask(function() -- Line: 189
        -- upvalues: u32 (copy), default (ref), OutQuad (ref), OutBack (ref), u37 (copy)
        u32.Highlight.FillTransparency = 1;
        default(0.6, OutQuad, function(p39) -- Line: 193
            -- upvalues: u32 (ref)
            if u32.forcefield then
                u32.forcefield.Size = p39;
            end;
        end, Vector3.new(30, 30, 30), Vector3.new(0, 0, 0));
        task.delay(0.7, function() -- Line: 198
            -- upvalues: u32 (ref)
            u32.forcefield:Destroy();
        end);
        default(2, OutBack, function(u40) -- Line: 202
            -- upvalues: u32 (ref)
            local function _(p41) -- Line: 204
                -- upvalues: u40 (copy)
                if p41:IsA("BasePart") then
                    p41.Transparency = u40;

                    return;
                end;

                if p41:IsA("ParticleEmitter") then
                    p41.Transparency = NumberSequence.new(u40);

                    return;
                end;

                if p41:IsA("GuiObject") then
                    p41.Transparency = u40;
                end;
            end;

            for i, descendant in u32:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = u40;
                elseif descendant:IsA("ParticleEmitter") then
                    descendant.Transparency = NumberSequence.new(u40);
                elseif descendant:IsA("GuiObject") then
                    descendant.Transparency = u40;
                end;
            end;
        end);
        task.delay(1, function() -- Line: 217
            -- upvalues: u37 (ref)
            local v42 = u37;

            if v42 ~= nil then
                v42:Destroy();
            end;
        end);
        task.delay(2.1, function() -- Line: 223
            -- upvalues: u32 (ref)
            u32:Destroy();
        end);
    end);

    return v31;
end;

function u6.playDangerEffect(p43, u44, u45, p46) -- Line: 229
    -- upvalues: u3 (copy), Workspace (copy), u4 (copy), default (copy), Linear (copy), ReplicatedStorage (copy), EffectUtil (copy), SoundManager (copy), GameSound (copy), KnitClient (copy)
    local v47 = u3.new();
    local u48 = u4("Part", {
        CFrame = CFrame.new(u44) * CFrame.Angles(0, 0, 1.5707963267948966),
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        Shape = Enum.PartType.Cylinder,
        Size = Vector3.new(0.5, u45 * 2, u45 * 2),
        Material = Enum.Material.ForceField,
        Transparency = 0.2,
        Color = Color3.fromRGB(255, 41, 0),
        Parent = Workspace
    });
    local u49 = u48:Clone();
    u49.Material = Enum.Material.Neon;
    u49.Size = Vector3.new(0.6, 0, 0);
    u49.Transparency = 0.6;
    u49.Parent = Workspace;
    default(p46, Linear, function(p50) -- Line: 253
        -- upvalues: u49 (copy), u45 (copy)
        if u49.Parent then
            u49.Size = Vector3.new(0.6, p50 * u45 * 2, p50 * u45 * 2);
        end;
    end);
    v47:GiveTask(function() -- Line: 258
        -- upvalues: ReplicatedStorage (ref), u48 (copy), EffectUtil (ref), SoundManager (ref), GameSound (ref), u44 (copy), KnitClient (ref), u49 (copy)
        local function _(p51) -- Line: 260
            -- upvalues: u48 (ref)
            if p51:IsA("ParticleEmitter") then
                local v52 = p51:Clone();
                v52.Parent = u48;
                v52:SetAttribute("EmitCount", 50);

                return v52;
            end;
        end;

        local v53 = 0;
        local v54 = {};

        for i, child in ReplicatedStorage.Assets.Effects.Warlock.UnityCurseAura.Root.OnExplode:GetChildren() do
            local _ = i - 1;
            local v55;

            if child:IsA("ParticleEmitter") then
                v55 = child:Clone();
                v55.Parent = u48;
                v55:SetAttribute("EmitCount", 50);
            else
                v55 = nil;
            end;

            if v55 ~= nil then
                v53 = v53 + 1;
                v54[v53] = v55;
            end;
        end;

        u48.Transparency = 1;
        u48.Transparency = 1;
        EffectUtil:playInstanceEffects(v54, {
            destroyAfterSec = 1,
            sizeMultiplier = 2
        });
        SoundManager:playSound(GameSound.CURSE_ACTIVATE, {
            rollOffMaxDistance = 300,
            rollOffMinDistance = 300,
            position = u44
        });
        KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
            magnitude = 2.2
        });
        task.delay(0.8, function() -- Line: 294
            -- upvalues: u48 (ref), u49 (ref)
            u48:Destroy();
            u49:Destroy();
        end);
    end);

    return v47;
end;

KnitClient.CreateController(u6.new());

return nil;