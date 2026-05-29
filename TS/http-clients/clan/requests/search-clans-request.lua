local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Name = "name"
v1.name = "Name"
v2.Tag = "tag"
v1.tag = "Tag"
local u3 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 16 ]]
        return "SearchClansRequest"
    end
})
u3.__index = u3
function u3.new(...) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v4 = u3
    local v5 = setmetatable({}, v4)
    return v5:constructor(...) or v5
end
function u3.constructor(p6, p7, p8, p9, p10, p11) --[[ Line: 25 ]]
    p6.keyword = p7
    p6.searchField = p8
    p6.page = p9
    p6.minMembers = p10
    p6.maxMembers = p11
end
return {
    ["SearchClansField"] = v2,
    ["SearchClansRequest"] = u3
}