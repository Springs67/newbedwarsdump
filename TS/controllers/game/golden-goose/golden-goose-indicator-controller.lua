-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GooseIndicatorApp = RuntimeLib.import(script, script.Parent, "ui", "goose-indicator-app").GooseIndicatorApp;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "GoldenGooseIndicatorController";
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
    p3.Name = "GoldenGooseIndicatorController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), Flamework (copy), GooseIndicatorApp (copy)
    KnitController.KnitStart(p4);
    WatchCollectionTag("ActiveGoose", function(p5) -- Line: 28
        -- upvalues: Flamework (ref), GooseIndicatorApp (ref)
        if not p5.PrimaryPart then
            p5:GetPropertyChangedSignal("PrimaryPart"):Wait();
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("goose-indicator");
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            appId = "goose-indicator",
            app = GooseIndicatorApp
        }, {
            billboardAdornee = p5.PrimaryPart
        }, nil, p5.PrimaryPart);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;