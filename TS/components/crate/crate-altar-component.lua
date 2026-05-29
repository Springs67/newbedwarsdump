local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameComponent
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "CrateAltarComponent"
    end,
    ["__index"] = u4
})
u7.__index = u7
function u7.new(...) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(p10, ...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    u4.constructor(p10, ...)
end
function u7.onStart(_) --[[ Line: 26 ]] end
function u7.getCratesFolder(p11) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v12 = u6
    local v13 = p11.attributes.id
    return v12:FindFirstChild("CrateAltar_" .. tostring(v13))
end
function u7.getTag(_) --[[ Line: 31 ]]
    return "InitializedCrateAltar"
end
v2.defineMetadata(u7, "identifier", "shared/components/crate/crate-altar-component@CrateAltarComponent")
v2.defineMetadata(u7, "flamework:implements", { "$:flamework@OnStart" })
local v14 = v2.decorate
local v15 = u7
local v16 = {}
local v17 = {
    ["tag"] = "InitializedCrateAltar",
    ["defaults"] = {
        ["id"] = 0
    },
    ["attributes"] = {
        ["id"] = v3.number
    }
}
local v18 = v3.intersection
local v19 = v3.instanceIsA("Model")
local v20 = v3.children
local v21 = {
    ["ProximityPart"] = v3.intersection(v3.instanceIsA("BasePart"), v3.children({
        ["ChooseCratePrompt"] = v3.instanceIsA("ProximityPrompt")
    })),
    ["Altars"] = v3.intersection(v3.instanceIsA("Folder"), v3.children({
        ["Altar"] = v3.instanceIsA("BasePart"),
        ["Altar2"] = v3.instanceIsA("BasePart"),
        ["Altar3"] = v3.instanceIsA("BasePart")
    })),
    ["Base"] = v3.instanceIsA("BasePart"),
    ["Center"] = v3.instanceIsA("BasePart"),
    ["Forcefield"] = v3.instanceIsA("BasePart")
}
v17.instanceGuard = v18(v19, v20(v21))
__set_list(v16, 1, {v17})
v14(v15, "$c:init@Component", v5, v16)
return {
    ["CrateAltarComponent"] = u7
}