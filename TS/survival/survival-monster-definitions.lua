local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "monster", "monster-type").MonsterType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "survival", "survival-monster-loot-table-definitions").SurvivalMonsterLootCategory
local v7 = {}
local v8 = v4.NORMAL_PENGUIN
local v9 = {
    ["modelName"] = "NormalPenguin",
    ["baseHealth"] = 100,
    ["baseDamage"] = 10,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 0,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v10 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v9.sounds = v10
v9.range = 3.8 * v3
v9.lootCategory = v6.TIER1
v7[v8] = v9
local v11 = v4.BIG_PENGUIN
local v12 = {
    ["modelName"] = "BigPenguin",
    ["baseHealth"] = 260,
    ["baseDamage"] = 20,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 7,
    ["blockDamage"] = 10,
    ["hitbox"] = Vector3.new(7, 7, 7),
    ["blockHeight"] = 3,
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v13 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v12.sounds = v13
v12.range = 6 * v3
v12.lootCategory = v6.TIER3
v7[v11] = v12
local v14 = v4.TALL_PENGUIN
local v15 = {
    ["modelName"] = "TallPenguin",
    ["baseHealth"] = 200,
    ["baseDamage"] = 15,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 2,
    ["blockDamage"] = 10,
    ["hitbox"] = Vector3.new(4, 7, 4),
    ["blockHeight"] = 2,
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v16 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v15.sounds = v16
v15.range = 4 * v3
v15.lootCategory = v6.TIER1
v7[v14] = v15
local v17 = v4.BABY_PENGUIN
local v18 = {
    ["modelName"] = "BabyPenguin",
    ["baseHealth"] = 60,
    ["baseDamage"] = 34,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 8,
    ["blockDamage"] = 100,
    ["hitbox"] = Vector3.new(1, 1, 1),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v19 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v18.sounds = v19
v18.range = 4.2 * v3
v18.lootCategory = v6.TIER1
v7[v17] = v18
local v20 = v4.BOMBER_PENGUIN
local v21 = {
    ["modelName"] = "BomberPenguin",
    ["baseHealth"] = 100,
    ["baseDamage"] = 18,
    ["walkSpeedMultiplier"] = 1.5,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 4,
    ["blockDamage"] = 10,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v22 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v21.sounds = v22
v21.range = 3.8 * v3
v21.lootCategory = v6.TIER2
v7[v20] = v21
local v23 = v4.ULTRA_BOMBER_PENGUIN
local v24 = {
    ["modelName"] = "BomberPenguin",
    ["baseHealth"] = 250,
    ["baseDamage"] = 18,
    ["walkSpeedMultiplier"] = 1.75,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 4,
    ["blockDamage"] = 20,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v25 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v24.sounds = v25
v24.range = 3.8 * v3
v24.lootCategory = v6.TIER3
v7[v23] = v24
local v26 = v4.KING_PENGUIN
local v27 = {
    ["modelName"] = "KingPenguin",
    ["baseHealth"] = 1500,
    ["baseDamage"] = 40,
    ["walkSpeedMultiplier"] = 0.5,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 11,
    ["blockDamage"] = 75,
    ["blockHeight"] = 3,
    ["hitbox"] = Vector3.new(4, 4, 4),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v28 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v27.sounds = v28
v27.range = 10 * v3
v27.lootCategory = v6.TIER5
v7[v26] = v27
local v29 = v4.SNIPER_PENGUIN
local v30 = {
    ["modelName"] = "SniperPenguin",
    ["walkSpeedMultiplier"] = 1.25,
    ["baseHealth"] = 80,
    ["baseDamage"] = 0,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 6,
    ["blockDamage"] = 3,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.SNIPER_PENGUIN_WALKING_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.SNIPER_PENGUIN_SHOOT_2
    }
}
local v31 = {
    ["attack"] = { v5.SNIPER_FIRE },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v30.sounds = v31
v30.range = 10 * v3
v30.lootCategory = v6.TIER2
v7[v29] = v30
local v32 = v4.ULTRA_SNIPER_PENGUIN
local v33 = {
    ["modelName"] = "SniperPenguin",
    ["baseHealth"] = 150,
    ["baseDamage"] = 0,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 6,
    ["blockDamage"] = 3,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.SNIPER_PENGUIN_WALKING_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.SNIPER_PENGUIN_SHOOT_2
    },
    ["range"] = 20 * v3,
    ["lootCategory"] = v6.TIER3
}
v7[v32] = v33
local v34 = v4.BOXER_PENGUIN
local v35 = {
    ["modelName"] = "BoxerPenguin",
    ["baseHealth"] = 125,
    ["baseDamage"] = 20,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 1,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v36 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v35.sounds = v36
v35.range = 4 * v3
v35.lootCategory = v6.TIER3
v7[v34] = v35
local v37 = v4.WIZARD_PENGUIN
local v38 = {
    ["modelName"] = "WizardPenguin",
    ["baseHealth"] = 150,
    ["baseDamage"] = 25,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 8,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v39 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v38.sounds = v39
v38.range = 5 * v3
v38.lootCategory = v6.TIER3
v7[v37] = v38
local v40 = v4.PARACHUTE_PENGUIN
local v41 = {
    ["modelName"] = "ParachutePenguin",
    ["baseHealth"] = 100,
    ["baseDamage"] = 15,
    ["spawnAtTimeRatioInWave"] = 0,
    ["spawnsAtWave"] = 0,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v42 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v41.sounds = v42
v41.range = 3.8 * v3
v41.lootCategory = v6.TIER3
v7[v40] = v41
local v43 = v4.CANNON_PENGUIN
local v44 = {
    ["modelName"] = "CannonPenguin",
    ["baseHealth"] = 80,
    ["baseDamage"] = 10,
    ["spawnAtTimeRatioInWave"] = 0,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v45 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v44.sounds = v45
v44.range = 5 * v3
v44.lootCategory = v6.TIER1
v7[v43] = v44
local v46 = v4.SAILOR_PENGUIN
local v47 = {
    ["modelName"] = "SailorPenguin",
    ["baseHealth"] = 80,
    ["baseDamage"] = 10,
    ["spawnAtTimeRatioInWave"] = 0,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.PENGUIN_ATTACK_2
    }
}
local v48 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v47.sounds = v48
v47.range = 5 * v3
v47.lootCategory = v6.TIER1
v7[v46] = v47
local v49 = v4.CAPTAIN_PENGUIN
local v50 = {
    ["modelName"] = "CaptainPenguin",
    ["baseHealth"] = 300,
    ["baseDamage"] = 20,
    ["spawnAtTimeRatioInWave"] = 0,
    ["blockDamage"] = 5,
    ["hitbox"] = Vector3.new(3, 3, 3),
    ["animations"] = {
        ["walk"] = v2.PENGUIN_WALK_2,
        ["jump"] = v2.PENGUIN_JUMP_2,
        ["idle"] = v2.PENGUIN_IDLE_2,
        ["attack"] = v2.CAPTAIN_PENGUIN_ATTACK
    }
}
local v51 = {
    ["attack"] = { v5.PENGUIN_ATTACK_1, v5.PENGUIN_ATTACK_2, v5.PENGUIN_ATTACK_3 },
    ["passive"] = {
        ["maxInterval"] = 50,
        ["minInterval"] = 1,
        ["sounds"] = { v5.PENGUIN_SQUAWK_1 }
    }
}
v50.sounds = v51
v50.range = 3.8 * v3
v50.lootCategory = v6.TIER2
v7[v49] = v50
return {
    ["SurvivalMonsterDefinitions"] = v7
}