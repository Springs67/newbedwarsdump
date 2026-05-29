local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["DefenderKitBalance"] = {
        ["DefenseBlockDiscount"] = 0.2,
        ["BedDefenseSchematics"] = { v1.STONE_BRICK, v1.STONE_BRICK, v1.BLASTPROOF_CERAMIC },
        ["BlockCreationTime"] = 2
    },
    ["DefenderSchematicColors"] = {
        ["normal"] = Color3.fromRGB(69, 112, 179),
        ["click"] = Color3.fromRGB(204, 105, 15),
        ["error"] = Color3.fromRGB(183, 27, 42)
    }
}