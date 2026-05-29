local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "TitanVariantStatusEffectController"
    end,
    ["__index"] = u3
})
u4.__index = u4
function u4.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.constructor(p7)
    p7.Name = "TitanVariantStatusEffectController"
end
function u4.KnitStart(p8) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    u3.KnitStart(p8)
end
v2.CreateController(u4.new())
return nil