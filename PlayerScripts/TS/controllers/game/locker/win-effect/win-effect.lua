-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "WinEffect";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 15
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.winEffectType = p3;
    p2.Name = "WinEffect";
    p2.Client = {};
end;

function v1.KnitStart(u4) -- Line: 21
    -- upvalues: default (copy)
    default.Client:Get("WinEffectTriggered"):Connect(function(p5) -- Line: 22
        -- upvalues: u4 (copy)
        if p5.winEffectType ~= u4.winEffectType then
            return nil;
        end;

        u4:onWin(p5.winningPlayer);
    end);
end;

return {
    WinEffect = v1
};