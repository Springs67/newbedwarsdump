-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SantaUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "santa", "santa-util").SantaUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SantaBombEffectsController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "SantaBombEffectsController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), default2 (copy), ReplicatedStorage (copy), Workspace (copy), AnimationUtil (copy), SoundManager (copy), GameSound (copy), default (copy), SantaUtil (copy), Linear (copy)
    KnitController.KnitStart(p6);
    default2.Client:WaitFor("SantaStrafeEffect"):andThen(function(p7) -- Line: 37
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), AnimationUtil (ref), SoundManager (ref), GameSound (ref), default (ref), SantaUtil (ref), Linear (ref)
        return p7:Connect(function(p8) -- Line: 38
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), AnimationUtil (ref), SoundManager (ref), GameSound (ref), default (ref), SantaUtil (ref), Linear (ref)
            local u9 = ReplicatedStorage.Assets.Misc:WaitForChild("santa"):WaitForChild("santa_sleigh"):Clone();
            local v10 = p8.siege == true;
            u9.Parent = Workspace;
            local u11 = CFrame.new(p8.originPosition, p8.dropPosition);
            local sleigh = u9:WaitForChild("sleigh");
            local u12 = u11 + (p8.dropPosition - p8.originPosition) * 2;
            local u13 = {
                {
                    sleighDelta = Vector3.new(0, 0, 0),
                    model = sleigh
                }
            };

            for _, child in u9:GetChildren() do
                if child:IsA("Model") and child.Name == "deer" then
                    local v14 = {
                        model = child,
                        sleighDelta = (child:GetPivot():Inverse() * sleigh:GetPivot()).Position
                    };
                    table.insert(u13, v14);
                    AnimationUtil:playAnimation(child:FindFirstChildWhichIsA("AnimationController"):FindFirstChildWhichIsA("Animator"), "rbxassetid://8246523829", {
                        looped = true
                    });
                end;
            end;

            SoundManager:playSound(GameSound.SANTA_BELLS, {
                rollOffMinDistance = 150,
                rollOffMaxDistance = 300,
                position = u11.Position,
                playbackSpeedMultiplier = v10 and 0.85 or 1
            });
            local u17 = default(SantaUtil.DROP_DELAY * 2, Linear, function(p15) -- Line: 73
                -- upvalues: u13 (copy), u11 (copy), u12 (copy)
                for _, v in u13 do
                    local v16 = u11:Lerp(u12, p15) * CFrame.new(v.sleighDelta * -1);

                    if v.model.Name == "sleigh" then
                        v16 = v16 * CFrame.Angles(0, -1.5707963267948966, 0);
                    end;

                    v.model:PivotTo(v16);
                end;
            end, 0, 1);
            task.spawn(function() -- Line: 86
                -- upvalues: u17 (copy), u9 (copy)
                u17:Wait();
                u9:Destroy();
            end);
        end);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;