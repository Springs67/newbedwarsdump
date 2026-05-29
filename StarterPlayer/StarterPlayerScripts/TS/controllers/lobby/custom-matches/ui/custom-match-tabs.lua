local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.HOME = "home"
v1.home = "HOME"
v2.MAP_BROWSER = "map_browser"
v1.map_browser = "MAP_BROWSER"
v2.GAME_BROWSER = "game_browser"
v1.game_browser = "GAME_BROWSER"
return {
    ["CustomMatchAppTab"] = v2
}