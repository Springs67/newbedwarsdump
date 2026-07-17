-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v3.Linear;
local OutQuad = v3.OutQuad;
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src");
local SingleMotor = v4.SingleMotor;
local Spring = v4.Spring;
local u5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u6 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v7 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v7.ReplicatedStorage;
local RunService = v7.RunService;
local Workspace = v7.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u8 = Random.new();
local u9 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "ButterflyKillEffect";
    end,

    __index = KillEffect
});
u9.__index = u9;

function u9.new(...) -- Line: 33
    -- upvalues: u9 (ref)
    local v10 = setmetatable({}, u9);

    return v10:constructor(...) or v10;
end;

function u9.constructor(p11, p12) -- Line: 37
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p11, p12);
    KillEffect.setPlayDefaultKillEffect(p11, false);
end;

function u9.onKill(p13, p14, p15, u16) -- Line: 41
    -- upvalues: u5 (copy), Workspace (copy), KillEffect (copy), ReplicatedStorage (copy), u2 (copy), SoundManager (copy), GameSound (copy), u8 (copy), u6 (copy), SingleMotor (copy), RunService (copy), RandomUtil (copy), default (copy), Linear (copy), Spring (copy), OutQuad (copy)
    local u17 = u5.new();
    p15.Archivable = true;
    local u18 = p15:Clone();
    u18.HumanoidRootPart.Anchored = true;
    u18:PivotTo(u16);
    u18.Parent = Workspace;
    KillEffect.hideCharacter(p13, p15);
    u17:GiveTask(u18);
    local u19 = ReplicatedStorage.Assets.Effects.ButterflyConsumeEffect.ParticleAttachment:Clone();
    u19.Parent = Workspace.Terrain;
    u17:GiveTask(u19);
    local u20 = {};

    for _, descendant in u19:GetDescendants() do
        if descendant:IsA("ParticleEmitter") then
            u20[descendant] = u2.copy(descendant.Size.Keypoints);
        end;
    end;

    SoundManager:playSound(GameSound.SPIRIT_EFFECT, {
        rollOffMaxDistance = 100,
        position = u16.Position
    });
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
            u17:GiveTask(RunService.Heartbeat:Connect(function(p24) -- Line: 128
                -- upvalues: u23 (copy), u16 (copy)
                for _, v in u23 do
                    v.elapsedTime = v.elapsedTime + p24;
                    local v25 = v.instance:GetPivot();
                    local v26 = math.noise(v.elapsedTime / 3, v.seed, 0) * 0.5;
                    local v27 = math.noise(v.elapsedTime / 3, 1, -v.seed) * 0.5;
                    local v28 = math.noise(v.elapsedTime / 3, 0, v.seed * 2) * 0.5;
                    local v29 = Vector3.new(v26, v27, v28);
                    local Position = u16.Position;
                    local v30 = math.sin(v.elapsedTime * 0.5) * 6;
                    local v31 = math.sin(v.elapsedTime + v.seed) * 3;
                    local v32 = math.cos(v.elapsedTime * 0.5) * 6;
                    local v33 = (Position + Vector3.new(v30, v31, v32) - v25.Position).Unit * -0.3;
                    local v34 = v29 + ((u16.Position - Vector3.new(0, 1, 0) - v25.Position).Y > 0 and Vector3.new(0, -0.6, 0) or Vector3.new()) + v33;
                    local v35 = (v25 * CFrame.new(0, 0, 3)).Position + v34 - v25.Position;
                    v.goalAttachment.WorldCFrame = CFrame.lookAt(v25.Position, v25.Position + v34);
                    v.linearVelocity.VectorVelocity = v35.Unit * 4;
                end;
            end));
            task.delay(1, function() -- Line: 158
                -- upvalues: u18 (copy), u17 (copy), RunService (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), u23 (copy), u8 (ref), u6 (ref), default (ref), Linear (ref), Spring (ref), u19 (copy), u20 (copy), OutQuad (ref)
                local function _(p36) -- Line: 160
                    return p36:IsA("BasePart");
                end;

                local v37 = 0;
                local u38 = {};

                for i, descendant in u18:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") == true then
                        v37 = v37 + 1;
                        u38[v37] = descendant;
                    end;
                end;

                for _, v in u38 do
                    v:BreakJoints();
                    v.Anchored = true;
                end;

                local u39 = 4 / #u38;
                local u40 = -1;
                u17:GiveTask(RunService.Heartbeat:Connect(function() -- Line: 180
                    -- upvalues: u40 (ref), u39 (copy), u38 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref), u23 (ref), u8 (ref), u6 (ref), default (ref), Linear (ref), Spring (ref), u19 (ref), u20 (ref), OutQuad (ref)
                    if u39 <= os.clock() - u40 then
                        u40 = os.clock();
                        local v41 = #u38;
                        local u42 = u38[v41];
                        u38[v41] = nil;

                        if u42 == nil then
                            return nil;
                        end;

                        SoundManager:playSound(RandomUtil.fromList(GameSound.SPIRITORB_PULL_1, GameSound.SPIRITORB_PULL_2, GameSound.SPIRITORB_PULL_3), {
                            position = u42.Position
                        });
                        local u43 = u23[u8:NextInteger(0, #u23 - 1) + 1];
                        local v44 = u42:FindFirstChildOfClass("Attachment");

                        if v44 == nil then
                            v44 = u6("Attachment", {
                                Parent = u42
                            });
                        end;

                        u43.beam.Attachment1 = v44;
                        task.spawn(function() -- Line: 204
                            -- upvalues: default (ref), Linear (ref), u42 (copy), u43 (copy), Spring (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref), u19 (ref), u20 (ref), OutQuad (ref)
                            default(0.3, Linear, function(p45) -- Line: 205
                                -- upvalues: u42 (ref)
                                u42.CFrame = p45;
                            end, u42.CFrame, u43.instance:GetPivot());
                            task.wait(0.2);

                            if u43.instance.PrimaryPart then
                                u43.motor:setGoal(Spring.new(1 + u43.partCount * 0.3, {
                                    dampingRatio = 0.8,
                                    frequency = 6
                                }));
                                SoundManager:playSound(RandomUtil.fromList(GameSound.SPIRITORB_ABSORB_1, GameSound.SPIRITORB_ABSORB_2, GameSound.SPIRITORB_ABSORB_2), {
                                    position = u42.Position
                                });
                                u19.WorldCFrame = u43.instance:GetPivot();

                                for _, child in u19:GetChildren() do
                                    if child:IsA("ParticleEmitter") then
                                        local v46 = child:GetAttribute("EmitCount");
                                        local v47 = u20[child];

                                        if v47 ~= nil then
                                            local v48 = {};

                                            for i, v in pairs(v47) do
                                                local v49 = NumberSequenceKeypoint.new(v.Time, v47[i - 1 + 1].Value * 0.6, v47[i - 1 + 1].Envelope);
                                                table.insert(v48, v49);
                                            end;

                                            child.Size = NumberSequence.new(v48);
                                            child:Emit(v46);
                                        end;
                                    end;
                                end;

                                local v50 = u43;
                                v50.partCount = v50.partCount + 1;
                            end;

                            default(0.1, OutQuad, function(p51) -- Line: 239
                                -- upvalues: u42 (ref)
                                u42.Size = p51;
                            end, u42.Size, Vector3.new(0, 0, 0)):Wait();
                            u42:Destroy();
                        end);
                    end;
                end));
            end);
            u17:GiveTask(function() -- Line: 247
                -- upvalues: u23 (copy)
                for _, v in u23 do
                    v.instance:Destroy();
                    v.goalAttachment:Destroy();
                    v.motor:destroy();
                end;
            end);
            task.delay(7, function() -- Line: 254
                -- upvalues: u23 (copy), default (ref), OutQuad (ref), u17 (copy)
                for _, v in u23 do
                    local function v53(p52) -- Line: 256
                        -- upvalues: v (copy)
                        if v.instance.PrimaryPart then
                            v.instance.PrimaryPart.Size = p52;
                        end;
                    end;

                    local PrimaryPart = v.instance.PrimaryPart;

                    if PrimaryPart ~= nil then
                        PrimaryPart = PrimaryPart.Size;
                    end;

                    default(0.5, OutQuad, v53, PrimaryPart == nil and Vector3.new(1, 1, 1) or PrimaryPart, (Vector3.new()));
                end;

                task.wait(0.5);
                u17:DoCleaning();
            end);

            return u17;
        end;

        local new = CFrame.new;
        local v54 = u8:NextNumber(0, 1) * 100;
        local v55 = math.sin(v54) * 5;
        local v56 = u8:NextNumber(0, 1) * 100;
        local v57 = u16 * new(v55, 0, math.cos(v56) * 5);
        local u58 = ReplicatedStorage.Assets.Effects.KillEffectButterfly:Clone();
        u58:PivotTo(CFrame.lookAt(v57.Position, u16.Position));
        u58.Parent = Workspace;
        local v59 = u6("Attachment", {
            Parent = u58.PrimaryPart
        });
        local v60 = u6("Attachment", {
            Parent = Workspace.Terrain
        });
        local v61 = u6("LinearVelocity", {
            Parent = u58.PrimaryPart,
            MaxForce = u58.PrimaryPart.AssemblyMass * 10,
            Attachment0 = v59
        });
        u6("AlignOrientation", {
            MaxTorque = 50000000,
            Responsiveness = 3,
            Parent = u58.PrimaryPart,
            Attachment0 = v59,
            Attachment1 = v60
        });
        local v62 = ReplicatedStorage.Assets.Effects.ButterflyBeam:Clone();
        v62.Parent = v59;
        v62.Attachment0 = v59;
        u58.PrimaryPart.Anchored = false;
        local v63 = SingleMotor.new(1);
        v63:onStep(function(p64) -- Line: 108
            -- upvalues: u58 (copy)
            if u58.PrimaryPart then
                u58.PrimaryPart.Size = Vector3.new(p64, p64, p64);
            end;
        end);
        local v65 = {
            partCount = 1,
            consuming = false,
            instance = u58,
            origin = v57,
            seed = u8:NextNumber(-50000, 50000),
            linearVelocity = v61,
            goalAttachment = v60,
            elapsedTime = v22 * 0.6283185307179586 * 2,
            motor = v63,
            beam = v62
        };
        table.insert(u23, v65);
    end;
end;

return u9;