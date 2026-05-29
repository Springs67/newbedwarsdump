local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "player", "game-player").GamePlayer
return {
    ["GamePlayerUtil"] = {
        ["getGamePlayer"] = function(p2) --[[ Name: getGamePlayer, Line 7 ]]
            --[[
            Upvalues:
                [1] = u1
            --]]
            return u1.new(p2)
        end,
        ["UserId"] = {
            ["SnickTrix"] = 22641473,
            ["spleenhook"] = 225721992,
            ["grilme99"] = 75380482,
            ["vorlias"] = 4308133
        }
    }
}