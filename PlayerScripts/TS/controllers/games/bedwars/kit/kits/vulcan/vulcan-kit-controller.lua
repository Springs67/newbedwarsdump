-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "VulcanKitController";
    end,

    __index = BaseKitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p3, BedwarsKit.VULCAN);
    p3.Name = "VulcanKitController";
end;

function u1.onKitLocalActivated(p4, p5) -- Line: 25
end;

function u1.onKitLocalDeactivated(p6) -- Line: 27
end;

function u1.onKitReplicationActivated(p7, p8) -- Line: 29
end;

function u1.onKitReplicationDeactivated(p9) -- Line: 31
end;

function u1.onInnateAbilityEnabled(p10, p11, p12) -- Line: 33
end;

function u1.onAbilityUsed(p13, p14, p15) -- Line: 35
end;

KnitClient.CreateController(u1.new());

return nil;