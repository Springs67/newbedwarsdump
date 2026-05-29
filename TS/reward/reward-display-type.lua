local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.KIT = "kit"
v1.kit = "KIT"
v2.KIT_SKIN = "kitSkin"
v1.kitSkin = "KIT_SKIN"
v2.BED_BREAK_EFFECT = "bedBreakEffect"
v1.bedBreakEffect = "BED_BREAK_EFFECT"
v2.KILL_EFFECT = "killEffect"
v1.killEffect = "KILL_EFFECT"
v2.LOBBY_GADGET = "lobbyGadget"
v1.lobbyGadget = "LOBBY_GADGET"
v2.EMOTE = "emote"
v1.emote = "EMOTE"
v2.CRATE = "crate"
v1.crate = "CRATE"
v2.WIN_EFFECT = "winEffect"
v1.winEffect = "WIN_EFFECT"
v2.BED_COINS = "bedCoins"
v1.bedCoins = "BED_COINS"
v2.BED_SKIN = "bedSkin"
v1.bedSkin = "BED_SKIN"
v2.ITEM_SKIN = "itemSkin"
v1.itemSkin = "ITEM_SKIN"
return {
    ["RewardDisplayType"] = v2
}