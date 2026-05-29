local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u11 = {
    ["bedSkin"] = nil,
    ["selectedKillEffect"] = v6.NONE,
    ["killEffects"] = { v6.NONE },
    ["selectedEmotes"] = { u5.BED_BREAK },
    ["emotes"] = { u5.BED_BREAK },
    ["selectedTitle"] = v9.NONE,
    ["titles"] = { v9.NONE },
    ["selectedLobbyGadget"] = v7.NONE,
    ["lobbyGadgets"] = { v7.NONE },
    ["selectedWinEffect"] = v10.NONE,
    ["winEffects"] = { v10.NONE },
    ["selectedBreakBedEffect"] = v4.NONE,
    ["breakBedEffects"] = { v4.NONE },
    ["featuredBadges"] = { v3.NONE },
    ["badges"] = { v3.NONE },
    ["bedSkins"] = {},
    ["selectedItemSkins"] = {},
    ["itemSkins"] = {},
    ["limitedReward"] = {}
}
return {
    ["LockerReducer"] = function(p12, p13) --[[ Name: LockerReducer, Line 37 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u2
            [3] = u8
            [4] = u5
        --]]
        if p12 == nil then
            p12 = u11
        end
        local u14 = {}
        for v15, v16 in p12 do
            u14[v15] = v16
        end
        local v17 = p13.type
        if v17 == "LockerUpdateAll" then
            u14 = p13.locker
        elseif v17 == "LockerSetOwnedItems" then
            local v18 = u2.entries(p13.items)
            local function v22(p19) --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u14
                --]]
                local v20 = p19[1]
                local v21 = p19[2]
                if v20 == u8.TITLE then
                    u14.titles = v21
                    return
                elseif v20 == u8.EMOTE then
                    u14.emotes = v21
                    return
                elseif v20 == u8.BED_BREAK_EFFECT then
                    u14.breakBedEffects = v21
                    return
                elseif v20 == u8.KILL_EFFECT then
                    u14.killEffects = v21
                    return
                elseif v20 == u8.LOBBY_GADGET then
                    u14.lobbyGadgets = v21
                    return
                elseif v20 == u8.WIN_EFFECT then
                    u14.winEffects = v21
                    return
                elseif v20 == u8.BADGE then
                    u14.badges = v21
                    return
                elseif v20 == u8.BED_SKIN then
                    u14.bedSkins = v21
                    return
                elseif v20 == u8.ITEM_SKIN then
                    u14.itemSkins = v21
                end
            end
            for v23, v24 in v18 do
                v22(v24, v23 - 1, v18)
            end
        elseif v17 == "LockerAddOwnedItems" then
            local v25 = u2.entries(p13.items)
            local function v74(p26) --[[ Line: 103 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u14
                --]]
                local v27 = p26[1]
                local v28 = p26[2]
                if v27 == u8.TITLE then
                    local v29 = {}
                    local v30 = #v29
                    local v31 = u14.titles
                    local v32 = #v31
                    table.move(v31, 1, v32, v30 + 1, v29)
                    local v33 = v30 + v32
                    table.move(v28, 1, #v28, v33 + 1, v29)
                    u14.titles = v29
                    return
                elseif v27 == u8.EMOTE then
                    local v34 = {}
                    local v35 = #v34
                    local v36 = u14.emotes
                    local v37 = #v36
                    table.move(v36, 1, v37, v35 + 1, v34)
                    local v38 = v35 + v37
                    table.move(v28, 1, #v28, v38 + 1, v34)
                    u14.emotes = v34
                    return
                elseif v27 == u8.BED_BREAK_EFFECT then
                    local v39 = {}
                    local v40 = #v39
                    local v41 = u14.breakBedEffects
                    local v42 = #v41
                    table.move(v41, 1, v42, v40 + 1, v39)
                    local v43 = v40 + v42
                    table.move(v28, 1, #v28, v43 + 1, v39)
                    u14.breakBedEffects = v39
                    return
                elseif v27 == u8.KILL_EFFECT then
                    local v44 = {}
                    local v45 = #v44
                    local v46 = u14.killEffects
                    local v47 = #v46
                    table.move(v46, 1, v47, v45 + 1, v44)
                    local v48 = v45 + v47
                    table.move(v28, 1, #v28, v48 + 1, v44)
                    u14.killEffects = v44
                    return
                elseif v27 == u8.LOBBY_GADGET then
                    local v49 = {}
                    local v50 = #v49
                    local v51 = u14.lobbyGadgets
                    local v52 = #v51
                    table.move(v51, 1, v52, v50 + 1, v49)
                    local v53 = v50 + v52
                    table.move(v28, 1, #v28, v53 + 1, v49)
                    u14.lobbyGadgets = v49
                    return
                elseif v27 == u8.WIN_EFFECT then
                    local v54 = {}
                    local v55 = #v54
                    local v56 = u14.winEffects
                    local v57 = #v56
                    table.move(v56, 1, v57, v55 + 1, v54)
                    local v58 = v55 + v57
                    table.move(v28, 1, #v28, v58 + 1, v54)
                    u14.winEffects = v54
                    return
                elseif v27 == u8.BADGE then
                    local v59 = {}
                    local v60 = #v59
                    local v61 = u14.badges
                    local v62 = #v61
                    table.move(v61, 1, v62, v60 + 1, v59)
                    local v63 = v60 + v62
                    table.move(v28, 1, #v28, v63 + 1, v59)
                    u14.badges = v59
                    return
                elseif v27 == u8.BED_SKIN then
                    local v64 = {}
                    local v65 = #v64
                    local v66 = u14.bedSkins
                    local v67 = #v66
                    table.move(v66, 1, v67, v65 + 1, v64)
                    local v68 = v65 + v67
                    table.move(v28, 1, #v28, v68 + 1, v64)
                    u14.bedSkins = v64
                    return
                elseif v27 == u8.ITEM_SKIN then
                    local v69 = {}
                    local v70 = #v69
                    local v71 = u14.itemSkins
                    local v72 = #v71
                    table.move(v71, 1, v72, v70 + 1, v69)
                    local v73 = v70 + v72
                    table.move(v28, 1, #v28, v73 + 1, v69)
                    u14.itemSkins = v69
                end
            end
            for v75, v76 in v25 do
                v74(v76, v75 - 1, v25)
            end
        elseif v17 == "LockerSetKillEffect" then
            u14.selectedKillEffect = p13.killEffect
        elseif v17 == "LockerSetWinEffect" then
            u14.selectedWinEffect = p13.winEffect
        elseif v17 == "LockerSetEmote" then
            if p13.emote == u5.NONE then
                u14.selectedEmotes[p13.slot] = nil
            else
                u14.selectedEmotes[p13.slot] = p13.emote
            end
        elseif v17 == "LockerSetEmoteWheel" then
            u14.selectedEmotes = p13.emoteWheel
        elseif v17 == "LockerSetTitle" then
            u14.selectedTitle = p13.title
        elseif v17 == "LockerSetBreakBedEffect" then
            u14.selectedBreakBedEffect = p13.breakBedEffect
        elseif v17 == "LockerSetLobbyGadget" then
            u14.selectedLobbyGadget = p13.lobbyGadget
        elseif v17 == "LockerSetFeaturedBadge" then
            u14.featuredBadges = { p13.badge }
        elseif v17 == "LockerSetBedSkin" then
            u14.bedSkin = p13.bedSkin
        elseif v17 == "LockerSetItemSkin" then
            if p13.itemSkin then
                u14.selectedItemSkins[p13.itemType] = p13.itemSkin
            else
                u14.selectedItemSkins[p13.itemType] = nil
            end
        elseif v17 == "LockerSetSelectedItemSkins" then
            u14.selectedItemSkins = p13.selectedItemSkins
        end
        return u14
    end
}