-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local UserInputService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local UserInputType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "user-input", "user-input-type").UserInputType;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "UserInputController";
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
    p3.Name = "UserInputController";
end;

function u1.KnitStart(u4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("RequestUserInputType"):Connect(function() -- Line: 28
        -- upvalues: default (ref), u4 (copy)
        default.Client:Get("SendUserInputType"):SendToServer({
            userInputType = u4:getUserInputType()
        });
    end);
end;

function u1.getUserInputType(p5) -- Line: 34
    -- upvalues: UserInputService (copy), UserInputType (copy)
    if UserInputService.GamepadEnabled then
        return UserInputType.GAMEPAD;
    end;

    if UserInputService.TouchEnabled and not UserInputService.MouseEnabled then
        return UserInputType.MOBILE;
    end;

    return UserInputType.PC;
end;

KnitClient.CreateController(u1.new());

return nil;