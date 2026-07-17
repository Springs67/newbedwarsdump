-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "KitShopController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "KitShopController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), PlaceUtil (copy), u1 (copy), ClientSyncEvents (copy), MatchState (copy), Flamework (copy), BedwarsAppIds (copy)
    KnitController.KnitStart(p5);

    if not PlaceUtil.isGameServer() then
        return nil;
    end;

    u1.new():GiveTask(ClientSyncEvents.MatchStateChange:connect(function(p6) -- Line: 35
        -- upvalues: MatchState (ref), Flamework (ref), BedwarsAppIds (ref)
        if p6.matchState ~= MatchState.PRE then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.KIT_DETAILS_APP);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.KIT_SHOP_APP);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.CONFIRMATION_MODAL);
        end;
    end));
end;

KnitClient.CreateController(u2.new());

return nil;