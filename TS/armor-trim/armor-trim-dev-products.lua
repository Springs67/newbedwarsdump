local u1 = {}
local v2 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
u1.ArmorTrimTierDevProducts = {
    0,
    0,
    0,
    0
}
if not v2.isProduction() then
    u1.ArmorTrimTierDevProducts = {
        2658016248,
        2658018237,
        2658018307,
        2658288528
    }
end
function u1.getArmorTrimTierDevProduct(p3) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return u1.ArmorTrimTierDevProducts[p3 + 1]
end
return u1