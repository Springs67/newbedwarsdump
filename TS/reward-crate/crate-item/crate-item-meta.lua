local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").Consumable
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-items").CrateItem
local v24 = {
    [v22.ONE_STAR] = 750,
    [v22.TWO_STAR] = 1200,
    [v22.THREE_STAR] = 3600,
    [v22.FOUR_STAR] = 9600,
    [v22.FIVE_STAR] = 28800,
    [v22.SIX_STAR] = 86400
}
local u25 = u2.values(v10)
local u26 = {}
local v27 = u23.FLAT_BP_XP_1
local v28 = {
    ["description"] = "Instantly gives the player a flat amount of XP"
}
local v29 = v24[v22.ONE_STAR]
v28.displayName = tostring(v29) .. " Battlepass XP"
v28.itemDisplay = {
    ["image"] = v15.XP_PLUS
}
u26[v27] = v28
local v30 = u23.FLAT_BP_XP_2
local v31 = {
    ["description"] = "Instantly gives the player a flat amount of XP"
}
local v32 = v24[v22.TWO_STAR]
v31.displayName = tostring(v32) .. " Battlepass XP"
v31.itemDisplay = {
    ["image"] = v15.XP_PLUS
}
u26[v30] = v31
local v33 = u23.FLAT_BP_XP_3
local v34 = {
    ["description"] = "Instantly gives the player a flat amount of XP"
}
local v35 = v24[v22.THREE_STAR]
v34.displayName = tostring(v35) .. " Battlepass XP"
v34.itemDisplay = {
    ["image"] = v15.XP_PLUS
}
u26[v33] = v34
local v36 = u23.RANDOM_KIT
local v37 = {
    ["displayName"] = "Random Free Kit",
    ["description"] = "Permenantly unlocks a random purchaseable kit!",
    ["itemDisplay"] = {
        ["image"] = v15.RANDOM_KIT_RENDER
    }
}
u26[v36] = v37
local v38 = u23.BED_COIN_100
local v39 = {
    ["displayName"] = "100 Bed Coin",
    ["description"] = "Contains 100 coins",
    ["itemDisplay"] = {
        ["image"] = v15.BED_COIN_ICON
    }
}
u26[v38] = v39
local v40 = u23.BED_COIN_200
local v41 = {
    ["displayName"] = "200 Bed Coin",
    ["description"] = "Contains 200 coins",
    ["itemDisplay"] = {
        ["image"] = v15.BED_COIN_ICON
    }
}
u26[v40] = v41
local v42 = u23.BED_COIN_350
local v43 = {
    ["displayName"] = "350 Bed Coin",
    ["description"] = "Contains 200 coins",
    ["itemDisplay"] = {
        ["image"] = v15.BED_COIN_ICON
    }
}
u26[v42] = v43
local v44 = u23.BED_COIN_600
local v45 = {
    ["displayName"] = "600 Bed Coin",
    ["description"] = "Contains 500 coins",
    ["itemDisplay"] = {
        ["image"] = v15.BED_COIN_ICON
    }
}
u26[v44] = v45
return {
    ["getCrateItemMeta"] = function(p46) --[[ Name: getCrateItemMeta, Line 92 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u26
            [3] = u13
            [4] = u14
            [5] = u3
            [6] = u11
            [7] = u12
            [8] = u17
            [9] = u16
            [10] = u21
            [11] = u20
            [12] = u19
            [13] = u18
            [14] = u25
            [15] = u9
            [16] = u5
            [17] = u4
            [18] = u2
            [19] = u7
            [20] = u8
            [21] = u6
        --]]
        if u23[p46] ~= nil then
            return u26[p46]
        end
        if u13[p46] == nil then
            if u11[p46] == nil then
                if u17[p46] == nil then
                    if u21[p46] == nil then
                        if u19[p46] == nil then
                            if (table.find(u25, p46) or 0) - 1 == -1 then
                                if u5[p46] ~= nil then
                                    local v47 = u4[p46]
                                    if v47 then
                                        local v48 = 0
                                        local v49 = {}
                                        for v50, v51 in u2.values(u7) do
                                            local _ = v50 - 1
                                            if u8.isArmorTrimEffectGrantableForTrim(v51, p46) == true then
                                                v48 = v48 + 1
                                                v49[v48] = v51
                                            end
                                        end
                                        return {
                                            ["disableDupe"] = true,
                                            ["displayName"] = (#v49 ~= 1 and "" or u6[v49[1]].name .. " - ") .. v47.name .. " Armor Trim Effect",
                                            ["itemDisplay"] = {
                                                ["image"] = v47.image
                                            }
                                        }
                                    end
                                    u3.Warn("Crate item meta error. " .. p46 .. " is not a valid ArmorTrimEffect Type")
                                end
                            else
                                local v52 = u9(p46)
                                if v52 then
                                    return {
                                        ["displayName"] = v52.displayName,
                                        ["itemDisplay"] = {
                                            ["image"] = v52.image
                                        },
                                        ["description"] = v52.description
                                    }
                                end
                                u3.Warn("Crate Item Meta Error. " .. p46 .. " is not a valid Consumable")
                            end
                        else
                            local v53 = u18[p46]
                            if v53 then
                                return {
                                    ["disableDupe"] = true,
                                    ["displayName"] = v53.name,
                                    ["itemDisplay"] = {
                                        ["image"] = v53.image
                                    }
                                }
                            end
                            u3.Warn("Crate Item Meta Error. " .. p46 .. " is not a valid LobbyGadget Type")
                        end
                    else
                        local v54 = u20[p46]
                        if v54 then
                            local v55 = {}
                            local v56 = v54.name
                            v55.displayName = tostring(v56) .. " Title"
                            local v57 = {}
                            local v58 = {}
                            local v59 = v54.name
                            v58.rawText = v59 == nil and "" or v59
                            v58.richText = v54.text
                            v58.color = v54.color
                            v57.text = v58
                            v55.itemDisplay = v57
                            v55.disableDupe = true
                            return v55
                        end
                        u3.Warn("Crate Item Meta Error. " .. p46 .. " is not a valid Title Type")
                    end
                else
                    local v60 = u16[p46]
                    if v60 then
                        local v61 = {
                            ["displayName"] = v60.name .. " Emote"
                        }
                        local v62 = {}
                        local v63 = v60.image
                        v62.image = v63 == nil and "" or v63
                        v61.itemDisplay = v62
                        v61.disableDupe = true
                        return v61
                    end
                    u3.Warn("Crate Item Meta Error. " .. p46 .. " is not a valid Emote Type")
                end
            else
                local v64 = u12[p46]
                if v64 then
                    return {
                        ["disableDupe"] = true,
                        ["displayName"] = v64.name,
                        ["itemDisplay"] = {
                            ["image"] = v64.renderImage
                        }
                    }
                end
                u3.Warn("Crate Item Meta Error. " .. p46 .. " is not a valid Bedwars Kit Skin")
            end
        else
            local v65 = u14(p46)
            if v65 then
                return {
                    ["disableDupe"] = true,
                    ["displayName"] = v65.name,
                    ["itemDisplay"] = {
                        ["image"] = v65.renderImage
                    }
                }
            end
            u3.Warn("Crate Item Meta Error. " .. p46 .. " is not a valid Bedwars Kit")
        end
        return {
            ["displayName"] = tostring(p46),
            ["itemDisplay"] = {
                ["image"] = ""
            }
        }
    end,
    ["FLAT_BP_XP_REWARD"] = v24,
    ["CrateItemMeta"] = u26
}