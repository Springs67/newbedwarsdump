-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local GamepadKeycodes = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GamepadKeycodes;
local v1 = {};
local u2 = nil;
local u3 = nil;

function v1.getGamepadKeybind(p4) -- Line: 16
    -- upvalues: u3 (ref), GamepadKeycodes (copy)
    local v5 = u3():getActionKeycodes(p4);

    if v5 ~= nil then
        local function _(p6) -- Line: 20
            -- upvalues: GamepadKeycodes (ref)
            return table.find(GamepadKeycodes, p6) ~= nil;
        end;

        local v7 = 0;
        local v8 = {};

        for i, v in v5 do
            local _ = i - 1;

            if table.find(GamepadKeycodes, v) ~= nil == true then
                v7 = v7 + 1;
                v8[v7] = v;
            end;
        end;

        v5 = table.remove(v8, 1);
    end;

    return v5;
end;

u3 = function() -- Line: 39, Name: getActionBinderController
    -- upvalues: u2 (ref), Flamework (copy)
    if not u2 then
        u2 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController");
    end;

    return u2;
end;

return {
    GamepadUtil = v1
};