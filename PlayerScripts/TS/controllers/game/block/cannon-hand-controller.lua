-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "CannonHandController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 21
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 25
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p3);
    p3.Name = "CannonHandController";
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p4);
end;

function u1.isRelevantItem(p5, p6) -- Line: 32
    -- upvalues: ItemType (copy)
    return p6.itemType == ItemType.TNT and true or p6.itemType == ItemType.SIEGE_TNT;
end;

function u1.onEnable(p7, p8) -- Line: 35
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.CannonController:stopAiming();
    p7:updateAllCannonPrompts();
end;

function u1.onDisable(p9) -- Line: 39
    p9:updateAllCannonPrompts();
end;

function u1.updateAllCannonPrompts(u10) -- Line: 42
    -- upvalues: KnitClient (copy)
    local function _(p11) -- Line: 44
        -- upvalues: u10 (copy)
        u10:updateCannonPrompts(p11);
    end;

    for i, v in KnitClient.Controllers.CannonController:getCannons() do
        local _ = i - 1;
        u10:updateCannonPrompts(v);
    end;
end;

function u1.updateCannonPrompts(p12, p13) -- Line: 51
    -- upvalues: KnitClient (copy), getItemMeta (copy)
    if KnitClient.Controllers.CannonController:isAiming() then
        p13.AimPrompt.Enabled = false;
        p13.StopAimingPrompt.Enabled = true;
        p13.FirePrompt.Enabled = false;
        p13.LaunchSelfPrompt.Enabled = false;

        return nil;
    end;

    if p12:isEnabled() then
        p13.AimPrompt.Enabled = false;
        p13.StopAimingPrompt.Enabled = false;
        local v14 = p12:getHandItem();

        if v14 ~= nil then
            v14 = v14.itemType;
        end;

        if v14 then
            local v15 = getItemMeta(v14);
            p13.FirePrompt.ObjectText = "Consumes " .. v15.displayName;
        else
            p13.FirePrompt.ObjectText = "Consumes Ammo";
        end;

        p13.FirePrompt.Enabled = true;

        return nil;
    end;

    p13.AimPrompt.Enabled = true;
    p13.LaunchSelfPrompt.Enabled = true;
    p13.StopAimingPrompt.Enabled = false;
    p13.FirePrompt.Enabled = false;
end;

function u1.fireCannon(p16, p17) -- Line: 81
    -- upvalues: default (copy), BlockEngine (copy)
    local v18 = p16:getHandItem();

    if not v18 then
        return nil;
    end;

    default.Client:Get("FireCannon"):SendToServer({
        cannonBlockPos = BlockEngine:getBlockPosition(p17.Position),
        itemType = v18.itemType
    });
end;

function u1.launchSelf(p19, p20) -- Line: 91
    -- upvalues: default (copy), BlockEngine (copy), Players (copy)
    if not default.Client:Get("LaunchSelfFromCannon"):CallServer({
        cannonBlockPos = BlockEngine:getBlockPosition(p20.Position)
    }) then
        return nil;
    end;

    local Character = Players.LocalPlayer.Character;

    if Character ~= nil then
        Character = Character.PrimaryPart;
    end;

    if not Character then
        return nil;
    end;

    local v21 = p20:GetAttribute("LookVector");

    if not v21 then
        return nil;
    end;

    local Character2 = Players.LocalPlayer.Character;

    if Character2 ~= nil then
        Character2 = Character2.PrimaryPart;

        if Character2 ~= nil then
            Character2 = Character2.AssemblyMass;
        end;
    end;

    Character:ApplyImpulse(v21 * (Character2 == nil and 0 or Character2) * 200);
end;

KnitClient.CreateController(u1.new());

return nil;