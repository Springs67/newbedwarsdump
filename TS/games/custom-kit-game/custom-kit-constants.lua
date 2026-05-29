local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-types").CustomKitTypes
local v4 = {
    ["MaxKitPoints"] = 100,
    ["MaxAbilities"] = 1,
    ["MaxKits"] = 5,
    ["MaxKitNameLength"] = 20,
    ["MaxAbilityNameLength"] = 20,
    ["MaxAbilityDescriptionLength"] = 100,
    ["AuraPollRate"] = 1,
    ["DefaultMaxHealth"] = 100,
    ["StatCostsAndValues"] = {
        [v3.Stat.HEALTH] = {
            {
                ["level"] = 1,
                ["value"] = 0,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 5,
                ["cost"] = 10
            },
            {
                ["level"] = 3,
                ["value"] = 10,
                ["cost"] = 20
            },
            {
                ["level"] = 4,
                ["value"] = 20,
                ["cost"] = 35
            },
            {
                ["level"] = 5,
                ["value"] = 30,
                ["cost"] = 45
            }
        },
        [v3.Stat.MELEE_DAMAGE] = {
            {
                ["level"] = 1,
                ["value"] = 1,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 1.025,
                ["cost"] = 10
            },
            {
                ["level"] = 3,
                ["value"] = 1.05,
                ["cost"] = 20
            },
            {
                ["level"] = 4,
                ["value"] = 1.1,
                ["cost"] = 35
            },
            {
                ["level"] = 5,
                ["value"] = 1.15,
                ["cost"] = 45
            }
        },
        [v3.Stat.RANGED_DAMAGE] = {
            {
                ["level"] = 1,
                ["value"] = 1,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 1.025,
                ["cost"] = 10
            },
            {
                ["level"] = 3,
                ["value"] = 1.05,
                ["cost"] = 20
            },
            {
                ["level"] = 4,
                ["value"] = 1.1,
                ["cost"] = 35
            },
            {
                ["level"] = 5,
                ["value"] = 1.15,
                ["cost"] = 45
            }
        },
        [v3.Stat.DEFENSE] = {
            {
                ["level"] = 1,
                ["value"] = 0,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 0.05,
                ["cost"] = 10
            },
            {
                ["level"] = 3,
                ["value"] = 0.1,
                ["cost"] = 20
            },
            {
                ["level"] = 4,
                ["value"] = 0.2,
                ["cost"] = 35
            },
            {
                ["level"] = 5,
                ["value"] = 0.25,
                ["cost"] = 45
            }
        }
    },
    ["StatOrder"] = {
        v3.Stat.HEALTH,
        v3.Stat.MELEE_DAMAGE,
        v3.Stat.RANGED_DAMAGE,
        v3.Stat.DEFENSE
    },
    ["DefaultAbilityPropertyCostsAndValues"] = {
        [v3.AbilityPropertyKey.COOLDOWN] = {
            {
                ["level"] = 1,
                ["value"] = 16,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 14,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 12,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 10,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 8,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.PROJECTILE_SPEED] = {
            {
                ["level"] = 1,
                ["value"] = 100,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 130,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 160,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 200,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 250,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.PROJECTILE_EXPLOSION_RADIUS] = {
            {
                ["level"] = 1,
                ["value"] = 5,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 10,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 15,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 20,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 25,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.AOE_RADIUS] = {
            {
                ["level"] = 1,
                ["value"] = 10,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 15,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 21,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 28,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 36,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.AURA_RADIUS] = {
            {
                ["level"] = 1,
                ["value"] = 10,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 15,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 20,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 25,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 30,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.AURA_DURATION] = {
            {
                ["level"] = 1,
                ["value"] = 5,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 6,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 8,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 11,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 15,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.STATUS_EFFECT_DURATION] = {
            {
                ["level"] = 1,
                ["value"] = 4,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 6,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 9,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 13,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 17,
                ["cost"] = 45
            }
        }
    },
    ["StatusEffectCost"] = 15
}
local v5 = {
    [v3.TargetType.SELF] = {
        [v3.AbilityPropertyKey.HEAL_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 10,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 20,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 35,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 48,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 60,
                ["cost"] = 45
            }
        }
    },
    [v3.TargetType.PROJECTILE] = {
        [v3.AbilityPropertyKey.DAMAGE_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 10,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 20,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 32,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 40,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 50,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.HEAL_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 5,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 10,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 15,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 22,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 30,
                ["cost"] = 45
            }
        }
    },
    [v3.TargetType.AOE] = {
        [v3.AbilityPropertyKey.HEAL_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 10,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 15,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 20,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 27,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 35,
                ["cost"] = 45
            }
        },
        [v3.AbilityPropertyKey.DAMAGE_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 12,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 16,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 22,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 30,
                ["cost"] = 30
            },
            {
                ["level"] = 5,
                ["value"] = 40,
                ["cost"] = 45
            }
        }
    },
    [v3.TargetType.AURA] = {
        [v3.AbilityPropertyKey.HEAL_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 2,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 3,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 5,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 8,
                ["cost"] = 25
            },
            {
                ["level"] = 5,
                ["value"] = 12,
                ["cost"] = 35
            }
        },
        [v3.AbilityPropertyKey.DAMAGE_POTENCY] = {
            {
                ["level"] = 1,
                ["value"] = 2,
                ["cost"] = 0
            },
            {
                ["level"] = 2,
                ["value"] = 3,
                ["cost"] = 5
            },
            {
                ["level"] = 3,
                ["value"] = 5,
                ["cost"] = 15
            },
            {
                ["level"] = 4,
                ["value"] = 8,
                ["cost"] = 25
            },
            {
                ["level"] = 5,
                ["value"] = 12,
                ["cost"] = 35
            }
        }
    }
}
v4.AbilityPropertyCostsAndValuesTargetTypeOverrides = v5
v4.StatusEffectDurationOverrides = {
    [v3.StatusEffectType.INVISIBILITY] = {
        {
            ["level"] = 1,
            ["value"] = 1
        },
        {
            ["level"] = 2,
            ["value"] = 2
        },
        {
            ["level"] = 3,
            ["value"] = 3
        },
        {
            ["level"] = 4,
            ["value"] = 4
        },
        {
            ["level"] = 5,
            ["value"] = 5
        }
    }
}
v4.TargetTypeCosts = {
    [v3.TargetType.SELF] = 5,
    [v3.TargetType.PROJECTILE] = 10,
    [v3.TargetType.AOE] = 20,
    [v3.TargetType.AURA] = 15
}
v4.StatusEffectNames = {
    [v3.StatusEffectType.NONE] = "None",
    [v3.StatusEffectType.REGEN] = "Regen",
    [v3.StatusEffectType.SHIELD] = "Shield",
    [v3.StatusEffectType.INVISIBILITY] = "Invisibility",
    [v3.StatusEffectType.POISON] = "Poison",
    [v3.StatusEffectType.ZAPPED] = "Zapped",
    [v3.StatusEffectType.SILENCE] = "Silence",
    [v3.StatusEffectType.DECAY] = "Decay",
    [v3.StatusEffectType.DIZZY] = "Dizzy",
    [v3.StatusEffectType.GROUNDED] = "Grounded"
}
v4.CustomStatusEffectToActualStatusEffectMap = {
    [v3.StatusEffectType.REGEN] = v2.HEAL_OVER_TIME,
    [v3.StatusEffectType.INVISIBILITY] = v2.INVISIBILITY,
    [v3.StatusEffectType.POISON] = v2.POISON,
    [v3.StatusEffectType.ZAPPED] = v2.ZAPPED_1,
    [v3.StatusEffectType.SILENCE] = v2.SILENCE,
    [v3.StatusEffectType.DECAY] = v2.DECAY,
    [v3.StatusEffectType.DIZZY] = v2.DIZZY,
    [v3.StatusEffectType.GROUNDED] = v2.GROUNDED
}
return {
    ["CustomKitConstants"] = v4
}