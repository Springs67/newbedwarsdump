local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "SwordChargeEvent"
    end,
    ["__index"] = u1
})
u2.__index = u2
function u2.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(p5, p6, p7, p8) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.constructor(p5)
    p5.chargeState = p6
    p5.itemType = p7
    p5.refId = p8
end
return {
    ["SwordChargeEvent"] = u2
}