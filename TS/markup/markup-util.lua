local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u2 = {
    ["r"] = {
        ["open"] = "<b><font color=\"rgb(255,0,0)\">",
        ["close"] = "</font></b>"
    },
    ["g"] = {
        ["open"] = "<b><font color=\"rgb(0,255,0)\">",
        ["close"] = "</font></b>"
    },
    ["b"] = {
        ["open"] = "<b><font color=\"rgb(255,0,0)\">",
        ["close"] = "</font></b>"
    },
    ["n"] = {
        ["open"] = "<b>",
        ["close"] = "</b>"
    }
}
local u3 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "MarkupUtil"
    end
})
u3.__index = u3
function u3.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v4 = u3
    local v5 = setmetatable({}, v4)
    return v5:constructor(...) or v5
end
function u3.constructor(_) --[[ Line: 40 ]] end
function u3.transformMarkup(_, p6) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v7 = p6
    local v8 = v7
    for v9, v10 in u1.keys(u2) do
        local _ = v9 - 1
        local v11 = u2[v10]
        v7 = string.gsub(v8, "%[" .. tostring(v10) .. "%]", v11.open)
        v7 = string.gsub(v7, "%[%/" .. tostring(v10) .. "%]", v11.close)
        v8 = v7
    end
    return v8
end
function u3.removeMarkup(_, p12) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u2
    --]]
    local v13 = p12
    local v14 = v13
    for v15, v16 in u1.keys(u2) do
        local _ = v15 - 1
        v13 = string.gsub(v14, "%[" .. tostring(v16) .. "%]", "")
        v13 = string.gsub(v13, "%[%/" .. tostring(v16) .. "%]", "")
        v14 = v13
    end
    return v14
end
return {
    ["MarkupUtil"] = u3
}