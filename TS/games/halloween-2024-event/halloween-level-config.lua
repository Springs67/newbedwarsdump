local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "HalloweenLevelConfig"
    end
})
u2.__index = u2
function u2.new(...) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v3 = u2
    local v4 = setmetatable({}, v3)
    return v4:constructor(...) or v4
end
function u2.constructor(_) --[[ Line: 16 ]] end
u2.MAX_LEVEL = 15
u2.LEVELS_PER_TIER = 5
u2.EXPERIENCE_NEEDED_PER_LEVEL = v1:IsStudio() and 50 or 100
u2.EXPERIENCE_PER_CRYSTAL = 30
u2.EXPERIENCE_PER_SPIDER = 10
u2.EXPERIENCE_PER_GUARD = 20
return {
    ["HalloweenLevelConfig"] = u2
}