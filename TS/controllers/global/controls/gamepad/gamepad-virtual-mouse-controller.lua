-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local GamepadService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").GamepadService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "GamepadVirtualMouseController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "GamepadVirtualMouseController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), Flamework (copy), GamepadService (copy)
    KnitController.KnitStart(p4);
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        actionId = "GamepadToggleVirtualMouse",
        action = "ToggleVirtualMouse",

        boundFunction = function(p5, p6, p7) -- Line: 30, Name: boundFunction
            -- upvalues: GamepadService (ref)
            if p6 == Enum.UserInputState.End then
                if GamepadService.GamepadCursorEnabled then
                    GamepadService:DisableGamepadCursor();

                    return;
                end;

                GamepadService:EnableGamepadCursor(nil);
            end;
        end
    });
end;

KnitClient.CreateController(u1.new());

return nil;