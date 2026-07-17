-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "TweenTeleportController";
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
    p4.Name = "TweenTeleportController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("TweenTeleport"):Connect(function(p6) -- Line: 32
        -- upvalues: u5 (copy)
        u5:tweenEffect(p6.player, p6.oldPosition, p6.targetPosition, p6.time, p6.animation, p6.cFrame, p6.invisible, p6.animationMultiplier);
    end);
end;

function u2.tweenEffect(p7, u8, p9, p10, p11, p12, p13, p14, p15) -- Line: 36
    -- upvalues: EntityUtil (copy), Workspace (copy), Players (copy), TweenService (copy), GameAnimationUtil (copy)
    local u16 = EntityUtil:getEntity(u8);
    local Character = u8.Character;
    Character.Archivable = true;
    local Character2 = u8.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.CFrame;
        end;
    end;

    if not Character2 then
        return nil;
    end;

    local u17 = Character:Clone();

    if p14 then
        u17:SetAttribute("Transparency", 1);
    end;

    local Animator = u17.Humanoid.Animator;

    if u16 ~= nil then
        u16:hideNametag();
    end;

    u8.Character:SetAttribute("Transparency", 1);
    u17.PrimaryPart.CFrame = Character2;
    u17.Parent = Workspace;

    if u8 == Players.LocalPlayer then
        Workspace.CurrentCamera.CameraSubject = u17.Humanoid;
        task.delay(p11, function() -- Line: 65
            -- upvalues: Players (ref), Workspace (ref)
            local Character3 = Players.LocalPlayer.Character;

            if Character3 then
                Workspace.CurrentCamera.CameraSubject = Character3.Humanoid;
            end;
        end);
    end;

    local v18 = TweenInfo.new(p11);
    local v19 = TweenService:Create(u17.PrimaryPart, v18, {
        CFrame = p13 or CFrame.new(p10)
    });
    v19:Play();

    if p12 ~= 0 and (p12 == p12 and p12) then
        local v20 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(p12));

        if p15 ~= nil then
            v20:AdjustSpeed(p15);
        end;

        v20:Play();
        GameAnimationUtil:playAnimation(Character, p12);
    end;

    v19.Completed:Connect(function() -- Line: 85
        -- upvalues: u17 (copy), u8 (copy), u16 (copy)
        u17:Destroy();
        local Character3 = u8.Character;

        if Character3 ~= nil then
            Character3:SetAttribute("Transparency", 0);
        end;

        local v21 = u16;

        if v21 ~= nil then
            v21:showNametag();
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;