-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local v1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "LegacyKitKnitController";
    end,

    __index = KnitController
});
v1.__index = v1;

function v1.constructor(p2, p3) -- Line: 19
    -- upvalues: KnitController (copy)
    KnitController.constructor(p2);
    p2.kits = p3;
    p2.enabled = false;
end;

function v1.KnitStart(u4) -- Line: 24
    -- upvalues: RuntimeLib (copy), ClientStore (copy)
    local function u6(p5) -- Line: 25
        -- upvalues: u4 (copy), RuntimeLib (ref)
        if p5.Bedwars.kit and table.find(u4.kits, p5.Bedwars.kit) ~= nil then
            if u4.enabled then
                return nil;
            end;

            u4.enabled = true;
            RuntimeLib.Promise.defer(function() -- Line: 34
                -- upvalues: u4 (ref)
                u4:onKitEnabled();
            end);

            return nil;
        end;

        if not u4.enabled then
            return nil;
        end;

        u4.enabled = false;
        RuntimeLib.Promise.defer(function() -- Line: 44
            -- upvalues: u4 (ref)
            u4:onKitDisabled();
        end);
    end;

    ClientStore.changed:connect(function(p7, p8) -- Line: 48
        -- upvalues: u6 (copy)
        if p7.Bedwars.kit ~= p8.Bedwars.kit then
            u6(p7);
        end;
    end);
    u6(ClientStore:getState());
end;

function v1.isEnabled(p9) -- Line: 55
    return p9.enabled;
end;

function v1.getHandItem(p10) -- Line: 58
    return p10.handItem;
end;

return {
    LegacyKitKnitController = v1
};