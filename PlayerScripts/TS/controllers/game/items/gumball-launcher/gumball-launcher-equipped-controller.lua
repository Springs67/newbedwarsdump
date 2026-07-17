-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local FRIENDLY_BLOCK_COLOR = RuntimeLib.import(script, script.Parent, "gum-block-controller").FRIENDLY_BLOCK_COLOR;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "GumballLauncherEquippedController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p4);
    p4.Name = "GumballLauncherEquippedController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), Flamework (copy), CooldownId (copy), getItemMeta (copy), ItemType (copy), FRIENDLY_BLOCK_COLOR (copy)
    HandKnitController.KnitStart(p5);
    ClientSyncEvents.ProjectileLaunched:connect(function(p6) -- Line: 32
        -- upvalues: Flamework (ref), CooldownId (ref), getItemMeta (ref), ItemType (ref), FRIENDLY_BLOCK_COLOR (ref)
        if p6:isLocalShooter() and p6.projectileType == "gumball" then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(CooldownId.GUMBALL_LAUNCHER, getItemMeta(ItemType.GUMBALL_LAUNCHER).projectileSource.fireDelaySec, {
                cooldownBar = {
                    color = FRIENDLY_BLOCK_COLOR
                }
            });
        end;
    end);
end;

function u2.isRelevantItem(p7, p8) -- Line: 42
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.GUMBALL_LAUNCHER;
end;

function u2.onEnable(p9, p10, p11) -- Line: 45
    -- upvalues: u1 (copy), Flamework (copy), CooldownId (copy)
    p9:setupYield(function() -- Line: 46
        -- upvalues: u1 (ref), Flamework (ref), CooldownId (ref)
        local u12 = u1.new();
        u12:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.GUMBALL_LAUNCHER));

        return function() -- Line: 49
            -- upvalues: u12 (copy)
            u12:DoCleaning();
        end;
    end);
end;

function u2.onDisable(p13) -- Line: 54
end;

KnitClient.CreateController(u2.new());

return nil;