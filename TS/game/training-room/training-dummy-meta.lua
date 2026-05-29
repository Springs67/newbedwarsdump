local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.TEAMMATE_DUMMY_1 = "tm_dummy_1"
v1.tm_dummy_1 = "TEAMMATE_DUMMY_1"
v2.TEAMMATE_DUMMY_2 = "tm_dummy_2"
v1.tm_dummy_2 = "TEAMMATE_DUMMY_2"
v2.NO_KNOCKBACK_ENEMY_DUMMY_1 = "nkb_dummy_1"
v1.nkb_dummy_1 = "NO_KNOCKBACK_ENEMY_DUMMY_1"
v2.NO_KNOCKBACK_ENEMY_DUMMY_2 = "nkb_dummy_2"
v1.nkb_dummy_2 = "NO_KNOCKBACK_ENEMY_DUMMY_2"
v2.NO_KNOCKBACK_ENEMY_DUMMY_3 = "nkb_dummy_3"
v1.nkb_dummy_3 = "NO_KNOCKBACK_ENEMY_DUMMY_3"
v2.NO_KNOCKBACK_ENEMY_DUMMY_4 = "nkb_dummy_4"
v1.nkb_dummy_4 = "NO_KNOCKBACK_ENEMY_DUMMY_4"
v2.NO_KNOCKBACK_ENEMY_DUMMY_5 = "nkb_dummy_5"
v1.nkb_dummy_5 = "NO_KNOCKBACK_ENEMY_DUMMY_5"
v2.NO_KNOCKBACK_ENEMY_DUMMY_6 = "nkb_dummy_6"
v1.nkb_dummy_6 = "NO_KNOCKBACK_ENEMY_DUMMY_6"
v2.KNOCKBACK_ENEMY_DUMMY_1 = "kb_dummy_1"
v1.kb_dummy_1 = "KNOCKBACK_ENEMY_DUMMY_1"
v2.KNOCKBACK_ENEMY_DUMMY_2 = "kb_dummy_2"
v1.kb_dummy_2 = "KNOCKBACK_ENEMY_DUMMY_2"
v2.KNOCKBACK_ENEMY_DUMMY_3 = "kb_dummy_3"
v1.kb_dummy_3 = "KNOCKBACK_ENEMY_DUMMY_3"
v2.KNOCKBACK_ENEMY_DUMMY_4 = "kb_dummy_4"
v1.kb_dummy_4 = "KNOCKBACK_ENEMY_DUMMY_4"
v2.KNOCKBACK_ENEMY_DUMMY_5 = "kb_dummy_5"
v1.kb_dummy_5 = "KNOCKBACK_ENEMY_DUMMY_5"
v2.KNOCKBACK_ENEMY_DUMMY_6 = "kb_dummy_6"
v1.kb_dummy_6 = "KNOCKBACK_ENEMY_DUMMY_6"
v2.WALKING_ENEMY_DUMMY_START_1 = "dummy_1_start"
v1.dummy_1_start = "WALKING_ENEMY_DUMMY_START_1"
v2.WALKING_ENEMY_DUMMY_START_2 = "dummy_2_start"
v1.dummy_2_start = "WALKING_ENEMY_DUMMY_START_2"
v2.WALKING_ENEMY_DUMMY_END_1 = "dummy_1_end"
v1.dummy_1_end = "WALKING_ENEMY_DUMMY_END_1"
v2.WALKING_ENEMY_DUMMY_END_2 = "dummy_2_end"
v1.dummy_2_end = "WALKING_ENEMY_DUMMY_END_2"
local u3 = {
    [0] = {
        ["displayName"] = "Friendly Dummy",
        ["maxHealth"] = 100,
        ["teammate"] = true,
        ["spawnSignName"] = v2.TEAMMATE_DUMMY_1
    },
    [1] = {
        ["displayName"] = "Friendly Dummy",
        ["maxHealth"] = 100,
        ["teammate"] = true,
        ["spawnSignName"] = v2.TEAMMATE_DUMMY_2
    },
    [2] = {
        ["displayName"] = "Regular Enemy Dummy",
        ["maxHealth"] = 100,
        ["teammate"] = false,
        ["noKnockback"] = true,
        ["spawnSignName"] = v2.NO_KNOCKBACK_ENEMY_DUMMY_1
    },
    [3] = {
        ["displayName"] = "Leather Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "LEATHER",
        ["teammate"] = false,
        ["noKnockback"] = true,
        ["spawnSignName"] = v2.NO_KNOCKBACK_ENEMY_DUMMY_2
    },
    [4] = {
        ["displayName"] = "Iron Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "IRON",
        ["teammate"] = false,
        ["noKnockback"] = true,
        ["spawnSignName"] = v2.NO_KNOCKBACK_ENEMY_DUMMY_3
    },
    [5] = {
        ["displayName"] = "Diamond Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "DIAMOND",
        ["teammate"] = false,
        ["noKnockback"] = true,
        ["spawnSignName"] = v2.NO_KNOCKBACK_ENEMY_DUMMY_4
    },
    [6] = {
        ["displayName"] = "Emerald Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "EMERALD",
        ["teammate"] = false,
        ["noKnockback"] = true,
        ["spawnSignName"] = v2.NO_KNOCKBACK_ENEMY_DUMMY_5
    },
    [7] = {
        ["displayName"] = "Void Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "VOID",
        ["teammate"] = false,
        ["noKnockback"] = true,
        ["spawnSignName"] = v2.NO_KNOCKBACK_ENEMY_DUMMY_6
    },
    [8] = {
        ["displayName"] = "Regular Enemy Dummy",
        ["maxHealth"] = 100,
        ["teammate"] = false,
        ["spawnSignName"] = v2.KNOCKBACK_ENEMY_DUMMY_1
    },
    [9] = {
        ["displayName"] = "Leather Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "LEATHER",
        ["teammate"] = false,
        ["spawnSignName"] = v2.KNOCKBACK_ENEMY_DUMMY_2
    },
    [10] = {
        ["displayName"] = "Iron Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "IRON",
        ["teammate"] = false,
        ["spawnSignName"] = v2.KNOCKBACK_ENEMY_DUMMY_3
    },
    [11] = {
        ["displayName"] = "Diamond Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "DIAMOND",
        ["teammate"] = false,
        ["spawnSignName"] = v2.KNOCKBACK_ENEMY_DUMMY_4
    },
    [12] = {
        ["displayName"] = "Emerald Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "EMERALD",
        ["teammate"] = false,
        ["spawnSignName"] = v2.KNOCKBACK_ENEMY_DUMMY_5
    },
    [13] = {
        ["displayName"] = "Void Enemy Dummy",
        ["maxHealth"] = 100,
        ["armorType"] = "VOID",
        ["teammate"] = false,
        ["spawnSignName"] = v2.KNOCKBACK_ENEMY_DUMMY_6
    }
}
local v4 = {
    ["displayName"] = "Regular Enemy Dummy",
    ["maxHealth"] = 100,
    ["teammate"] = false,
    ["noKnockback"] = true,
    ["spawnSignName"] = v2.WALKING_ENEMY_DUMMY_START_1,
    ["canMove"] = {
        ["startPositionSign"] = v2.WALKING_ENEMY_DUMMY_START_1,
        ["endPositionSign"] = v2.WALKING_ENEMY_DUMMY_END_1
    }
}
u3[14] = v4
local v5 = {
    ["displayName"] = "Leather Enemy Dummy",
    ["maxHealth"] = 100,
    ["armorType"] = "LEATHER",
    ["teammate"] = false,
    ["noKnockback"] = true,
    ["spawnSignName"] = v2.WALKING_ENEMY_DUMMY_START_2,
    ["canMove"] = {
        ["startPositionSign"] = v2.WALKING_ENEMY_DUMMY_START_2,
        ["endPositionSign"] = v2.WALKING_ENEMY_DUMMY_END_2
    }
}
u3[15] = v5
return {
    ["getTrainingDummyMeta"] = function(p6) --[[ Name: getTrainingDummyMeta, Line 171 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        return u3[p6]
    end,
    ["TrainingDummyMeta"] = u3,
    ["TrainingDummySigns"] = v2
}