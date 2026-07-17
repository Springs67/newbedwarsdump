-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").CollectionTagAdded;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MonsterType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "DuckController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "DuckController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), MonsterType (copy), KnitClient2 (copy), GameSound (copy)
    KnitController.KnitStart(p5);
    CollectionTagAdded("Monster", function(u6) -- Line: 30
        -- upvalues: MonsterType (ref), KnitClient2 (ref), GameSound (ref)
        if u6:GetAttribute("MonsterType") == MonsterType.DUCK then
            task.spawn(function() -- Line: 32
                -- upvalues: KnitClient2 (ref), u6 (copy), GameSound (ref)
                KnitClient2.Controllers.FootstepsController:hookCharacter(nil, u6, {
                    walk = { GameSound.DUCK_FOOTSTEP_1, GameSound.DUCK_FOOTSTEP_2, GameSound.DUCK_FOOTSTEP_3 },
                    run = { GameSound.DUCK_FOOTSTEP_1, GameSound.DUCK_FOOTSTEP_2, GameSound.DUCK_FOOTSTEP_3 }
                });
            end);
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;