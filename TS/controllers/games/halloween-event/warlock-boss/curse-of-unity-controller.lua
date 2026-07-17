-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "CurseOfUnityController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 26
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "CurseOfUnityController";
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy), Workspace (copy), ReplicatedStorage (copy), default (copy), Linear (copy), RunService (copy), Players (copy), KnitClient (copy), EffectUtil (copy)
    KnitController.KnitStart(p5);
    default2.Client:GetNamespace("WarlockBoss"):Get("WarlockCurseOfUnity"):Connect(function(p6) -- Line: 36
        -- upvalues: SoundManager (ref), GameSound (ref), Workspace (ref), ReplicatedStorage (ref), default (ref), Linear (ref), RunService (ref), Players (ref), KnitClient (ref), EffectUtil (ref)
        local targetPlayer = p6.targetPlayer;
        local fromPosition = p6.fromPosition;
        local radius = p6.radius;
        local explodeAt = p6.explodeAt;
        SoundManager:playSound(GameSound.HALLOWEEN_BOSS_CAST, {
            rollOffMaxDistance = 300,
            position = fromPosition
        });
        local v7 = explodeAt - Workspace:GetServerTimeNow();
        local Character = targetPlayer.Character;

        if not Character then
            return nil;
        end;

        local Position = Character:GetPivot().Position;
        local u8 = ReplicatedStorage.Assets.Effects.Warlock.Ball:Clone();

        local function _(p9) -- Line: 55
            if p9:IsA("BasePart") then
                p9.CanCollide = false;
                p9.CanQuery = false;
                p9.Transparency = 1;
            end;
        end;

        for i, descendant in u8:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.Transparency = 1;
            end;
        end;

        u8:PivotTo(CFrame.new(fromPosition));
        u8.Parent = Workspace;
        local u10 = (math.random() < 0.5 and -1 or 1) * (0.5235987755982988 + math.random() * 0.5235987755982988);
        local Position2 = u8:GetPrimaryPartCFrame().Position;
        default(0.3, Linear, function(p11) -- Line: 69
            -- upvalues: u8 (copy), Position (copy), fromPosition (copy), u10 (copy), Position2 (ref)
            if u8.Parent then
                local v12 = Position - fromPosition;
                local v13 = CFrame.lookAt(Vector3.new(0, 0, 0), v12) * CFrame.Angles(-1.5707963267948966, 0, 0) * CFrame.Angles(0, u10, 0) * Vector3.new(0, 0, 1);
                local v14 = math.pow(9.87 * p11, 0.5);
                local v15 = (Position - fromPosition) * p11 + fromPosition + v13 * (math.sin(v14) * 0.16666666666666666 * v12.Magnitude);
                u8:PivotTo(CFrame.new(v15, v15 + (v15 - Position2)) * CFrame.Angles(0, 1.5707963267948966, 0));
                Position2 = v15;
            end;
        end);
        SoundManager:playSound(GameSound.CURSE_INFLICT, {
            rollOffMaxDistance = 300,
            parent = Character.PrimaryPart
        });
        local u16 = ReplicatedStorage.Assets.Effects.Warlock.UnityCurseAura:Clone();

        local function _(p17) -- Line: 101
            if p17:IsA("BasePart") then
                p17.CanCollide = false;
                p17.CanQuery = false;
                p17.Anchored = false;
                p17.CanTouch = false;
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
                descendant.CanQuery = false;
                descendant.Anchored = false;
                descendant.CanTouch = false;
            end;
        end;

        u16.Root.Size = Vector3.new(0.1, radius * 2, radius * 2);
        u16.Root.OnExplode.Size = Vector3.new(0.1, radius * 2, radius * 2);
        u16.Parent = Character;
        local u18 = SoundManager:playSound(GameSound.CURSE_LOOP, {
            rollOffMaxDistance = 100,
            looped = true,
            volumeMultiplier = 7,
            parent = Character.PrimaryPart
        });
        local u21 = RunService.Heartbeat:Connect(function(u19) -- Line: 123
            -- upvalues: u16 (copy), Character (copy)
            local Position3 = Character:GetPivot().Position;
            u16:PivotTo(CFrame.new(Position3 - Vector3.new(0, 2.6, 0)) * CFrame.Angles(0, 0, 1.5707963267948966));

            local function _(p20) -- Line: 131
                -- upvalues: u19 (copy)
                if p20:IsA("ImageLabel") then
                    p20.Rotation = p20.Rotation + u19 * 30;
                end;
            end;

            for i, descendant in u16.Root.SurfaceGui:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ImageLabel") then
                    descendant.Rotation = descendant.Rotation + u19 * 30;
                end;
            end;
        end);
        task.delay(v7, function() -- Line: 141
            -- upvalues: Players (ref), u16 (copy), radius (copy), KnitClient (ref), EffectUtil (ref), SoundManager (ref), GameSound (ref), Character (copy), u18 (copy), u21 (copy)
            local Character2 = Players.LocalPlayer.Character;

            if Character2 ~= nil then
                Character2 = Character2:GetPivot().Position;
            end;

            if Character2 ~= nil then
                Character2 = (Character2 - u16:GetPivot().Position).Magnitude;
            end;

            if Character2 ~= 0 and (Character2 == Character2 and Character2) then
                Character2 = Character2 <= radius;
            end;

            if Character2 ~= 0 and (Character2 == Character2 and Character2) then
                KnitClient.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    magnitude = 1.6
                });
            end;

            EffectUtil:playInstanceEffects({ u16.Root.OnExplode }, {
                destroyAfterSec = 1,
                sizeMultiplier = 0.3
            });
            SoundManager:playSound(GameSound.CURSE_ACTIVATE, {
                rollOffMaxDistance = 200,
                position = Character:GetPivot().Position
            });
            task.delay(0.5, function() -- Line: 170
                -- upvalues: u16 (ref), u18 (ref), u21 (ref)
                u16:Destroy();
                local v22 = u18;

                if v22 ~= nil then
                    v22:Destroy();
                end;

                u21:Disconnect();
            end);
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;