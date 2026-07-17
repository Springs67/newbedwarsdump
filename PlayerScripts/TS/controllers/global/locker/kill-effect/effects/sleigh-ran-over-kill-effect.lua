-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "animation-util").AnimationUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = {
    GameSound.DEER_STOMP_1,
    GameSound.DEER_STOMP_2,
    GameSound.DEER_STOMP_3,
    GameSound.DEER_STOMP_4
};
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "SleighRanOverKillEffect";
    end,

    __index = KillEffect
});
u5.__index = u5;

function u5.new(...) -- Line: 27
    -- upvalues: u5 (copy)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, p8) -- Line: 31
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p7, p8);
    p7.preloaded = false;
    KillEffect.setPlayDefaultKillEffect(p7, false);
end;

function u5.onKill(p9, p10, p11, p12) -- Line: 36
    -- upvalues: u1 (copy), KnitClient (copy), u4 (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), KillEffect (copy), u2 (copy), AnimationUtil (copy), default (copy), InQuad (copy), SoundManager (copy), scaleModel (copy)
    local v13 = u1.new();

    if not p9.preloaded then
        local PreloadController = KnitClient.Controllers.PreloadController;
        local v14 = {};
        local v15 = {};
        local v16 = #v15;
        local v17 = #u4;
        table.move(u4, 1, v17, v16 + 1, v15);
        local v18 = v16 + v17;
        v15[v18 + 1] = GameSound.DEER_SLEIGH_CRUSH;
        v15[v18 + 2] = GameSound.DEER_SLEIGH_LOOP;
        v14.sounds = v15;
        PreloadController:runPreload(v14);
        p9.preloaded = true;
    end;

    p11.Archivable = true;
    local u19 = p11:Clone();
    local u20 = ReplicatedStorage.Assets.Misc:WaitForChild("santa"):WaitForChild("santa_sleigh"):Clone();
    u19.Parent = Workspace;
    u19.PrimaryPart.Anchored = true;

    local function _(p21) -- Line: 59
        if p21:IsA("Part") or p21:IsA("MeshPart") then
            p21.CanCollide = false;
        end;
    end;

    for i, child in u19:GetChildren() do
        local _ = i - 1;

        if child:IsA("Part") or child:IsA("MeshPart") then
            child.CanCollide = false;
        end;
    end;

    u19.Humanoid:ChangeState(Enum.HumanoidStateType.Physics);
    v13:GiveTask(u19);
    KillEffect.hideCharacter(p9, p11);
    local PrimaryPart = u19.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.CFrame;
    end;

    if not PrimaryPart then
        return v13;
    end;

    local u22 = PrimaryPart * CFrame.Angles(1.5707963267948966, 0, 1.5707963267948966) - Vector3.new(0, 1.5, 0);
    local LookVector = (PrimaryPart * CFrame.Angles(0, -1.5707963267948966, 0)).LookVector;
    u20:PivotTo(CFrame.new(PrimaryPart.Position + LookVector * 75 + Vector3.new(0, 2.5, 0), PrimaryPart.Position) * CFrame.Angles(0, -1.5707963267948966, 0));
    local sleigh = u20:WaitForChild("sleigh");
    u20.Parent = Workspace;
    u2("Sound", {
        RollOffMinDistance = 110,
        RollOffMaxDistance = 220,
        Volume = 1,
        Playing = true,
        Looped = true,
        SoundId = GameSound.DEER_SLEIGH_LOOP,
        Parent = sleigh.PrimaryPart
    });
    local v23 = {
        {
            sleighDelta = Vector3.new(0, 0, 0),
            model = sleigh
        }
    };

    for _, child in u20:GetChildren() do
        if child:IsA("Model") and child.Name == "deer" then
            local v24 = {
                model = child,
                sleighDelta = (child:GetPivot():Inverse() * sleigh:GetPivot()).Position
            };
            table.insert(v23, v24);
            AnimationUtil:playAnimation(child:FindFirstChildWhichIsA("AnimationController"):FindFirstChildWhichIsA("Animator"), "rbxassetid://8246523829", {
                looped = true
            });
        end;
    end;

    default(5, InQuad, function(p25) -- Line: 122
        -- upvalues: u20 (copy)
        u20:PivotTo(p25);
    end, sleigh.PrimaryPart.CFrame, sleigh.PrimaryPart.CFrame - LookVector * 150);
    task.delay(5, function() -- Line: 129
        -- upvalues: u20 (copy)
        u20:Destroy();
    end);
    task.delay(6.5, function() -- Line: 132
        -- upvalues: u19 (copy)
        u19:Destroy();
    end);
    task.delay(3.25, function() -- Line: 135
        -- upvalues: default (ref), InQuad (ref), u19 (copy), u22 (copy)
        default(0.1, InQuad, function(p26) -- Line: 136
            -- upvalues: u19 (ref)
            u19:PivotTo(p26);
        end, u19.PrimaryPart.CFrame, u22);
    end);
    task.delay(3.35, function() -- Line: 140
        -- upvalues: u19 (copy), default (ref), InQuad (ref), SoundManager (ref), u4 (ref)
        local CFrame2 = u19.PrimaryPart.CFrame;
        default(0.5, InQuad, function(p27) -- Line: 142
            -- upvalues: u19 (ref), CFrame2 (copy)
            u19:PivotTo(CFrame2 * CFrame.Angles(math.random(-1, 1) * 3.141592653589793 / 32, math.random(-1, 1) * 3.141592653589793 / 32, math.random(-1, 1) * 3.141592653589793 / 32));
        end, 0, 1);
        local v28 = false;
        local v29 = 0;

        while true do
            if v28 then
                v29 = v29 + 1;
            else
                v28 = true;
            end;

            if v29 >= 4 then
                return;
            end;

            SoundManager:playSound(u4[v29 + 1], {
                position = CFrame2.Position
            });
            task.wait(0.1);
        end;
    end);
    task.delay(4, function() -- Line: 167
        -- upvalues: u19 (copy), SoundManager (ref), GameSound (ref), default (ref), InQuad (ref), u22 (copy), scaleModel (ref)
        SoundManager:playSound(GameSound.DEER_SLEIGH_CRUSH, {
            position = u19.PrimaryPart.CFrame.Position
        });
        default(0.05, InQuad, function(p30) -- Line: 182
            -- upvalues: u19 (ref)
            u19:PivotTo(p30);
        end, u19.PrimaryPart.CFrame, u22 - Vector3.new(0, 1, 0));
        scaleModel(u19, Vector3.new(1, 1, 0.1));
    end);

    return v13;
end;

return u5;