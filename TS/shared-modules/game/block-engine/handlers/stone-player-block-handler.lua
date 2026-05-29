local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").GreedyBlockHandler
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "StonePlayerBlockHandler"
    end,
    ["__index"] = u2
})
u5.__index = u5
function u5.new(...) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v6 = u5
    local v7 = setmetatable({}, v6)
    return v7:constructor(...) or v7
end
function u5.constructor(p8, ...) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p8, ...)
end
function u5.checkCulling(_) --[[ Line: 23 ]] end
function u5.createNewInstance(p9, _) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v10 = Color3.fromRGB(161, 161, 163)
    local v11 = u3
    local v12 = {
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["CastShadow"] = false,
        ["Name"] = p9:getBlockType()
    }
    local v13 = u4
    local v14 = u4
    local v15 = u4
    v12.Size = Vector3.new(v13, v14, v15)
    v12.Material = Enum.Material.Glass
    v12.Color = v10
    return v11("Part", v12)
end
return {
    ["StonePlayerBlockHandler"] = u5
}