local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole
local u5 = v1.import(script, script.Parent, "murderer-match-end-screen").MurdererMatchEndScreen
return function(p6) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
        [4] = u2
    --]]
    local v7 = u3.mount
    local v8 = u3.createElement
    local v9 = u5
    local v10 = {
        ["Roles"] = {
            [u4.CIVILIAN] = {
                u2.Dummy.oiogy,
                u2.Dummy.Chase,
                u2.Dummy.DVwastaken,
                u2.Dummy.Bryan3838,
                u2.Dummy.JKJ,
                u2.Dummy.Midciel,
                u2.Dummy.Vorlias,
                u2.Dummy.grilme99,
                u2.Dummy.SteamPulse
            },
            [u4.SHERIFF] = { u2.Dummy.SnickTrix },
            [u4.MURDERER] = { u2.Dummy.Asen, u2.Dummy.spleenhook }
        }
    }
    local v11 = {}
    local v12 = {
        ["killer"] = {
            ["offlinePlayer"] = u2.Dummy.Chase,
            ["role"] = u4.CIVILIAN
        },
        ["victim"] = {
            ["offlinePlayer"] = u2.Dummy.spleenhook,
            ["role"] = u4.MURDERER
        },
        ["time"] = os.time() - 60
    }
    local v13 = {
        ["killer"] = {
            ["offlinePlayer"] = u2.Dummy.Midciel,
            ["role"] = u4.CIVILIAN
        },
        ["victim"] = {
            ["offlinePlayer"] = u2.Dummy.Asen,
            ["role"] = u4.MURDERER
        },
        ["time"] = os.time() - 60
    }
    local v14 = {
        ["killer"] = {
            ["offlinePlayer"] = u2.Dummy.spleenhook,
            ["role"] = u4.MURDERER
        },
        ["victim"] = {
            ["offlinePlayer"] = u2.Dummy.SnickTrix,
            ["role"] = u4.SHERIFF
        },
        ["time"] = os.time() - 60
    }
    __set_list(v11, 1, {v12, v13, v14})
    v10.Eliminations = v11
    local u15 = v7(v8(v9, v10), p6)
    return function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u15
        --]]
        return u3.unmount(u15)
    end
end