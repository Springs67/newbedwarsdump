-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local QueueState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").QueueState;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "store").ClientStore;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "LobbyQueueController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "LobbyQueueController";
end;

function u2.KnitStart(p5) -- Line: 31
    -- upvalues: CollectionTagAdded (copy), KnitClient2 (copy), Theme (copy), ClientStore (copy), QueueState (copy), Flamework (copy)
    CollectionTagAdded("lobby-queue-npc", function(p6) -- Line: 32
        -- upvalues: KnitClient2 (ref), Theme (ref), ClientStore (ref), QueueState (ref), Flamework (ref)
        local Name = p6.Name;
        local u7 = p6:GetAttribute("QueueTitle");
        KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            ObjectText = "Join Queue",
            ActionText = u7 == nil and "Missing Title" or u7,
            MaxActivationDistance = 20,
            HoldDuration = Theme.promptHoldDuration,
            RequiresLineOfSight = false,
            Parent = p6
        }).Triggered:Connect(function(p8) -- Line: 50
            -- upvalues: ClientStore (ref), QueueState (ref), Flamework (ref), u7 (copy), KnitClient2 (ref), Name (copy)
            if ClientStore:getState().Party.queueState ~= QueueState.NONE then
                Flamework.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
                    message = "You are already in another queue. Leave to join " .. tostring(u7) .. "."
                });

                return nil;
            end;

            KnitClient2.Controllers.QueueController:joinQueue(Name);
        end);
    end);
end;

return {
    LobbyQueueController = KnitClient.CreateController(u2.new())
};