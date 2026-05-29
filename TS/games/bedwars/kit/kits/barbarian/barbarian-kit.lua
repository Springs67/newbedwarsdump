local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u2 = {
    ["FULL_RAGE"] = 1240
}
local u3 = {
    {
        ["rage"] = 0,
        ["item"] = u1.WOOD_SWORD
    },
    {
        ["rage"] = 90,
        ["item"] = u1.STONE_SWORD
    },
    {
        ["rage"] = 280,
        ["item"] = u1.IRON_SWORD
    },
    {
        ["rage"] = 660,
        ["item"] = u1.DIAMOND_SWORD
    },
    {
        ["rage"] = u2.FULL_RAGE,
        ["item"] = u1.RAGEBLADE
    }
}
u2.SwordProgression = u3
function u2.getSwordProgress(p4) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    if p4 == nil then
        return {
            ["prev"] = u3[1],
            ["next"] = u3[2]
        }
    end
    local v5 = p4:GetAttribute("BarbarianRageLevel")
    local v6 = v5 == nil and 0 or v5
    local v7 = u3[1]
    local v8 = false
    local v9 = 0
    local v10 = nil
    while true do
        if true then
            if v8 then
                v9 = v9 + 1
            else
                v8 = true
            end
        end
        if v9 >= #u3 then
            break
        end
        if u3[v9 + 1].rage > v6 then
            v10 = u3[v9 + 1]
            break
        end
        v7 = u3[v9 + 1]
    end
    return {
        ["prev"] = v7,
        ["next"] = v10
    }
end
function u2.updateAppearance(p11, p12) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    local v13 = u2.FULL_RAGE <= p12
    for _, v14 in p11:GetDescendants() do
        if v14.Name == "FullRageRed" and v14:IsA("BasePart") then
            local v15
            if v13 then
                v15 = Color3.fromRGB(255, 73, 73)
            else
                v15 = Color3.fromRGB(0, 0, 0)
            end
            v14.Color = v15
        elseif v14.Name == "FullRageEnabled" and (v14:IsA("ParticleEmitter") or v14:IsA("Trail")) then
            v14.Enabled = v13
        end
    end
end
function u2.getItemScore(p16) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    return (p16 == u1.STONE_SWORD or (p16 == u1.STONE_GUN_BLADE or p16 == u1.STONE_DAO)) and 30 or ((p16 == u1.IRON_SWORD or (p16 == u1.IRON_GUN_BLADE or p16 == u1.IRON_DAO)) and 100 or ((p16 == u1.DIAMOND_SWORD or (p16 == u1.DIAMOND_GUN_BLADE or (p16 == u1.DIAMOND_DAO or (p16 == u1.INFERNAL_SABER or (p16 == u1.HEAVENLY_SWORD or p16 == u1.ICE_SWORD))))) and 220 or ((p16 == u1.EMERALD_SWORD or (p16 == u1.EMERALD_GUN_BLADE or p16 == u1.EMERALD_DAO)) and 420 or ((p16 == u1.LEATHER_HELMET or (p16 == u1.LEATHER_CHESTPLATE or p16 == u1.LEATHER_BOOTS)) and 30 or ((p16 == u1.IRON_HELMET or (p16 == u1.IRON_CHESTPLATE or p16 == u1.IRON_BOOTS)) and 100 or ((p16 == u1.DIAMOND_HELMET or (p16 == u1.DIAMOND_CHESTPLATE or p16 == u1.DIAMOND_BOOTS)) and 220 or ((p16 == u1.EMERALD_HELMET or (p16 == u1.EMERALD_CHESTPLATE or p16 == u1.EMERALD_BOOTS)) and 400 or 1)))))))
end
return {
    ["BarbarianKit"] = u2
}