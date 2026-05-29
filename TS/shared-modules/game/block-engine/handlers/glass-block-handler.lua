local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").GreedyBlockHandler
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u7 = {}
local v8 = {
    v6.orange,
    v6.purple,
    v6.lightBlue,
    v6.yellow,
    v6.green,
    v6.pink
}
u7[7] = BrickColor.DarkGray().Color
u7[8] = BrickColor.Gray().Color
v8[9] = v6.cyan
v8[10] = v6.purple
v8[11] = v6.lightBlue
u7[12] = Color3.fromRGB(139, 69, 19)
v8[13] = v6.green
v8[14] = v6.red
u7[15] = Color3.fromRGB(45, 45, 45)
for v9, v10 in v8 do
    u7[v9] = v3.hexColor(v10)
end
local u11 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 52 ]]
        return "GlassBlockHandler"
    end,
    ["__index"] = u2
})
u11.__index = u11
function u11.new(...) --[[ Line: 58 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    local v12 = u11
    local v13 = setmetatable({}, v12)
    return v13:constructor(...) or v13
end
function u11.constructor(p14, ...) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.constructor(p14, ...)
end
function u11.checkCulling(_) --[[ Line: 65 ]] end
function u11.createNewInstance(p15, p16) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u4
        [3] = u5
    --]]
    local v17 = Color3.fromRGB(161, 161, 163)
    if u7[p16] ~= nil then
        v17 = u7[p16]
    end
    local v18 = u4
    local v19 = {
        ["Anchored"] = true,
        ["CanCollide"] = true,
        ["CastShadow"] = false,
        ["Name"] = p15:getBlockType()
    }
    local v20 = u5
    local v21 = u5
    local v22 = u5
    v19.Size = Vector3.new(v20, v21, v22)
    v19.Material = Enum.Material.Glass
    v19.Transparency = p16 == 15 and 0.35 or 0.25
    v19.Color = v17
    return v18("Part", v19)
end
return {
    ["GlassBlockHandler"] = u11
}