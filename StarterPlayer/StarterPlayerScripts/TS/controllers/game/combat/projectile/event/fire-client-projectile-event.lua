local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").CancellableEvent
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "FireClientProjectileEvent"
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
function u2.constructor(p5, p6, p7, p8, p9, p10, p11, p12, p13) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.constructor(p5)
    p5.projectileSource = p6
    p5.ammoType = p7
    p5.projectileType = p8
    p5.positionFrom = p9
    p5.projectileRefId = p10
    p5.initialVelocity = p11
    p5.launchData = p12
    p5.config = p13
end
return {
    ["FireClientProjectileEvent"] = u2
}