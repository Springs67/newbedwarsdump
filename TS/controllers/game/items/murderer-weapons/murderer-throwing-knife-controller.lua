-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local ColorUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "MurdererThrowingKnifeController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p5);
    p5.Name = "MurdererThrowingKnifeController";
end;

function u3.KnitStart(p6) -- Line: 33
    -- upvalues: HandKnitController (copy), ClientSyncEvents (copy), ItemType (copy), EntityUtil (copy), Players (copy), Workspace (copy)
    HandKnitController.KnitStart(p6);
    ClientSyncEvents.BeginProjectileTargeting:connect(function(p7) -- Line: 35
        -- upvalues: ItemType (ref), EntityUtil (ref), Players (ref), Workspace (ref)
        if p7.handItem.itemType == ItemType.MURDERER_THROWING_KNIFE then
            local v8 = EntityUtil:getEntity(Players.LocalPlayer);

            if v8 ~= nil then
                v8 = v8:getInstance();
            end;

            local v9 = Players.LocalPlayer:GetAttribute("MurdererReadyTime");

            if (v9 == nil and 0 or v9) > Workspace:GetServerTimeNow() then
                p7:setCancelled(true);
            end;
        end;
    end);
end;

function u3.isRelevantItem(p10, p11) -- Line: 53
    -- upvalues: ItemType (copy)
    return p11.itemType == ItemType.MURDERER_THROWING_KNIFE;
end;

function u3.onEnable(p12, p13, p14) -- Line: 56
    -- upvalues: u1 (copy), Flamework (copy), CooldownId (copy), ColorUtil (copy)
    p12:setupYield(function() -- Line: 57
        -- upvalues: u1 (ref), Flamework (ref), CooldownId (ref), ColorUtil (ref)
        local u15 = u1.new();
        task.wait(0.2);
        u15:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(CooldownId.MURDERER_KILL, {
            title = {
                text = "KILL COOLDOWN",
                color = ColorUtil.WHITE
            }
        }));

        return function() -- Line: 66
            -- upvalues: u15 (copy)
            u15:DoCleaning();
        end;
    end);
end;

function u3.onDisable(p16) -- Line: 71
end;

KnitClient.CreateController(u3.new());

return nil;