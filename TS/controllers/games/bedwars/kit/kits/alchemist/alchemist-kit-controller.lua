-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
RuntimeLib.import(script, script.Parent, "alchemist-flask-controller");
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "AlchemistKitController";
    end,

    __index = BaseKitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p3, BedwarsKit.ALCHEMIST);
    p3.Name = "AlchemistKitController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p4);
end;

function u1.onKitLocalActivated(p5, p6) -- Line: 29
end;

function u1.onKitLocalDeactivated(p7) -- Line: 31
end;

function u1.onKitReplicationActivated(p8, p9) -- Line: 33
end;

function u1.onKitReplicationDeactivated(p10) -- Line: 35
end;

function u1.onInnateAbilityEnabled(p11, p12, p13) -- Line: 37
end;

function u1.onAbilityUsed(p14, p15, p16) -- Line: 39
end;

KnitClient.CreateController(u1.new());

return nil;