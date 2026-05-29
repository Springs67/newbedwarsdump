local v1 = {
    [require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-metadata").EventShopItemTier.LEGENDARY] = {
        ["color"] = Color3.fromRGB(255, 161, 54)
    }
}
return {
    ["EventShopItemTierMeta"] = v1
}