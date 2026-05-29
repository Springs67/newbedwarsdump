local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").ItemSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-meta").BedBreakEffectMeta
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-meta").KillEffectMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-meta").LobbyGadgetMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil
local u21 = v1.import(script, script.Parent, "locker-preview-fullscreen-armor-trim-effect-menu").LockerPreviewFullscreenArmorTrimEffectMenu
local u22 = v1.import(script, script.Parent, "locker-preview-fullscreen-footer").LockerPreviewFullscreenFooter
local u23 = v3.values(u10)
table.sort(u23, function(p24, p25) --[[ Line: 25 ]]
    return p24 < p25
end)
local v99 = v5.new(u4)(function(u26, p27) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u2
        [4] = u20
        [5] = u18
        [6] = u16
        [7] = u12
        [8] = u19
        [9] = u17
        [10] = u15
        [11] = u14
        [12] = u13
        [13] = u7
        [14] = u9
        [15] = u11
        [16] = u4
        [17] = u21
        [18] = u23
        [19] = u22
    --]]
    local v28 = p27.useEffect
    local v29 = p27.useState
    local u30 = u26.PreviewItem.armorTrim
    local u31 = u26.PreviewItem.kit
    local u32
    if u31 == nil or u30 == nil then
        u32 = nil
    else
        u32 = u26.AllKitProgress[u31]
        if u32 ~= nil then
            u32 = nil
            for v33, v34 in u32 do
                local _ = v33 - 1
                if v34.trim == u30.type == true then
                    u32 = v34
                    break
                end
            end
        end
    end
    local v35
    if u31 == nil then
        v35 = nil
    else
        v35 = u26.SelectedArmorTrimConfigs[u31]
    end
    local v36 = u30 ~= nil
    if v36 then
        local v37
        if v35 == nil then
            v37 = v35
        else
            v37 = v35.type
        end
        v36 = v37 == u30.type
    end
    local u38
    if v36 then
        u38 = v35.effectType
    else
        u38 = nil
    end
    local u40, u41 = v29(function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u38
            [2] = u30
            [3] = u8
        --]]
        local v39 = u38
        if v39 == nil then
            v39 = u30
            if v39 ~= nil then
                v39 = v39.effectType
            end
            if v39 == nil then
                v39 = u8.DEFAULT
            end
        end
        return v39
    end)
    local v42
    if u30 == nil then
        v42 = u30
    else
        v42 = u30.armorSet
    end
    local u43, u44 = v29(v42 == nil and "LEATHER" or v42)
    local u46, u47 = v29(function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u10
        --]]
        local v45 = u30
        if v45 ~= nil then
            v45 = v45.effectRank
        end
        if v45 == nil then
            v45 = u10.T1
        end
        return v45
    end)
    local function v49() --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u44
            [3] = u10
            [4] = u47
        --]]
        if u30 then
            u44(u30.armorSet or "LEATHER")
            local v48 = u30.effectRank
            if v48 == nil then
                v48 = u10.T1
            end
            u47(v48)
        end
    end
    local v50
    if u30 == nil then
        v50 = u30
    else
        v50 = u30.type
    end
    local v51
    if u30 == nil then
        v51 = u30
    else
        v51 = u30.color
    end
    local v52
    if u30 == nil then
        v52 = u30
    else
        v52 = u30.effectRank
    end
    v28(v49, { v50, v51, v52 })
    local function v59() --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u38
            [3] = u41
            [4] = u2
            [5] = u31
            [6] = u43
            [7] = u46
        --]]
        if u30 then
            local v53 = u38 or u30.effectType
            u41(v53)
            local v54 = u2.Controllers.LockerPreviewController
            local v55 = {
                ["kit"] = u31
            }
            local v56 = {}
            for v57, v58 in u30 do
                v56[v57] = v58
            end
            v56.armorSet = u43
            v56.effectRank = u46
            v56.effectType = v53
            v55.armorTrim = v56
            v54:preview(v55)
        end
    end
    local v60
    if u30 == nil then
        v60 = u30
    else
        v60 = u30.type
    end
    local v61
    if u30 == nil then
        v61 = u30
    else
        v61 = u30.color
    end
    local v62
    if u30 == nil then
        v62 = u30
    else
        v62 = u30.effectRank
    end
    v28(v59, {
        v60,
        v61,
        v62,
        u38,
        u43,
        u46
    })
    local v63 = u20.canReplay(u26.PreviewItem)
    local v64 = ""
    local v65 = ""
    if u26.PreviewItem.killEffect then
        v64 = u18[u26.PreviewItem.killEffect].name
        v65 = "Kill Effect"
    elseif u26.PreviewItem.bedBreakEffect then
        v64 = u16[u26.PreviewItem.bedBreakEffect].name
        v65 = "Bed Break Effect"
    elseif u26.PreviewItem.bedSkin then
        local v66 = u12[u26.PreviewItem.bedSkin].name
        v64 = v66 == nil and "" or v66
        v65 = "Bed Skin"
    elseif u26.PreviewItem.lobbyGadget then
        local v67 = u19[u26.PreviewItem.lobbyGadget].name
        v64 = v67 == nil and "" or v67
        v65 = "Lobby Gadget"
    elseif u26.PreviewItem.itemSkin then
        local v68 = u12[u26.PreviewItem.itemSkin].name
        v64 = v68 == nil and "" or v68
        v65 = "Item Skin"
    elseif u26.PreviewItem.emote then
        local v69 = u17[u26.PreviewItem.emote].name
        v64 = v69 == nil and "" or v69
        v65 = "Emote"
    elseif u26.PreviewItem.kit and not u26.PreviewItem.kitSkin then
        local v70 = u15[u26.PreviewItem.kit].name
        v64 = v70 == nil and "" or v70
        v65 = "Kit"
    elseif u26.PreviewItem.kitSkin then
        local v71 = u14[u26.PreviewItem.kitSkin].name
        v64 = v71 == nil and "" or v71
        if u26.PreviewItem.kitSkin == u13.DEFAULT and u26.PreviewItem.kit then
            local v72 = u15[u26.PreviewItem.kit].name
            local v73 = v72 == nil and "" or v72
            v64 = v73 == "" and "Default" or "Default (" .. v73 .. ")"
        end
        v65 = "Kit Skin"
    end
    if u26.PreviewItem.armorTrim then
        v64 = u7[u40].name
        v65 = u9[u26.PreviewItem.armorTrim.type].name
    end
    v28(function() --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u2
        --]]
        return not u26.FromLocker and function() --[[ Line: 234 ]]
            --[[
            Upvalues:
                [1] = u2
            --]]
            u2.Controllers.LockerPreviewController:closePreview()
        end or nil
    end, {})
    local v74 = u30 == nil and {} or u11.getSelectableArmorTrimEffectTypes(u30.type)
    local function v77(p75) --[[ Line: 240 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u8
            [3] = u11
            [4] = u7
            [5] = u32
            [6] = u26
        --]]
        if u30 == nil then
            return false
        elseif p75 == u8.DEFAULT then
            return false
        else
            local v76 = u11.getSelectableArmorTrimEffectTypes(u30.type)
            if table.find(v76, p75) == nil then
                return true
            elseif u7[p75].unlockable == true then
                return not u11.canPlayerUseArmorTrimEffectOnTrim(u32, p75, u26.EffectUnlocks)
            else
                return false
            end
        end
    end
    local u78 = not v77(u40)
    if u38 == nil then
        if u30 == nil then
            u38 = u30
        else
            u38 = u30.effectType
        end
    end
    local v79
    if u38 == nil then
        v79 = false
    else
        v79 = u38 == u40
    end
    local v80 = {
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = true,
        ["ClipToDeviceSafeArea"] = false,
        ["DisplayOrder"] = 101
    }
    local v81 = {}
    local v82 = #v81
    local v83
    if u30 == nil or #v74 <= 0 then
        v83 = nil
    else
        v83 = u4.createElement(u21, {
            ["selectableTypes"] = v74,
            ["selectedEffectType"] = u40,
            ["armorTrimType"] = u30.type,
            ["previewEffectRank"] = u46,
            ["currentArmorSet"] = u43,
            ["equippedEffectType"] = u38,
            ["isLockedEffectType"] = v77,
            ["canEquipSelectedEffect"] = u78,
            ["isSelectedEffectEquipped"] = v79,
            ["onSelectEffectType"] = function(p84) --[[ Name: onSelectEffectType, Line 289 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u2
                    [3] = u31
                    [4] = u30
                    [5] = u43
                    [6] = u46
                --]]
                u41(p84)
                local v85 = u2.Controllers.LockerPreviewController
                local v86 = {
                    ["kit"] = u31
                }
                local v87 = {}
                for v88, v89 in u30 do
                    v87[v88] = v89
                end
                v87.armorSet = u43
                v87.effectRank = u46
                v87.effectType = p84
                v86.armorTrim = v87
                v85:preview(v86)
            end,
            ["onEquipSelectedEffect"] = function() --[[ Name: onEquipSelectedEffect, Line 306 ]]
                --[[
                Upvalues:
                    [1] = u78
                    [2] = u31
                    [3] = u2
                    [4] = u30
                    [5] = u40
                --]]
                if not u78 then
                    return nil
                end
                if u31 == nil then
                    return nil
                end
                u2.Controllers.ArmorTrimController:equipArmorTrimConfig(u31, u30.type, u30.color, u40)
            end,
            ["onSwitchArmorSet"] = function(p90) --[[ Name: onSwitchArmorSet, Line 315 ]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = u2
                    [3] = u31
                    [4] = u30
                    [5] = u46
                    [6] = u40
                --]]
                u44(p90)
                local v91 = u2.Controllers.LockerPreviewController
                local v92 = {
                    ["kit"] = u31
                }
                local v93 = {}
                for v94, v95 in u30 do
                    v93[v94] = v95
                end
                v93.armorSet = p90
                v93.effectRank = u46
                v93.effectType = u40
                v92.armorTrim = v93
                v91:preview(v92)
            end,
            ["onCyclePreviewEffectRank"] = function() --[[ Name: onCyclePreviewEffectRank, Line 332 ]]
                --[[
                Upvalues:
                    [1] = u47
                    [2] = u46
                    [3] = u23
                --]]
                local v96 = u47
                local v97 = u46
                local v98 = (table.find(u23, v97) or 0) - 1
                v96(u23[(v98 < 0 and 0 or v98 + 1) % #u23 + 1])
            end
        })
    end
    if v83 then
        v81[v82 + 1] = v83
    end
    v81[#v81 + 1] = u4.createElement(u22, {
        ["name"] = v64,
        ["previewName"] = v65,
        ["canReplay"] = v63,
        ["previewItem"] = u26.PreviewItem,
        ["onClose"] = u26.OnClose
    })
    return u4.createElement("ScreenGui", v80, v81)
end)
return {
    ["LockerPreviewFullscreen"] = v6.connect(function(p100, p101) --[[ Line: 350 ]]
        local v102 = {}
        for v103, v104 in p101 do
            v102[v103] = v104
        end
        v102.AllKitProgress = p100.ArmorTrim.allKitProgress
        v102.EffectUnlocks = p100.ArmorTrim.effectUnlocks
        v102.SelectedArmorTrimConfigs = p100.ArmorTrim.selectedArmorTrimConfigs
        return v102
    end)(v99)
}