local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DESCENDING = -1
v1[-1] = "DESCENDING"
v2.ASCENDING = 1
v1[1] = "ASCENDING"
local u3 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "PatchMapMetadataDto"
    end
})
u3.__index = u3
function u3.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v4 = u3
    local v5 = setmetatable({}, v4)
    return v5:constructor(...) or v5
end
function u3.constructor(_) --[[ Line: 27 ]] end
return {
    ["MapBrowserSortFields"] = { "likes", "dislikes", "joins" },
    ["MapBrowserQueryFields"] = {
        "metadata.mapTitle",
        "metadata.mapDescription",
        "metadata.creator",
        "joinCode",
        "mapId"
    },
    ["SortPreference"] = v2,
    ["PatchMapMetadataDto"] = u3
}