local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out")
local u2 = v1.BlockEngine
local u3 = v1.GreedyBlockHandler
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "SmokeBlockHandler"
    end,
    ["__index"] = u3
})
u4.__index = u4
function u4.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, ...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7, ...)
end
function u4.place(p8, p9, p10, _) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v11 = u3.createNewInstance(p8, p10)
    v11.CanCollide = false
    v11.CFrame = CFrame.new(u2:getWorldPosition(p9))
    v11:SetAttribute("IgnoreProjectileCollision", true)
    return v11
end
function u4.createFace(p12, p13, p14, p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v16 = u3.createFace(p12, p13, p14, p15)
    if not v16 then
        return nil
    end
    v16.Color = Color3.fromRGB(63, 63, 63)
    return v16
end
function u4.checkCulling(_) --[[ Line: 38 ]] end
return {
    ["SmokeBlockHandler"] = u4
}