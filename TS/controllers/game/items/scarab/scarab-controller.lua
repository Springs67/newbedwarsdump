-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatefulEntityHpBarBillboard = RuntimeLib.import(script, script.Parent.Parent.Parent, "stateful-entity", "ui", "stateful-entity-hp-bar-billboard").StatefulEntityHpBarBillboard;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ScarabController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ScarabController";
    p3.count = 0;
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: KnitController (copy), WatchCollectionTag (copy)
    KnitController.KnitStart(u4);
    WatchCollectionTag("Scarab", function(p5) -- Line: 29
        -- upvalues: u4 (copy)
        u4:createEntityHealthbar(p5);
    end);
end;

function u1.createEntityHealthbar(p6, p7, p8) -- Line: 33
    -- upvalues: Flamework (copy), StatefulEntityHpBarBillboard (copy)
    local v9 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController");
    local v10 = {
        app = StatefulEntityHpBarBillboard
    };
    local count = p6.count;
    p6.count = p6.count + 1;
    v10.appId = "StatefulEntityHpBarBillboard_Scarab" .. tostring(count);
    v9:openApp(v10, {
        hpBarOffset = Vector3.new(0, 2, 0),
        gameEntity = p7,
        serverInstance = p7,
        barColor = p8
    }, nil, p7);
end;

KnitClient.CreateController(u1.new());

return nil;