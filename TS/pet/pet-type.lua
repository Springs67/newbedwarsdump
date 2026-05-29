local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.CHICKEN = "chicken"
v1.chicken = "CHICKEN"
v2.CRAB = "crab"
v1.crab = "CRAB"
v2.TURTLE = "turtle"
v1.turtle = "TURTLE"
v2.DEFAULT_SPIDER = "default_spider"
v1.default_spider = "DEFAULT_SPIDER"
v2.GOLDEN_SNAKE = "golden_snake"
v1.golden_snake = "GOLDEN_SNAKE"
v2.EGYPTIAN_CAT = "egyptian_cat"
v1.egyptian_cat = "EGYPTIAN_CAT"
v2.JELLYFISH = "jellyfish"
v1.jellyfish = "JELLYFISH"
v2.OWL = "owl"
v1.owl = "OWL"
v2.DRAGON = "dragon"
v1.dragon = "DRAGON"
v2.BABY_PENGUIN = "baby_penguin"
v1.baby_penguin = "BABY_PENGUIN"
return {
    ["PetType"] = v2
}