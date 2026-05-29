local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SKULL_DROP = "skull_drop"
v1.skull_drop = "SKULL_DROP"
v2.ARMOR_TRIM_BOOST = "armor_trim_boost"
v1.armor_trim_boost = "ARMOR_TRIM_BOOST"
v2.AFK_WEEKEND = "afk_weekend"
v1.afk_weekend = "AFK_WEEKEND"
v2.RANDOM_LOBBY_EVENT_WEEKEND = "random_lobby_event_weekend"
v1.random_lobby_event_weekend = "RANDOM_LOBBY_EVENT_WEEKEND"
v2.LOGIN_REWARD_WEEKEND = "login_reward_weekend"
v1.login_reward_weekend = "LOGIN_REWARD_WEEKEND"
return {
    ["WeeklyTimedEvent"] = v2
}