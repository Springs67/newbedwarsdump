-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "InvisibleCloakSpeedBoostController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 18
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 22
    -- upvalues: KnitController (copy), u1 (copy)
    KnitController.constructor(p4);
    p4.Name = "InvisibleCloakSpeedBoostController";
    p4.speedMaid = u1.new();
end;

function u2.KnitStart(u5) -- Line: 27
    -- upvalues: KnitController (copy), WatchCharacter (copy), KnitClient (copy)
    KnitController.KnitStart(u5);
    WatchCharacter(function(p6, u7, p8) -- Line: 29
        -- upvalues: u5 (copy), KnitClient (ref)
        p8:GiveTask(u7:GetAttributeChangedSignal("CloakUpgradeSpeedBoost"):Connect(function() -- Line: 30
            -- upvalues: u7 (copy), u5 (ref), KnitClient (ref)
            if u7:GetAttribute("CloakUpgradeSpeedBoost") == nil then
                u5.speedMaid:DoCleaning();

                return;
            end;

            u5.speedMaid:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
                blockSprint = false,
                moveSpeedMultiplier = u7:GetAttribute("CloakUpgradeSpeedBoost")
            }));
        end));
        p8:GiveTask(u5.speedMaid);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;