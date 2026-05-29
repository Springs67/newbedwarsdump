local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-type").PetType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-types").PetAnimationPriority
local v6 = {}
local v7 = v4.CRAB
local v8 = {
    ["rotationOffset"] = -90,
    ["model"] = v2.Assets.Pets.Crab
}
local v9 = {
    ["idle"] = v3.CRAB_IDLE,
    ["walk"] = v3.CRAB_WALK_RIGHT,
    ["dance"] = v3.CRAB_DANCE,
    ["passiveActions"] = {
        {
            ["id"] = v3.CRAB_BLINK,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.CRAB_HEAD_SWAY,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.CRAB_HEAD_SCRATCH,
            ["type"] = v5.OVERRIDE
        }
    }
}
v8.animations = v9
v6[v7] = v8
local v10 = v4.TURTLE
local v11 = {
    ["spawnHeightOffset"] = 1.3,
    ["model"] = v2.Assets.Pets.VictoriousTurtle
}
local v12 = {
    ["idle"] = v3.TURTLE_IDLE,
    ["walk"] = v3.TURTLE_WALK,
    ["dance"] = v3.TURTLE_DANCE,
    ["passiveActions"] = {
        {
            ["id"] = v3.TURTLE_BLINK,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.TURTLE_HEAD_SWAY,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.TURTLE_HEAD_SCRATCH,
            ["type"] = v5.OVERRIDE
        }
    }
}
v11.animations = v12
v6[v10] = v11
local v13 = v4.DEFAULT_SPIDER
local v14 = {
    ["scaleMultiplier"] = 1.25,
    ["spawnHeightOffset"] = 1.9,
    ["model"] = v2.Assets.Misc.SpiderQueenSpiderling
}
local v15 = {
    ["idle"] = v3.DEFAULT_SPIDER_IDLE,
    ["walk"] = v3.DEFAULT_SPIDER_WALK,
    ["dance"] = v3.DEFAULT_SPIDER_DANCE,
    ["passiveActions"] = {
        {
            ["id"] = v3.DEFAULT_SPIDER_LOOKING,
            ["type"] = v5.OVERRIDE
        },
        {
            ["id"] = v3.DEFAULT_SPIDER_SCRATCHING,
            ["type"] = v5.OVERRIDE
        }
    }
}
v14.animations = v15
v6[v13] = v14
local v16 = v4.GOLDEN_SNAKE
local v17 = {
    ["scaleMultiplier"] = 0.45,
    ["model"] = v2.Assets.Pets.GoldenSnake,
    ["animations"] = {
        ["idle"] = v3.GOLDEN_SNAKE_IDLE,
        ["walk"] = v3.GOLDEN_SNAKE_WALK,
        ["dance"] = v3.GOLDEN_SNAKE_DANCE
    }
}
v6[v16] = v17
local v18 = v4.EGYPTIAN_CAT
local v19 = {
    ["scaleMultiplier"] = 0.7,
    ["spawnHeightOffset"] = 2.3,
    ["model"] = v2.Assets.Pets.EgyptianCat
}
local v20 = {
    ["idle"] = v3.EGYPTIAN_CAT_IDLE,
    ["walk"] = v3.EGYPTIAN_CAT_WALK,
    ["dance"] = v3.EGYPTIAN_CAT_DANCE,
    ["passiveActions"] = {
        {
            ["id"] = v3.EGYPTIAN_CAT_BLINK,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.EGYPTIAN_CAT_HEAD_SWAY,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.EGYPTIAN_CAT_HEAD_SCRATCH,
            ["type"] = v5.OVERRIDE
        }
    }
}
v19.animations = v20
v6[v18] = v19
local v21 = v4.JELLYFISH
local v22 = {
    ["scaleMultiplier"] = 1,
    ["heightOffset"] = 2,
    ["spawnHeightOffset"] = 5,
    ["model"] = v2.Assets.Pets.Jellyfish
}
local v23 = {
    ["idle"] = v3.JELLYFISH_IDLE,
    ["walk"] = v3.JELLYFISH_IDLE,
    ["dance"] = v3.JELLYFISH_SPAWN,
    ["passiveActions"] = {
        {
            ["id"] = v3.JELLYFISH_ATTACK,
            ["type"] = v5.OVERLAY
        }
    }
}
v22.animations = v23
v6[v21] = v22
local v24 = v4.OWL
local v25 = {
    ["scaleMultiplier"] = 1,
    ["heightOffset"] = 2,
    ["spawnHeightOffset"] = 1.1,
    ["model"] = v2.Assets.Pets.Owl,
    ["animations"] = {
        ["idle"] = v3.OWL_FLY,
        ["walk"] = v3.OWL_FLY,
        ["passiveActions"] = {}
    }
}
v6[v24] = v25
local v26 = v4.DRAGON
local v27 = {
    ["scaleMultiplier"] = 1,
    ["heightOffset"] = -0.9,
    ["spawnHeightOffset"] = 3.5,
    ["model"] = v2.Assets.Pets.Dragon
}
local v28 = {
    ["idle"] = v3.DRAGON_IDLE,
    ["walk"] = v3.DRAGON_WALK,
    ["dance"] = v3.DRAGON_DANCE,
    ["passiveActions"] = {
        {
            ["id"] = v3.DRAGON_BLINK,
            ["type"] = v5.OVERLAY
        },
        {
            ["id"] = v3.DRAGON_HEAD_SWAY,
            ["type"] = v5.OVERLAY
        }
    }
}
v27.animations = v28
v6[v26] = v27
local v29 = v4.BABY_PENGUIN
local v30 = {
    ["scaleMultiplier"] = 1,
    ["heightOffset"] = 0,
    ["spawnHeightOffset"] = 0,
    ["model"] = v2.Assets.Pets.BabyPenguin,
    ["animations"] = {
        ["idle"] = v3.PENGUIN_IDLE_2,
        ["walk"] = v3.NORMAL_PENGUIN_WALK
    }
}
v6[v29] = v30
local v31 = v4.CHICKEN
local v32 = {
    ["scaleMultiplier"] = 1,
    ["heightOffset"] = 0,
    ["spawnHeightOffset"] = 0,
    ["model"] = v2.Assets.Pets.Chicken,
    ["animations"] = {
        ["idle"] = v3.CHICKEN_IDLE,
        ["walk"] = v3.CHICKEN_RUN,
        ["dance"] = v3.CHICKEN_FLAP
    }
}
v6[v31] = v32
return {
    ["PetMeta"] = v6
}