local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local v5 = {}
local function u10(p6, p7) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v8 = string.find(p6, "diamond")
    if v8 ~= 0 and (v8 == v8 and v8) then
        return p7 == u3.BOOTS and "enchanted_diamond_boots" or (p7 == u3.HELMET and "enchanted_diamond_helmet" or "enchanted_diamond_chestplate")
    end
    local v9 = string.find(p6, "emerald")
    return v9 ~= 0 and (v9 == v9 and v9) and (p7 == u3.BOOTS and "enchanted_emerald_boots" or (p7 == u3.HELMET and "enchanted_emerald_helmet" or "enchanted_emerald_chestplate")) or nil
end
function v5.getArmorFolderName(p11, p12, p13, p14) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u10
        [3] = u2
    --]]
    if p14 == nil then
        p14 = false
    end
    local v15 = {}
    if p12 ~= nil and p12 ~= "" then
        local v16 = u4(p12)
        local v17
        if v16 == nil then
            v17 = v16
        else
            v17 = v16.itemType
        end
        if v17 == p11 then
            table.insert(v15, p12)
            local v18 = p11 .. "_" .. v16.skinTag
            table.insert(v15, v18)
        end
    end
    local v19
    if p14 then
        v19 = u10(p11, p13)
    else
        v19 = nil
    end
    local v20
    if v19 == "" or not v19 then
        v20 = {}
        local v21 = #v20
        local v22 = #v15
        table.move(v15, 1, v22, v21 + 1, v20)
        v20[v21 + v22 + 1] = p11
    else
        v20 = {}
        local v23 = #v20
        local v24 = table.create(#v15)
        for v25, v26 in v15 do
            local _ = v25 - 1
            v24[v25] = "enchanted_" .. v26
        end
        local v27 = #v24
        table.move(v24, 1, v27, v23 + 1, v20)
        local v28 = v23 + v27
        local v29 = table.create(#v15)
        for v30, v31 in v15 do
            local _ = v30 - 1
            v29[v30] = v31 .. "_enchanted"
        end
        local v32 = #v29
        table.move(v29, 1, v32, v28 + 1, v20)
        local v33 = v28 + v32
        local v34 = #v15
        table.move(v15, 1, v34, v33 + 1, v20)
        local v35 = v33 + v34
        v20[v35 + 1] = v19
        v20[v35 + 2] = p11
    end
    local v36 = nil
    for v37, v38 in v20 do
        local _ = v37 - 1
        local v39 = u2:FindFirstChild("Assets")
        if v39 ~= nil then
            v39 = v39:FindFirstChild("Armor")
            if v39 ~= nil then
                v39 = v39:FindFirstChild(v38)
            end
        end
        if v39 ~= nil == true then
            v36 = v38
            break
        end
    end
    if v36 ~= nil then
        p11 = v36
    end
    return p11
end
return {
    ["ArmorItemSkinUtil"] = v5
}