local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.None = "None"
v1.None = "None"
v2.Night = "Night"
v1.Night = "Night"
v2.Winter = "Winter"
v1.Winter = "Winter"
v2.Rain = "Rain"
v1.Rain = "Rain"
v2.Desert = "Desert"
v1.Desert = "Desert"
v2.Forest = "Forest"
v1.Forest = "Forest"
v2.Cave = "Cave"
v1.Cave = "Cave"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.Heal = 0
v3[0] = "Heal"
v4.Shield = 1
v3[1] = "Shield"
v4.Speed = 2
v3[2] = "Speed"
v4.Dizzy = 3
v3[3] = "Dizzy"
return {
    ["EnvironmentPreset"] = v2,
    ["ForestEnvironmentMushroomType"] = v4
}