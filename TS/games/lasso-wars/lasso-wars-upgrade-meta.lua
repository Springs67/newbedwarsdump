local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "lasso-wars", "lasso-wars-types")
local v4 = v3.LassoCategory
local v5 = v3.LassoUpgradeType
local v6 = {
    [v5.SPEED] = {
        ["displayName"] = "Speed",
        ["layoutOrder"] = 1,
        ["description"] = "Increases the throw speed of your lasso.",
        ["category"] = v4.OFFENSIVE,
        ["icon"] = v2.LASSO_SPEED_BUFF,
        ["upgrades"] = {
            {
                ["level"] = 0,
                ["price"] = 0,
                ["upgrade"] = "200"
            },
            {
                ["level"] = 1,
                ["price"] = 1,
                ["upgrade"] = "200 \226\134\146 250"
            },
            {
                ["level"] = 2,
                ["price"] = 1,
                ["upgrade"] = "250 \226\134\146 300"
            },
            {
                ["level"] = 3,
                ["price"] = 2,
                ["upgrade"] = "300 \226\134\146 350"
            },
            {
                ["level"] = 4,
                ["price"] = 2,
                ["upgrade"] = "350 \226\134\146 400"
            }
        }
    },
    [v5.RANGE] = {
        ["displayName"] = "Range",
        ["layoutOrder"] = 2,
        ["description"] = "Increases the range of your lasso.",
        ["category"] = v4.OFFENSIVE,
        ["icon"] = v2.LASSO_RANGE_BUFF,
        ["upgrades"] = {
            {
                ["level"] = 0,
                ["price"] = 0,
                ["upgrade"] = "65"
            },
            {
                ["level"] = 1,
                ["price"] = 1,
                ["upgrade"] = "65 \226\134\146 80"
            },
            {
                ["level"] = 2,
                ["price"] = 2,
                ["upgrade"] = "80 \226\134\146 95"
            },
            {
                ["level"] = 3,
                ["price"] = 3,
                ["upgrade"] = "95 \226\134\146 110"
            },
            {
                ["level"] = 4,
                ["price"] = 4,
                ["upgrade"] = "110 \226\134\146 125"
            }
        }
    },
    [v5.COOLDOWN] = {
        ["displayName"] = "Cooldown",
        ["layoutOrder"] = 3,
        ["description"] = "Decreases the cooldown of your lasso.",
        ["category"] = v4.OFFENSIVE,
        ["icon"] = v2.LASSO_COOLDOWN_BUFF,
        ["upgrades"] = {
            {
                ["level"] = 0,
                ["price"] = 0,
                ["upgrade"] = "7"
            },
            {
                ["level"] = 1,
                ["price"] = 2,
                ["upgrade"] = "6 \226\134\146 4"
            },
            {
                ["level"] = 2,
                ["price"] = 2,
                ["upgrade"] = "4 \226\134\146 2"
            },
            {
                ["level"] = 3,
                ["price"] = 3,
                ["upgrade"] = "4 \226\134\146 2"
            }
        }
    },
    [v5.DAMAGE] = {
        ["displayName"] = "Lasso Damage",
        ["layoutOrder"] = 4,
        ["description"] = "Deals damage when you grab an enemy with your lasso.",
        ["category"] = v4.OFFENSIVE,
        ["icon"] = v2.LASSO_DAMAGE,
        ["upgrades"] = {
            {
                ["level"] = 0,
                ["price"] = 0,
                ["upgrade"] = "5"
            },
            {
                ["level"] = 1,
                ["price"] = 1,
                ["upgrade"] = "5 \226\134\146 10"
            },
            {
                ["level"] = 2,
                ["price"] = 2,
                ["upgrade"] = "10 \226\134\146 20"
            },
            {
                ["level"] = 3,
                ["price"] = 3,
                ["upgrade"] = "20 \226\134\146 30"
            }
        }
    },
    [v5.LASSO_ARMOR] = {
        ["displayName"] = "Lasso Armor",
        ["layoutOrder"] = 5,
        ["description"] = "Nullifies one lasso hit against you. Breaks on activation.",
        ["category"] = v4.DEFENSIVE,
        ["icon"] = v2.LASSO_GUARD,
        ["upgrades"] = {
            {
                ["level"] = 0,
                ["price"] = 0,
                ["upgrade"] = ""
            },
            {
                ["level"] = 1,
                ["price"] = 1,
                ["upgrade"] = "One time use"
            }
        }
    },
    [v5.HEAVY] = {
        ["displayName"] = "Heavy",
        ["layoutOrder"] = 6,
        ["description"] = "When lassoed by an enemy you get pulled slower.",
        ["category"] = v4.DEFENSIVE,
        ["icon"] = v2.LASSO_HEAVY,
        ["upgrades"] = {
            {
                ["level"] = 0,
                ["price"] = 0,
                ["upgrade"] = "Not Heavy"
            },
            {
                ["level"] = 1,
                ["price"] = 1,
                ["upgrade"] = "Not Heavy \226\134\146 Heavy"
            },
            {
                ["level"] = 2,
                ["price"] = 2,
                ["upgrade"] = "Heavy \226\134\146 Heaviest"
            }
        }
    }
}
return {
    ["LassoWarsUpgrades"] = v6
}