local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.GamePass = "GamePass"
v1.GamePass = "GamePass"
v2.DevProduct = "DevProduct"
v1.DevProduct = "DevProduct"
v2.BedwarsUGC = "BedwarsUGC"
v1.BedwarsUGC = "BedwarsUGC"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.Robux = "Robux"
v3.Robux = "Robux"
v4.BedCoin = "BedCoin"
v3.BedCoin = "BedCoin"
return {
    ["RobuxProductType"] = v2,
    ["StoreCurrency"] = v4
}