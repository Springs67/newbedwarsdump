-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 10, Name: __tostring
        return "RiddleController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 16
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 20
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "RiddleController";
    p3.riddleCache = {};
end;

function u1.KnitStart(u4) -- Line: 25
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("SendRiddleDataToPlayer"):Connect(function(p5, p6) -- Line: 28
        -- upvalues: u4 (copy)
        u4.riddleCache[p5] = p6;
    end);
end;

function u1.getRiddle(u7, u8) -- Line: 35
    -- upvalues: RuntimeLib (copy), default (copy)
    local u9 = u7.riddleCache[u8];

    if u9 then
        return RuntimeLib.Promise.new(function(p10) -- Line: 40
            -- upvalues: u9 (copy)
            return p10(u9);
        end);
    end;

    local v11 = default.Client:Get("RequestRiddleData"):CallServerAsync(u8);
    v11:andThen(function(p12) -- Line: 46
        -- upvalues: u7 (copy), u8 (copy)
        u7.riddleCache[u8] = p12;
    end);

    return v11;
end;

KnitClient.CreateController(u1.new());

return nil;