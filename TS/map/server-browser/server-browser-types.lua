local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.PUBLIC = "public"
v1.public = "PUBLIC"
v2.PRIVATE = "private"
v1.private = "PRIVATE"
return {
    ["LiveServerVisibilityMode"] = v2
}