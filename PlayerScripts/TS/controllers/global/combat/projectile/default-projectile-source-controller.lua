-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local TripleShotUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "triple-shot", "triple-shot-util").TripleShotUtil;
local WizardUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "wizard", "wizard-util").WizardUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent, "projectile-source-controller").ProjectileSourceController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "DefaultProjectileSourceController";
    end,

    __index = ProjectileSourceController
});
u1.__index = u1;

function u1.new(...) -- Line: 21
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 25
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.constructor(p3, ...);
    p3.Name = "DefaultProjectileSourceController";
end;

function u1.isRelevantItem(p4, p5) -- Line: 29
    -- upvalues: ItemType (copy), WizardUtil (copy), TripleShotUtil (copy), Players (copy), getItemMeta (copy)
    if p5.itemType == ItemType.LASSO then
        return false;
    end;

    if p5.itemType == ItemType.BLUNDERBUSS then
        return false;
    end;

    if WizardUtil:isWizardStaff(p5.itemType) then
        return false;
    end;

    if p5.itemType == ItemType.FISHING_ROD then
        return false;
    end;

    if p5.itemType == ItemType.VACUUM then
        return false;
    end;

    if p5.itemType == ItemType.FEATHER_BOW then
        return false;
    end;

    if TripleShotUtil.isTripleShot(p5.itemType, Players.LocalPlayer) then
        return false;
    end;

    if p5.itemType == ItemType.SPEAR or (p5.itemType == ItemType.SAND_SPEAR or p5.itemType == ItemType.HARPOON) then
        return false;
    end;

    local v6 = getItemMeta(p5.itemType);

    if v6.projectileSource == nil then
        return false;
    end;

    return not v6.projectileSource.multiShot;
end;

function u1.onStartCharging(p7) -- Line: 74
end;

function u1.onStopCharging(p8) -- Line: 76
end;

function u1.onMaxCharge(p9) -- Line: 78
end;

function u1.onLaunch(p10) -- Line: 80
end;

function u1.onStartReload(p11) -- Line: 82
end;

return {
    DefaultProjectileSourceController = KnitClient.CreateController(u1.new())
};