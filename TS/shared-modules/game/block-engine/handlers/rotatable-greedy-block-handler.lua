local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").GreedyBlockHandler
local function u2() --[[ Line: 4 ]]
    return {
        Enum.NormalId.Top,
        Enum.NormalId.Bottom,
        Enum.NormalId.Front,
        Enum.NormalId.Back,
        Enum.NormalId.Left,
        Enum.NormalId.Right
    }
end
local u3 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 11 ]]
        return "RotatableGreedyBlockHandler"
    end,
    ["__index"] = u1
})
u3.__index = u3
function u3.new(...) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v4 = u3
    local v5 = setmetatable({}, v4)
    return v5:constructor(...) or v5
end
function u3.constructor(p6, ...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    u1.constructor(p6, ...)
end
function u3.placeAtCFrame(p7, p8, p9, p10) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u1
    --]]
    local v11 = u2()[p10 % 6 + 1]
    local v12 = CFrame.lookAt(Vector3.new(0, 0, 0), Vector3.FromNormalId(v11))
    local v13 = CFrame.new(p9.Position) * v12 * CFrame.Angles(-1.5707963267948966, 0, 0)
    u1.placeAtCFrame(p7, p8, v13, p10)
end
return {
    ["getBlockRotationNormalsList"] = u2,
    ["RotatableGreedyBlockHandler"] = u3
}