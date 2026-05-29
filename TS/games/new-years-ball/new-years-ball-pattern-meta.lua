local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.RAINBOW = 0
v1[0] = "RAINBOW"
v2.DUOTONE = 1
v1[1] = "DUOTONE"
v2.TRITONE = 2
v1[2] = "TRITONE"
v2.STRIPE = 3
v1[3] = "STRIPE"
v2.STARS = 4
v1[4] = "STARS"
return {
    ["NewYearsBallPatterns"] = v2,
    ["NEW_YEARS_BALL_COLOR_SET"] = {
        Color3.fromRGB(66, 255, 32),
        Color3.fromRGB(64, 54, 252),
        Color3.fromRGB(92, 249, 248),
        Color3.fromRGB(249, 246, 61),
        Color3.fromRGB(249, 50, 72),
        Color3.fromRGB(184, 46, 247),
        Color3.fromRGB(250, 135, 51),
        Color3.fromRGB(255, 148, 232)
    },
    ["newYearsPatternMeta"] = {
        {
            ["symbol"] = "R",
            ["colors"] = 4,
            ["groups"] = nil,
            ["type"] = v2.RAINBOW
        },
        {
            ["symbol"] = "D",
            ["colors"] = 2,
            ["groups"] = nil,
            ["type"] = v2.DUOTONE
        },
        {
            ["symbol"] = "T",
            ["colors"] = 3,
            ["groups"] = nil,
            ["type"] = v2.TRITONE
        },
        {
            ["symbol"] = "P",
            ["colors"] = 2,
            ["groups"] = nil,
            ["type"] = v2.STRIPE
        },
        {
            ["symbol"] = "S",
            ["colors"] = 2,
            ["groups"] = nil,
            ["type"] = v2.STARS
        }
    }
}