-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local UILayers = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local HalloweenAbilityInitialSelectionApp = RuntimeLib.import(script, script.Parent.Parent, "ui", "halloween-ability-initial-selection-app").HalloweenAbilityInitialSelectionApp;
local HalloweenAbilityViewApp = RuntimeLib.import(script, script.Parent.Parent, "ui", "halloween-ability-view-app").HalloweenAbilityViewApp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "HalloweenAbilityAllKitsTreeController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "HalloweenAbilityAllKitsTreeController";
    p4.speedMaid = u1.new();
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: KnitController (copy), default (copy), KnitClient (copy), Flamework (copy), HalloweenAbilityInitialSelectionApp (copy), ClientSyncEvents (copy), AbilityId (copy), Players (copy), HalloweenAbilityViewApp (copy), UILayers (copy)
    KnitController.KnitStart(u5);
    default.Client:GetNamespace("Halloween2025Remotes"):Get("SpeedRegistered"):Connect(function(u6) -- Line: 35
        -- upvalues: u5 (copy), KnitClient (ref)
        u5.speedMaid:DoCleaning();
        u5.speedMaid:GiveTask(function() -- Line: 37
            -- upvalues: KnitClient (ref), u6 (copy)
            KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                moveSpeedMultiplier = u6.speedMultiplier
            });
        end);
    end);
    default.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(p7) -- Line: 43
    end);
    default.Client:GetNamespace("Halloween2024Remotes"):Get("ShowInitialKitSelection"):Connect(function(p8) -- Line: 44
        -- upvalues: Flamework (ref), HalloweenAbilityInitialSelectionApp (ref)
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "HalloweenAbilityInitialSelectionApp",
            app = HalloweenAbilityInitialSelectionApp
        }, {});
    end);
    ClientSyncEvents.AbilityUsed:connect(function(p9) -- Line: 51
        -- upvalues: AbilityId (ref), Players (ref), Flamework (ref), HalloweenAbilityViewApp (ref), UILayers (ref)
        if p9:isCancelled() then
            return nil;
        end;

        if p9.ability ~= AbilityId.HALLOWEEN_VIEW_ABILITIES then
            return nil;
        end;

        if p9.userCharacter ~= Players.LocalPlayer.Character then
            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "HalloweenAbilityViewApp",
            app = HalloweenAbilityViewApp,
            layer = UILayers.MAIN
        }, {
            AppId = "HalloweenAbilityViewApp"
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;