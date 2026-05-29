local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
return {
    ["GatherBotBalance"] = {
        ["GATHER_BOT_BASIC_HITPOINTS"] = 150,
        ["GATHER_BOT_PRO_HITPOINTS"] = 200,
        ["GATHER_BOT_BASIC_WALK_SPEED"] = 16,
        ["GATHER_BOT_PRO_WALK_SPEED"] = 16,
        ["GATHER_BOT_JUMP_POWER"] = 50,
        ["GATHER_BOT_JUMP_HEIGHT"] = 7.2,
        ["GATHER_BOT_RADIUS"] = 10,
        ["GATHER_BOT_MAX_AMOUNT"] = 4,
        ["GATHER_BOT_DANGER_RADIUS"] = v1 * 13.4,
        ["GATHER_BOT_DROP_MULTIPLIER_PERCENT"] = 0.6,
        ["GATHER_BOT_OVERCLOCK_COOLDOWN"] = 20,
        ["GATHER_BOT_OVERCLOCK_RANGE"] = v1 * 8.4,
        ["GATHER_BOT_DAMAGE_RATE"] = 0.5,
        ["GATHER_BOT_OVERCLOCK_DAMAGE"] = 4,
        ["GATHER_BOT_OVERCLOCK_DURATION"] = 5,
        ["GATHER_BOT_OVERCLOCK_WALK_SPEED_MULTIPLIER"] = 1.85
    }
}