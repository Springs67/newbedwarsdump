-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "GiftKillEffect";
    end,

    __index = KillEffect
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 28
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p6, ...);
end;

function u4.onKill(p7, p8, p9, p10) -- Line: 31
    -- upvalues: u1 (copy), Workspace (copy), SoundManager (copy), GameSound (copy)
    local v11 = u1.new();
    local v12 = p7:buildBox(p10, p9);
    v12.Parent = Workspace;
    v11:GiveTask(v12);
    v11:GiveTask(SoundManager:playSound(GameSound.GIFT_KILL_EFFECT, {
        rollOffMaxDistance = 80,
        position = p10.Position
    }));
    v11:GiveTask(p7:animateBox(v12, p9));

    return v11;
end;

function u4.animateBox(u13, u14, u15) -- Line: 43
    -- upvalues: u1 (copy), Players (copy), RuntimeLib (copy), TweenService (copy), u2 (copy)
    local v16 = u1.new();
    local u17 = u14:FindFirstChild("Particle"):FindFirstChildOfClass("ParticleEmitter");

    if u15 == Players.LocalPlayer.Character then
        u15:BreakJoints();

        for _, descendant in u15:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
            end;
        end;
    end;

    local function _(p18) -- Line: 59
        -- upvalues: u17 (copy)
        local v19;

        if p18.Name == "Lid" or p18.Name == "Bow" then
            v19 = false;
        else
            v19 = p18 ~= u17;
        end;

        return v19;
    end;

    local v20 = 0;
    local u21 = {};

    for i, child in u14:GetChildren() do
        local _ = i - 1;
        local v22;

        if child.Name == "Lid" or child.Name == "Bow" then
            v22 = false;
        else
            v22 = child ~= u17;
        end;

        if v22 == true then
            v20 = v20 + 1;
            u21[v20] = child;
        end;
    end;

    table.sort(u21, function(p23, p24) -- Line: 72
        return p23.Name < p24.Name;
    end);
    local u25 = { u14:FindFirstChild("Lid"), u14:FindFirstChild("Bow") };

    for _, v in u25 do
        v.Transparency = 1;
    end;

    for _, v in u21 do
        v.Transparency = 1;
    end;

    local u30 = RuntimeLib.Promise.new(function() -- Line: 85
        -- upvalues: u21 (copy), TweenService (ref), u25 (copy), u13 (copy), u15 (copy), u14 (copy), u2 (ref), u17 (copy)
        for _, v in u21 do
            local CFrame2 = v.CFrame;
            v.CFrame = v.CFrame * CFrame.new(0, -4, 0);
            local v26 = TweenService:Create(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Transparency = 0,
                CFrame = CFrame2
            });
            v26:Play();
            v26.Completed:Wait();
        end;

        for _, v in u25 do
            local CFrame2 = v.CFrame;
            v.CFrame = v.CFrame * CFrame.new(0, 4, 0);
            local v27 = TweenService:Create(v, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Transparency = 0,
                CFrame = CFrame2
            });
            v27:Play();
            v27.Completed:Wait();
        end;

        u13:hideCharacter(u15);
        local Bottom = u14:FindFirstChild("Bottom");

        for _, child in u14:GetChildren() do
            if child:IsA("BasePart") and child ~= Bottom then
                u2("WeldConstraint", {
                    Part0 = Bottom,
                    Part1 = child,
                    Parent = Bottom
                });
                child.Anchored = false;
            end;
        end;

        local CFrame2 = Bottom.CFrame;
        local v28 = TweenService:Create(Bottom, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            CFrame = CFrame2 * CFrame.Angles(0, 3.141592653589793, 0)
        });
        v28:Play();
        v28.Completed:Wait();
        local CFrame3 = Bottom.CFrame;
        local v29 = TweenService:Create(Bottom, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            CFrame = CFrame3 * CFrame.new(0, 2, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        });
        v29:Play();
        v29.Completed:Wait();
        local CFrame4 = Bottom.CFrame;
        TweenService:Create(Bottom, TweenInfo.new(0.2, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            CFrame = CFrame4 * CFrame.new(0, -2, 0)
        }):Play();

        for _, child in u14:GetChildren() do
            if child:IsA("BasePart") then
                child.Anchored = true;
            end;
        end;

        Bottom:ClearAllChildren();
        u13:scaleModel(u14, 0, (TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In)));
        u17:Emit(100);
        task.wait(5);
        u14:Destroy();
    end);
    v16:GiveTask(function() -- Line: 188
        -- upvalues: u30 (copy)
        return u30:cancel();
    end);

    return v16;
end;

function u4.buildBox(p31, p32, p33) -- Line: 193
    -- upvalues: ReplicatedStorage (copy), PlaceUtil (copy), Workspace (copy)
    local v34 = ReplicatedStorage.Assets.Misc.GiftBox:Clone();
    local v35 = Random.new();
    local v36 = RaycastParams.new();
    v36.FilterDescendantsInstances = PlaceUtil.isLobbyServer() and { p33 } or { Workspace.Map };
    local v37;

    if PlaceUtil.isLobbyServer() then
        v37 = Enum.RaycastFilterType.Exclude;
    else
        v37 = Enum.RaycastFilterType.Include;
    end;

    v36.FilterType = v37;
    local v38 = Workspace:Raycast(p32.Position, Vector3.new(0, -10, 0), v36);

    if v38 ~= nil then
        v38 = v38.Position;
    end;

    local v39 = v38 or p32.Position;
    local v40 = v35:NextNumber(-360, 360);
    local v41 = math.rad(v40);
    v34:PivotTo(CFrame.new(v39) * CFrame.Angles(0, v41, 0));

    return v34;
end;

return u4;