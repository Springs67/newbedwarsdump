local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-meta").AchievementsMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ChatTagColorDefinition
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "lobby", "clan-podium-banner-meta").getClanPodiumBannerMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-currency", "event-currency-metadata").EventCurrencyMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-utils").getLobbyGadgetImage
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-meta").WinEffectMeta
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-meta").CrateMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
return {
    ["RewardUtils"] = {
        ["getRewardColors"] = function(p32) --[[ Name: getRewardColors, Line 36 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u31
                [3] = u23
                [4] = u30
                [5] = u16
                [6] = u29
            --]]
            if p32.kit ~= nil then
                return u13[u31.KIT]
            end
            if p32.killEffect ~= nil then
                return u13[u31.KILL_EFFECT]
            end
            if p32.winEffect ~= nil then
                return u13[u31.WIN_EFFECT]
            end
            if p32.emote ~= nil and u23[p32.emote].animation then
                return u13[u31.EMOTE]
            end
            if p32.lobbyGadget ~= nil then
                return u13[u31.LOBBY_GADGET]
            end
            if p32.kitSkin ~= nil then
                return u13[u31.KIT_SKIN]
            end
            if p32.crate ~= nil then
                local v33 = u30[p32.crate]
                if not v33.consumableRequirement then
                    return u13[u31.CRATE]
                end
                local v34 = u29(u16(v33.consumableRequirement).rarity)
                return {
                    ["borderColor"] = v34.gradient.colorTop,
                    ["backgroundColor"] = v34.gradient.colorBottom
                }
            end
            if p32.bedBreakEffect ~= nil then
                return u13[u31.BED_BREAK_EFFECT]
            end
            if p32.bedCoins ~= nil then
                return u13[u31.BED_COINS]
            end
            if p32.bedSkin ~= nil then
                return u13[u31.BED_SKIN]
            end
            if p32.itemSkin ~= nil then
                return u13[u31.ITEM_SKIN]
            end
            if p32.consumable == nil then
                return {
                    ["borderColor"] = Color3.fromRGB(103, 103, 103),
                    ["backgroundColor"] = Color3.fromRGB(48, 48, 48)
                }
            end
            local v35 = u29(u16(p32.consumable.consumableType).rarity)
            return {
                ["borderColor"] = v35.gradient.colorTop,
                ["backgroundColor"] = v35.gradient.colorBottom
            }
        end,
        ["getRewardName"] = function(p36) --[[ Name: getRewardName, Line 84 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u24
                [3] = u28
                [4] = u23
                [5] = u27
                [6] = u25
                [7] = u19
                [8] = u30
                [9] = u22
                [10] = u17
                [11] = u16
                [12] = u18
                [13] = u8
                [14] = u10
                [15] = u9
                [16] = u15
                [17] = u14
            --]]
            local v37 = ""
            if p36.kit == nil then
                if p36.killEffect == nil then
                    if p36.winEffect == nil then
                        if p36.emote == nil then
                            if p36.title == nil then
                                if p36.lobbyGadget == nil then
                                    if p36.kitSkin == nil then
                                        if p36.crate == nil then
                                            if p36.clanShopContribution == nil then
                                                if p36.bedBreakEffect == nil then
                                                    if p36.bedCoins == nil then
                                                        if p36.battlepassXP == nil then
                                                            if p36.eventCurrency == nil then
                                                                if p36.consumable == nil then
                                                                    if p36.comingSoonReward == nil then
                                                                        if p36.bedSkin == nil then
                                                                            if p36.itemSkin == nil then
                                                                                if p36.achievement == nil then
                                                                                    if p36.armorTrimEffectUnlock == nil then
                                                                                        if p36.clanPodiumBanner == nil then
                                                                                            if p36.clanTagChatColor ~= nil then
                                                                                                v37 = u14[p36.clanTagChatColor].name
                                                                                            end
                                                                                        else
                                                                                            v37 = u15(p36.clanPodiumBanner).title
                                                                                        end
                                                                                    else
                                                                                        v37 = (p36.armorTrimEffectUnlock.trim == nil and "" or u10[p36.armorTrimEffectUnlock.trim].name .. " - ") .. u9[p36.armorTrimEffectUnlock.effect].name .. " Armor Trim Effect"
                                                                                    end
                                                                                else
                                                                                    v37 = u8[p36.achievement].title
                                                                                end
                                                                            else
                                                                                local v38 = u18(p36.itemSkin).name
                                                                                v37 = v38 == nil and "Item Skin" or v38
                                                                            end
                                                                        else
                                                                            local v39 = u18(p36.bedSkin).name
                                                                            v37 = v39 == nil and "Bed Skin" or v39
                                                                        end
                                                                    else
                                                                        v37 = p36.comingSoonReward.text
                                                                    end
                                                                else
                                                                    v37 = u16(p36.consumable.consumableType).displayName
                                                                end
                                                            else
                                                                local v40 = p36.eventCurrency.amount
                                                                v37 = tostring(v40) .. " " .. u17[p36.eventCurrency.currency].name .. "s"
                                                            end
                                                        else
                                                            local v41 = p36.battlepassXP.amount
                                                            v37 = tostring(v41) .. " Battle Pass XP"
                                                        end
                                                    else
                                                        local v42 = p36.bedCoins
                                                        v37 = tostring(v42) .. " Bed Coins"
                                                    end
                                                else
                                                    v37 = u22[p36.bedBreakEffect].name
                                                end
                                            else
                                                v37 = "Clan Shop Coins"
                                            end
                                        else
                                            v37 = u30[p36.crate].displayName
                                        end
                                    else
                                        v37 = u19[p36.kitSkin].name
                                    end
                                else
                                    v37 = u25[p36.lobbyGadget].name
                                end
                            else
                                v37 = u27[p36.title].name
                                if v37 == nil then
                                    v37 = u27[p36.title].text
                                end
                            end
                        else
                            v37 = u23[p36.emote].name
                        end
                    else
                        v37 = u28[p36.winEffect].name
                    end
                else
                    v37 = u24[p36.killEffect].name
                end
            else
                v37 = u20(p36.kit).name
            end
            if p36.duration ~= nil then
                local v43 = p36.duration / 86400
                local v44 = math.round(v43)
                v37 = v37 .. " (" .. (tostring(v44) .. "d") .. ")"
            end
            return v37
        end,
        ["getRewardType"] = function(p45) --[[ Name: getRewardType, Line 153 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u16
            --]]
            local v46 = nil
            if p45.kit == nil then
                if p45.killEffect == nil then
                    if p45.winEffect == nil then
                        if p45.emote == nil then
                            if p45.title == nil then
                                if p45.lobbyGadget == nil then
                                    if p45.kitSkin == nil then
                                        if p45.crate == nil then
                                            if p45.eventCurrency == nil then
                                                if p45.clanShopContribution == nil then
                                                    if p45.bedBreakEffect == nil then
                                                        if p45.bedCoins == nil then
                                                            if p45.battlepassXP == nil then
                                                                if p45.consumable == nil then
                                                                    if p45.comingSoonReward == nil then
                                                                        return p45.bedSkin ~= nil and "Bed Skin" or (p45.itemSkin ~= nil and "Item Skin" or (p45.achievement ~= nil and "Achievement" or (p45.armorTrimEffectUnlock ~= nil and "Armor Trim Effect" or (p45.clanPodiumBanner ~= nil and "Clan Podium Banner" or (p45.clanTagChatColor ~= nil and "Clan Chat Tag Color" or v46)))))
                                                                    else
                                                                        return p45.comingSoonReward.text
                                                                    end
                                                                else
                                                                    return u16(p45.consumable.consumableType).displayName
                                                                end
                                                            else
                                                                return ""
                                                            end
                                                        else
                                                            return ""
                                                        end
                                                    else
                                                        return "Bed Break Effect"
                                                    end
                                                else
                                                    return "Clan Shop Coins"
                                                end
                                            else
                                                return ""
                                            end
                                        else
                                            return "Crate"
                                        end
                                    else
                                        return "Kit Skin"
                                    end
                                else
                                    return "Lobby Gadget"
                                end
                            else
                                return "Lobby Title"
                            end
                        else
                            return u23[p45.emote].animation and "Animated Emote" or "Emote"
                        end
                    else
                        return "Win Effect"
                    end
                else
                    return "Kill Effect"
                end
            else
                return "Kit"
            end
        end,
        ["getRewardImageId"] = function(p47) --[[ Name: getRewardImageId, Line 207 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u23
                [3] = u26
                [4] = u19
                [5] = u30
                [6] = u28
                [7] = u17
                [8] = u21
                [9] = u22
                [10] = u16
                [11] = u18
                [12] = u8
                [13] = u15
                [14] = u9
            --]]
            local v48 = nil
            if p47.killEffect == nil then
                if p47.emote == nil then
                    if p47.lobbyGadget == nil then
                        if p47.kitSkin == nil then
                            if p47.crate == nil then
                                if p47.winEffect == nil then
                                    if p47.eventCurrency == nil then
                                        if p47.clanShopContribution == nil then
                                            if p47.bedBreakEffect == nil then
                                                if p47.bedCoins == nil then
                                                    if p47.winEffect == nil then
                                                        if p47.consumable == nil then
                                                            if p47.bedSkin == nil then
                                                                if p47.itemSkin == nil then
                                                                    if p47.battlepassXP == nil then
                                                                        if p47.achievement == nil then
                                                                            if p47.clanPodiumBanner ~= nil then
                                                                                return u15(p47.clanPodiumBanner).iconId
                                                                            end
                                                                            if p47.armorTrimEffectUnlock ~= nil then
                                                                                v48 = u9[p47.armorTrimEffectUnlock.effect].image
                                                                            end
                                                                            return v48
                                                                        else
                                                                            local v49 = u8[p47.achievement].icon
                                                                            if v49 ~= nil then
                                                                                v49 = v49.image
                                                                            end
                                                                            return v49
                                                                        end
                                                                    else
                                                                        return u21.TICKET
                                                                    end
                                                                else
                                                                    return u18(p47.itemSkin).renderImage
                                                                end
                                                            else
                                                                return u18(p47.bedSkin).renderImage
                                                            end
                                                        else
                                                            return u16(p47.consumable.consumableType).image
                                                        end
                                                    else
                                                        return u28[p47.winEffect]
                                                    end
                                                else
                                                    return u21.BED_COIN_ICON
                                                end
                                            else
                                                return u22[p47.bedBreakEffect].image
                                            end
                                        else
                                            return u21.CLAN_CP_COIN
                                        end
                                    else
                                        return u17[p47.eventCurrency.currency].icon
                                    end
                                else
                                    return u28[p47.winEffect].image
                                end
                            else
                                return u30[p47.crate].image
                            end
                        else
                            return u19[p47.kitSkin].renderImage
                        end
                    else
                        return u26(p47.lobbyGadget)
                    end
                else
                    return u23[p47.emote].image
                end
            else
                return u24[p47.killEffect].image
            end
        end,
        ["playerOwnsReward"] = function(p50, p51) --[[ Name: playerOwnsReward, Line 254 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u7
                [3] = u5
                [4] = u4
                [5] = u6
                [6] = u11
                [7] = u12
            --]]
            if u2.isHoarceKat() then
                return false
            end
            if p51.kit ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.KitController:ownsKit(p51.kit)
                end
                local v52 = nil
                for v53, v54 in u5.Services.PlayerProfileService:waitForProfile(p50).Data.kits do
                    local _ = v53 - 1
                    if v54.kitType == p51.kit == true then
                        v52 = v54
                        break
                    end
                end
                return v52 ~= nil
            end
            if p51.killEffect ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsKillEffect(p51.killEffect)
                end
                local v55 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.killEffects
                local v56 = p51.killEffect
                return table.find(v55, v56) ~= nil
            end
            if p51.winEffect ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsWinEffect(p51.winEffect)
                end
                local v57 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.winEffects
                local v58 = p51.winEffect
                return table.find(v57, v58) ~= nil
            end
            if p51.emote ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsEmote(p51.emote)
                end
                local v59 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.emotes
                local v60 = p51.emote
                return table.find(v59, v60) ~= nil
            end
            if p51.title ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsTitle(p51.title)
                end
                local v61 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.titles
                local v62 = p51.title
                return table.find(v61, v62) ~= nil
            end
            if p51.lobbyGadget ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsLobbyGadget(p51.lobbyGadget)
                end
                local v63 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.lobbyGadgets
                local v64 = p51.lobbyGadget
                return table.find(v63, v64) ~= nil
            end
            if p51.kitSkin ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.KitSkinController:ownsKitSkin(p51.kitSkin)
                end
                local v65 = nil
                for v66, v67 in u5.Services.PlayerProfileService:waitForProfile(p50).Data.kitSkins do
                    local _ = v66 - 1
                    if v67.skinType == p51.kitSkin == true then
                        v65 = v67
                        break
                    end
                end
                return v65 ~= nil
            end
            if p51.crate ~= nil then
                return false
            end
            if p51.clanShopContribution ~= nil then
                return false
            end
            if p51.bedBreakEffect ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsBedBreakEffect(p51.bedBreakEffect)
                end
                local v68 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.breakBedEffects
                local v69 = p51.bedBreakEffect
                return table.find(v68, v69) ~= nil
            end
            if p51.bedCoins ~= nil then
                return false
            end
            if p51.eventCurrency ~= nil then
                return false
            end
            if p51.consumable ~= nil then
                return false
            end
            if p51.comingSoonReward ~= nil then
                return false
            end
            if p51.bedSkin ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsBedSkin(p51.bedSkin)
                end
                local v70 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.bedSkins
                local v71 = p51.bedSkin
                return table.find(v70, v71) ~= nil
            end
            if p51.itemSkin ~= nil then
                if not u7:IsServer() then
                    return u4.Controllers.LockerController:ownsItemSkin(p51.itemSkin)
                end
                local v72 = u5.Services.PlayerProfileService:waitForProfile(p50).Data.locker.itemSkins
                local v73 = p51.itemSkin
                return table.find(v72, v73) ~= nil
            end
            if p51.armorTrimEffectUnlock == nil then
                return false
            end
            if not u7:IsServer() then
                return false
            end
            local v74 = u5.Services.PlayerProfileService:waitForProfile(p50).Data
            local v75 = p51.armorTrimEffectUnlock
            if v75.trim ~= nil then
                if v75.kit == nil then
                    return u12.isArmorTrimEffectUnlockedForTrim(v74.armorTrimEffectUnlocks, v75.trim, v75.effect)
                end
                local v76 = v74.armorTrimProgress[v75.kit]
                if v76 ~= nil then
                    v76 = nil
                    for v77, v78 in v76 do
                        local _ = v77 - 1
                        if v78.trim == v75.trim == true then
                            v76 = v78
                            break
                        end
                    end
                end
                if not v76 then
                    return false
                end
                local v79 = v76.effects
                if v79 ~= nil then
                    local v80 = v75.effect
                    v79 = table.find(v79, v80) ~= nil
                end
                if v79 == nil then
                    v79 = false
                end
                return v79 or u12.isArmorTrimEffectUnlockedForTrim(v74.armorTrimEffectUnlocks, v75.trim, v75.effect)
            end
            local v81 = v74.armorTrimEffectUnlocks.allTrims
            if v81 ~= nil then
                local v82 = v75.effect
                v81 = table.find(v81, v82) ~= nil
            end
            if v81 then
                return true
            end
            local v83 = 0
            local v84 = {}
            for v85, v86 in u6.values(u11) do
                local _ = v85 - 1
                if u12.isArmorTrimEffectGrantableForTrim(v86, v75.effect) == true then
                    v83 = v83 + 1
                    v84[v83] = v86
                end
            end
            local v87 = #v84 > 0
            if v87 then
                v87 = true
                for v88, v89 in v84 do
                    local _ = v88 - 1
                    if not u12.isArmorTrimEffectUnlockedForTrim(v74.armorTrimEffectUnlocks, v89, v75.effect) then
                        v87 = false
                        break
                    end
                end
            end
            return v87
        end
    }
}