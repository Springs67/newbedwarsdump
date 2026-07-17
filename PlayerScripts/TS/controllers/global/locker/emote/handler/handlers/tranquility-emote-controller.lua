-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local SingleMotor = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src").SingleMotor;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v4.ReplicatedStorage;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "TranquilityEmoteController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 26
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "TranquilityEmoteController";
end;

function u5.KnitStart(p8) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), u2 (copy), ReplicatedStorage (copy), Workspace (copy), u1 (copy), GameSound (copy), u3 (copy), SingleMotor (copy), RunService (copy)
    KnitController.KnitStart(p8);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local ZEN_HOVER = EmoteType.ZEN_HOVER;
    local u9 = EmoteHandler;
    local u10 = setmetatable({}, {
        __tostring = function() -- Line: 42, Name: __tostring
            return "Anonymous";
        end,

        __index = u9
    });
    u10.__index = u10;

    function u10.new(...) -- Line: 48
        -- upvalues: u10 (ref)
        local v11 = setmetatable({}, u10);

        return v11:constructor(...) or v11;
    end;

    function u10.constructor(p12, ...) -- Line: 52
        -- upvalues: u9 (copy), u2 (ref)
        u9.constructor(p12, ...);
        p12.maid = u2.new();
    end;

    function u10.onEnable(p13, p14, u15, p16, p17) -- Line: 56
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), u1 (ref), GameSound (ref), u3 (ref), SingleMotor (ref), RunService (ref)
        local v18 = ReplicatedStorage.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone();
        v18.Parent = Workspace.Terrain;
        p13.maid:GiveTask(v18);
        local v19 = {};

        for _, descendant in v18:GetDescendants() do
            if descendant:IsA("ParticleEmitter") then
                v19[descendant] = u1.copy(descendant.Size.Keypoints);
            end;
        end;

        p13:playSound(GameSound.SPIRIT_EFFECT, p14, {
            rollOffMaxDistance = 100,
            position = u15:GetPivot().Position
        });
        local v20 = Random.new();
        local v21 = false;
        local v22 = 0;
        local u23 = {};

        while true do
            if v21 then
                v22 = v22 + 1;
            else
                v21 = true;
            end;

            if v22 >= 10 then
                p17:GiveTask(RunService.Heartbeat:Connect(function(p24) -- Line: 135
                    -- upvalues: u23 (copy), u15 (copy)
                    for _, v in u23 do
                        v.elapsedTime = v.elapsedTime + p24;
                        local v25 = v.instance:GetPivot();
                        local v26 = math.noise(v.elapsedTime / 3, v.seed, 0) * 0.5;
                        local v27 = math.noise(v.elapsedTime / 3, 1, -v.seed) * 0.5;
                        local v28 = math.noise(v.elapsedTime / 3, 0, v.seed * 2) * 0.5;
                        local v29 = Vector3.new(v26, v27, v28);
                        local Position = u15:GetPivot().Position;
                        local v30 = math.sin(v.elapsedTime * 0.5) * 6;
                        local v31 = math.sin(v.elapsedTime + v.seed) * 3;
                        local v32 = math.cos(v.elapsedTime * 0.5) * 6;
                        local v33 = (Position + Vector3.new(v30, v31, v32) - v25.Position).Unit * -0.3;
                        local v34 = v29 + ((u15:GetPivot().Position - Vector3.new(0, 1, 0) - v25.Position).Y > 0 and Vector3.new(0, -0.6, 0) or Vector3.new()) + v33;
                        local v35 = (v25 * CFrame.new(0, 0, 3)).Position + v34 - v25.Position;
                        v.goalAttachment.WorldCFrame = CFrame.lookAt(v25.Position, v25.Position + v34);
                        v.linearVelocity.VectorVelocity = v35.Unit * 4;
                    end;
                end));
                p17:GiveTask(function() -- Line: 165
                    -- upvalues: u23 (copy)
                    for _, v in u23 do
                        v.instance:Destroy();
                        v.goalAttachment:Destroy();
                        v.motor:destroy();
                    end;
                end);

                return;
            end;

            local v36 = u15:GetPivot();
            local new = CFrame.new;
            local v37 = v20:NextNumber(0, 1) * 100;
            local v38 = math.sin(v37) * 5;
            local v39 = v20:NextNumber(0, 1) * 100;
            local v40 = v36 * new(v38, 0, math.cos(v39) * 5);
            local u41 = ReplicatedStorage.Assets.Effects.KillEffectButterfly:Clone();
            u41:PivotTo(CFrame.lookAt(v40.Position, u15:GetPivot().Position));
            u41.Parent = Workspace;
            local v42 = u3("Attachment", {
                Parent = u41.PrimaryPart
            });
            local v43 = u3("Attachment", {
                Parent = Workspace.Terrain
            });
            local v44 = u3("LinearVelocity", {
                Parent = u41.PrimaryPart,
                MaxForce = u41.PrimaryPart.AssemblyMass * 10,
                Attachment0 = v42
            });
            u3("AlignOrientation", {
                MaxTorque = 50000000,
                Responsiveness = 3,
                Parent = u41.PrimaryPart,
                Attachment0 = v42,
                Attachment1 = v43
            });
            local v45 = ReplicatedStorage.Assets.Effects.ButterflyBeam:Clone();
            v45.Parent = v42;
            v45.Attachment0 = v42;
            u41.PrimaryPart.Anchored = false;
            local v46 = SingleMotor.new(1);
            v46:onStep(function(p47) -- Line: 115
                -- upvalues: u41 (copy)
                if u41.PrimaryPart then
                    u41.PrimaryPart.Size = Vector3.new(p47, p47, p47);
                end;
            end);
            local v48 = {
                partCount = 1,
                consuming = false,
                instance = u41,
                origin = v40,
                seed = v20:NextNumber(-50000, 50000),
                linearVelocity = v44,
                goalAttachment = v43,
                elapsedTime = v22 * 0.6283185307179586 * 2,
                motor = v46,
                beam = v45
            };
            table.insert(u23, v48);
        end;
    end;

    function u10.onDisable(p49, p50, p51, p52) -- Line: 173
    end;

    EmoteHandlerController:registerHandler(ZEN_HOVER, u10);
end;

KnitClient.CreateController(u5.new());

return nil;