-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "mage", "mage-kit-util");
local MAGE_ELEMENT_CYCLE_INDEX = v1.MAGE_ELEMENT_CYCLE_INDEX;
local MageKitUtil = v1.MageKitUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "MageSpellbookController";
    end,

    __index = ProjectileSourceController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 28
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.constructor(p4, ...);
    p4.Name = "MageSpellbookController";
    p4.Client = {};
end;

function u2.KnitStart(p5) -- Line: 33
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.KnitStart(p5);
end;

function u2.isRelevantItem(p6, p7) -- Line: 36
    -- upvalues: ItemType (copy), KnitClient (copy), Players (copy), BedwarsKit (copy)
    local v8;

    if p7.itemType == ItemType.MAGE_SPELLBOOK then
        v8 = KnitClient.Controllers.KitController:isUsingKit(Players.LocalPlayer, BedwarsKit.MAGE);
    else
        v8 = false;
    end;

    return v8;
end;

function u2.onEnable(p9, p10, p11) -- Line: 39
    -- upvalues: ProjectileSourceController (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    ProjectileSourceController.onEnable(p9, p10, p11);
    p9:setupYield(function() -- Line: 41
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u12 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.WIZARD_BALL_CAST, {});

        return function() -- Line: 43
            -- upvalues: u12 (copy)
            local v13 = u12;

            if v13 ~= nil then
                v13:Stop();
            end;
        end;
    end);
end;

function u2.onDisable(p14) -- Line: 51
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.onDisable(p14);
end;

function u2.getProjectileSource(p15, p16) -- Line: 54
    return p15:getNextElementProjectile();
end;

function u2.getNextElementProjectile(p17) -- Line: 57
    -- upvalues: Players (copy), MAGE_ELEMENT_CYCLE_INDEX (copy), BalanceFile (copy), MageKitUtil (copy)
    local v18 = Players.LocalPlayer:GetAttribute(MAGE_ELEMENT_CYCLE_INDEX);
    local v19 = BalanceFile.MAGE_ELEMENT_CYCLE[v18 + 1];
    local v20 = MageKitUtil.getUnlockedMageElements(Players.LocalPlayer);

    if table.find(v20, v19) == nil then
        return MageKitUtil.MageElementMeta.BASE.projectileSource;
    end;

    return MageKitUtil.MageElementMeta[v19].projectileSource;
end;

function u2.onStartCharging(p21) -- Line: 67
end;

function u2.onStopCharging(p22) -- Line: 69
end;

function u2.onLaunch(p23, p24) -- Line: 71
end;

function u2.onStartReload(p25, p26) -- Line: 73
end;

KnitClient.CreateController(u2.new());

return nil;