return {
    ["ItemBalanceFile"] = {
        [require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType.MYTHIC_DAGGER] = {
            ["poisonDurationSec"] = 4
        }
    }
}