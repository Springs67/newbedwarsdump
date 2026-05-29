local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v3 = {
    ["sceneName"] = "pirate scene",
    ["timeConfig"] = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "live-event", "live-event-system").TimeConfig.betweenDates({
        ["startDate"] = DateTime.fromUniversalTime(2022, 8, 26, 20, 0, 0),
        ["endDate"] = DateTime.fromUniversalTime(2022, 8, 26, 20, 3, 0)
    }),
    ["preload"] = {
        ["sounds"] = {
            v2.BLUNDERBUSS_SHOOT,
            v2.PIRATE_EVENT_FIRST_ENTRY,
            v2.PIRATE_EVENT_MOTHERSHIP,
            v2.PIRATE_EVENT_MUSIC,
            v2.PIRATE_EVENT_THUNDER,
            v2.PIRATE_EVENT_SHIP_CRASH,
            v2.PIRATE_EVENT_SHIP_CREAK
        }
    }
}
return {
    ["pirateSceneConfig"] = v3
}