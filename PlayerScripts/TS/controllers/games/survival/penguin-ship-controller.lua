-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "PenguinShipController";
    end,

    __index = GameKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 31
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 35
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p5, { GameType.SURVIVAL });
    p5.Name = "PenguinShipController";
end;

function u3.onGameInit(p6) -- Line: 39
    -- upvalues: CollectionService (copy), ReplicatedStorage (copy), WeldUtil (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy), KnitClient (copy), default (copy), TweenService (copy), Workspace (copy), RunService (copy)
    CollectionService:GetInstanceAddedSignal("PenguinShip"):Connect(function(u7) -- Line: 40
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), EntityUtil (ref), KnitClient (ref)
        u7:GetPropertyChangedSignal("PrimaryPart"):Wait();
        local v8 = ReplicatedStorage.Assets.Misc.PenguinPirateShip:Clone();

        if not v8 then
            return nil;
        end;

        local v9 = v8:FindFirstChildOfClass("Humanoid");

        if v9 ~= nil then
            v9:Destroy();
        end;

        v8:SetPrimaryPartCFrame(u7:GetPrimaryPartCFrame());

        for _, child in v8:GetChildren() do
            if child:IsA("BasePart") then
                child.CanCollide = false;
                child.Massless = true;
            end;
        end;

        v8.Parent = u7;
        WeldUtil:weldPartsWithJoint(u7.PrimaryPart, v8.PrimaryPart, "Motor6D");
        v8.PrimaryPart.Name = "Main";

        for _, child in v8:GetChildren() do
            child.Parent = u7;
        end;

        v8:Destroy();
        local Humanoid = u7:WaitForChild("Humanoid");

        if Humanoid ~= nil then
            Humanoid = Humanoid:WaitForChild("Animator");
        end;

        if Humanoid then
            AnimationUtil:playAnimation(Humanoid, GameAnimationUtil:getAssetId(AnimationType.PENGUIN_PIRATE_SHIP_FLY), {
                looped = true
            });
        end;

        local v10 = u7:GetAttribute("MaxHealth");
        local u11 = v10 == nil and 1000 or v10;
        local u12 = 100;
        local FireEffect = u7:WaitForChild("FireEffect", 3);
        u7:GetAttributeChangedSignal("Health"):Connect(function() -- Line: 84
            -- upvalues: u7 (copy), u11 (copy), u12 (ref), FireEffect (copy)
            local v13 = u7:GetAttribute("Health");
            local v14 = (v13 == nil and 0 or v13) * 100 / u11;

            if u12 > 70 and v14 < 70 then
                local v15 = FireEffect;

                if v15 ~= nil then
                    local v16 = v15:WaitForChild("1");

                    if v16 ~= nil then
                        local function _(p17) -- Line: 97
                            if p17:IsA("ParticleEmitter") then
                                p17.Enabled = true;
                            end;
                        end;

                        for i, descendant in v16:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("ParticleEmitter") then
                                descendant.Enabled = true;
                            end;
                        end;
                    end;
                end;
            elseif u12 > 40 and v14 < 40 then
                local v18 = FireEffect;

                if v18 ~= nil then
                    local v19 = v18:WaitForChild("2");

                    if v19 ~= nil then
                        local function _(p20) -- Line: 113
                            if p20:IsA("ParticleEmitter") then
                                p20.Enabled = true;
                            end;
                        end;

                        for i, descendant in v19:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("ParticleEmitter") then
                                descendant.Enabled = true;
                            end;
                        end;
                    end;
                end;
            elseif u12 > 10 and v14 < 10 then
                local v21 = FireEffect;

                if v21 ~= nil then
                    local v22 = v21:WaitForChild("3");

                    if v22 ~= nil then
                        local function _(p23) -- Line: 129
                            if p23:IsA("ParticleEmitter") then
                                p23.Enabled = true;
                            end;
                        end;

                        for i, descendant in v22:GetDescendants() do
                            local _ = i - 1;

                            if descendant:IsA("ParticleEmitter") then
                                descendant.Enabled = true;
                            end;
                        end;
                    end;
                end;
            end;

            u12 = v14;
        end);
        SoundManager:playSound(GameSound.PIRATE_EVENT_MOTHERSHIP);
        task.delay(1, function() -- Line: 143
            -- upvalues: EntityUtil (ref), u7 (copy), KnitClient (ref)
            local v24 = EntityUtil:getEntity(u7);

            if v24 then
                KnitClient.Controllers.ShipBarController:mountEntityBossBar(v24, {
                    DisplayName = "Pirate Ship",
                    Gradient = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 56, 56)),
                    OffsetY = Vector2.new(0, 0.15)
                });
            end;
        end);
    end);
    default.Client:Get("EntityDeathEvent"):Connect(function(p25) -- Line: 154
        -- upvalues: CollectionService (ref), TweenService (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        if CollectionService:HasTag(p25.entityInstance, "PenguinShip") then
            local function _(p26) -- Line: 158
                if p26:IsA("Part") then
                    p26.Anchored = false;
                end;
            end;

            for i, descendant in p25.entityInstance:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Part") then
                    descendant.Anchored = false;
                end;
            end;

            local PrimaryPart = p25.entityInstance.PrimaryPart;
            local v27 = TweenInfo.new(5);
            local v28 = {};
            local PrimaryPart2 = p25.entityInstance.PrimaryPart;

            if PrimaryPart2 ~= nil then
                local CFrame2 = PrimaryPart2.CFrame;
                local v29 = CFrame.Angles(3.141592653589793 * math.random(), 0, 3.141592653589793 * math.random());
                PrimaryPart2 = (CFrame2 + Vector3.new(10, -90, 0)) * v29;
            end;

            v28.CFrame = PrimaryPart2;
            TweenService:Create(PrimaryPart, v27, v28):Play();
            local Position = p25.entityInstance.PrimaryPart.Position;
            local v30 = ReplicatedStorage.Assets.Effects.DragonMortarExplosion:Clone();
            v30:PivotTo(CFrame.new(Position));
            v30.Parent = Workspace;

            local function _(p31) -- Line: 186
                if p31:IsA("ParticleEmitter") then
                    p31:Emit(30);
                end;
            end;

            for i, descendant in v30:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(30);
                end;
            end;

            SoundManager:playSound(GameSound.PIRATE_MOTHERSHIP_CANNON_EXPLODE, {
                rollOffMinDistance = 300,
                position = Position
            });
            local CaptainPenguin = p25.entityInstance:FindFirstChild("CaptainPenguin");

            if CaptainPenguin ~= nil then
                CaptainPenguin:Destroy();
            end;
        end;
    end);
    default.Client:Get("CaptainPirateSpawn"):Connect(function(p32) -- Line: 204
        -- upvalues: CollectionService (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), RunService (ref)
        task.delay(2, function() -- Line: 205
            -- upvalues: CollectionService (ref)
            for _, v in CollectionService:GetTagged("PiratePenguin") do
                local function _(p33) -- Line: 208
                    if p33:IsA("ParticleEmitter") then
                        p33.Enabled = true;
                    end;
                end;

                for i, descendant in v:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = true;
                    end;
                end;
            end;
        end);
        local HumanoidRootPart = p32.captain:WaitForChild("HumanoidRootPart", 3);
        local v34;

        if HumanoidRootPart == nil then
            v34 = HumanoidRootPart;
        else
            v34 = HumanoidRootPart.Position;
        end;

        if HumanoidRootPart and v34 then
            AnimationUtil:playAnimation(p32.captain:WaitForChild("Humanoid"):WaitForChild("Animator"), GameAnimationUtil:getAssetId(AnimationType.CAPTAIN_PENGUIN_ABILITY));
            SoundManager:playSound(GameSound.PENGUIN_PIRATE);
            local u35 = ReplicatedStorage.Assets.Effects.Impulse:Clone();
            u35.Parent = Workspace;
            u35:PivotTo(CFrame.new(v34));
            local u37 = RunService.Heartbeat:Connect(function(p36) -- Line: 232
                -- upvalues: u35 (copy), Workspace (ref), HumanoidRootPart (copy)
                if u35.Parent ~= Workspace or not HumanoidRootPart.CFrame then
                    return nil;
                end;

                u35:PivotTo(HumanoidRootPart.CFrame);
            end);

            local function _(p38) -- Line: 239
                if p38:IsA("ParticleEmitter") then
                    p38:Emit(1);
                end;
            end;

            for i, child in u35:GetChildren() do
                local _ = i - 1;

                if child:IsA("ParticleEmitter") then
                    child:Emit(1);
                end;
            end;

            task.delay(2, function() -- Line: 247
                -- upvalues: u35 (copy), u37 (copy)
                u35:Destroy();
                u37:Disconnect();
            end);
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;