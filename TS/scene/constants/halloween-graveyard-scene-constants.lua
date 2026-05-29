local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.FISH = "fish"
v1.fish = "FISH"
v2.WITCH = "witch"
v1.witch = "WITCH"
v2.SPIDER = "spider"
v1.spider = "SPIDER"
v2.BAT = "bat"
v1.bat = "BAT"
v2.KNIFE = "knife"
v1.knife = "KNIFE"
v2.BONE = "bone"
v1.bone = "BONE"
v2.MOON = "moon"
v1.moon = "MOON"
v2.HAND = "hand"
v1.hand = "HAND"
return {
    ["ClueType"] = v2,
    ["CLUE_TO_TEXTURE"] = {
        [v2.FISH] = "rbxassetid://11315101036",
        [v2.WITCH] = "rbxassetid://11315886896",
        [v2.SPIDER] = "rbxassetid://11315215025",
        [v2.BAT] = "rbxassetid://11315771476",
        [v2.KNIFE] = "rbxassetid://11315036212",
        [v2.BONE] = "rbxassetid://11315995612",
        [v2.MOON] = "rbxassetid://11315175675",
        [v2.HAND] = "rbxassetid://11316081576"
    }
}