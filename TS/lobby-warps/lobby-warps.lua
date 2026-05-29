local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.AFK_AREA = "afk_area"
v1.afk_area = "AFK_AREA"
v2.CRATE_ALTAR = "crate_altar"
v1.crate_altar = "CRATE_ALTAR"
v2.SPAWN = "spawn"
v1.spawn = "SPAWN"
v2.QUEUES = "queues"
v1.queues = "QUEUES"
return {
    ["LobbyWarp"] = v2,
    ["LobbyWarpMeta"] = {
        [v2.AFK_AREA] = {
            ["name"] = "Afk Area",
            ["tag"] = "afk-area-warp"
        },
        [v2.CRATE_ALTAR] = {
            ["name"] = "Open Crates",
            ["tag"] = "crate-altar-warp"
        },
        [v2.SPAWN] = {
            ["name"] = "Spawn",
            ["tag"] = "spawn-warp"
        },
        [v2.QUEUES] = {
            ["name"] = "Queue NPCs",
            ["tag"] = "queues-warp"
        }
    }
}