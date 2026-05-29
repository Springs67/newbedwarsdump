local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-meta").ArmorTrimEffectMeta
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-effect-type").ArmorTrimEffectType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRankMeta
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type")
local u10 = v9.ArmorTrimPackType
local u11 = v9.ArmorTrimType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-unlock-definition").armorTrimUnlockDefinition
local v31 = {
    ["BLACK_LISTED_ARMOR_TRIM_KITS"] = {
        v4.BIGMAN,
        v4.TINKER,
        v4.VOID_KNIGHT,
        v4.RANDOM,
        v4.SKELETON
    },
    ["createArmorTrims"] = function(p13, u14, u15) --[[ Name: createArmorTrims, Line 19 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u8
        --]]
        local u16 = {}
        local v17 = u3:WaitForChild("Assets"):WaitForChild("ArmorTrims"):WaitForChild(p13)
        if not v17 then
            return {}
        end
        local v18 = 0
        local v19 = {}
        for v20, v21 in v17:GetDescendants() do
            local _ = v20 - 1
            if v21:IsA("Accessory") == true then
                v18 = v18 + 1
                v19[v18] = v21
            end
        end
        local function v28(p22) --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u15
                [3] = u14
                [4] = u16
            --]]
            local v23 = p22:Clone()
            local v24 = u8[u15]
            for v25, v26 in v23:GetDescendants() do
                local _ = v25 - 1
                if v26:IsA("BasePart") then
                    v26.Color = u14
                    v26.Transparency = 0
                    v26.Material = v24.material
                end
            end
            local v27 = u16
            table.insert(v27, v23)
        end
        for v29, v30 in v19 do
            v28(v30, v29 - 1, v19)
        end
        return u16
    end
}
local u32 = nil
function v31.getArmorTrimRate(p33, p34, p35) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u12
    --]]
    local v36 = u32(p34 or {}, p35)
    local v37 = 0
    for v38 = 1, #v36 do
        local v39 = v36[v38]
        local _ = v38 - 1
        local v40 = u12[v39]
        if v40 ~= nil then
            v40 = v40.unlockWeight
        end
        v37 = v37 + (v40 == nil and 1 or v40)
    end
    local v41 = u12[p33]
    if v41 ~= nil then
        v41 = v41.unlockWeight
    end
    local v42 = v41 == nil and 1 or v41
    local v43 = table.find(v36, p33) ~= nil
    if v43 then
        v43 = v37 ~= 0
    end
    if not v43 then
        return 0
    end
    local v44 = v42 / v37 * 100
    return math.floor(v44)
end
u32 = function(u45, p46) --[[ Name: getUnlockableArmorTrims, Line 102 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u11
        [3] = u12
        [4] = u10
        [5] = u7
    --]]
    local v47 = u2.values(u11)
    local function v52(p48) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v49 = false
        for v50, v51 in u45 do
            local _ = v50 - 1
            if v51.trim == p48 then
                v49 = true
                break
            end
        end
        return not v49
    end
    local v53 = 0
    local v54 = {}
    for v55, v56 in v47 do
        if v52(v56, v55 - 1, v47) == true then
            v53 = v53 + 1
            v54[v53] = v56
        end
    end
    local v57 = 0
    local v58 = {}
    for v59, v60 in v54 do
        local _ = v59 - 1
        local v61 = u12[v60]
        local v62
        if v61 then
            v62 = v61.requiredUnlockCount <= #u45
            local v63 = not v61.limited and true or v61.limited.endTime > os.time()
            local v64 = p46 == u10.ALL_RANDOM and true or u7[v60].packType == p46
            if v62 then
                v62 = v63 and v64
            end
        else
            v62 = false
        end
        if v62 == true then
            v57 = v57 + 1
            v58[v57] = v60
        end
    end
    return v58
end
v31.getUnlockableArmorTrims = u32
local function u75(p65) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u6
    --]]
    local v66 = u7[p65].effects
    if v66 ~= nil then
        v66 = v66.definition
    end
    if not v66 then
        return { u6.DEFAULT }
    end
    local v67 = v66.condition
    if v67 == "None" then
        return { v66.effectType }
    end
    if v67 == "Select" then
        local v68 = {}
        local v69 = #v68
        local v70 = v66.effectType
        table.move(v70, 1, #v70, v69 + 1, v68)
        return v68
    end
    if v67 == "TrimColor" then
        local v71 = {}
        local v72 = {}
        for _, v73 in v66.selectablePreviewTrimColors do
            local v74 = v66.effectType(v73)
            if v71[v74] == nil then
                v71[v74] = true
                table.insert(v72, v74)
            end
        end
        return v72
    end
end
v31.getSelectableArmorTrimEffectTypes = u75
local function u81(p76) --[[ Line: 190 ]]
    --[[
    Upvalues:
        [1] = u75
        [2] = u5
    --]]
    local v77 = 0
    local v78 = {}
    for v79, v80 in u75(p76) do
        local _ = v79 - 1
        if u5[v80].unlockable == true == true then
            v77 = v77 + 1
            v78[v77] = v80
        end
    end
    return v78
end
v31.getArmorTrimEffectUnlockPool = u81
function v31.isArmorTrimEffectGrantableForTrim(p82, p83) --[[ Line: 208 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u81
    --]]
    if p83 == u6.DEFAULT then
        return false
    end
    local v84 = u81(p82)
    return table.find(v84, p83) ~= nil
end
local function u89(p85, p86, p87) --[[ Line: 217 ]]
    local v88
    if p85 == nil then
        v88 = p85
    else
        v88 = p85[p86]
        if v88 ~= nil then
            v88 = table.find(v88, p87) ~= nil
        end
    end
    if v88 == nil then
        v88 = false
    end
    if v88 then
        p85 = v88
    else
        if p85 ~= nil then
            p85 = p85.allTrims
            if p85 ~= nil then
                p85 = table.find(p85, p87) ~= nil
            end
        end
        if p85 == nil then
            p85 = false
        end
    end
    return p85
end
v31.isArmorTrimEffectUnlockedForTrim = u89
function v31.canPlayerUseArmorTrimEffectOnTrim(p90, p91, p92) --[[ Line: 249 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u75
        [3] = u5
        [4] = u89
    --]]
    if p91 == nil or p91 == u6.DEFAULT then
        return true
    end
    if not p90 then
        return false
    end
    local v93 = u75(p90.trim)
    if table.find(v93, p91) == nil then
        return false
    end
    if not u5[p91].unlockable then
        return true
    end
    local v94 = p90.effects
    if v94 ~= nil then
        v94 = table.find(v94, p91) ~= nil
    end
    if v94 == nil then
        v94 = false
    end
    return v94 or u89(p92, p90.trim, p91)
end
return {
    ["ArmorTrimUtil"] = v31
}