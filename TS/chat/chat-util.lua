return {
    ["ChatUtil"] = {
        ["LEGACY_TEXT_CHAT_ENABLED"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameCoreSharedConfig.LegacyTextChatService,
        ["TEXT_CHANNELS_ENABLED"] = true
    }
}