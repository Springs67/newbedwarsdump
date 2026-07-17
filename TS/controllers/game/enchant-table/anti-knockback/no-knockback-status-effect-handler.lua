-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InOutExpo = v2.InOutExpo;
local OutExpo = v2.OutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "status-effect", "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "NoKnockbackStatusEffectHandler";
    end,

    __index = ClientStatusEffectHandler
});
u4.__index = u4;

function u4.new(...) -- Line: 31
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 35
    -- upvalues: ClientStatusEffectHandler (copy)
    ClientStatusEffectHandler.constructor(p6, ...);
end;

function u4.onApply(u7, u8, p9) -- Line: 38
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), ModelUtil (copy), InOutExpo (copy), GameQueryUtil (copy), KnitClient (copy), VignetteType (copy), RunService (copy), default (copy), OutExpo (copy)
    local v10;

    if u8 == Players.LocalPlayer.Character then
        v10 = Players.LocalPlayer.Character;
    else
        v10 = false;
    end;

    local USE_SMOKE_CHARGE = GameSound.USE_SMOKE_CHARGE;
    local v11 = {};
    local v12;

    if v10 then
        v12 = nil;
    else
        v12 = u8.PrimaryPart;

        if v12 ~= nil then
            v12 = v12.Position;
        end;
    end;

    v11.position = v12;
    SoundManager:playSound(USE_SMOKE_CHARGE, v11);
    local u13 = ReplicatedStorage.Assets.Effects.AntiKnockbackBubble:Clone();
    u13:PivotTo(u8.HumanoidRootPart.CFrame);
    scaleModel(u13, 0.1);
    u13.Parent = Workspace;
    ModelUtil.tweenModelSize(u13, 0.2, InOutExpo, 10);

    for _, child in u13:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    if v10 then
        u7:updateShieldTransparency(u13, KnitClient.Controllers.CameraPerspectiveController:getCameraPerspective());
        u7.maid:GiveTask(KnitClient.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(p14) -- Line: 69
            -- upvalues: u7 (copy), u13 (copy)
            u7:updateShieldTransparency(u13, p14);
        end));
        KnitClient.Controllers.VignetteController:createVignette(VignetteType.ANTI_KNOCKBACK);
        u7.maid:GiveTask(function() -- Line: 73
            -- upvalues: KnitClient (ref), VignetteType (ref)
            KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.ANTI_KNOCKBACK);
        end);
    end;

    local u15 = 0;
    u7.maid:GiveTask(RunService.Heartbeat:Connect(function(p16) -- Line: 79
        -- upvalues: u15 (ref), u8 (copy), u13 (copy), default (ref)
        u15 = u15 + p16;
        local HumanoidRootPart = u8.HumanoidRootPart;

        if HumanoidRootPart == nil then
            return nil;
        end;

        if u13.PrimaryPart == nil then
            default.Error("Shield effect has no primary part");

            return nil;
        end;

        u13:PivotTo(CFrame.new(HumanoidRootPart.Position) * CFrame.Angles(u15 * -0.6, u15 * 1.5, u15 * -0.6));
        local v17 = CFrame.new(u13.Shields.Position);
        local v18 = CFrame.Angles(0, u15 * 2, 0);
        u13.Shields.CFrame = v17 * v18;
    end));
    u7.maid:GiveTask(function() -- Line: 97
        -- upvalues: ModelUtil (ref), u13 (copy), OutExpo (ref)
        ModelUtil.tweenModelSize(u13, 0.15, OutExpo, 0):andThen(function() -- Line: 99
            -- upvalues: u13 (ref)
            u13:Destroy();
        end);
    end);
end;

function u4.onRemove(p19, p20, p21) -- Line: 105
end;

function u4.updateShieldTransparency(p22, p23, p24) -- Line: 107
    local v25 = p24 == 0 and 1 or 0;

    for _, child in p23:GetChildren() do
        if child:IsA("BasePart") then
            child.LocalTransparencyModifier = v25;
        end;
    end;
end;

return {
    NoKnockbackStatusEffectHandler = u4
};