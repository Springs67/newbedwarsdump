-- Decompiled with Potassium's decompiler.

local DeviceUtil = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 7, Name: __tostring
        return "BedwarsUI";
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

function u1.getActionBarPosition(p4) -- Line: 18
    -- upvalues: DeviceUtil (copy)
    if DeviceUtil.isSmallScreen() then
        return UDim2.fromScale(0.5, 0.74);
    end;

    return UDim2.fromScale(0.48, 0.85);
end;

function u1.getTopBarPosition(p5) -- Line: 24
    return UDim2.fromScale(0.5, 0.02);
end;

function u1.getActionMobileButtonPosition(p6) -- Line: 27
    -- upvalues: DeviceUtil (copy)
    if DeviceUtil.isSmallScreen() then
        return UDim2.fromScale(0.83, 0.235);
    end;

    return UDim2.fromScale(0.82, 0.43);
end;

function u1.getSwordButtonPosition(p7) -- Line: 34
    -- upvalues: DeviceUtil (copy)
    if DeviceUtil.isSmallScreen() then
        return UDim2.fromScale(0.84, 0.67);
    end;

    return UDim2.fromScale(0.81, 0.68);
end;

function u1.getInteractButtonPosition(p8) -- Line: 41
    -- upvalues: DeviceUtil (copy)
    if DeviceUtil.isSmallScreen() then
        return UDim2.fromScale(0.95, 0.49);
    end;

    return UDim2.fromScale(0.95, 0.49);
end;

function u1.getBuildButtonPosition(p9) -- Line: 47
    -- upvalues: DeviceUtil (copy)
    if DeviceUtil.isSmallScreen() then
        return UDim2.fromScale(0.95, 0.64);
    end;

    return UDim2.fromScale(0.95, 0.6);
end;

function u1.getSprintButtonPosition(p10) -- Line: 53
    -- upvalues: DeviceUtil (copy)
    if DeviceUtil.isSmallScreen() then
        return UDim2.fromScale(0.95, 0.34);
    end;

    return UDim2.fromScale(0.95, 0.4);
end;

return {
    BedwarsUI = u1
};