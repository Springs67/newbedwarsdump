-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "HeldItemAnimationController";
    end,

    __index = HandKnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p4);
    p4.Name = "HeldItemAnimationController";
    p4.maid = u1.new();
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p5);
end;

function u2.isRelevantItem(p6, p7) -- Line: 31
    -- upvalues: getItemMeta (copy)
    local thirdPerson = getItemMeta(p7.itemType).thirdPerson;

    if thirdPerson ~= nil then
        thirdPerson = thirdPerson.holdAnimation;
    end;

    return thirdPerson ~= nil;
end;

function u2.onEnable(u8, p9, p10) -- Line: 38
    -- upvalues: getItemMeta (copy), GameAnimationUtil (copy), Players (copy)
    local holdAnimation = getItemMeta(p9.itemType).thirdPerson.holdAnimation;
    u8:setupYield(function() -- Line: 40
        -- upvalues: GameAnimationUtil (ref), Players (ref), holdAnimation (copy), u8 (copy)
        local u11 = GameAnimationUtil:playAnimation(Players.LocalPlayer, holdAnimation);
        u8.maid:GiveTask(function() -- Line: 42
            -- upvalues: u11 (copy)
            local v12 = u11;

            if v12 ~= nil then
                v12:Stop();
            end;
        end);

        return function() -- Line: 48
            -- upvalues: u11 (copy)
            local v13 = u11;

            if v13 ~= nil then
                v13:Stop();
            end;
        end;
    end);
end;

function u2.onDisable(p14) -- Line: 56
    p14.maid:DoCleaning();
end;

KnitClient.CreateController(u2.new());

return nil;