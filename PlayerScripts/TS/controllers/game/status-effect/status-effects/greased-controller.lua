-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BaconBladeBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "bacon-blade-balance").BaconBladeBalance;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "GreasedController";
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
    p4.Name = "GreasedController";
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), default (copy), Players (copy), KnitClient2 (copy), BaconBladeBalance (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("GreaseStatusApplied", function(p6) -- Line: 30
        -- upvalues: Players (ref), KnitClient2 (ref), BaconBladeBalance (ref)
        if p6.player ~= Players.LocalPlayer then
            return nil;
        end;

        if p6.player.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Physics then
            KnitClient2.Controllers.TaserController:taseSelf(BaconBladeBalance.MIN_GET_UP_TIME + math.random() * (BaconBladeBalance.MAX_GET_UP_TIME - BaconBladeBalance.MIN_GET_UP_TIME));
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;