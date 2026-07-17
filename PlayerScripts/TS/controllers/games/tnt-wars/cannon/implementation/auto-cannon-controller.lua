-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local AUTO_CANNON_CONFIG = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "cannon-constants").AUTO_CANNON_CONFIG;
local BaseCannonController = RuntimeLib.import(script, script.Parent.Parent, "base-cannon-controller").BaseCannonController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "AutoCannonController";
    end,

    __index = BaseCannonController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: BaseCannonController (copy), AUTO_CANNON_CONFIG (copy)
    BaseCannonController.constructor(p3, AUTO_CANNON_CONFIG);
    p3.Name = "AutoCannonController";
end;

function u1.onFire(p4) -- Line: 24
end;

KnitClient.CreateController(u1.new());

return {
    AutoCannonController = u1
};