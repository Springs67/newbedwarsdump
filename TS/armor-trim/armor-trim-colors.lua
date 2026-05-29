local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.RED = 0
v1[0] = "RED"
v2.ORANGE = 1
v1[1] = "ORANGE"
v2.YELLOW = 2
v1[2] = "YELLOW"
v2.GREEN = 3
v1[3] = "GREEN"
v2.BLUE = 4
v1[4] = "BLUE"
v2.INDIGO = 5
v1[5] = "INDIGO"
v2.PURPLE = 6
v1[6] = "PURPLE"
v2.WHITE = 7
v1[7] = "WHITE"
v2.BLACK = 8
v1[8] = "BLACK"
v2.BROWN = 9
v1[9] = "BROWN"
v2.PINK = 10
v1[10] = "PINK"
return {
    ["ArmorTrimColor"] = v2
}