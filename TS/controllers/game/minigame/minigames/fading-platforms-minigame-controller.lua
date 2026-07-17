-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MinigameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").MinigameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "FadingPlatformsMinigameController";
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
    p3.Name = "FadingPlatformsMinigameController";
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy), MinigameType (copy)
    KnitController.KnitStart(u4);
    default.Client:WaitFor("MinigameStarted"):expect():Connect(function(p5) -- Line: 28
        -- upvalues: MinigameType (ref), u4 (copy)
        if p5.minigame.type == MinigameType.FADING_PLATFORMS then
            u4:onMinigameStart();
        end;
    end);
    default.Client:WaitFor("MinigameEnded"):expect():Connect(function(p6) -- Line: 34
        -- upvalues: MinigameType (ref), u4 (copy)
        if p6.minigame.type == MinigameType.FADING_PLATFORMS then
            u4:onMinigameEnded();
        end;
    end);
end;

function u1.onMinigameStart(p7) -- Line: 40
end;

function u1.onMinigameEnded(p8) -- Line: 42
end;

KnitClient.CreateController(u1.new());

return nil;