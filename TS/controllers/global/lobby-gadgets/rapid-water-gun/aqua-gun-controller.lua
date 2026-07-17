-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local WaterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "water-gun", "water-gun-util").WaterType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "water-guns", "water-gun-util");
local WATER_ATTRIBUTE = v3.WATER_ATTRIBUTE;
local WATER_GUN_COST = v3.WATER_GUN_COST;
local WaterBar = RuntimeLib.import(script, script.Parent, "ui", "water-bar").WaterBar;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "AquaGunController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: HandKnitController (copy), u1 (copy), WaterType (copy)
    HandKnitController.constructor(p6);
    p6.maid = u1.new();
    p6.Name = "AquaGunController";
    p6.waterType = WaterType.DEFAULT;
end;

function u4.KnitStart(u7) -- Line: 36
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy), Players (copy), WATER_ATTRIBUTE (copy), WATER_GUN_COST (copy), WaterType (copy)
    HandKnitController.KnitStart(u7);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p8) -- Line: 38
        -- upvalues: ItemType (ref), Players (ref), WATER_ATTRIBUTE (ref), WATER_GUN_COST (ref)
        if p8.handItem.itemType ~= ItemType.AQUA_GUN then
            return nil;
        end;

        local v9 = Players.LocalPlayer:GetAttribute(WATER_ATTRIBUTE);

        if (v9 == nil and 0 or v9) < WATER_GUN_COST then
            p8:setCancelled(true);
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("WaterType"):Connect(function() -- Line: 50
        -- upvalues: Players (ref), WaterType (ref), u7 (copy)
        local v10 = Players.LocalPlayer:GetAttribute("WaterType");

        if v10 == nil then
            v10 = WaterType.DEFAULT;
        end;

        u7.waterType = v10;
    end);
    ClientSyncEvents.StartLaunchProjectile:connect(function(p11) -- Line: 58
        -- upvalues: u7 (copy)
        if p11.projectileType == "single_water_bullet" then
            p11.projectileType = u7:getBulletType();
        end;
    end);
end;

function u4.isRelevantItem(p12, p13) -- Line: 64
    -- upvalues: ItemType (copy)
    return p13.itemType == ItemType.AQUA_GUN;
end;

function u4.onEnable(p14, p15, p16) -- Line: 67
    -- upvalues: Flamework (copy), u2 (copy), WaterBar (copy)
    p14.maid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createFragment({
        WaterBar = u2.createElement(WaterBar)
    })));
end;

function u4.onDisable(p17) -- Line: 72
    p17.maid:DoCleaning();
end;

function u4.getBulletType(p18) -- Line: 75
    -- upvalues: WaterType (copy)
    return p18.waterType == WaterType.FROSTY and "frost_single_water_bullet" or (p18.waterType == WaterType.SLIME and "slime_single_water_bullet" or "single_water_bullet");
end;

KnitClient.CreateController(u4.new());

return nil;