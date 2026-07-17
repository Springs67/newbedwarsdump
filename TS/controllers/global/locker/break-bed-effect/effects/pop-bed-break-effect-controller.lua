-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local OutQuad = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local BedBreakEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local BreakBedEffectController = RuntimeLib.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController;

local function getRootCFrame(p3) -- Line: 32
    if p3:IsA("Model") then
        return p3:GetPivot();
    end;

    if p3:IsA("BasePart") then
        return p3.CFrame;
    end;

    error("[PopBreakEffect] Root must be Model or BasePart");
end;

local u4 = setmetatable({}, {
    __tostring = function() -- Line: 45, Name: __tostring
        return "PopBreakEffectController";
    end,

    __index = BreakBedEffectController
});
u4.__index = u4;

function u4.new(...) -- Line: 51
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 55
    -- upvalues: BreakBedEffectController (copy), BedBreakEffectType (copy), u1 (copy)
    BreakBedEffectController.constructor(p6, BedBreakEffectType.POP);
    p6.Name = "PopBreakEffectController";
    p6.tweenMaid = u1.new();
end;

function u4.KnitStart(p7) -- Line: 60
    -- upvalues: BreakBedEffectController (copy)
    BreakBedEffectController.KnitStart(p7);
end;

function u4.onBedBreak(u8, p9, u10, u11, u12) -- Line: 63
    task.spawn(function() -- Line: 64
        -- upvalues: u8 (copy), u10 (copy), u12 (copy), u11 (copy)
        u8:createEffect(u10, u12, u11);
    end);
end;

function u4.createEffect(u13, u14, u15, p16) -- Line: 68
    -- upvalues: KnitClient (copy), Workspace (copy), SoundManager (copy), GameSound (copy), RunService (copy), OutQuad (copy), ReplicatedStorage (copy), EffectUtil (copy)
    local u17 = true;
    u13.maid:GiveTask(function() -- Line: 70
        -- upvalues: u17 (ref)
        u17 = false;
    end);
    u13.maid:GiveTask(u13.tweenMaid);
    local v18 = KnitClient.Controllers.BreakBedEffectUtilController:createBedClone(p16);

    if not v18 then
        return nil;
    end;

    v18.Name = "BedBreakEffectBedClone";
    v18:PivotTo(u14);
    v18.Parent = Workspace;
    u13.maid:GiveTask(v18);
    local u19 = SoundManager:playSound(GameSound.BED_INFLATE_SOUND, {
        position = u15
    });

    if u19 then
        u13.tweenMaid:GiveTask(function() -- Line: 96
            -- upvalues: u19 (copy)
            return u19:Destroy();
        end);
    end;

    local Root = v18:FindFirstChild("Root");

    if not Root then
        v18:Destroy();

        return nil;
    end;

    local u20;

    if Root:IsA("Model") then
        u20 = Root:GetPivot();
    elseif Root:IsA("BasePart") then
        u20 = Root.CFrame;
    else
        error("[PopBreakEffect] Root must be Model or BasePart");
        u20 = nil;
    end;

    local u21 = {};

    local function _(p22) -- Line: 108
        -- upvalues: u20 (copy), u21 (copy)
        if p22:IsA("BasePart") then
            u21[p22] = {
                initialSize = p22.Size,
                initialLocalCFrame = u20:ToObjectSpace(p22.CFrame)
            };
        end;
    end;

    for i, child in Root:GetChildren() do
        local _ = i - 1;

        if child:IsA("BasePart") then
            u21[child] = {
                initialSize = child.Size,
                initialLocalCFrame = u20:ToObjectSpace(child.CFrame)
            };
        end;
    end;

    local u23 = 0;
    local v44 = RunService.Heartbeat:Connect(function(p24) -- Line: 123
        -- upvalues: u23 (ref), OutQuad (ref), u20 (copy), u14 (copy), u21 (copy)
        u23 = u23 + p24;
        local v25 = math.min(1, u23 / 3);
        local v26 = OutQuad(math.min(u23, 3), 0, 1, 3);
        local u27 = math.lerp(1, 1.5, v26);
        local u28 = math.lerp(1, 3.5, v26);
        local u29 = math.lerp(1, 1.5, v26);
        local v30 = math.lerp(0, 0.5, v25);
        local v31 = math.pow(v25, 2.2);
        local v32 = math.pow(v25, 2.4);
        local v33 = v31 * math.lerp(1, 0.82, v32);
        local v34 = math.lerp(2.2, 22, v33);
        local v35 = math.lerp(0.042, 0.24, v33);
        local v36 = math.lerp(0.0020943951023931952, 0.01832595714594046, v33);
        local v37 = u23;
        local u38 = CFrame.new(math.sin(v37 * v34 * 1.07) * v35, math.cos(v37 * v34 * 0.93) * v35 * 0.55 + v30, math.sin(v37 * v34 * 0.71 + 1.2) * v35) * CFrame.Angles(math.cos(v37 * v34 * 1.21) * v36 * 0.5, math.sin(v37 * v34 * 0.88) * v36 * 0.5, math.cos(v37 * v34 * 0.76 + 0.5) * v36 * 0.5);

        local function v43(p39, p40) -- Line: 142
            -- upvalues: u27 (copy), u28 (copy), u29 (copy), u20 (ref), u14 (ref), u38 (copy)
            local initialLocalCFrame = p39.initialLocalCFrame;
            local Position = initialLocalCFrame.Position;
            local v41 = Vector3.new(Position.X * u27, Position.Y * u28, Position.Z * u29);
            local v42 = initialLocalCFrame - initialLocalCFrame.Position;
            p40.CFrame = u14:ToWorldSpace(u38 * u14:ToObjectSpace((u20:ToWorldSpace(CFrame.new(v41) * v42))));
            p40.Size = Vector3.new(p39.initialSize.X * u27, p39.initialSize.Y * u28, p39.initialSize.Z * u29);
        end;

        for i, v in u21 do
            v43(v, i, u21);
        end;
    end);
    u13.tweenMaid:GiveTask(v44);
    task.delay(2.7, function() -- Line: 159
        -- upvalues: u19 (copy), SoundManager (ref), GameSound (ref), u15 (copy), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local v45 = u19;

        if v45 ~= nil then
            v45:Stop();
        end;

        SoundManager:playSound(GameSound.BED_POP_SOUND, {
            position = u15
        });
        local v46 = ReplicatedStorage.Assets.Effects.BedPopExplosion:Clone();
        v46.Parent = Workspace;
        v46.CFrame = CFrame.new(u15);
        EffectUtil:playEffects({ v46 }, nil, {
            sizeMultiplier = 2,
            destroyAfterSec = 3
        });
    end);
    task.wait(2.8499999999999996);
    v44:Disconnect();
    v18:Destroy();
    u13.maid:GiveTask(task.spawn(function() -- Line: 181
        -- upvalues: u13 (copy)
        task.wait(10);
        u13.tweenMaid:DoCleaning();
        u13.maid:DoCleaning();
    end));
end;

KnitClient.CreateController(u4.new());

return nil;