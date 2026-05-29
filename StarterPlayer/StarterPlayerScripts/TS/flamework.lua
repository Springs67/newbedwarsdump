local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["setup"] = function(p4) --[[ Name: setup, Line 5 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        for v5, v6 in p4 do
            local _ = v5 - 1
            u2.registerExternalClass(v6)
        end
        u2._addPaths({
            "StarterPlayer",
            "StarterPlayerScripts",
            "TS",
            "controllers",
            "global"
        })
        u2._addPaths({ "ReplicatedStorage", "TS", "components" })
        u2._addPaths({ "ReplicatedStorage", "TS", "strollers" })
        if u3.isLobbyServer() then
            u2._addPaths({
                "StarterPlayer",
                "StarterPlayerScripts",
                "TS",
                "controllers",
                "lobby"
            })
        end
        if u3.isAfkServer() then
            u2._addPaths({
                "StarterPlayer",
                "StarterPlayerScripts",
                "TS",
                "controllers",
                "afk-place"
            })
        end
        if u3.isGameServer() then
            u2._addPaths({
                "StarterPlayer",
                "StarterPlayerScripts",
                "TS",
                "controllers",
                "game"
            })
            u2._addPaths({
                "StarterPlayer",
                "StarterPlayerScripts",
                "TS",
                "controllers",
                "games",
                "bedwars"
            })
        end
        u2.ignite()
    end
}