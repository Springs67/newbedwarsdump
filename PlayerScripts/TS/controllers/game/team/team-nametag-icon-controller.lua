-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local _ = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local _ = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "TeamNametagIconController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 21
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "TeamNametagIconController";
end;

function u1.KnitStart(p4) -- Line: 29
    -- upvalues: WatchCharacter (copy), Players (copy)
    WatchCharacter(function(p5, p6) -- Line: 30
        -- upvalues: Players (ref)
        if p5 == Players.LocalPlayer then
            return nil;
        end;

        return nil;
    end);
end;

return {
    TeamNametagIconController = KnitClient.CreateController(u1.new())
};