local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "versus-hud").VersusHud
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u4
        [4] = u3
        [5] = u6
    --]]
    local v8 = {
        ["Name"] = "AsenDevIsSuperCool",
        ["offlinePlayer"] = u2.Dummy.Asen,
        ["teamColor"] = u5.mcAqua,
        ["stat"] = {
            ["value"] = 3,
            ["icon"] = u4.WINSTREAK
        }
    }
    local v9 = {
        ["Name"] = "Sprux",
        ["offlinePlayer"] = u2.Dummy.oiogy,
        ["teamColor"] = u5.mcGreen,
        ["stat"] = {
            ["value"] = 5,
            ["icon"] = u4.WINSTREAK
        }
    }
    local u10 = u3.mount(u3.createElement(u6, {
        ["TeamA"] = v8,
        ["TeamB"] = v9
    }), p7)
    return function() --[[ Line: 31 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
        --]]
        return u3.unmount(u10)
    end
end