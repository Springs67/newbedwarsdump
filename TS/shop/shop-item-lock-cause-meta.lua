local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shop", "shop-item-lock-cause").ShopItemLockCause
local v5 = {}
local v6 = {
    ["purchaseButtonTitle"] = "Downgrade",
    ["purchaseButtonColor"] = v3.backgroundPrimary
}
v5[v4.DOWNGRADE] = v6
v5[v4.LOCKED] = {
    ["purchaseButtonTitle"] = "Locked",
    ["lockIcon"] = v2.LOCK_ART
}
return {
    ["ShopItemLockCauseMeta"] = v5
}