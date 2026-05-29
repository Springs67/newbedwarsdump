local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "SwordSwingEvent"
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
function u2.constructor(p5, p6, p7, p8, p9, p10) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.constructor(p5)
    p5.targetEntity = p6
    p5.swordType = p7
    p5.attackSpeed = p8
    p5.chargedAttack = p9
    p5.config = p10
end
function u2.bufferAttack(p11, p12) --[[ Line: 26 ]]
    local v13 = p11.bufferTime
    if v13 == 0 then
        v13 = false
    elseif v13 ~= v13 then
        v13 = false
    end
    if not v13 or p12 < p11.bufferTime then
        p11.bufferTime = p12
    end
end
return {
    ["SwordSwingEvent"] = u2
}