-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local KillEffect = RuntimeLib.import(script, script.Parent.Parent, "kill-effect").KillEffect;
local CurrentCamera = Workspace.CurrentCamera;
local u4 = { { "SnowmanBottom" }, { "SnowmanTorso" }, { "SnowmanLeftArm", "SnowmanRightArm", "SnowmanMitten" }, { "SnowmanScarf" }, { "SnowmanHead", "SnowmanLeftEye", "SnowmanRightEye", "SnowmanNose" }, { "SnowmanHat" } };
local u5 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out);
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "SnowmanKillEffect";
    end,

    __index = KillEffect
});
u6.__index = u6;

function u6.new(...) -- Line: 25
    -- upvalues: u6 (copy)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 29
    -- upvalues: KillEffect (copy)
    KillEffect.constructor(p8, ...);
end;

function u6.onKill(p9, p10, p11, p12) -- Line: 32
    -- upvalues: u1 (copy), Workspace (copy)
    local v13 = u1.new();
    local v14 = p9:buildSnowman(p12, p11);
    v14.Parent = Workspace;
    v13:GiveTask(v14);
    v13:GiveTask(p9:animateSnowman(v14, p11));

    return v13;
end;

function u6.animateSnowman(u15, u16, u17) -- Line: 40
    -- upvalues: u1 (copy), Players (copy), RuntimeLib (copy), u4 (copy), TweenService (copy), u5 (copy), u2 (copy)
    local v18 = u1.new();
    local SnowmanBottom = u16.SnowmanBottom;

    if u17 == Players.LocalPlayer.Character then
        u17:BreakJoints();

        for _, descendant in u17:GetDescendants() do
            if descendant:IsA("BasePart") then
                descendant.CanCollide = false;
            end;
        end;
    end;

    local u19 = u16:GetChildren();
    local u20 = {};

    for _, v in u19 do
        local CFrame2 = v.CFrame;
        u20[v] = CFrame2;
        v.CFrame = CFrame2 * CFrame.new(0, 5, 0);
        v.Transparency = 1;
    end;

    local u28 = RuntimeLib.Promise.new(function() -- Line: 64
        -- upvalues: u4 (ref), u19 (copy), u20 (copy), TweenService (ref), u5 (ref), u16 (copy), SnowmanBottom (copy), u2 (ref), u15 (copy), u17 (copy)
        for _, v in u4 do
            for _, v2 in v do
                local function _(p21) -- Line: 69
                    -- upvalues: v2 (copy)
                    return p21.Name == v2;
                end;

                local v22 = nil;

                for i, v4 in u19 do
                    local _ = i - 1;

                    if v4.Name == v2 == true then
                        v22 = v4;
                        break;
                    end;
                end;

                if v22 then
                    local v23 = u20[v22];

                    if v23 then
                        TweenService:Create(v22, u5, {
                            Transparency = 0,
                            CFrame = v23
                        }):Play();
                    end;
                end;
            end;

            task.wait(0.2);
        end;

        for _, child in u16:GetChildren() do
            if child:IsA("BasePart") and child ~= SnowmanBottom then
                u2("WeldConstraint", {
                    Part0 = SnowmanBottom,
                    Part1 = child,
                    Parent = SnowmanBottom
                });
                child.Anchored = false;
            end;
        end;

        u15:hideCharacter(u17);
        local CFrame2 = SnowmanBottom.CFrame;
        local v24 = TweenService:Create(SnowmanBottom, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            CFrame = CFrame2 * CFrame.Angles(0, 3.141592653589793, 0)
        });
        v24:Play();
        v24.Completed:Wait();
        local CFrame3 = SnowmanBottom.CFrame;
        local v25 = TweenService:Create(SnowmanBottom, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            CFrame = CFrame3 * CFrame.new(0, 2, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        });
        v25:Play();
        v25.Completed:Wait();
        local CFrame4 = SnowmanBottom.CFrame;
        TweenService:Create(SnowmanBottom, TweenInfo.new(0.4, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            CFrame = CFrame4 * CFrame.new(0, -2, 0)
        }):Play();
        task.delay(0.1, function() -- Line: 155
            -- upvalues: u16 (ref)
            u16.SnowmanBottom.Attachment.ParticleEmitter:Emit(300);
        end);
        task.wait(1);
        local v26 = TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut);
        local v27 = nil;

        for _, child in u16:GetChildren() do
            if child:IsA("BasePart") then
                v27 = TweenService:Create(child, v26, {
                    Transparency = 1
                });
                v27:Play();
            end;
        end;

        v27.Completed:Wait();
        u16:Destroy();
    end);
    v18:GiveTask(function() -- Line: 176
        -- upvalues: u28 (copy)
        return u28:cancel();
    end);

    return v18;
end;

function u6.buildSnowman(p29, p30, p31) -- Line: 181
    -- upvalues: ReplicatedStorage (copy), PlaceUtil (copy), Workspace (copy), CurrentCamera (copy)
    local v32 = ReplicatedStorage.Assets.Misc.Snowman:Clone();
    local v33 = RaycastParams.new();
    v33.FilterDescendantsInstances = PlaceUtil.isLobbyServer() and { p31 } or { Workspace.Map };
    local v34;

    if PlaceUtil.isLobbyServer() then
        v34 = Enum.RaycastFilterType.Exclude;
    else
        v34 = Enum.RaycastFilterType.Include;
    end;

    v33.FilterType = v34;
    local v35 = Workspace:Raycast(p30.Position, Vector3.new(0, -10, 0), v33);

    if v35 ~= nil then
        v35 = v35.Position;
    end;

    local v36 = v35 or p30.Position;
    v32:PivotTo(CFrame.new(v36, v36 + (v36 - CurrentCamera.CFrame.Position).Unit * Vector3.new(1, 0, 1)) * CFrame.Angles(0, 3.141592653589793, 0));

    return v32;
end;

return u6;