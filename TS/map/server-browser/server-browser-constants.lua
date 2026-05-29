return {
    ["ServerBrowserConstants"] = {
        ["GAMES_PER_PAGE"] = 20,
        ["DEFAULT_VISIBILITY_MODE"] = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "map", "server-browser", "server-browser-types").LiveServerVisibilityMode.PRIVATE,
        ["GAME_NAME_MIN_CHARS"] = 3,
        ["GAME_NAME_MAX_CHARS"] = 36,
        ["LOBBY_GAME_DISPLAY_COUNT"] = 3
    }
}