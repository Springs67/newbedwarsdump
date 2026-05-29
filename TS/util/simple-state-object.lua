local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local function u8(p4) --[[ Line: 5 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v5 = {}
    for v6, v7 in pairs(p4) do
        if type(v7) == "table" and getmetatable(v7) == nil then
            v5[v6] = u8(v7)
        else
            v5[v6] = v7
        end
    end
    return v5
end
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "SimpleStateObject"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(p12, p13, p14) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p14 == nil then
        p14 = false
    end
    p12.dontDeepCopy = p14
    p12.changed = u3.new()
    p12.state = p13
end
function u9.set(p15, p16, p17) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    local v18
    if p15.dontDeepCopy then
        v18 = u2.copy(p15.state)
    else
        v18 = u8(p15.state)
    end
    table.freeze(v18)
    local v19
    if p15.dontDeepCopy then
        v19 = u2.copy(p15.state)
    else
        v19 = u8(p15.state)
    end
    v19[p16] = p17
    table.freeze(v19)
    p15.state = v19
    p15.changed:Fire(v19, v18)
end
function u9.getState(p20) --[[ Line: 45 ]]
    return p20.state
end
function u9.copy(p21) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    return u8(p21.state)
end
return {
    ["SimpleStateObject"] = u9
}