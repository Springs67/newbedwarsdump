local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.Recommended = "Recommended"
v1.Recommended = "Recommended"
v2.Blocks = "Blocks"
v1.Blocks = "Blocks"
v2.Combat = "Combat"
v1.Combat = "Combat"
v2.Tools = "Tools"
v1.Tools = "Tools"
v2.Armory = "Armory"
v1.Armory = "Armory"
v2.Void = "Void"
v1.Void = "Void"
v2.Pirate = "Pirate"
v1.Pirate = "Pirate"
v2.Halloween = "Halloween"
v1.Halloween = "Halloween"
v2.Seeds = "Seeds"
v1.Seeds = "Seeds"
v2.Potions = "Potions"
v1.Potions = "Potions"
v2.Resources = "Resources"
v1.Resources = "Resources"
v2.BlackMarket = "BlackMarket"
v1.BlackMarket = "BlackMarket"
v2.Random = "Random"
v1.Random = "Random"
return {
    ["BedwarsShopCategory"] = v2
}