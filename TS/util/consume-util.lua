local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u2 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 7 ]]
        return "ConsumeUtil"
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
function u2.isConsumable(_, p5) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v6 = u1(p5)
    if v6 ~= nil then
        v6 = v6.consumable
    end
    return v6 and true or false
end
return {
    ["ConsumeUtil"] = u2
}