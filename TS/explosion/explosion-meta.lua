local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance")
local v3 = v2.SorcererBalance
local v4 = v2.SorcererTier
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "exploding-tank-block", "exploding-tank-block-util").ExplodingTankBlockUtil
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "explosion", "explosion-type").ExplosionType
local u10 = {
    [v9.TNT] = {
        ["displayName"] = "TNT",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2.5,
        ["explodeRadius"] = 5,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.SIEGE_TNT] = {
        ["displayName"] = "SIEGE TNT",
        ["damageMultiplier"] = 1.15,
        ["explodePower"] = 6.2,
        ["explodeRadius"] = 7,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.65,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 9 * v5,
        ["explosionSound"] = v8.SIEGE_TNT_EXPLODE_1,
        ["explosionParticleColor"] = Color3.fromRGB(33, 33, 33)
    },
    [v9.PIRATE_GUNPOWDER_BARREL] = {
        ["displayName"] = "Pirate Gunpowder Barrel",
        ["damageMultiplier"] = 0.3,
        ["explodePower"] = 2,
        ["explodeRadius"] = 2,
        ["explodeRays"] = 75,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 6 * v5,
        ["damageType"] = v6.GUNPOWDER_BARREL
    },
    [v9.DINO_CHARGE_I] = {
        ["displayName"] = "Dino Charge I",
        ["damageMultiplier"] = 0.7,
        ["explodePower"] = 8,
        ["explodeRays"] = 125,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.DINO_CHARGE_II] = {
        ["displayName"] = "Dino Charge II",
        ["damageMultiplier"] = 0.9,
        ["explodePower"] = 12,
        ["explodeRadius"] = 150,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 9 * v5
    },
    [v9.CARD] = {
        ["displayName"] = "Card",
        ["explodePower"] = 1.5,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.2,
            ["vertical"] = 1.3
        },
        ["damageRadius"] = 6 * v5
    },
    [v9.GAUNTLETS_PUNCH] = {
        ["displayName"] = "Gauntlets Punch",
        ["damageMultiplier"] = 0.2,
        ["explodePower"] = 5.8,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1.5
        },
        ["damageRadius"] = 3 * v5
    },
    [v9.HOT_AIR_BALLOON_TNT] = {
        ["displayName"] = "Balloon TNT",
        ["damageMultiplier"] = 1.15,
        ["explodePower"] = 3.15,
        ["explodeRadius"] = 2,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.55,
            ["vertical"] = 3
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.FIREBALL] = {
        ["displayName"] = "Fireball",
        ["damageMultiplier"] = 0.3,
        ["explodePower"] = 3.15,
        ["explodeRadius"] = 1,
        ["explodeRays"] = 75,
        ["firey"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.25,
            ["vertical"] = 1
        },
        ["damageRadius"] = 5.5 * v5
    },
    [v9.ROCKET_MISSILE] = {
        ["displayName"] = "Rocket Missile",
        ["damageMultiplier"] = 1.2,
        ["explodePower"] = 4.8,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2,
            ["vertical"] = 2.8
        },
        ["damageRadius"] = 6.5 * v5
    },
    [v9.LUCKYBLOCK_TNT] = {
        ["displayName"] = "TNT",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2,
        ["explodeRadius"] = 3,
        ["explodeRays"] = 75,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 4 * v5
    },
    [v9.GUIDED_MISSILE] = {
        ["displayName"] = "Guided Missile",
        ["damageMultiplier"] = 0.7,
        ["explodePower"] = 3.15,
        ["explodeRadius"] = 1,
        ["explodeRays"] = 75,
        ["damageRadius"] = 25,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        }
    },
    [v9.CARROT_ROCKET] = {
        ["displayName"] = "Carrot Rocket",
        ["damageMultiplier"] = 0.7,
        ["damageRadius"] = 15,
        ["explodePower"] = 13.5,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        }
    },
    [v9.BOBA] = {
        ["displayName"] = "Boba",
        ["explodePower"] = 0,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0,
            ["vertical"] = 0
        },
        ["damageRadius"] = 5 * v5
    },
    [v9.METEOR] = {
        ["displayName"] = "Meteor",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 17,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.INVISIBLE_LANDMINE] = {
        ["displayName"] = "Invisible Landmine",
        ["damageMultiplier"] = 0.5,
        ["explodePower"] = 1.55,
        ["explodeRadius"] = 3,
        ["damageType"] = v6.INVISIBLE_LANDMINE,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 4.5
        },
        ["damageRadius"] = 4 * v5
    },
    [v9.HELICOPTER] = {
        ["displayName"] = "Minicopter Explosion",
        ["damageMultiplier"] = 2,
        ["explodePower"] = 4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 5 * v5
    },
    [v9.UFO] = {
        ["displayName"] = "UFO Explosion",
        ["damageMultiplier"] = 3,
        ["explodePower"] = 10,
        ["explodeRays"] = 150,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 10 * v5
    },
    [v9.HELICOPTER_MISSILE] = {
        ["displayName"] = "Minicopter Missile",
        ["damageMultiplier"] = 0.7,
        ["explodePower"] = 3.15,
        ["explodeRadius"] = 1,
        ["explodeRays"] = 75,
        ["damageRadius"] = 25,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        }
    },
    [v9.PENGUIN] = {
        ["displayName"] = "Penguin Self-Destruct",
        ["damageMultiplier"] = 0.5,
        ["explodePower"] = 2.2,
        ["explodeRadius"] = 1,
        ["explodeRays"] = 35,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0,
            ["vertical"] = 0
        },
        ["explosionSound"] = v8.TNT_EXPLODE_1,
        ["damageRadius"] = 5.5 * v5
    },
    [v9.BOMBER_PENGUIN_EXPLOSION] = {
        ["displayName"] = "Penguin Self-Destruct",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 6,
        ["explodeRadius"] = 10,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["explosionSound"] = v8.TNT_EXPLODE_1,
        ["damageRadius"] = 8 * v5,
        ["damageType"] = v6.BOMBER_PENGUIN
    },
    [v9.ULTRA_BOMBER_PENGUIN_EXPLOSION] = {
        ["displayName"] = "Penguin Self-Destruct",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 8,
        ["explodeRadius"] = 10,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["explosionSound"] = v8.TNT_EXPLODE_1,
        ["damageRadius"] = 8 * v5
    },
    [v9.KING_PENGUIN_EXPLOSION] = {
        ["displayName"] = "King Penguin",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 10,
        ["explodeRadius"] = 10,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["explosionSound"] = v8.TNT_EXPLODE_1,
        ["damageRadius"] = 10 * v5
    },
    [v9.ROCKET_BELT] = {
        ["displayName"] = "Rocket Belt",
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1
        },
        ["damageRadius"] = 3 * v5
    },
    [v9.TENNIS_BALL_EXPLOSION] = {
        ["displayName"] = "Tennis Ball",
        ["damageMultiplier"] = 0.5,
        ["explodePower"] = 10,
        ["damageType"] = v6.TENNIS_BALL,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.5
        },
        ["damageRadius"] = 4 * v5
    },
    [v9.C4_BOMB] = {
        ["displayName"] = "C4",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 10,
        ["explodeRadius"] = 4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.EXPLODING_ARROW] = {
        ["displayName"] = "Exploding Arrow",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 1.55,
        ["explodeRadius"] = 1,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1
        },
        ["damageRadius"] = 2 * v5
    },
    [v9.TNT_BALLOON_TNT] = {
        ["displayName"] = "TNT Balloon TNT",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2,
        ["explodeRadius"] = 4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.5
        },
        ["damageRadius"] = 4 * v5
    },
    [v9.TNT_WARS_CANNON_TNT] = {
        ["displayName"] = "TNT",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2,
        ["explodeRadius"] = 4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.LAUNCHED_PLAYER] = {
        ["displayName"] = "Dragon Punch",
        ["explodePower"] = 1.55,
        ["explodeRadius"] = 3,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.5
        },
        ["damageRadius"] = 5 * v5
    },
    [v9.PUMPKIN_BOMB] = {
        ["displayName"] = "Pumpkin Bomb",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 1.55,
        ["explodeRadius"] = 4,
        ["damageType"] = v6.PUMPKIN_BOMB,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1
        },
        ["damageRadius"] = 5 * v5
    },
    [v9.HALLOWEEN_OBBY_FALLING_OBJECT] = {
        ["displayName"] = "Falling Object",
        ["explodePower"] = 1.55,
        ["explodeRadius"] = 3,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.2,
            ["vertical"] = 1.2
        },
        ["damageRadius"] = 2 * v5
    },
    [v9.BLACKHOLE_BOMB] = {
        ["displayName"] = "Blackhole Bomb",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2,
        ["explodeRadius"] = 5,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 10 * v5
    },
    [v9.COSMIC_METEOR] = {
        ["displayName"] = "Cosmic Meteor",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2,
        ["explodeRadius"] = 4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.5,
            ["vertical"] = 0.5
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.STAR] = {
        ["displayName"] = "Star",
        ["explodePower"] = 0,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1
        },
        ["damageRadius"] = 5 * v5
    },
    [v9.HOT_POTATO] = {
        ["displayName"] = "Hot Potato",
        ["damageMultiplier"] = 3,
        ["explodePower"] = 4.1,
        ["explodeRadius"] = 6,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.5,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 10 * v5
    },
    [v9.NEW_YEARS_PARTY_CANNON] = {
        ["displayName"] = "New Years Fireworks",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 2,
        ["explodeRadius"] = 4,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 5,
            ["vertical"] = 1
        },
        ["damageRadius"] = 8 * v5
    },
    [v9.RAINBOW] = {
        ["displayName"] = "Rainbow",
        ["explodePower"] = 1.5,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.3,
            ["vertical"] = 1
        },
        ["damageRadius"] = 3 * v5
    },
    [v9.EASTER_EGG] = {
        ["displayName"] = "Easter",
        ["damageMultiplier"] = 1.2,
        ["explodePower"] = 4.8,
        ["damageType"] = v6.EASTER_EGG,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2,
            ["vertical"] = 2.8
        },
        ["damageRadius"] = 6 * v5
    },
    [v9.CURSED_GEM] = {
        ["displayName"] = "Cursed Gem",
        ["damageMultiplier"] = 2,
        ["explodePower"] = 3,
        ["explodeRadius"] = 4.5,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.65,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 6 * v5,
        ["explosionSound"] = v8.WITCH_BROOM_CURSED_ITEM_EXPLOSION,
        ["explosionParticleColor"] = Color3.fromRGB(77, 3, 245)
    },
    [v9.FIREWORK_ROCKET] = {
        ["damageMultiplier"] = 1.2,
        ["explodePower"] = 4.5,
        ["firey"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2,
            ["vertical"] = 2.8
        },
        ["damageRadius"] = 6.5 * v5
    },
    [v9.COMET] = {
        ["displayName"] = "Comet",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 17,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2,
            ["vertical"] = 1.5
        },
        ["damageRadius"] = 9 * v5
    },
    [v9.SOLAR_FLARE] = {
        ["damageMultiplier"] = 1.2,
        ["explodePower"] = 4.5,
        ["firey"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2,
            ["vertical"] = 1.5
        },
        ["damageRadius"] = 6 * v5
    },
    [v9.FIRECRACKER] = {
        ["damageMultiplier"] = 0.2,
        ["explodePower"] = 0,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0,
            ["vertical"] = 0
        },
        ["damageRadius"] = 5 * v5
    },
    [v9.CLUSTER_BOMB] = {
        ["displayName"] = "Cluster Bomb",
        ["explodePower"] = 0,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.5,
            ["vertical"] = 0.5
        },
        ["damageRadius"] = 6 * v5,
        ["damageType"] = v6.CLUSTER_BOMB
    },
    [v9.CLUSTER_MINI_BOMB] = {
        ["displayName"] = "Cluster Mini Bomb",
        ["explodePower"] = 0,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.2,
            ["vertical"] = 0.2
        },
        ["damageRadius"] = 10 * v5
    },
    [v9.TINKER] = {
        ["displayName"] = "Tinker",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 1.65,
        ["explodeRadius"] = 6,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 8 * v5,
        ["explosionSound"] = v8.TINKER_EXPLODE
    },
    [v9.MAX_TINKER] = {
        ["displayName"] = "Tinker",
        ["damageMultiplier"] = 1.2,
        ["explodePower"] = 1.65,
        ["explodeRadius"] = 7,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 2.25,
            ["vertical"] = 2.5
        },
        ["damageRadius"] = 9 * v5,
        ["explosionSound"] = v8.TINKER_EXPLODE
    },
    [v9.BALLISTA_PROJECTILE] = {
        ["displayName"] = "Explosive Arrow",
        ["damageMultiplier"] = 1,
        ["explodePower"] = 10,
        ["explodeRadius"] = 1,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1,
            ["vertical"] = 1
        },
        ["damageRadius"] = 2 * v5
    },
    [v9.SORCERER_EXPLOSION_1] = {
        ["displayName"] = "Explosive Comet",
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.8,
            ["vertical"] = 0.6
        },
        ["damageMultiplier"] = v3.getSorcererTierData(v4.TIER_1).explosionDamageMultiplier,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_1).explosionDamageRadius,
        ["explodePower"] = v3.getSorcererTierData(v4.TIER_1).explodePower,
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_1).explodeRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_2] = {
        ["displayName"] = "Explosive Comet",
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.9,
            ["vertical"] = 0.7
        },
        ["damageMultiplier"] = v3.getSorcererTierData(v4.TIER_2).explosionDamageMultiplier,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_2).explosionDamageRadius,
        ["explodePower"] = v3.getSorcererTierData(v4.TIER_2).explodePower,
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_2).explodeRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_3] = {
        ["displayName"] = "Explosive Comet",
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.1,
            ["vertical"] = 0.9
        },
        ["damageMultiplier"] = v3.getSorcererTierData(v4.TIER_3).explosionDamageMultiplier,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_3).explosionDamageRadius,
        ["explodePower"] = v3.getSorcererTierData(v4.TIER_3).explodePower,
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_3).explodeRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_4] = {
        ["displayName"] = "Explosive Comet",
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.3,
            ["vertical"] = 1.1
        },
        ["damageMultiplier"] = v3.getSorcererTierData(v4.TIER_4).explosionDamageMultiplier,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_4).explosionDamageRadius,
        ["explodePower"] = v3.getSorcererTierData(v4.TIER_4).explodePower,
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_4).explodeRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_5] = {
        ["displayName"] = "Explosive Comet",
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.55,
            ["vertical"] = 1.25
        },
        ["damageMultiplier"] = v3.getSorcererTierData(v4.TIER_5).explosionDamageMultiplier,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_5).explosionDamageRadius,
        ["explodePower"] = v3.getSorcererTierData(v4.TIER_5).explodePower,
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_5).explodeRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_1_HUGE] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.6,
        ["explodePower"] = 1.5,
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.8,
            ["vertical"] = 0.6
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_1).explodeRadius * 3,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_1).explodeRadius * 3,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_2_HUGE] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.7,
        ["explodePower"] = 3,
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.2,
            ["vertical"] = 0.8
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_2).explodeRadius * 3,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_2).explodeRadius * 3,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_3_HUGE] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.8,
        ["explodePower"] = 5.5,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.2
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_3).explodeRadius * 3,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_3).explosionDamageRadius * 3,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_FRAG_1] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.6,
        ["explodePower"] = 1.5,
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.8,
            ["vertical"] = 0.6
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_1).explodeRadius,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_1).explodeRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_FRAG_2] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.7,
        ["explodePower"] = 3,
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.2,
            ["vertical"] = 0.8
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_2).explodeRadius,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_2).explosionDamageRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_FRAG_3] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.8,
        ["explodePower"] = 5.5,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.2
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_3).explodeRadius,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_3).explosionDamageRadius,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_FRAG_1_HUGE] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.6,
        ["explodePower"] = 1.5,
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 0.8,
            ["vertical"] = 0.6
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_1).explodeRadius * 3,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_1).explosionDamageRadius * 3,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_FRAG_2_HUGE] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.7,
        ["explodePower"] = 3,
        ["ignoreBlastProof"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.2,
            ["vertical"] = 0.8
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_2).explodeRadius * 3,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_2).explosionDamageRadius * 3,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.SORCERER_EXPLOSION_FRAG_3_HUGE] = {
        ["displayName"] = "Explosive Comet",
        ["damageMultiplier"] = 0.8,
        ["explodePower"] = 5.5,
        ["ignoreBlastProof"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.5,
            ["vertical"] = 1.2
        },
        ["explodeRadius"] = v3.getSorcererTierData(v4.TIER_3).explodeRadius * 3,
        ["damageRadius"] = v3.getSorcererTierData(v4.TIER_3).explosionDamageRadius * 3,
        ["explosionSound"] = v8.SORCERER_PROJECTILE_HIT
    },
    [v9.EXPLOSIVE_TOOL_ENCHANT] = {
        ["damageMultiplier"] = 0.3,
        ["displayName"] = "Explosive Tool Enchant",
        ["explodePower"] = 3.15,
        ["explodeRadius"] = 0.8,
        ["explodeRays"] = 75,
        ["firey"] = false,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.25,
            ["vertical"] = 1
        },
        ["damageRadius"] = 2 * v5,
        ["damageType"] = v6.EXPLOSIVE_TOOL_ENCHANT
    },
    [v9.EXPLODING_TANK_BLOCK] = {
        ["displayName"] = "Exploding Tank Block",
        ["explodeRadius"] = 8,
        ["explodePower"] = 3.15,
        ["damageMultiplier"] = 1.2,
        ["firey"] = true,
        ["knockbackMultiplier"] = {
            ["horizontal"] = 1.1,
            ["vertical"] = 1
        },
        ["damageRadius"] = v7.RADIUS,
        ["damageType"] = v6.EXPLODING_TANK
    }
}
return {
    ["getExplosionMeta"] = function(p11) --[[ Name: getExplosionMeta, Line 764 ]]
        --[[
        Upvalues:
            [1] = u10
        --]]
        return u10[p11]
    end
}