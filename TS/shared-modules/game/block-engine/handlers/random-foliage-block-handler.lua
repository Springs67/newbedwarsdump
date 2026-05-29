local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").PrefabBlockHandler
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").RandomUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "RandomFoliageBlockHandler"
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
function u5.constructor(p8, p9, p10, p11, p12) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p8, p9, p10, p11, nil)
    p8.blockOptions = p12
end
function u5.createNewInstance(p13, _) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
    --]]
    local v14 = u3.fromList
    local v15 = p13.blockOptions
    local v16 = v14(unpack(v15))
    local v17 = u4.Assets.Blocks:WaitForChild(v16):WaitForChild("Root"):Clone()
    v17.Name = p13:getBlockType()
    return v17
end
function u5.place(p18, p19, p20, _) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    return u2.place(p18, p19, p20, {
        ["yRot"] = math.random() * 2 * 3.141592653589793
    })
end
return {
    ["RandomFoliageBlockHandler"] = u5
}