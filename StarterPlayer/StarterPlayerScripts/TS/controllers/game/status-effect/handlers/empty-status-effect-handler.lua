local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, script.Parent, "client-status-effect-handler").ClientStatusEffectHandler
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "EmptyStatusEffectHandler"
    end,
    ["__index"] = u1
})
u2.__index = u2
function u2.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, ...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.constructor(p5, ...)
end
function u2.onApply(_, _, _) --[[ Line: 21 ]] end
function u2.onRemove(_, _, _) --[[ Line: 23 ]] end
return {
    ["EmptyStatusEffectHandler"] = u2
}