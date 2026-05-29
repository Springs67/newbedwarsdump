local u1 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 5 ]]
        return "StyxEnterGhostStateEvent"
    end
})
u1.__index = u1
function u1.new(...) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v2 = u1
    local v3 = setmetatable({}, v2)
    return v3:constructor(...) or v3
end
function u1.constructor(p4, p5) --[[ Line: 14 ]]
    p4.player = p5
end
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "StyxKitUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 30 ]] end
return {
    ["StyxEnterGhostStateEvent"] = u1,
    ["StyxKitUtil"] = u6
}