-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local SoundManager = v1.SoundManager;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local InExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo;
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Players = v3.Players;
local Workspace = v3.Workspace;
local Tween = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").Tween;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getMountMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "mount", "mount-meta").getMountMeta;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 27, Name: __tostring
        return "VoidTeleportPortalController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 33
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 37
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "VoidTeleportPortalController";
    p6.lastTeleport = -1;
end;

function u4.KnitStart(u7) -- Line: 42
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), Players (copy), Workspace (copy), default (copy)
    KnitController.KnitStart(u7);
    CollectionTagAdded("void_teleport_portal", function(u8) -- Line: 44
        -- upvalues: Players (ref), u7 (copy), Workspace (ref), default (ref)
        u8.Touched:Connect(function(p9) -- Line: 45
            -- upvalues: Players (ref), u7 (ref), Workspace (ref), default (ref), u8 (copy)
            if Players.LocalPlayer.Character and (p9.Parent == Players.LocalPlayer.Character and u7.lastTeleport + 2 <= Workspace:GetServerTimeNow()) then
                u7.lastTeleport = Workspace:GetServerTimeNow();
                default.Client:Get("StepOnVoidPortal"):SendToServer({
                    voidBlock = u8
                });
            end;
        end);
    end);
    default.Client:Get("VoidPortalEffect"):Connect(function(p10) -- Line: 54
        -- upvalues: u7 (copy)
        if p10.entering then
            u7:jumpInPortal(p10.player, p10.portalPosition);

            return;
        end;

        u7:jumpOutPortal(p10.player, p10.targetPosition);
    end);
end;

function u4.jumpInPortal(p11, p12, p13) -- Line: 62
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), EntityUtil (copy), CollectionService (copy), Workspace (copy), KnitClient (copy), getMountMeta (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), Tween (copy), InExpo (copy), scaleModel (copy)
    if p12 == Players.LocalPlayer then
        SoundManager:playSound(GameSound.VOID_PORTAL_ENTER);
    end;

    local Character = p12.Character;
    local v14 = EntityUtil:getEntity(p12);

    if not (Character and v14) then
        return nil;
    end;

    local v15 = p13 or Character.PrimaryPart.Position - Vector3.new(0, 2, 0);
    Character.Archivable = true;
    local u16 = Character:Clone();
    Character:SetAttribute("Transparency", 1);
    u16:SetAttribute("FirstPersonVisible", false);
    CollectionService:AddTag(u16, "FirstPersonHidden");
    v14:hideNametag();
    u16:PivotTo(Character.PrimaryPart.CFrame);
    u16.Parent = Workspace;
    local v17 = KnitClient.Controllers.MountController:getMountTypeFromPlayer(p12);

    if v17 then
        local v18 = u16:WaitForChild(v17, 0.5);
        local fall = getMountMeta(v17).animations.fall;
        local v19;

        if fall == 0 or fall ~= fall then
            v19 = fall;
        elseif fall then
            v19 = v18;
        else
            v19 = fall;
        end;

        if v19 ~= 0 and (v19 == v19 and v19) then
            KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v18, fall);
        end;
    else
        GameAnimationUtil:playAnimation(u16, AnimationType.GRAVEYARD_JUMP);
    end;

    Tween(1, InExpo, function(p20) -- Line: 98
        -- upvalues: scaleModel (ref), u16 (copy)
        scaleModel(u16, 1 - p20);
    end);
    Tween(1, InExpo, function(p21) -- Line: 101
        -- upvalues: u16 (copy)
        u16:PivotTo(p21);
    end, u16.PrimaryPart.CFrame, CFrame.new(v15));
    task.delay(1, function() -- Line: 104
        -- upvalues: u16 (copy)
        u16:Destroy();
    end);
end;

function u4.jumpOutPortal(p22, u23, p24) -- Line: 108
    -- upvalues: Players (copy), SoundManager (copy), GameSound (copy), Workspace (copy), KnitClient (copy), getMountMeta (copy), KnitClient2 (copy), GameAnimationUtil (copy), AnimationType (copy), Tween (copy), InExpo (copy), EntityUtil (copy)
    if u23 == Players.LocalPlayer then
        SoundManager:playSound(GameSound.VOID_PORTAL_EXIT);
    end;

    local Character = u23.Character;

    if not Character then
        return nil;
    end;

    Character.Archivable = true;
    local u25 = Character:Clone();
    u25:PivotTo(p24);
    u25:SetAttribute("Transparency", 0.25);

    local function _(p26) -- Line: 121
        if p26:IsA("MeshPart") then
            p26.Transparency = 0;
            p26.CanCollide = false;
        end;

        if p26:IsA("Part") then
            p26.Transparency = 1;
            p26.CanCollide = false;
        end;
    end;

    for i, descendant in u25:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("MeshPart") then
            descendant.Transparency = 0;
            descendant.CanCollide = false;
        end;

        if descendant:IsA("Part") then
            descendant.Transparency = 1;
            descendant.CanCollide = false;
        end;
    end;

    u25.Parent = Workspace;
    u25.PrimaryPart.Transparency = 1;
    local v27 = KnitClient.Controllers.MountController:getMountTypeFromPlayer(u23);

    if v27 then
        local v28 = u25:WaitForChild(v27, 0.5);
        local jump = getMountMeta(v27).animations.jump;
        local v29;

        if jump == 0 or jump ~= jump then
            v29 = jump;
        elseif jump then
            v29 = v28;
        else
            v29 = jump;
        end;

        if v29 ~= 0 and (v29 == v29 and v29) then
            KnitClient2.Controllers.MountAnimationController:playAnimationInMount(v28, jump);
        end;
    else
        GameAnimationUtil:playAnimation(u25, AnimationType.SKELETON_SPAWN);
    end;

    Tween(1, InExpo, function(p30) -- Line: 150
        -- upvalues: u25 (copy)
        u25:PivotTo(p30);
    end, u25.PrimaryPart.CFrame, Character.PrimaryPart.CFrame);
    task.delay(1, function() -- Line: 153
        -- upvalues: u25 (copy), Character (copy), EntityUtil (ref), u23 (copy)
        u25:Destroy();
        Character:SetAttribute("Transparency", 0);
        EntityUtil:getEntity(u23):showNametag();
    end);
end;

KnitClient.CreateController(u4.new());

return nil;