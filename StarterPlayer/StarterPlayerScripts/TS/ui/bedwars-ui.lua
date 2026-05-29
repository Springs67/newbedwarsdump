local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "BedwarsUI"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(_) --[[ Line: 16 ]] end
function u2.getActionBarPosition(_) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u1.isSmallScreen() then
        return UDim2.fromScale(0.5, 0.74)
    else
        return UDim2.fromScale(0.48, 0.85)
    end
end
function u2.getTopBarPosition(_) --[[ Line: 24 ]]
    return UDim2.fromScale(0.5, 0.02)
end
function u2.getActionMobileButtonPosition(_) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u1.isSmallScreen() then
        return UDim2.fromScale(0.83, 0.235)
    else
        return UDim2.fromScale(0.82, 0.43)
    end
end
function u2.getSwordButtonPosition(_) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u1.isSmallScreen() then
        return UDim2.fromScale(0.84, 0.67)
    else
        return UDim2.fromScale(0.81, 0.68)
    end
end
function u2.getInteractButtonPosition(_) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u1.isSmallScreen() then
        return UDim2.fromScale(0.95, 0.49)
    else
        return UDim2.fromScale(0.95, 0.49)
    end
end
function u2.getBuildButtonPosition(_) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u1.isSmallScreen() then
        return UDim2.fromScale(0.95, 0.64)
    else
        return UDim2.fromScale(0.95, 0.6)
    end
end
function u2.getSprintButtonPosition(_) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    if u1.isSmallScreen() then
        return UDim2.fromScale(0.95, 0.34)
    else
        return UDim2.fromScale(0.95, 0.4)
    end
end
return {
    ["BedwarsUI"] = u2
}