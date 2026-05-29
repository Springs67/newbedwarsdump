local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v4 = {}
local function u14(p5) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v6 = 0
    local v7 = {}
    for v8, v9 in u2.getInventory(p5).items do
        local _ = v8 - 1
        local v10 = u3(v9.itemType).armor
        if v10 ~= nil then
            v6 = v6 + 1
            v7[v6] = v10
        end
    end
    local v11 = 0
    for v12 = 1, #v7 do
        local v13 = v7[v12]
        local _ = v12 - 1
        v11 = v11 + v13.damageReductionMultiplier
    end
    return v11
end
v4.getDamageReductionMultiplier = u14
function v4.calculateDamageAfterArmor(p15, p16, p17) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v18 = u14(p15)
    if v18 == 0 then
        return p16
    else
        return (1 - 1 / (1 + (1 / v18 - 1) * (1 / (p17 == nil and 1 or p17)))) * p16
    end
end
return {
    ["ArmorUtil"] = v4
}