local v1 = {
    [require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "keys", "key-type").KeyType.HALLOWEEN_LTM] = {
        ["name"] = "Halloween LTM Key",
        ["maxAmount"] = 6,
        ["disabled"] = false,
        ["keyRegen"] = {
            ["cooldown"] = 3600,
            ["amountPerRegen"] = 1
        }
    }
}
return {
    ["KeyMeta"] = v1
}