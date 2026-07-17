-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent, "kit", "base-kit-controller").BaseKitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "FishermanKitController";
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
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy)
    BaseKitController.constructor(p3, BedwarsKit.FISHERMAN, {
        animations = {
            AnimationType.FISHING_ROD_CAST,
            AnimationType.FISHING_ROD_CATCH_FAIL,
            AnimationType.FISHING_ROD_CATCH_SUCCESS,
            AnimationType.FISHING_ROD_IDLE,
            AnimationType.FISHING_ROD_PULLING
        }
    });
    p3.Name = "FishermanKitController";
end;

function u1.KnitStart(p4) -- Line: 27
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p4);
end;

function u1.onKitLocalActivated(p5, p6) -- Line: 30
end;

function u1.onKitLocalDeactivated(p7) -- Line: 32
end;

function u1.onKitReplicationActivated(p8, p9) -- Line: 34
end;

function u1.onKitReplicationDeactivated(p10) -- Line: 36
end;

function u1.onInnateAbilityEnabled(p11, p12, p13) -- Line: 38
end;

function u1.onAbilityUsed(p14, p15, p16) -- Line: 40
end;

KnitClient.CreateController(u1.new());

return nil;