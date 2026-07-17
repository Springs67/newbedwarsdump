-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local StatsBoardUIWrapper = RuntimeLib.import(script, script.Parent, "ui", "stats-board-app").StatsBoardUIWrapper;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "StatsBoardController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "StatsBoardController";
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: WatchCollectionTag (copy), CreateRoduxApp (copy), StatsBoardUIWrapper (copy)
    WatchCollectionTag("StatsBoard", function(p5) -- Line: 28
        -- upvalues: u4 (copy), CreateRoduxApp (ref), StatsBoardUIWrapper (ref)
        u4.roactTree = CreateRoduxApp("StatsBoard", StatsBoardUIWrapper, {}, {}, {
            Parent = p5
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;