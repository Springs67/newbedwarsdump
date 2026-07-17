-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "VoidArmorController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "VoidArmorController";
end;

function u2.KnitStart(u5) -- Line: 31
    -- upvalues: KnitController (copy), ItemType (copy), KnitClient (copy), GameSound (copy), default (copy)
    KnitController.KnitStart(u5);

    for _, v in { ItemType.VOID_CHESTPLATE, ItemType.VOID_HELMET, ItemType.VOID_BOOTS } do
        KnitClient.Controllers.PreloadController:preloadForItemType(v, {
            sounds = { GameSound.VOID_SHIELD_BREAK }
        });
    end;

    default.Client:Get("VoidArmorShieldTrigger"):Connect(function(u6) -- Line: 38
        -- upvalues: u5 (copy)
        u5:playEffect(u6.player);
        u5:putOnCooldown(u6.player);
        task.delay(30, function() -- Line: 41
            -- upvalues: u5 (ref), u6 (copy)
            u5:shieldReady(u6.player);
        end);
    end);
end;

function u2.putOnCooldown(p7, p8) -- Line: 46
    p7:changeArmorMaterial(p8, Enum.Material.Sand);
end;

function u2.shieldReady(p9, p10) -- Line: 49
    p9:changeArmorMaterial(p10, Enum.Material.Neon);
end;

function u2.changeArmorMaterial(p11, p12, p13) -- Line: 52
    if p12.Character == nil then
        return nil;
    end;

    local Character = p12.Character;

    if Character ~= nil then
        Character = Character:GetChildren();
    end;

    for _, v in Character do
        if #{ string.find(v:GetFullName(), "void_") } ~= 0 then
            local Handle = v:WaitForChild("Handle", 3);

            if Handle ~= nil then
                Handle = Handle:WaitForChild("Neon", 3);
            end;

            if Handle then
                Handle.Material = p13;
            end;
        end;
    end;
end;

function u2.playEffect(p14, u15) -- Line: 73
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), RunService (copy), scaleModel (copy)
    if u15.Character == nil then
        return nil;
    end;

    local u16 = ReplicatedStorage.Assets.Effects.VoidShieldBreak:Clone();
    u16:PivotTo(u15.Character:GetPrimaryPartCFrame());
    u16.Parent = Workspace;
    local Shield = u16:WaitForChild("Shield", 3);
    Shield.Transparency = 0.4;
    local u17 = tick() + 1;
    local u18 = 1;
    RunService.Heartbeat:Connect(function(p19) -- Line: 84
        -- upvalues: u17 (copy), Shield (copy), u16 (copy), u15 (copy), scaleModel (ref), u18 (ref)
        if u17 < tick() + p19 then
            Shield:Destroy();

            return nil;
        end;

        u16:PivotTo(u15.Character:GetPrimaryPartCFrame());
        local v20 = Shield;
        v20.Transparency = v20.Transparency + p19 * 2.5;
        scaleModel(u16, u18);
        u18 = u18 + p19;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;