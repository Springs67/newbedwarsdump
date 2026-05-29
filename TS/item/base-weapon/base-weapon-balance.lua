local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
return {
    ["BaseWeaponBalance"] = {
        ["SWORD_SWING_COOLDOWN"] = 0.3,
        ["CROSSBOW_FIRE_DELAY"] = 1.25,
        ["HEADHUNTER_FIRE_DELAY"] = 1.25,
        ["HAMMER_SWING_COOLDOWN"] = 0.6,
        ["HAMMER_CHARGE_TIME"] = 0.75,
        ["MYTHIC_HAMMER_AURA_HEAL_RADIUS"] = v1 * 10,
        ["MYTHIC_HAMMER_CHARGE_ATTACK_HEAL_RADIUS"] = v1 * 8,
        ["MYTHIC_HAMMER_HEAL_INTERVAL"] = 0.5,
        ["MYTHIC_HAMMER_HEAL_PER_INTERVAL"] = 3
    }
}