local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameComponent
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "MapBoundsComponent"
    end,
    ["__index"] = u4
})
u6.__index = u6
function u6.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, ...) --[[ Line: 22 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p9, ...)
end
function u6.onStart(_) --[[ Line: 25 ]] end
function u6.getTag(_) --[[ Line: 27 ]]
    return "map-bounds-component"
end
v2.defineMetadata(u6, "identifier", "shared/map/map-bounds-component@MapBoundsComponent")
v2.defineMetadata(u6, "flamework:implements", { "$:flamework@OnStart" })
local v10 = v2.decorate
local v11 = u6
local v12 = {}
local v13 = {
    ["tag"] = "map-bounds-component",
    ["defaults"] = {
        ["minX"] = 0,
        ["maxX"] = 0,
        ["minY"] = 0,
        ["maxY"] = 0,
        ["minZ"] = 0,
        ["maxZ"] = 0
    },
    ["attributes"] = {
        ["minX"] = v3.number,
        ["maxX"] = v3.number,
        ["minY"] = v3.number,
        ["maxY"] = v3.number,
        ["minZ"] = v3.number,
        ["maxZ"] = v3.number
    }
}
__set_list(v12, 1, {v13})
v10(v11, "$c:init@Component", v5, v12)
return {
    ["MapBoundsComponent"] = u6
}