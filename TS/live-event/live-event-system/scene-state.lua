local function u5(p1) --[[ Line: 2 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v2 = {}
    for v3, v4 in pairs(p1) do
        if type(v4) == "table" and getmetatable(v4) == nil then
            v2[v3] = u5(v4)
        else
            v2[v3] = v4
        end
    end
    return v2
end
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SceneState"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(p9, p10) --[[ Line: 25 ]]
    p9.state = {}
    if p10 ~= 0 and (p10 == p10 and (p10 ~= "" and p10)) then
        p9.state = p10
    end
end
function u6.get(p11, p12) --[[ Line: 31 ]]
    return p11.state[p12]
end
function u6.getRaw(p13) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    return u5(p13.state)
end
local u14 = u6
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "WriteableSceneState"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18, p19) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p18, p19)
end
function u15.set(p20, p21, p22) --[[ Line: 55 ]]
    p20.state[p21] = p22
end
return {
    ["SceneState"] = u6,
    ["WriteableSceneState"] = u15
}