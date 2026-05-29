local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v2 = {}
local v3 = {
    [v1.LEATHER_CHESTPLATE] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(20, 30)
        }
    },
    [v1.IRON_CHESTPLATE] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(40, 60)
        }
    },
    [v1.DIAMOND_CHESTPLATE] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(30, 50)
        },
        {
            ["itemType"] = v1.EMERALD,
            ["amount"] = NumberRange.new(3, 4)
        }
    },
    [v1.WARRIOR_CHESTPLATE] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(45, 55)
        },
        {
            ["itemType"] = v1.EMERALD,
            ["amount"] = NumberRange.new(4, 5)
        }
    },
    [v1.VOID_CHESTPLATE] = {
        {
            ["itemType"] = v1.EMERALD,
            ["amount"] = NumberRange.new(4, 6)
        }
    },
    [v1.EMERALD_CHESTPLATE] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(45, 55)
        },
        {
            ["itemType"] = v1.EMERALD,
            ["amount"] = NumberRange.new(12, 15)
        }
    },
    [v1.NOCTIUM_BLADE] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(10, 15)
        }
    },
    [v1.NOCTIUM_BLADE_2] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(40, 60)
        }
    },
    [v1.NOCTIUM_BLADE_3] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(60, 80)
        },
        {
            ["itemType"] = v1.EMERALD,
            ["amount"] = NumberRange.new(2, 3)
        }
    },
    [v1.NOCTIUM_BLADE_4] = {
        {
            ["itemType"] = v1.IRON,
            ["amount"] = NumberRange.new(45, 55)
        },
        {
            ["itemType"] = v1.EMERALD,
            ["amount"] = NumberRange.new(10, 13)
        }
    }
}
v2.GEAR_PAYOUTS = v3
v2.PAYOUT_ORDER = {
    v1.EMERALD_CHESTPLATE,
    v1.DIAMOND_CHESTPLATE,
    v1.IRON_CHESTPLATE,
    v1.LEATHER_CHESTPLATE
}
v2.GEAR_SCORE = {
    [v1.LEATHER_CHESTPLATE] = 1,
    [v1.IRON_CHESTPLATE] = 2,
    [v1.DIAMOND_CHESTPLATE] = 3,
    [v1.WARRIOR_CHESTPLATE] = 3,
    [v1.VOID_CHESTPLATE] = 3,
    [v1.EMERALD_CHESTPLATE] = 4
}
v2.GEAR_HEALTH_EQUIVALANCE = {
    [v1.LEATHER_CHESTPLATE] = 140,
    [v1.IRON_CHESTPLATE] = 240,
    [v1.DIAMOND_CHESTPLATE] = 330,
    [v1.EMERALD_CHESTPLATE] = 440
}
v2.MAX_TIME_ALIVE_SCALING_SEC = 300
v2.MAX_ASSIST_TIME = 10
v2.MIN_TIME_ALIVE = 20
return {
    ["BountyUtil"] = v2
}