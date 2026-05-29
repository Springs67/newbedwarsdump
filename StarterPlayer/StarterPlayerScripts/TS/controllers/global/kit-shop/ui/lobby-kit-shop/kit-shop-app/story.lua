local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u5 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, script.Parent, "kit-shop-app").KitShopApp
return function(p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u7
        [3] = u6
        [4] = u5
        [5] = u4
        [6] = u8
        [7] = u3
    --]]
    u5:dispatch({
        ["type"] = "SetEquippedKitSkins",
        ["equippedKitSkins"] = (function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
                [3] = u6
            --]]
            local v10 = u2.values(u7)
            local function v12(p11) --[[ Line: 13 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u6
                --]]
                return p11 == u7.FROSTY_HAMMER and { p11, u6.VOID_ADETUNDE } or { p11, u6.DEFAULT }
            end
            local v13 = table.create(#v10)
            for v14, v15 in v10 do
                v13[v14] = v12(v15, v14 - 1, v10)
            end
            return u2.fromEntries(v13)
        end)()
    })
    u5:dispatch({
        ["type"] = "AddOwnedKits",
        ["kits"] = {
            u7.FROSTY_HAMMER,
            u7.CYBER,
            u7.NAZAR,
            u7.AERY,
            u7.FARMER_CLETUS,
            u7.SKELETON,
            u7.VOID_DRAGON,
            u7.EMBER
        }
    })
    local v16 = u5
    local v17 = {
        ["type"] = "BedwarsSetSome"
    }
    local v18 = {
        ["playerLevel"] = 20,
        ["freeKitLevel"] = 20,
        ["favoriteKits"] = {
            [u7.CYBER] = true,
            [u7.NAZAR] = true,
            [u7.FROSTY_HAMMER] = true
        },
        ["kit"] = u7.FROSTY_HAMMER
    }
    v17.data = v18
    v16:dispatch(v17)
    local u19 = u4("KitShop", u8, {
        ["SelectedKit"] = u7.FROSTY_HAMMER
    }, {}, {
        ["Parent"] = p9
    })
    return function() --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
        --]]
        u3.unmount(u19)
    end
end