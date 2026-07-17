-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 7, Name: __tostring
        return "ProfileDataKeybindLoader";
    end
});
u1.__index = u1;

function u1.new(...) -- Line: 12
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 16
end;

function u1.loadKeybinds(p4) -- Line: 18
    -- upvalues: RuntimeLib (copy), default (copy)
    local v6, v7 = RuntimeLib.try(function() -- Line: 19
        -- upvalues: default (ref), RuntimeLib (ref)
        local v5 = default.Client:Get("RetrieveProfileDataKeybinds"):CallServer();

        if v5 then
            return RuntimeLib.TRY_RETURN, {
                {
                    keyboard = v5.keyboardKeybindDefinition,
                    gamepad = v5.gamepadKeybindDefinition
                }
            };
        end;

        return RuntimeLib.TRY_RETURN, { nil };
    end, function() -- Line: 28
        -- upvalues: RuntimeLib (ref)
        return RuntimeLib.TRY_RETURN, { nil };
    end);

    if v6 then
        return unpack(v7);
    end;
end;

return {
    ProfileDataKeybindLoader = u1
};