-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local InExpo = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InExpo;
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CloudEnchantUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "enchant", "cloud", "cloud-enchant-util").CloudEnchantUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "UnstablePortalController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "UnstablePortalController";
end;

function u3.KnitStart(u6) -- Line: 34
    -- upvalues: KnitController (copy), default2 (copy), EntityUtil (copy), CloudEnchantUtil (copy)
    KnitController.KnitStart(u6);
    default2.Client:Get("UnstablePortalEffect"):Connect(function(p7) -- Line: 36
        -- upvalues: EntityUtil (ref), CloudEnchantUtil (ref), u6 (copy)
        local v8 = EntityUtil:getEntity(p7.player);

        if not v8 then
            return nil;
        end;

        if CloudEnchantUtil:isAboveVoid(v8:getInstance(), 15) then
            u6:aboveAirEffect(p7.player);

            return;
        end;

        u6:onGroundEffect(p7.player);
    end);
    default2.Client:Get("PlayerLeavePortal"):Connect(function(p9) -- Line: 48
        -- upvalues: u6 (copy)
        u6:leavePortalEffect(p9.targetPosition, p9.player);
    end);
end;

function u3.aboveAirEffect(p10, p11) -- Line: 52
    -- upvalues: EntityUtil (copy), Workspace (copy), default (copy), InExpo (copy), scaleModel (copy), ReplicatedStorage (copy)
    local v12 = EntityUtil:getEntity(p11);

    if not v12 then
        return nil;
    end;

    local Character = p11.Character;

    if not Character then
        return nil;
    end;

    local PrimaryPart = Character.PrimaryPart;

    if PrimaryPart ~= nil then
        PrimaryPart = PrimaryPart.Position;
    end;

    if not PrimaryPart then
        return nil;
    end;

    Character.Archivable = true;
    local u13 = Character:Clone();
    u13.Parent = Workspace;
    Character:SetAttribute("Transparency", 1);
    v12:hideNametag();
    default(1, InExpo, function(p14) -- Line: 74
        -- upvalues: scaleModel (ref), u13 (copy)
        scaleModel(u13, 1 - p14);
    end);
    default(1, InExpo, function(p15) -- Line: 77
        -- upvalues: u13 (copy)
        u13:PivotTo(p15);
    end, u13.PrimaryPart.CFrame, CFrame.new(PrimaryPart - Vector3.new(0, 15, 0)));
    local u16 = ReplicatedStorage.Assets.Effects.UnstablePortal:Clone();
    u16.Parent = Workspace;
    u16:PivotTo(CFrame.new(PrimaryPart - Vector3.new(0, 15, 0)));
    task.delay(1, function() -- Line: 88
        -- upvalues: u16 (copy), u13 (copy)
        u16:Destroy();
        u13:Destroy();
    end);
end;

function u3.onGroundEffect(p17, p18) -- Line: 93
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), KnitClient2 (copy)
    local Character = p18.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;

        if Character ~= nil then
            Character = Character.Position;
        end;
    end;

    if not Character then
        return nil;
    end;

    local u19 = ReplicatedStorage.Assets.Effects.UnstablePortal:Clone();
    u19:PivotTo(CFrame.new(Character - Vector3.new(0, 1.5, 0)));
    u19.Parent = Workspace;
    KnitClient2.Controllers.VoidTeleportPortalController:jumpInPortal(p18, Character - Vector3.new(0, 1.5, 0));
    task.delay(1, function() -- Line: 114
        -- upvalues: u19 (copy)
        u19:Destroy();
    end);
end;

function u3.leavePortalEffect(p20, p21, p22) -- Line: 118
    -- upvalues: ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), default (copy), InExpo (copy)
    local Character = p22.Character;

    if not Character then
        return nil;
    end;

    Character.Archivable = true;
    local u23 = ReplicatedStorage.Assets.Effects.UnstablePortal:Clone();
    local u24 = Character:Clone();
    scaleModel(u24, 0.1);
    u24.Parent = Workspace;
    u24:SetAttribute("Transparency", 0);

    local function _(p25) -- Line: 130
        -- upvalues: u24 (copy)
        if (p25:IsA("BasePart") or p25:IsA("Decal") and not p25:IsA("Texture")) and p25 ~= u24.PrimaryPart then
            p25.Transparency = 0;
        end;
    end;

    for i, descendant in u24:GetDescendants() do
        local _ = i - 1;

        if (descendant:IsA("BasePart") or descendant:IsA("Decal") and not descendant:IsA("Texture")) and descendant ~= u24.PrimaryPart then
            descendant.Transparency = 0;
        end;
    end;

    u23:PivotTo(CFrame.new(p21 + Vector3.new(0, 9, 0)));
    u24:PivotTo(CFrame.new(p21 + Vector3.new(0, 9, 0)));
    u23.Parent = Workspace;
    default(1, InExpo, function(p26) -- Line: 147
        -- upvalues: scaleModel (ref), u24 (copy)
        scaleModel(u24, p26);
    end);
    default(1, InExpo, function(p27) -- Line: 150
        -- upvalues: u24 (copy)
        u24:PivotTo(p27);
    end, u24.PrimaryPart.CFrame, CFrame.new(p21));
    task.delay(1, function() -- Line: 153
        -- upvalues: u24 (copy), u23 (copy), Character (copy)
        u24:Destroy();
        u23:Destroy();
        Character:SetAttribute("Transparency", 0);
    end);
end;

KnitClient.CreateController(u3.new());

return nil;