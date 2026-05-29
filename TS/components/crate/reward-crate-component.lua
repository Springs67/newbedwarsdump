local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "t", "lib", "ts").t
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameComponent
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "components", "out").Component
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-type").CrateType
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "RewardCrateComponent"
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
function u7.setOpenCratePrompt(p11, p12) --[[ Line: 28 ]]
    p11.openCratePrompt = p12
end
function u7.getOpenCratePrompt(p13) --[[ Line: 31 ]]
    return p13.openCratePrompt
end
function u7.getTag(_) --[[ Line: 34 ]]
    return "RewardCrate"
end
v2.defineMetadata(u7, "identifier", "shared/components/crate/reward-crate-component@RewardCrateComponent")
v2.defineMetadata(u7, "flamework:implements", { "$:flamework@OnStart" })
local v14 = {
    ["tag"] = "RewardCrate",
    ["defaults"] = {
        ["crateId"] = "",
        ["crateType"] = v6.LEVEL_UP_CRATE
    },
    ["attributes"] = {
        ["crateId"] = v3.string,
        ["crateType"] = v3.literal("level_up_crate", "diamond_lucky_crate", "afk_crate", "murder_crate", "kitskin_crate"),
        ["promptObjectLabel"] = v3.optional(v3.string),
        ["promptActionText"] = v3.optional(v3.string),
        ["altarId"] = v3.optional(v3.number),
        ["owner"] = v3.optional(v3.number)
    },
    ["instanceGuard"] = v3.instanceIsA("Model")
}
v2.decorate(u7, "$c:init@Component", v5, { v14 })
return {
    ["RewardCrateComponent"] = u7
}