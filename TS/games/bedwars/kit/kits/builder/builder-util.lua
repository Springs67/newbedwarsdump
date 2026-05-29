local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "shop", "bedwars-shop").BedwarsShop
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
return {
    ["BuilderUtil"] = {
        ["getFortificationCost"] = function(p5) --[[ Name: getFortificationCost, Line 9 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u4
                [3] = u2
            --]]
            local v6 = {}
            local v7 = u3(p5)
            local v8 = v7.block
            if v8 ~= nil then
                v8 = v8.wool
            end
            if v8 then
                p5 = u4.WOOL_WHITE
            end
            local v9 = u2.getShopItem(p5, nil)
            if not v9 then
                return nil
            end
            local v10 = {
                ["currency"] = v9.currency
            }
            local v11 = v7.block
            if v11 ~= nil then
                v11 = v11.blastProof
            end
            local v12
            if v11 then
                local v13 = v9.price * 1.75 / v9.amount
                v12 = math.ceil(v13)
            else
                local v14 = v9.price * 2.5 / v9.amount
                v12 = math.ceil(v14)
            end
            v10.amount = v12
            table.insert(v6, v10)
            return v6
        end
    }
}