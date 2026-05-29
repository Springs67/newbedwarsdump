local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.LOCKED = "locked"
v1.locked = "LOCKED"
v2.DOWNGRADE = "downgrade"
v1.downgrade = "DOWNGRADE"
return {
    ["ShopItemLockCause"] = v2
}