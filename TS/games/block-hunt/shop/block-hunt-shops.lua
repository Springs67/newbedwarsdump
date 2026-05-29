local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "block-hunt-team-id").BlockHuntTeamId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "shop", "block-hunt-hiders-shop").BlockHuntHidersShop
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "block-hunt", "shop", "block-hunt-hunters-shop").BlockHuntHuntersShop
local v5 = v2.HUNTERS
local v6 = {}
local u7 = {}
for _, v8 in v4 do
    v6[v8.itemType] = v8
end
u7[v5] = v6
local v9 = v2.HIDERS
local v10 = {}
for _, v11 in v3 do
    v10[v11.itemType] = v11
end
u7[v9] = v10
return {
    ["getBlockHuntShop"] = function(p12) --[[ Name: getBlockHuntShop, Line 18 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        return u7[p12]
    end,
    ["getBlockHuntShopItemMeta"] = function(p13, p14) --[[ Name: getBlockHuntShopItemMeta, Line 21 ]]
        --[[
        Upvalues:
            [1] = u7
        --]]
        local v15 = u7[p13]
        if v15 then
            return v15[p14]
        else
            return nil
        end
    end,
    ["BlockHuntShops"] = u7
}