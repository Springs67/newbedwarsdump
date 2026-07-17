-- Decompiled with Potassium's decompiler.

local EmoteHandler = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 8, Name: __tostring
        return "BaseEmoteHandler";
    end,

    __index = EmoteHandler
});
u1.__index = u1;

function u1.new(...) -- Line: 14
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 18
    -- upvalues: EmoteHandler (copy)
    EmoteHandler.constructor(p3, ...);
end;

function u1.onEnable(p4, p5, p6, p7) -- Line: 21
end;

function u1.onDisable(p8, p9, p10, p11) -- Line: 23
end;

return {
    BaseEmoteHandler = u1
};