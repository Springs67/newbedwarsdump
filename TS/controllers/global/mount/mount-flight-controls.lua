-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = {};
local u3 = nil;
local u4 = nil;

function v2.bindUpDownControls() -- Line: 27
    -- upvalues: u1 (copy), u3 (ref), u4 (ref)
    local v5 = u1.new();
    local v6 = u3();
    local v7 = u4();
    v5:GiveTask(v6.bindActionMaid);
    v5:GiveTask(v7.bindActionMaid);

    return {
        bindActionMaid = v5,
        shouldFlyUpRef = v6.shouldFlyUpRef,
        shouldFlyDownRef = v7.shouldFlyDownRef
    };
end;

u3 = function() -- Line: 47, Name: bindUpControls
    -- upvalues: u1 (copy), Flamework (copy)
    local BoolValue = Instance.new("BoolValue");
    local v8 = u1.new();
    v8:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "MoveMountUp",
        actionId = "mount-flying-up",

        boundFunction = function(p9, p10) -- Line: 54, Name: boundFunction
            -- upvalues: BoolValue (copy)
            if p10 == Enum.UserInputState.Begin then
                BoolValue.Value = true;
            elseif p10 == Enum.UserInputState.End then
                BoolValue.Value = false;
            end;

            return Enum.ContextActionResult.Sink;
        end,

        priority = Enum.ContextActionPriority.High.Value
    }));

    return {
        bindActionMaid = v8,
        shouldFlyUpRef = BoolValue
    };
end;

v2.bindUpControls = u3;

u4 = function() -- Line: 76, Name: bindDownControls
    -- upvalues: u1 (copy), Flamework (copy)
    local BoolValue = Instance.new("BoolValue");
    local v11 = u1.new();
    v11:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "MoveMountDown",
        actionId = "mount-flying-down",

        boundFunction = function(p12, p13) -- Line: 83, Name: boundFunction
            -- upvalues: BoolValue (copy)
            if p13 == Enum.UserInputState.Begin then
                BoolValue.Value = true;
            elseif p13 == Enum.UserInputState.End then
                BoolValue.Value = false;
            end;

            return Enum.ContextActionResult.Sink;
        end,

        priority = Enum.ContextActionPriority.High.Value
    }));

    return {
        bindActionMaid = v11,
        shouldFlyDownRef = BoolValue
    };
end;

v2.bindDownControls = u4;

return {
    MountFlightControls = v2
};