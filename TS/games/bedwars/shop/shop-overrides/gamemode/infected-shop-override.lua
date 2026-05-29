local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop-types").BedwarsShopOverride
local u5 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "InfectedShopOverride"
    end,
    ["__index"] = u4
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
        [1] = u4
    --]]
    u4.constructor(p8, ...)
end
function u5.shouldApply(_, _) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v9 = u2:GetAttribute("QueueType")
    if v9 then
        v9 = v9 == u3.INFECTED
    end
    return v9
end
function u5.getOverride(_) --[[ Line: 27 ]]
    return {}
end
return {
    ["default"] = u5.new()
}