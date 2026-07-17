-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GuidedProjectileSourceController = RuntimeLib.import(script, script.Parent, "guided-projectile-source-controller").GuidedProjectileSourceController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "DefaultGuidedProjectileSourceController";
    end,

    __index = GuidedProjectileSourceController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (copy)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 21
    -- upvalues: GuidedProjectileSourceController (copy)
    GuidedProjectileSourceController.constructor(p3, ...);
    p3.Name = "DefaultGuidedProjectileSourceController";
end;

function u1.isRelevantItem(p4, p5) -- Line: 25
    -- upvalues: getItemMeta (copy)
    return getItemMeta(p5.itemType).guidedProjectileSource ~= nil;
end;

function u1.onLaunch(p6) -- Line: 29
end;

return {
    DefaultGuidedProjectileSourceController = KnitClient.CreateController(u1.new())
};