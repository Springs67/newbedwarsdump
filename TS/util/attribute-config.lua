local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "typesafe-attributes")
local u2 = v1.GetAttribute
local u3 = v1.GetAttributeChangedSignal
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 9 ]]
        return "AttributeConfig"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(p7, p8, p9) --[[ Line: 18 ]]
    p7.instance = p8
    p7.Values = {}
    for _, v10 in p9 do
        p7:handleAttribute(v10)
    end
end
function u4.handleAttribute(u11, u12) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v13 = u2(u11.instance, u12)
    u11.Values[u12.Name] = v13
    u3(u11.instance, u12, function(p14) --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u12
        --]]
        u11.Values[u12.Name] = p14
    end)
end
return u4