-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimatorAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimatorAdded;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "VoidCrabController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "VoidCrabController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), AnimatorAdded (copy), u1 (copy), GameAnimationUtil (copy), AnimationType (copy), default (copy), Linear (copy)
    KnitController.KnitStart(p5);
    CollectionTagAdded("VoidCrab", function(p6) -- Line: 32
        -- upvalues: AnimatorAdded (ref), u1 (ref), GameAnimationUtil (ref), AnimationType (ref), default (ref), Linear (ref)
        local LaserTarget = p6:WaitForChild("LaserTarget");
        local Humanoid = p6:WaitForChild("Humanoid");
        local TargetBeam = p6:WaitForChild("TargetBeam");
        local BlastBeam = p6:WaitForChild("BlastBeam");
        AnimatorAdded(Humanoid, function(p7) -- Line: 37
            -- upvalues: u1 (ref), GameAnimationUtil (ref), AnimationType (ref), TargetBeam (copy), BlastBeam (copy), LaserTarget (copy), default (ref), Linear (ref)
            p7.AnimationPlayed:Connect(function(p8) -- Line: 38
                -- upvalues: u1 (ref), GameAnimationUtil (ref), AnimationType (ref), TargetBeam (ref), BlastBeam (ref), LaserTarget (ref), default (ref), Linear (ref)
                local Animation = p8.Animation;

                if Animation ~= nil then
                    Animation = Animation.AnimationId;
                end;

                local u9 = u1.new();
                u9:GiveTask(p8.Stopped:Connect(function() -- Line: 45
                    -- upvalues: u9 (copy)
                    u9:DoCleaning();
                end));
                u9:GiveTask(p8);

                if Animation == GameAnimationUtil:getAssetId(AnimationType.VOID_CRAB_BEAM_ATTACK) then
                    TargetBeam.Enabled = true;

                    local function handleTarget(p10) -- Line: 51
                        -- upvalues: TargetBeam (ref), BlastBeam (ref)
                        if p10 ~= nil then
                            p10 = p10:FindFirstChild("UpperTorso");

                            if p10 ~= nil then
                                p10 = p10:FindFirstChild("BodyFrontAttachment");
                            end;
                        end;

                        TargetBeam.Attachment1 = p10;
                        BlastBeam.Attachment1 = p10;
                    end;

                    local Value = LaserTarget.Value;

                    if Value ~= nil then
                        Value = Value:FindFirstChild("UpperTorso");

                        if Value ~= nil then
                            Value = Value:FindFirstChild("BodyFrontAttachment");
                        end;
                    end;

                    TargetBeam.Attachment1 = Value;
                    BlastBeam.Attachment1 = Value;
                    u9:GiveTask(LaserTarget.Changed:Connect(function() -- Line: 64
                        -- upvalues: LaserTarget (ref), TargetBeam (ref), BlastBeam (ref)
                        local Value2 = LaserTarget.Value;

                        if Value2 ~= nil then
                            Value2 = Value2:FindFirstChild("UpperTorso");

                            if Value2 ~= nil then
                                Value2 = Value2:FindFirstChild("BodyFrontAttachment");
                            end;
                        end;

                        TargetBeam.Attachment1 = Value2;
                        BlastBeam.Attachment1 = Value2;
                    end));
                    u9:GiveTask(p8:GetMarkerReachedSignal("blast"):Connect(function() -- Line: 67
                        -- upvalues: TargetBeam (ref), BlastBeam (ref), default (ref), Linear (ref), u9 (copy)
                        TargetBeam.Enabled = false;
                        BlastBeam.Enabled = true;
                        local u12 = default(0.1, Linear, function(p11) -- Line: 70
                            -- upvalues: BlastBeam (ref)
                            BlastBeam.Width0 = 0.1 + p11 * 0.4;
                            BlastBeam.Width1 = 0.2 + p11 * 0.6;
                        end);
                        u9:GiveTask(function() -- Line: 74
                            -- upvalues: u12 (copy)
                            return u12:Cancel();
                        end);
                        task.delay(0.3, function() -- Line: 77
                            -- upvalues: BlastBeam (ref), default (ref), Linear (ref), u9 (ref)
                            if not BlastBeam.Parent then
                                return nil;
                            end;

                            local u14 = default(0.05, Linear, function(p13) -- Line: 81
                                -- upvalues: BlastBeam (ref)
                                BlastBeam.Width0 = 0.5 * (1 - p13);
                                BlastBeam.Width1 = 0.8 * (1 - p13);
                            end);
                            u9:GiveTask(function() -- Line: 85
                                -- upvalues: u14 (copy)
                                return u14:Cancel();
                            end);
                        end);
                    end));
                end;
            end);
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;