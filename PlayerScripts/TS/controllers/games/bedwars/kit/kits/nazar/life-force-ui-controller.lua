-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchPlayerCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local isUsingKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit;
local LifeForceUi = RuntimeLib.import(script, script.Parent, "life-force-ui").LifeForceUi;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "LifeForceUiController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p5);
    p5.Name = "LifeForceUiController";
    p5.lifeForceUiKey = "LifeForceUI";
    p5.lifeForceUiMaid = u1.new();
    p5.lifeForceUiMaid = u1.new();
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), WatchPlayerCharacter (copy), Players (copy), isUsingKit (copy), BedwarsKit (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u6);
    WatchPlayerCharacter(Players.LocalPlayer, function() -- Line: 37
        -- upvalues: isUsingKit (ref), Players (ref), BedwarsKit (ref), u6 (copy)
        if isUsingKit(Players.LocalPlayer, BedwarsKit.NAZAR) then
            u6:mountLifeForceUi();

            return;
        end;

        u6.lifeForceUiMaid:DoCleaning();
    end);
    ClientSyncEvents.KitUnequip:connect(function() -- Line: 44
        -- upvalues: isUsingKit (ref), Players (ref), BedwarsKit (ref), u6 (copy)
        if not isUsingKit(Players.LocalPlayer, BedwarsKit.NAZAR) then
            u6.lifeForceUiMaid:DoCleaning();
        end;
    end);
end;

function u3.mountLifeForceUi(p7) -- Line: 50
    -- upvalues: Flamework (copy), u2 (copy), LifeForceUi (copy)
    p7.lifeForceUiMaid:DoCleaning();
    p7.lifeForceUiMaid:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u2.createFragment({
        [p7.lifeForceUiKey] = u2.createElement(LifeForceUi)
    })));
end;

KnitClient.CreateController(u3.new());

return nil;