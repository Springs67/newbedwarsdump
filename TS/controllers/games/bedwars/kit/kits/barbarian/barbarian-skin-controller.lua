-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BarbarianKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "barbarian", "barbarian-kit").BarbarianKit;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "BarbarianSkinController";
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
    p3.Name = "BarbarianSkinController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: WatchCharacter (copy), BarbarianKit (copy)
    WatchCharacter(function(u5, u6, p7) -- Line: 26
        -- upvalues: BarbarianKit (ref)
        p7:GiveTask(u5:GetAttributeChangedSignal("BarbarianRageLevel"):Connect(function() -- Line: 27
            -- upvalues: BarbarianKit (ref), u6 (copy), u5 (copy)
            BarbarianKit.updateAppearance(u6, u5:GetAttribute("BarbarianRageLevel"));
        end));
        local v8 = u5:GetAttribute("BarbarianRageLevel");

        if v8 ~= nil then
            BarbarianKit.updateAppearance(u6, v8);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;