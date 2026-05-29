local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-dev-products").BattlePassGiftDevProduct
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-meta").BundleMeta
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bundle", "bundle-type").BundleType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local v15 = v2.values(v10)
local function v25(p16, p17) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
    --]]
    local v18 = u11(p17)
    local v19 = v18.notGiftable
    if not v19 then
        local v20 = v18.devProductId
        if v20 == 0 then
            v20 = false
        elseif v20 ~= v20 then
            v20 = false
        end
        v19 = not v20
        if v19 then
            local v21 = v18.gamepassId
            if v21 == 0 then
                v21 = false
            elseif v21 ~= v21 then
                v21 = false
            end
            v19 = not v21
        end
    end
    if v19 then
        return p16
    end
    local v22 = nil
    if v18.priceRobux == 399 then
        v22 = u13.KIT_GIFT_399
    elseif v18.priceRobux == 479 then
        v22 = u13.KIT_GIFT_479
    end
    if v22 == 0 or (v22 ~= v22 or not v22) then
        return p16
    end
    local v23 = {
        ["giftClassificationName"] = "Kit",
        ["name"] = v18.name,
        ["imageId"] = v18.renderImage
    }
    local v24 = v18.priceRobux
    v23.price = v24 == nil and 399 or v24
    v23.devProductId = v22
    p16[p17] = v23
    return p16
end
local v26 = {}
local u27 = {}
for v28 = 1, #v15 do
    v26 = v25(v26, v15[v28], v28 - 1, v15)
end
local v29 = v2.values(v8)
local v30 = {}
for v31 = 1, #v29 do
    local v32 = v29[v31]
    local _ = v31 - 1
    local v33 = v9[v32]
    if v33.product then
        v30[v32] = {
            ["name"] = v33.name,
            ["imageId"] = v33.renderImage,
            ["giftClassificationName"] = v33.name,
            ["price"] = v33.product.priceRobux,
            ["devProductId"] = v33.product.devProductId
        }
    end
end
local v34 = v2.values(v7)
local function v39(p35, p36) --[[ Line: 89 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v37 = u6[p36]
    local v38 = v37.devProductId
    if v38 ~= 0 and (v38 == v38 and v38) then
        p35[p36] = {
            ["name"] = v37.name,
            ["giftClassificationName"] = v37.name,
            ["imageId"] = v37.image,
            ["price"] = v37.price,
            ["devProductId"] = v37.devProductId
        }
    end
    return p35
end
local v40 = {}
for v41 = 1, #v34 do
    v40 = v39(v40, v34[v41], v41 - 1, v34)
end
local v42 = {}
local v43 = v14.BattlePass
local v44 = {}
local v45 = v4(v5.BATTLE_PASS_SEASON).name
if v45 == nil then
    local v46 = v5.BATTLE_PASS_SEASON_NUMBER
    v45 = "Battle Pass Season " .. tostring(v46)
end
v44.name = v45
v44.giftClassificationName = "Battle Pass"
v44.imageId = v5.BATTLE_PASS_SEASON_ICON
v44.price = 799
v44.devProductId = v3
v42[v43] = v44
v42[v14.VIP_RANK] = {
    ["name"] = "VIP Rank",
    ["giftClassificationName"] = "VIP Rank",
    ["price"] = 400,
    ["imageId"] = v12.BED_RED_RENDER,
    ["devProductId"] = u13.VIP_RANK
}
v42[v14.BED_COIN_1000] = {
    ["name"] = "1000 Bed Coins",
    ["giftClassificationName"] = "1000 Bed Coinss",
    ["price"] = 49,
    ["repeatGiftable"] = true,
    ["imageId"] = v12.BED_COIN_ICON,
    ["devProductId"] = u13.BED_COIN_1000
}
v42[v14.BED_COIN_4500] = {
    ["name"] = "4,500 Bed Coins",
    ["giftClassificationName"] = "4500 Bed Coins",
    ["price"] = 199,
    ["repeatGiftable"] = true,
    ["imageId"] = v12.BED_COIN_ICON,
    ["devProductId"] = u13.BED_COIN_4500
}
v42[v14.BED_COIN_12000] = {
    ["name"] = "12,000 Bed Coins",
    ["giftClassificationName"] = "12000 Bed Coins",
    ["price"] = 499,
    ["repeatGiftable"] = true,
    ["imageId"] = v12.BED_COIN_ICON,
    ["devProductId"] = u13.BED_COIN_12000
}
v42[v14.BED_COIN_26000] = {
    ["name"] = "26,000 Bed Coins",
    ["giftClassificationName"] = "26000 Bed Coins",
    ["price"] = 999,
    ["repeatGiftable"] = true,
    ["imageId"] = v12.BED_COIN_ICON,
    ["devProductId"] = u13.BED_COIN_26000
}
for v47, v48 in v40 do
    v42[v47] = v48
end
for v49, v50 in v26 do
    v42[v49] = v50
end
for v51, v52 in v30 do
    v42[v51] = v52
end
u27.GiftMeta = v42
function u27.getGiftMeta(p53) --[[ Line: 174 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    return u27.GiftMeta[p53]
end
return u27