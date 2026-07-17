-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local OutExpo = v1.OutExpo;
local OutQuad = v1.OutQuad;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "CrystallizeBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy)
    BreakBedEffectController.constructor(p5, BedBreakEffectType.CRYSTALLIZE);
    p5.Name = "CrystallizeBedBreakEffectController";
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p6);
end;

function u3.onBedBreak(p7, p8, p9, p10, p11) -- Line: 40
    p7:createEffect(p9, p11, p10);
end;

function u3.createEffect(u12, u13, u14, u15) -- Line: 43
    -- upvalues: KnitClient (copy), Workspace (copy), ReplicatedStorage (copy), SoundManager (copy), GameSound (copy), default (copy), OutExpo (copy), OutQuad (copy), EffectUtil (copy)
    u12.maid:GiveTask(task.spawn(function() -- Line: 44
        -- upvalues: KnitClient (ref), u15 (copy), u12 (copy), u13 (copy), Workspace (ref)
        local u16 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(u15);
        u12.maid:GiveTask(u16);

        if u16 then
            u16.Name = "BedBreakEffectBedClone";
            u16:PivotTo(u13);
            u16.Parent = Workspace;

            local function _(p17) -- Line: 52
                if p17:IsA("MeshPart") then
                    p17.LocalTransparencyModifier = 0.5;
                end;
            end;

            for i, descendant in u16:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("MeshPart") then
                    descendant.LocalTransparencyModifier = 0.5;
                end;
            end;

            task.delay(2.5, function() -- Line: 60
                -- upvalues: u16 (copy)
                u16:Destroy();
            end);
        end;
    end));
    local u18 = ReplicatedStorage.Assets.Effects.CrystallizeBedEffect:Clone();
    u18.Parent = Workspace;
    local u19 = { u18.Root.PurpleCrystal, u18.Root.LightCrystal, u18.Root.MiddleCrystal };

    local function _(p20) -- Line: 70
        if p20:IsA("MeshPart") then
            p20.Transparency = 1;

            return;
        end;

        if p20:IsA("Decal") then
            p20.Transparency = 1;
        end;
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") then
            descendant.Transparency = 1;
        elseif descendant:IsA("Decal") then
            descendant.Transparency = 1;
        end;
    end;

    u18:PivotTo(u13);
    u12.maid:GiveTask(u18);
    u12.maid:GiveTask(SoundManager:playSound(GameSound.CRYSTALLIZE_BED, {
        rollOffMinDistance = 10,
        rollOffMaxDistance = 40,
        looped = false,
        position = u14
    }));
    u12.maid:GiveTask(task.spawn(function() -- Line: 90
        -- upvalues: u19 (copy), SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref)
        local function _(p21) -- Line: 91
            p21.Position = p21.Position - Vector3.new(0, 6, 0);
        end;

        for i, v in u19 do
            local _ = i - 1;
            v.Position = v.Position - Vector3.new(0, 6, 0);
        end;

        task.wait(1);

        local function _(u22) -- Line: 100
            -- upvalues: SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref)
            task.spawn(function() -- Line: 101
                -- upvalues: u22 (copy), SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref)
                u22.Transparency = 0;

                local function _(p23) -- Line: 104
                    if p23:IsA("Decal") then
                        p23.Transparency = 0;
                    end;
                end;

                for i, descendant in u22:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("Decal") then
                        descendant.Transparency = 0;
                    end;
                end;

                task.delay(0.2, function() -- Line: 112
                    -- upvalues: SoundManager (ref), GameSound (ref), u22 (ref)
                    SoundManager:playSound(GameSound.CRYSTAL_BED_IMPALE, {
                        rollOffMinDistance = 10,
                        rollOffMaxDistance = 40,
                        looped = false,
                        position = u22.Position
                    });
                end);
                default(1, OutExpo, function(p24) -- Line: 120
                    -- upvalues: u22 (ref)
                    u22.Position = p24;
                end, u22.Position, u22.Position + Vector3.new(0, 6, 0)):Play();
            end);
            task.wait(0.35);
        end;

        for i, v in u19 do
            local _ = i - 1;
            task.spawn(function() -- Line: 101
                -- upvalues: v (copy), SoundManager (ref), GameSound (ref), default (ref), OutExpo (ref)
                v.Transparency = 0;

                local function _(p25) -- Line: 104
                    if p25:IsA("Decal") then
                        p25.Transparency = 0;
                    end;
                end;

                for i2, descendant in v:GetDescendants() do
                    local _ = i2 - 1;

                    if descendant:IsA("Decal") then
                        descendant.Transparency = 0;
                    end;
                end;

                task.delay(0.2, function() -- Line: 112
                    -- upvalues: SoundManager (ref), GameSound (ref), v (ref)
                    SoundManager:playSound(GameSound.CRYSTAL_BED_IMPALE, {
                        rollOffMinDistance = 10,
                        rollOffMaxDistance = 40,
                        looped = false,
                        position = v.Position
                    });
                end);
                default(1, OutExpo, function(p26) -- Line: 120
                    -- upvalues: v (ref)
                    v.Position = p26;
                end, v.Position, v.Position + Vector3.new(0, 6, 0)):Play();
            end);
            task.wait(0.35);
        end;
    end));

    local function _(u27) -- Line: 136
        -- upvalues: u12 (copy), u19 (copy), default (ref), OutQuad (ref)
        u12.maid:GiveTask(task.spawn(function() -- Line: 137
            -- upvalues: u27 (copy), u19 (ref), default (ref), OutQuad (ref)
            local v28 = u27:IsA("MeshPart");

            if v28 then
                local v29 = table.find(u19, u27) ~= nil;
                v28 = not v29;
            end;

            if not v28 then
                if u27:IsA("Decal") then
                    u27.Transparency = 1;
                    default(1.5, OutQuad, function(p30) -- Line: 152
                        -- upvalues: u27 (ref)
                        if u27:IsA("Decal") then
                            u27.Transparency = p30;
                        end;
                    end, 1, 0):Play();
                end;

                return;
            end;

            u27.Transparency = 1;
            default(1.5, OutQuad, function(p31) -- Line: 145
                -- upvalues: u27 (ref)
                if u27:IsA("BasePart") then
                    u27.Transparency = p31;
                end;
            end, 1, u27.Name == "BedCover" and 0.7 or 0):Play();
        end));
    end;

    for i, descendant in u18:GetDescendants() do
        local _ = i - 1;
        u12.maid:GiveTask(task.spawn(function() -- Line: 137
            -- upvalues: descendant (copy), u19 (copy), default (ref), OutQuad (ref)
            local v32 = descendant:IsA("MeshPart");

            if v32 then
                local v33 = table.find(u19, descendant) ~= nil;
                v32 = not v33;
            end;

            if not v32 then
                if descendant:IsA("Decal") then
                    descendant.Transparency = 1;
                    default(1.5, OutQuad, function(p34) -- Line: 152
                        -- upvalues: descendant (ref)
                        if descendant:IsA("Decal") then
                            descendant.Transparency = p34;
                        end;
                    end, 1, 0):Play();
                end;

                return;
            end;

            descendant.Transparency = 1;
            default(1.5, OutQuad, function(p35) -- Line: 145
                -- upvalues: descendant (ref)
                if descendant:IsA("BasePart") then
                    descendant.Transparency = p35;
                end;
            end, 1, descendant.Name == "BedCover" and 0.7 or 0):Play();
        end));
    end;

    u12.maid:GiveTask(task.delay(2.5, function() -- Line: 164
        -- upvalues: u12 (copy), SoundManager (ref), GameSound (ref), u14 (copy), u18 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        u12.maid:GiveTask(SoundManager:playSound(GameSound.CRYSTALLIZE_BED_BREAK, {
            rollOffMinDistance = 10,
            rollOffMaxDistance = 40,
            looped = false,
            position = u14
        }));
        local _ = {
            Color3.fromRGB(250, 98, 255),
            Color3.fromRGB(225, 116, 232),
            Color3.fromRGB(149, 101, 212),
            Color3.fromRGB(255, 206, 255),
            Color3.fromRGB(163, 86, 221),
            Color3.fromRGB(241, 73, 253)
        };
        local v36 = u18:GetDescendants();

        local function v40(u37) -- Line: 174
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), u12 (ref), EffectUtil (ref)
            if u37:IsA("MeshPart") then
                if u37.Name == "SmallCrystal" then
                    u37.Anchored = false;
                    local v38 = ReplicatedStorage.Assets.Effects.CrystalExplosion:Clone();
                    v38:PivotTo(CFrame.new(u37.Position));
                    v38.Parent = Workspace;
                    u12.maid:GiveTask(v38);
                    EffectUtil:playEffects(v38:GetChildren(), nil, {
                        sizeMultiplier = u37.Size.X / 2
                    });
                    task.delay(0.6, function() -- Line: 197
                        -- upvalues: u37 (copy)
                        u37:Destroy();
                    end);

                    return;
                end;

                local v39 = ReplicatedStorage.Assets.Effects.CrystalExplosion:Clone();
                v39:PivotTo(CFrame.new(u37.Position));
                v39.Parent = Workspace;
                u12.maid:GiveTask(v39);
                EffectUtil:playEffects(v39:GetChildren(), nil, {
                    sizeMultiplier = u37.Size.X / 2
                });
                u37:Destroy();
            end;
        end;

        for i, v in v36 do
            v40(v, i - 1, v36);
        end;
    end));
    u12.maid:GiveTask(task.delay(4, function() -- Line: 216
        -- upvalues: u18 (copy)
        u18:Destroy();
        u18.Parent = nil;
    end));
end;

KnitClient.CreateController(u3.new());

return nil;