local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameComponent
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 12 ]]
        return "GeneratorComponent"
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
    return "Generator"
end
v2.defineMetadata(u6, "identifier", "shared/components/generator-component@GeneratorComponent")
v2.defineMetadata(u6, "flamework:implements", { "$:flamework@OnStart" })
local v10 = {
    ["tag"] = "Generator",
    ["defaults"] = {
        ["Id"] = "",
        ["Cooldown"] = 20,
        ["MaxStackSize"] = 3,
        ["GeneratorLevel"] = 0,
        ["BlockPosition"] = Vector3.new()
    },
    ["attributes"] = {
        ["Id"] = v3.string,
        ["BlockPosition"] = v3.Vector3,
        ["Cooldown"] = v3.number,
        ["MaxStackSize"] = v3.number,
        ["GeneratorLevel"] = v3.number
    },
    ["instanceGuard"] = v3.instanceIsA("Part")
}
v2.decorate(u6, "$c:init@Component", v5, { v10 })
return {
    ["default"] = u6
}