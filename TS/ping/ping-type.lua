local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v5 = {}
local u6 = setmetatable({}, {
    ["__index"] = v5
})
u6.GENERIC = 0
v5[0] = "GENERIC"
u6.HELP = 1
v5[1] = "HELP"
u6.ATTACK = 2
v5[2] = "ATTACK"
u6.DANGER = 3
v5[3] = "DANGER"
u6.ON_MY_WAY = 4
v5[4] = "ON_MY_WAY"
u6.POINT_CAPTURED_BY_ENEMY = 5
v5[5] = "POINT_CAPTURED_BY_ENEMY"
u6.POINT_CAPTURING_BY_ENEMY = 6
v5[6] = "POINT_CAPTURING_BY_ENEMY"
u6.POINT_CAPTURED_BY_TEAM = 7
v5[7] = "POINT_CAPTURED_BY_TEAM"
local u7 = {
    [u6.GENERIC] = {
        ["title"] = "Ping",
        ["image"] = v3.INDICATOR_ICON,
        ["color"] = Color3.fromRGB(255, 255, 255),
        ["sound"] = v4.PING
    },
    [u6.HELP] = {
        ["title"] = "Help",
        ["slot"] = 1,
        ["image"] = v3.FLAG_ICON,
        ["color"] = Color3.fromRGB(173, 255, 209),
        ["sound"] = v4.PING_HELP
    },
    [u6.ATTACK] = {
        ["title"] = "Attack",
        ["slot"] = 2,
        ["image"] = v3.SWORD_ICON,
        ["color"] = Color3.fromRGB(255, 242, 150),
        ["sound"] = v4.PING_ATTACK
    },
    [u6.DANGER] = {
        ["title"] = "Danger",
        ["slot"] = 3,
        ["image"] = v3.DIAMOND_CAUTION_ICON,
        ["sound"] = v4.PING_DANGER,
        ["color"] = Color3.fromRGB(255, 148, 148)
    },
    [u6.ON_MY_WAY] = {
        ["title"] = "On my way",
        ["slot"] = 4,
        ["image"] = v3.DOWN_ON_LINE_ICON,
        ["color"] = Color3.fromRGB(140, 176, 255),
        ["sound"] = v4.PING_HELP
    },
    [u6.POINT_CAPTURED_BY_ENEMY] = {
        ["title"] = "Point Captured By Enemy Team",
        ["image"] = v3.INDICATOR_ICON,
        ["color"] = Color3.fromRGB(247, 0, 0),
        ["sound"] = v4.PING_DANGER
    },
    [u6.POINT_CAPTURING_BY_ENEMY] = {
        ["title"] = "On my way",
        ["image"] = v3.FLAG_ICON,
        ["color"] = Color3.fromRGB(255, 0, 0),
        ["sound"] = v4.PING_HELP
    },
    [u6.POINT_CAPTURED_BY_TEAM] = {
        ["title"] = "Point Captured",
        ["image"] = v3.INDICATOR_ICON,
        ["color"] = Color3.fromRGB(0, 255, 18),
        ["sound"] = v4.PING
    }
}
return {
    ["PING_SLOTS"] = 4,
    ["PingType"] = u6,
    ["Pings"] = u7,
    ["getPingFromSlot"] = function(p8) --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u7
            [3] = u6
        --]]
        local v9 = nil
        for v10, v11 in u2.entries(u7) do
            local _ = v10 - 1
            local _ = v11[1]
            if v11[2].slot == p8 == true then
                v9 = v11
                break
            end
        end
        return v9 and {
            ["pingType"] = v9[1],
            ["data"] = v9[2]
        } or {
            ["pingType"] = u6.GENERIC,
            ["data"] = u7[u6.GENERIC]
        }
    end
}