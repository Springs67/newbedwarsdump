local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.COLLECTION = "Collection"
v1.Collection = "COLLECTION"
v2.EMOTES = "Emotes"
v1.Emotes = "EMOTES"
v2.KILL_EFFECTS = "Kill Effects"
v1["Kill Effects"] = "KILL_EFFECTS"
v2.WIN_EFFECTS = "Win Effects"
v1["Win Effects"] = "WIN_EFFECTS"
v2.TITLES = "Titles"
v1.Titles = "TITLES"
v2.LOBBY_GADGETS = "Lobby Gadgets"
v1["Lobby Gadgets"] = "LOBBY_GADGETS"
v2.BREAK_BED_EFFECTS = "Break Bed Effects"
v1["Break Bed Effects"] = "BREAK_BED_EFFECTS"
v2.BADGES = "Achievements"
v1.Achievements = "BADGES"
v2.BED_SKIN = "Bed Skin"
v1["Bed Skin"] = "BED_SKIN"
v2.CONSUMABLES = "Consumables"
v1.Consumables = "CONSUMABLES"
return {
    ["LockerTab"] = v2,
    ["LockerTabMeta"] = {
        [v2.COLLECTION] = {
            ["title"] = "\226\173\144 Collection"
        }
    },
    ["LockerTabOrder"] = {
        [v2.COLLECTION] = 0,
        [v2.CONSUMABLES] = 1,
        [v2.TITLES] = 2,
        [v2.EMOTES] = 3,
        [v2.LOBBY_GADGETS] = 4,
        [v2.KILL_EFFECTS] = 5,
        [v2.WIN_EFFECTS] = 6,
        [v2.BREAK_BED_EFFECTS] = 7,
        [v2.BED_SKIN] = 8,
        [v2.BADGES] = 9
    }
}