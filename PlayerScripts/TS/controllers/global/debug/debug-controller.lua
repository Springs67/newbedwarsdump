-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ContextActionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ContextActionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "DebugController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "DebugController";
    p3.debugTimers = {};
    p3.debugTimerArrays = {};
end;

function u1.KnitStart(u4) -- Line: 29
    -- upvalues: KnitController (copy), PlaceUtil (copy), ContextActionService (copy), default (copy)
    KnitController.KnitStart(u4);

    if PlaceUtil.isProduction() then
        return nil;
    end;

    ContextActionService:BindAction("debug-action", function(p5, p6, p7) -- Line: 34
        -- upvalues: u4 (copy)
        if p6 ~= Enum.UserInputState.Begin then
            return nil;
        end;

        task.spawn(function() -- Line: 38
            -- upvalues: u4 (ref)
            u4:debugFunction();
        end);
    end, false, Enum.KeyCode.RightShift);
    default.Client:Get("DebugResponse"):Connect(function(p8) -- Line: 42
        -- upvalues: u4 (copy)
        task.spawn(function() -- Line: 43
            -- upvalues: u4 (ref)
            u4:responseFunction();
        end);
    end);
end;

function u1.debugFunction(p9) -- Line: 48
    -- upvalues: default (copy)
    print("[DEBUG CLIENT]: Local debug function called.");
    default.Client:Get("DebugRequest"):SendToServer({});
end;

function u1.responseFunction(p10) -- Line: 54
    print("[DEBUG CLIENT]: Server response received.");
end;

KnitClient.CreateController(u1.new());

return nil;