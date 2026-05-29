return {
    ["ConquerorBalance"] = {
        ["CONQUEROR_FLAG_RADIUS"] = 19 * require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE,
        ["CONQUEROR_FLAG_BUFF_DURATION"] = 5,
        ["CONQUEROR_FLAG_LIFETIME"] = 30,
        ["CONQUEROR_FLAG_MAX_PLAYERS_BUFFED"] = 4
    }
}