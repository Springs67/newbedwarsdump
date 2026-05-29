local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-type").GiftType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "devproduct").DevProduct
local v5 = {}
local v6 = setmetatable({}, {
    ["__index"] = v5
})
v6.BED_COIN_1000 = "BED_COIN_1000"
v5.BED_COIN_1000 = "BED_COIN_1000"
v6.BED_COIN_4500 = "BED_COIN_4500"
v5.BED_COIN_4500 = "BED_COIN_4500"
v6.BED_COIN_12000 = "BED_COIN_12000"
v5.BED_COIN_12000 = "BED_COIN_12000"
v6.BED_COIN_26000 = "BED_COIN_26000"
v5.BED_COIN_26000 = "BED_COIN_26000"
local u7 = {
    [v6.BED_COIN_1000] = {
        ["amount"] = 1000,
        ["robuxPrice"] = 49,
        ["devProductId"] = v4.BED_COIN_1000,
        ["giftType"] = v3.BED_COIN_1000
    },
    [v6.BED_COIN_4500] = {
        ["amount"] = 4500,
        ["robuxPrice"] = 199,
        ["devProductId"] = v4.BED_COIN_4500,
        ["giftType"] = v3.BED_COIN_4500
    },
    [v6.BED_COIN_12000] = {
        ["amount"] = 12000,
        ["robuxPrice"] = 499,
        ["devProductId"] = v4.BED_COIN_12000,
        ["giftType"] = v3.BED_COIN_12000
    },
    [v6.BED_COIN_26000] = {
        ["amount"] = 26000,
        ["robuxPrice"] = 999,
        ["devProductId"] = v4.BED_COIN_26000,
        ["giftType"] = v3.BED_COIN_26000
    }
}
local v8 = u2.values(u7)
local v9 = table.create(#v8)
local function v14(p10) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
    --]]
    local v11 = nil
    for v12, v13 in u2.values(u7) do
        local _ = v12 - 1
        if v13.devProductId == p10 == true then
            v11 = v13
            break
        end
    end
    return v11
end
for v15, v16 in v8 do
    local _ = v15 - 1
    v9[v15] = v16.devProductId
end
return {
    ["BedCoinDevProduct"] = v6,
    ["BedCoinDevProductInfoList"] = u7,
    ["GetBedCoinDevProductInfo"] = v14,
    ["BedCoinDevProductIds"] = v9
}