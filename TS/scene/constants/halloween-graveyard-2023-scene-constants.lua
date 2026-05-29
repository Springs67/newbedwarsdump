local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.RED = "red"
v1.red = "RED"
v2.ORANGE = "orange"
v1.orange = "ORANGE"
v2.YELLOW = "yellow"
v1.yellow = "YELLOW"
v2.GREEN = "green"
v1.green = "GREEN"
v2.BLUE = "blue"
v1.blue = "BLUE"
v2.INDIGO = "indigo"
v1.indigo = "INDIGO"
v2.VIOLET = "violet"
v1.violet = "VIOLET"
v2.WHITE = "white"
v1.white = "WHITE"
return {
    ["CandleColors"] = v2,
    ["CandleOctavePair"] = {
        [v2.RED] = 0.6,
        [v2.ORANGE] = 0.7,
        [v2.YELLOW] = 0.8,
        [v2.GREEN] = 0.9,
        [v2.BLUE] = 1,
        [v2.INDIGO] = 1.2,
        [v2.VIOLET] = 1.3,
        [v2.WHITE] = 1.4
    },
    ["CandleColorsPair"] = {
        [v2.RED] = Color3.fromRGB(255, 0, 0),
        [v2.ORANGE] = Color3.fromRGB(255, 115, 20),
        [v2.YELLOW] = Color3.fromRGB(255, 250, 0),
        [v2.GREEN] = Color3.fromRGB(0, 255, 0),
        [v2.BLUE] = Color3.fromRGB(0, 0, 255),
        [v2.INDIGO] = Color3.fromRGB(100, 100, 255),
        [v2.VIOLET] = Color3.fromRGB(200, 0, 200),
        [v2.WHITE] = Color3.fromRGB(255, 255, 255)
    }
}