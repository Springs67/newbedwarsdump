-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local RavenTimerApp = RuntimeLib.import(script, script.Parent, "ui", "raven-timer-app").RavenTimerApp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "RavenKitController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p4, BedwarsKit.RAVEN);
    p4.Name = "RavenKitController";
    p4.isPreloaded = false;
end;

function u2.onKitLocalActivated(p5, p6) -- Line: 27
    -- upvalues: KnitClient (copy), u1 (copy), RavenTimerApp (copy)
    if not p5.isPreloaded then
        KnitClient.Controllers.PreloadController:runPreload({
            imageIds = { "rbxassetid://7343272003" }
        });
        p5.isPreloaded = true;
    end;

    local u7 = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u1.createElement(RavenTimerApp));
    p6:GiveTask(function() -- Line: 35
        -- upvalues: u1 (ref), u7 (copy)
        u1.unmount(u7);
    end);
end;

function u2.onAbilityUsed(p8, p9, p10) -- Line: 39
end;

function u2.onKitLocalDeactivated(p11) -- Line: 41
end;

function u2.onKitReplicationActivated(p12, p13) -- Line: 43
end;

function u2.onKitReplicationDeactivated(p14) -- Line: 45
end;

function u2.onInnateAbilityEnabled(p15, p16, p17) -- Line: 47
end;

KnitClient.CreateController(u2.new());

return nil;