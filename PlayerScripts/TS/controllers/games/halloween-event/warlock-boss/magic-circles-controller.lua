-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "CurseCirclesController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 29
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "CurseCirclesController";
end;

function u4.KnitStart(u7) -- Line: 37
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), Workspace (copy), u2 (copy), ReplicatedStorage (copy), ColorUtil (copy), default (copy), Linear (copy)
    KnitController.KnitStart(u7);
    default2.Client:GetNamespace("WarlockBoss"):Get("WarlockMagicCircle"):Connect(function(p8) -- Line: 39
        -- upvalues: SoundManager (ref), GameSound (ref), Workspace (ref), u2 (ref), ReplicatedStorage (ref), ColorUtil (ref), default (ref), Linear (ref), u7 (copy)
        local position = p8.position;
        local _ = p8.fromPosition;
        local radius = p8.radius;
        local explodeAt = p8.explodeAt;
        SoundManager:playSound(GameSound.MAGIC_CIRCLE_SPAWN, {
            rollOffMaxDistance = 180,
            volumeMultiplier = 3,
            position = position
        });
        local u9 = u2("Part", {
            CFrame = CFrame.new(position) * CFrame.Angles(0, 0, 1.5707963267948966),
            Anchored = true,
            CanCollide = false,
            CanQuery = false,
            Shape = Enum.PartType.Cylinder,
            Size = Vector3.new(0.5, radius * 2, radius * 2),
            Material = Enum.Material.ForceField,
            Transparency = 0.2,
            Color = Color3.fromRGB(255, 64, 64),
            Parent = Workspace
        });
        local v10 = explodeAt - Workspace:GetServerTimeNow();
        local v11 = math.max(v10, 0.1);
        local u12 = ReplicatedStorage.Assets.Effects.Warlock.MagicCircle:Clone();

        local function _(p13) -- Line: 67
            if p13:IsA("BasePart") then
                p13.CanCollide = false;
                p13.CanQuery = false;
            end;
        end;

        for i, descendant in u12:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
            end;
        end;

        u12:PivotTo(CFrame.new(position) * CFrame.Angles(1.5707963267948966, 0, 0));
        local v14 = u12:GetDescendants();

        local function v16(p15) -- Line: 81
            -- upvalues: ColorUtil (ref)
            if p15:IsA("UIGradient") then
                p15.Color = ColorSequence.new(ColorUtil.brighten(Color3.fromRGB(89, 255, 97), 0.1), Color3.fromRGB(89, 255, 97));
            end;
        end;

        for i, v in v14 do
            v16(v, i - 1, v14);
        end;

        u12.Parent = Workspace;
        default(v11, Linear, function(p17) -- Line: 90
            -- upvalues: u12 (copy), radius (copy)
            u12.Size = Vector3.new(p17 * (radius * 2), p17 * (radius * 2), 1);
            u12.Rotation = Vector3.new(u12.Rotation.X, u12.Rotation.Y, p17 * 360 * 2);
        end);
        task.delay(v11, function() -- Line: 94
            -- upvalues: u9 (copy), u7 (ref), position (copy), radius (copy), u12 (copy)
            u9:Destroy();
            u7:eruptFlamePillar(position, radius, 0.8);
            task.delay(0.8, function() -- Line: 98
                -- upvalues: u12 (ref)
                u12:Destroy();
            end);
        end);
    end);
end;

function u4.eruptFlamePillar(p18, p19, p20, p21) -- Line: 104
    -- upvalues: ReplicatedStorage (copy), GameQueryUtil (copy), Workspace (copy), SoundManager (copy), GameSound (copy), Players (copy), KnitClient (copy), TweenService (copy), default (copy), Linear (copy)
    local u22 = ReplicatedStorage.Assets.Effects.Warlock.FlamePillar:Clone();

    local function _(p23) -- Line: 107
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p23, true);

        if p23:IsA("BasePart") then
            p23.CanCollide = false;
            p23.CanQuery = false;
            p23.CanTouch = false;
        end;
    end;

    for i, descendant in u22:GetDescendants() do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(descendant, true);

        if descendant:IsA("BasePart") then
            descendant.CanCollide = false;
            descendant.CanQuery = false;
            descendant.CanTouch = false;
        end;
    end;

    if not u22 then
        return nil;
    end;

    u22.CFrame = CFrame.new(p19);
    u22.Size = Vector3.new(0, 0, 0);
    u22.Orientation = Vector3.new(0, 0, -90);
    u22.Parent = Workspace;
    SoundManager:playSound(GameSound.MAGIC_CIRCLE_FLAME_ERUPT, {
        rollOffMaxDistance = 180,
        volumeMultiplier = 4.5,
        position = p19
    });
    local u24 = SoundManager:playSound(GameSound.GHOST_PILLAR_LOOP, {
        rollOffMaxDistance = 150,
        volumeMultiplier = 3.5,
        looped = true,
        position = p19
    });
    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character:GetPivot().Position;
    end;

    if Character ~= nil then
        Character = (Character - u22:GetPivot().Position).Magnitude;
    end;

    local v25;

    if Character == 0 or (Character ~= Character or not Character) then
        v25 = Character;
    else
        v25 = Character < 35;
    end;

    if v25 ~= 0 and (v25 == v25 and v25) then
        KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
            magnitude = 0.4 * Character / 200
        });
    end;

    TweenService:Create(u22, TweenInfo.new(1.2, Enum.EasingStyle.Exponential), {
        Size = Vector3.new(35, p20 * 2, p20 * 2),
        Position = u22.Position + Vector3.new(0, 17.5, 0)
    }):Play();
    task.delay(p21, function() -- Line: 170
        -- upvalues: default (ref), Linear (ref), u22 (copy), u24 (copy)
        default(0.65, Linear, function(p26) -- Line: 173
            -- upvalues: u22 (ref)
            u22.Base.PointLight.Brightness = p26;
        end, u22.Base.PointLight.Brightness, 0);
        local v27 = u22:GetDescendants();

        local function v30(u28) -- Line: 178
            -- upvalues: default (ref), Linear (ref)
            if u28:IsA("ParticleEmitter") or u28:IsA("Beam") then
                default(0.65, Linear, function(p29) -- Line: 180
                    -- upvalues: u28 (copy)
                    u28.Transparency = p29;
                end, u28.Transparency, NumberSequence.new(1));
            end;
        end;

        for i, v in v27 do
            v30(v, i - 1, v27);
        end;

        task.delay(0.75, function() -- Line: 188
            -- upvalues: u24 (ref), u22 (ref)
            local v31 = u24;

            if v31 ~= nil then
                v31:Destroy();
            end;

            u22:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;