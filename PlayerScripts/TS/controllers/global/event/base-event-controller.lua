-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EventMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 9, Name: __tostring
        return "BaseEventController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 15
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.eventTypes = p3;
    p2.Name = "BaseEventController";
end;

function v1.KnitStart(p4) -- Line: 20
    -- upvalues: KnitController (copy), EventMeta (copy)
    KnitController.KnitStart(p4);

    local function _(p5) -- Line: 23
        -- upvalues: EventMeta (ref)
        local v6 = EventMeta[p5];
        local v7 = v6.active and os.time() < v6.endDate;

        return v7;
    end;

    local v8 = false;

    for i, v in p4.eventTypes do
        local _ = i - 1;
        local v9 = EventMeta[v];
        local v10 = v9.active and os.time() < v9.endDate;

        if v10 then
            v8 = true;
            break;
        end;
    end;

    if v8 then
        p4:onEventInit();
    end;
end;

return {
    BaseEventController = v1
};