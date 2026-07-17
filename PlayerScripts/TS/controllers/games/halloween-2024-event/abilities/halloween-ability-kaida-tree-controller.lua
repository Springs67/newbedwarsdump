-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local HalloweenAbilityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2024-event", "halloween-ability-type").HalloweenAbilityType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "HalloweenAbilityKaidaTreeController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "HalloweenAbilityKaidaTreeController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy), HalloweenAbilityType (copy), Players (copy), KnitClient (copy)
    KnitController.KnitStart(p4);
    default.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(p5) -- Line: 28
        -- upvalues: HalloweenAbilityType (ref), Players (ref), KnitClient (ref)
        if p5.halloweenAbilityType == HalloweenAbilityType.KAIDA_STARTER and p5.player == Players.LocalPlayer then
            KnitClient.Controllers.SummonerKitController:initializePlayer();
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;