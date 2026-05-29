local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DEFAULT = "default"
v1.default = "DEFAULT"
v2.CHRISTMAS = "christmas"
v1.christmas = "CHRISTMAS"
return {
    ["StatefulEntitySkinTheme"] = v2
}