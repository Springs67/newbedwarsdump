local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src", "Knit", "Util", "Promise").resolve
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["shopPurchaseItem"] = function(u8, p9) --[[ Name: shopPurchaseItem, Line 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u4
            [3] = u6
            [4] = u2
            [5] = u7
            [6] = u5
        --]]
        if u3.Controllers.BedwarsShopController.alreadyPurchasedMap[u8.itemType] ~= nil then
            return u4(false)
        else
            return u6.Client:Get("BedwarsPurchaseItem"):CallServerAsync({
                ["shopItem"] = u8,
                ["shopId"] = p9
            }):andThen(function(p10) --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u7
                    [3] = u5
                    [4] = u8
                --]]
                if not p10 then
                    return false
                end
                u2:playSound(u7.BEDWARS_PURCHASE_ITEM)
                u5:dispatch({
                    ["type"] = "BedwarsAddItemPurchased",
                    ["itemType"] = u8.itemType
                })
                return true
            end)
        end
    end
}