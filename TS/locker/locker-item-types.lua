local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.EMOTE = "EmoteType"
v2.EmoteType = "EMOTE"
v3.TITLE = "TitleType"
v2.TitleType = "TITLE"
v3.LOBBY_GADGET = "LobbyGadget"
v2.LobbyGadget = "LOBBY_GADGET"
v3.WIN_EFFECT = "WinEffect"
v2.WinEffect = "WIN_EFFECT"
v3.BED_BREAK_EFFECT = "BedBreakEffect"
v2.BedBreakEffect = "BED_BREAK_EFFECT"
v3.KILL_EFFECT = "KillEffect"
v2.KillEffect = "KILL_EFFECT"
v3.BADGE = "Badges"
v2.Badges = "BADGE"
v3.BED_SKIN = "BedSkin"
v2.BedSkin = "BED_SKIN"
v3.ITEM_SKIN = "ItemSkin"
v2.ItemSkin = "ITEM_SKIN"
return {
    ["LockerItemCategory"] = v3,
    ["LockerCategoryToTab"] = {
        [v3.EMOTE] = v1.EMOTES,
        [v3.TITLE] = v1.TITLES,
        [v3.LOBBY_GADGET] = v1.LOBBY_GADGETS,
        [v3.WIN_EFFECT] = v1.WIN_EFFECTS,
        [v3.BED_BREAK_EFFECT] = v1.BREAK_BED_EFFECTS,
        [v3.KILL_EFFECT] = v1.KILL_EFFECTS,
        [v3.BADGE] = v1.BADGES,
        [v3.BED_SKIN] = v1.BED_SKIN,
        [v3.ITEM_SKIN] = v1.COLLECTION
    }
}