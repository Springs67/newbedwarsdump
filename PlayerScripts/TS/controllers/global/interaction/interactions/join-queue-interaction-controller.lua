-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Signal = v1.Signal;
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local QueueGroupMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-meta").QueueGroupMeta;
local InteractionCategory = RuntimeLib.import(script, script.Parent.Parent, "interaction-registry-controller").InteractionCategory;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "JoinQueueInteraction";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "JoinQueueInteraction";
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: Signal (copy), KnitClient2 (copy), KnitClient (copy), InteractionCategory (copy), QueueGroupMeta (copy), Flamework (copy), ClientStore (copy), QueueState (copy)
    local u6 = Signal.new();
    local u7 = KnitClient2.Controllers.PlayerLevelController:isBeginner();
    KnitClient.Controllers.InteractionRegistryController:RegisterInteraction({
        maxActivationDistance = 17,
        interactionLabel = "Join Queue",
        instantActivation = true,
        interactionTag = "InteractionJoinQueue",
        category = InteractionCategory.OTHER,

        interactionObjectText = function(p8) -- Line: 42, Name: interactionObjectText
            -- upvalues: QueueGroupMeta (ref), Flamework (ref)
            local v9 = p8:GetAttribute("QueueSelectionMenu");

            if v9 ~= 0 and (v9 == v9 and (v9 ~= "" and v9)) then
                return QueueGroupMeta[p8.Name].title;
            end;

            local Name = p8.Name;

            return Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(Name).title;
        end,

        onInteracted = function(p10, p11) -- Line: 55, Name: onInteracted
            -- upvalues: u5 (copy)
            if p11:GetAttribute("QueueSelectionMenu") == true then
                u5:openQueueSelectionMenu(p11.Name);

                return;
            end;

            print("[Queue Client]: Attempting to join queue: " .. p11.Name);
            u5:joinQueue(p11.Name);
        end,

        shouldMakeInteraction = function(p12) -- Line: 65, Name: shouldMakeInteraction
            -- upvalues: Flamework (ref), u7 (copy)
            local v13 = p12:GetAttribute("QueueSelectionMenu");

            if v13 ~= 0 and (v13 == v13 and (v13 ~= "" and v13)) then
                return true;
            end;

            local Name = p12.Name;
            local v14 = Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-client-controller@LobbyClientController"):getQueueMeta(Name);

            if not v14 then
                return false;
            end;

            if v14.beginnerQueue == true or not u7 then
                return v14.disabled == nil and true or not v14.disabled;
            end;

            return false;
        end,

        onVisibilityStateChanged = u6
    });
    ClientStore.changed:connect(function(p15, p16) -- Line: 84
        -- upvalues: QueueState (ref), u6 (copy)
        local queueState = p15.Party.queueState;

        if queueState == p16.Party.queueState then
            return nil;
        end;

        print("[Queue Client]: Queue state updated, updating interactions");
        u6:Fire(queueState == QueueState.NONE);
    end);
end;

function u2.joinQueue(p17, p18) -- Line: 95
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/lobby:client/controllers/lobby-queue-controller@LobbyQueueController"):joinQueue(p18);
end;

function u2.openQueueSelectionMenu(p19, p20) -- Line: 98
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.QUEUE_SELECTION, {
        QueueSelectionType = p20
    });
end;

return {
    JoinQueueInteraction = KnitClient.CreateController(u2.new())
};