local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "NinjaKitUtil"
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
function u2.isItemTypeChakram(_, p5) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return (p5 == u1.NINJA_CHAKRAM_1 or (p5 == u1.NINJA_CHAKRAM_2 or p5 == u1.NINJA_CHAKRAM_3)) and true or p5 == u1.NINJA_CHAKRAM_4
end
function u2.isProjectileTypeChakram(_, p6) --[[ Line: 21 ]]
    return (p6 == "ninja_chakram_1" or (p6 == "ninja_chakram_2" or p6 == "ninja_chakram_3")) and true or p6 == "ninja_chakram_4"
end
return {
    ["NinjaKitUtil"] = u2
}