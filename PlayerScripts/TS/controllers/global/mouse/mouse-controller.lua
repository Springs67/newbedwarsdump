-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local UserInputService = v2.UserInputService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "MouseController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 19
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "MouseController";
end;

function u3.KnitStart(p6) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.hookToMouseMovement(p7, u8) -- Line: 30
    -- upvalues: u1 (copy), UserInputService (copy)
    local v9 = u1.new();
    v9:GiveTask(UserInputService.InputChanged:Connect(function(p10) -- Line: 32
        -- upvalues: u8 (copy)
        if p10.UserInputType == Enum.UserInputType.MouseMovement then
            u8(p10.Position, p10);
        end;
    end));

    return v9;
end;

function u3.hookToMouseClick(p11, u12) -- Line: 40
    -- upvalues: u1 (copy), Players (copy)
    local v13 = u1.new();
    local u14 = Players.LocalPlayer:GetMouse();
    local u15 = 0;
    v13:GiveTask(u14.Button1Down:Connect(function() -- Line: 45
        -- upvalues: u15 (ref), u12 (copy), u14 (copy)
        u15 = u15 + 1;

        if u15 % 2 == 0 then
            u12(u14, true);
        else
            u12(u14, false);
        end;

        task.delay(0.5, function() -- Line: 52
            -- upvalues: u15 (ref)
            u15 = u15 - 1;
        end);
    end));

    return v13;
end;

KnitClient.CreateController(u3.new());

return nil;