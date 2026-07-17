-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "FriendsListController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "FriendsListController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), ClientStore (copy), Flamework (copy)
    KnitController.KnitStart(p4);
    ClientStore.changed:connect(function(p5, p6) -- Line: 27
        -- upvalues: Flamework (ref)
        if p5.Settings.friendNotifications ~= p6.Settings.friendNotifications then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):setShowNotifications(p5.Settings.friendNotifications);
        end;
    end);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):startFetchingFriends();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/friends/easy-friends-controller@EasyFriendsController"):setFetchCooldown(7);
end;

KnitClient.CreateController(u1.new());

return nil;