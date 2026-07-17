-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local SingleMotor = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src").SingleMotor;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util");
local findSurfacePosition = v4.findSurfacePosition;
local getClosestBlockReferenceBelowWorldPosition = v4.getClosestBlockReferenceBelowWorldPosition;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "VoidMeditationEmoteController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 33
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "VoidMeditationEmoteController";
end;

function u5.KnitStart(p8) -- Line: 41
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), Workspace (copy), u2 (copy), default (copy), Linear (copy), getClosestBlockReferenceBelowWorldPosition (copy), BlockEngine (copy), findSurfacePosition (copy), ReplicatedStorage (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), u1 (copy), SingleMotor (copy), RunService (copy)
    KnitController.KnitStart(p8);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local VOID_MEDITATION = EmoteType.VOID_MEDITATION;
    local u9 = EmoteHandler;
    local u10 = setmetatable({}, {
        __tostring = function() -- Line: 49, Name: __tostring
            return "Anonymous";
        end,

        __index = u9
    });
    u10.__index = u10;

    function u10.new(...) -- Line: 55
        -- upvalues: u10 (ref)
        local v11 = setmetatable({}, u10);

        return v11:constructor(...) or v11;
    end;

    function u10.constructor(p12, ...) -- Line: 59
        -- upvalues: u9 (copy)
        u9.constructor(p12, ...);
    end;

    function u10.onEnable(p13, p14, u15, p16, u17) -- Line: 62
        -- upvalues: Workspace (ref), u2 (ref), default (ref), Linear (ref), getClosestBlockReferenceBelowWorldPosition (ref), BlockEngine (ref), findSurfacePosition (ref), ReplicatedStorage (ref), GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), u1 (ref), SingleMotor (ref), RunService (ref)
        local u18 = u2("Part", {
            Name = "EmotePart",
            Transparency = 1,
            Size = Vector3.new(1, 1, 1),
            Parent = Workspace,
            Position = u15.Head.Position + Vector3.new(0, 6, 0),
            Anchored = true,
            CanCollide = false
        });
        local u19 = u2("PointLight", {
            Name = "EmotePointLight",
            Brightness = 0,
            Range = 10,
            Enabled = true,
            Parent = u18,
            Color = Color3.fromRGB(133, 46, 158)
        });
        local u21 = default(1, Linear, function(p20) -- Line: 85
            -- upvalues: u19 (copy)
            u19.Brightness = p20;
        end, 0, 2);
        local v22 = getClosestBlockReferenceBelowWorldPosition(u15:GetPivot().Position, 3);

        if v22 ~= nil then
            v22 = v22.blockPosition;
        end;

        if v22 == nil then
            v22 = BlockEngine:getBlockPosition(u15:GetPivot().Position);
        end;

        local v23 = findSurfacePosition(v22);
        local u24 = ReplicatedStorage.Assets.Effects.VoidMeditationPortal:Clone();

        if v23 == nil then
            v23 = u15:GetPivot().Position - Vector3.new(0, 2, 0);
        end;

        u24:PivotTo(CFrame.new(v23));
        u24.Parent = Workspace;
        u17:GiveTask(function() -- Line: 108
            -- upvalues: u24 (copy)
            u24:Destroy();
        end);
        local Animator = u15:WaitForChild("Humanoid"):WaitForChild("Animator");
        local u25 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.VOID_MEDITATION_KNEEL));
        local u26 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.VOID_MEDITATION_IDLE));
        u25:Play();
        u21:Play();
        local u27 = p13:playSound(GameSound.VOID_PORTAL_LOOP, p14, {
            looped = true,
            volumeMultiplier = 0.4,
            position = u15:GetPivot().Position
        });
        u17:GiveTask(function() -- Line: 122
            -- upvalues: u18 (copy), u19 (copy), u21 (copy), u25 (copy), u27 (copy)
            u18:Destroy();
            u19:Destroy();
            u21:Cancel();
            u25:Stop();
            u25:Destroy();
            u27:Destroy();
        end);
        u25:GetMarkerReachedSignal("freeze"):Connect(function() -- Line: 130
            -- upvalues: u25 (copy), u26 (copy), u17 (copy)
            u25:AdjustSpeed(0);
            u26:Play();
            u25:Stop(1);
            u17:GiveTask(function() -- Line: 134
                -- upvalues: u26 (ref)
                u26:Stop();
                u26:Destroy();
            end);
        end);
        local v28 = ReplicatedStorage.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone();
        v28.Parent = Workspace.Terrain;
        u17:GiveTask(v28);
        local v29 = {};

        for _, descendant in v28:GetDescendants() do
            if descendant:IsA("ParticleEmitter") then
                v29[descendant] = u1.copy(descendant.Size.Keypoints);
            end;
        end;

        local v30 = Random.new();
        local v31 = false;
        local v32 = 0;
        local u33 = {};

        while true do
            if v31 then
                v32 = v32 + 1;
            else
                v31 = true;
            end;

            if v32 >= 10 then
                u17:GiveTask(RunService.Heartbeat:Connect(function(p34) -- Line: 209
                    -- upvalues: u33 (copy), u15 (copy)
                    for _, v in u33 do
                        v.elapsedTime = v.elapsedTime + p34;
                        local v35 = v.instance:GetPivot();
                        local v36 = math.noise(v.elapsedTime / 3, v.seed, 0) * 0.5;
                        local v37 = math.noise(v.elapsedTime / 3, 1, -v.seed) * 0.5;
                        local v38 = math.noise(v.elapsedTime / 3, 0, v.seed * 2) * 0.5;
                        local v39 = Vector3.new(v36, v37, v38);
                        local Position = u15:GetPivot().Position;
                        local v40 = math.sin(v.elapsedTime * 0.5) * 6;
                        local v41 = math.sin(v.elapsedTime + v.seed) * 3;
                        local v42 = math.cos(v.elapsedTime * 0.5) * 6;
                        local v43 = (Position + Vector3.new(v40, v41, v42) - v35.Position).Unit * -0.3;
                        local v44 = v39 + ((u15:GetPivot().Position - Vector3.new(0, 1, 0) - v35.Position).Y > 0 and Vector3.new(0, -0.6, 0) or Vector3.new()) + v43;
                        local v45 = (v35 * CFrame.new(0, 0, 3)).Position + v44 - v35.Position;
                        v.goalAttachment.WorldCFrame = CFrame.lookAt(v35.Position, v35.Position + v44);
                        v.linearVelocity.VectorVelocity = v45.Unit * 4;
                    end;
                end));
                u17:GiveTask(function() -- Line: 239
                    -- upvalues: u33 (copy)
                    for _, v in u33 do
                        v.instance:Destroy();
                        v.goalAttachment:Destroy();
                        v.motor:destroy();
                    end;
                end);

                return;
            end;

            local v46 = u15:GetPivot();
            local new = CFrame.new;
            local v47 = v30:NextNumber(0, 1) * 100;
            local v48 = math.sin(v47) * 5;
            local v49 = v30:NextNumber(0, 1) * 100;
            local v50 = v46 * new(v48, 0, math.cos(v49) * 5);
            local u51 = ReplicatedStorage.Assets.Effects.KillEffectVoidShadow:Clone();
            u51:PivotTo(CFrame.lookAt(v50.Position, u15:GetPivot().Position));
            u51.Parent = Workspace;
            local v52 = u2("Attachment", {
                Parent = u51.PrimaryPart
            });
            local v53 = u2("Attachment", {
                Parent = Workspace.Terrain
            });
            local v54 = u2("LinearVelocity", {
                Parent = u51.PrimaryPart,
                MaxForce = u51.PrimaryPart.AssemblyMass * 10,
                Attachment0 = v52
            });
            u2("AlignOrientation", {
                MaxTorque = 50000000,
                Responsiveness = 3,
                Parent = u51.PrimaryPart,
                Attachment0 = v52,
                Attachment1 = v53
            });
            u51.PrimaryPart.Anchored = false;
            local v55 = SingleMotor.new(1);
            v55:onStep(function(p56) -- Line: 191
                -- upvalues: u51 (copy)
                if u51.PrimaryPart then
                    u51.PrimaryPart.Size = Vector3.new(p56, p56, p56);
                end;
            end);
            local v57 = {
                partCount = 1,
                instance = u51,
                origin = v50,
                seed = v30:NextNumber(-50000, 50000),
                linearVelocity = v54,
                goalAttachment = v53,
                elapsedTime = v32 * 0.6283185307179586 * 2,
                motor = v55
            };
            table.insert(u33, v57);
        end;
    end;

    function u10.onDisable(p58, p59, p60, p61) -- Line: 247
    end;

    EmoteHandlerController:registerHandler(VOID_MEDITATION, u10);
end;

KnitClient.CreateController(u5.new());

return nil;