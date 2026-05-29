local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.ENCHANT = "enchant"
v1.enchant = "ENCHANT"
return {
    ["StatusEffectCategory"] = v2
}