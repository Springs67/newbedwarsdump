-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "AutoCompleteDropdownController";
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
    p3.Name = "AutoCompleteDropdownController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p4);
end;

function u1.openAutoCompleteDropdownMenu(p5, p6, p7, p8, p9) -- Line: 28
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    p5:closeAutoCompleteDropdownMenu();
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(BedwarsAppIds.AUTO_COMPLETE_DROPDOWN, {
        Items = p6,
        DescribeItem = p7,
        OnSelect = p8,
        AdditionalElements = p9
    });
end;

function u1.closeAutoCompleteDropdownMenu(p10) -- Line: 37
    -- upvalues: Flamework (copy), BedwarsAppIds (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(BedwarsAppIds.AUTO_COMPLETE_DROPDOWN);
end;

KnitClient.CreateController(u1.new());

return nil;