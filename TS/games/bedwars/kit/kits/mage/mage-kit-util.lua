local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local v12 = {}
local u13 = setmetatable({}, {
    ["__index"] = v12
})
u13.ICE = "ice"
v12.ice = "ICE"
u13.FIRE = "fire"
v12.fire = "FIRE"
u13.NATURE = "nature"
v12.nature = "NATURE"
local u22 = {
    ["getUnlockedMageElements"] = function(p14) --[[ Name: getUnlockedMageElements, Line 35 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u13
        --]]
        local v15 = u6:getEntity(p14)
        if v15 ~= nil then
            v15 = v15:getInstance()
        end
        if not v15 then
            return {}
        end
        local v16 = {}
        for _, v17 in u3.values(u13) do
            local v18 = p14:GetAttribute(v17)
            if v18 ~= 0 and (v18 == v18 and (v18 ~= "" and v18)) then
                table.insert(v16, v17)
            end
        end
        return v16
    end,
    ["hasUnlockedMageElement"] = function(p19, p20) --[[ Name: hasUnlockedMageElement, Line 56 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        local v21 = u22.getUnlockedMageElements(p19)
        return table.find(v21, p20) ~= nil
    end
}
local u23 = nil
function u22.getMageStatusEffect(p24) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    return u23[p24].statusEffect
end
local v25 = {}
local v26 = {
    ["hatName"] = "MageHatBase",
    ["color"] = Color3.fromRGB(255, 227, 173)
}
local v27 = {
    ["fireDelaySec"] = 0.7,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 75 ]]
        return "mage_spell_base"
    end,
    ["launchSound"] = { v9.WHIM_CAST_BASE_1, v9.WHIM_CAST_BASE_2, v9.WHIM_CAST_BASE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = v5.FP_USE_ITEM
    }
}
v26.projectileSource = v27
v25.BASE = v26
local v28 = u13.NATURE
local v29 = {
    ["hatName"] = "MageHatNature",
    ["learnSound"] = v9.WHIM_LEARN_NATURE,
    ["icon"] = v7.LIFE_STEAL_ELEMENT,
    ["color"] = Color3.fromRGB(107, 214, 46)
}
local v30 = {
    ["fireDelaySec"] = 0.7,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 93 ]]
        return "mage_spell_nature"
    end,
    ["launchSound"] = { v9.WHIM_CAST_NATURE_1, v9.WHIM_CAST_NATURE_2, v9.WHIM_CAST_NATURE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = v5.FP_USE_ITEM
    }
}
v29.projectileSource = v30
v29.colorSequence = ColorSequence.new(Color3.fromRGB(150, 240, 122), Color3.fromRGB(79, 194, 46))
v29.statusEffect = v10.MAGE_NATURE_ELEMENT
v25[v28] = v29
local v31 = u13.FIRE
local v32 = {
    ["hatName"] = "MageHatFire",
    ["learnSound"] = v9.WHIM_LEARN_FIRE,
    ["icon"] = v7.FIRE_ENCHANT,
    ["color"] = Color3.fromRGB(227, 110, 66)
}
local v33 = {
    ["fireDelaySec"] = 0.7,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 113 ]]
        return "mage_spell_fire"
    end,
    ["launchSound"] = { v9.WHIM_CAST_FIRE_1, v9.WHIM_CAST_FIRE_2, v9.WHIM_CAST_FIRE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = v5.FP_USE_ITEM
    }
}
v32.projectileSource = v33
v32.statusEffect = v10.MAGE_FIRE_ELEMENT
v25[v31] = v32
local v34 = u13.ICE
local v35 = {
    ["hatName"] = "MageHatIce",
    ["learnSound"] = v9.WHIM_LEARN_ICE,
    ["icon"] = v7.MAGE_ICE_ICON,
    ["color"] = Color3.fromRGB(61, 184, 237)
}
local v36 = {
    ["fireDelaySec"] = 0.7,
    ["maxStrengthChargeSec"] = 0.25,
    ["minStrengthScalar"] = 0.7692307692307692,
    ["projectileType"] = function() --[[ Name: projectileType, Line 132 ]]
        return "mage_spell_ice"
    end,
    ["launchSound"] = { v9.WHIM_CAST_ICE_1, v9.WHIM_CAST_ICE_2, v9.WHIM_CAST_ICE_3 },
    ["firstPerson"] = {
        ["fireAnimation"] = v5.FP_USE_ITEM
    }
}
v35.projectileSource = v36
v35.statusEffect = v10.MAGE_ICE_ELEMENT
v25[v34] = v35
u23 = v25
u22.MageElementMeta = u23
local u37 = {}
function u22.changeMageKitAppearance(p38, p39, p40) --[[ Line: 149 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u6
        [3] = u37
        [4] = u4
        [5] = u11
        [6] = u2
        [7] = u8
    --]]
    local v41 = u23[p40]
    local v42 = u6:getEntity(p38)
    if v42 ~= nil then
        v42 = v42:getHumanoid()
    end
    local v43 = u37[p39]
    local v44
    if v43 == nil then
        v44 = v43
    else
        v44 = v43.Name
    end
    if v44 ~= v41.hatName then
        if v43 ~= nil then
            v43:Destroy()
        end
        local v45 = u4.Assets.Misc:FindFirstChild(v41.hatName)
        if v45 ~= nil then
            v45 = v45:Clone()
        end
        if v45 then
            u37[p39] = v45
            if v42 ~= nil then
                v42:AddAccessory(v45)
            end
        end
        u11:weldCharacterAccessories(p39)
    end
    for _, v46 in p39:GetDescendants() do
        if v46:IsA("BasePart") and (v46.Name == "MageNeon" or v46.Name == "TomeText") then
            v46.Color = v41.color
        end
    end
    local v47 = u2.Controllers.ViewmodelController:getViewModel()
    if v47 ~= nil then
        v47 = v47:WaitForChild(u8.MAGE_SPELLBOOK, 1)
    end
    if v47 then
        local v48 = v47:FindFirstChild("Handle")
        if v48 ~= nil then
            v48 = v48:FindFirstChild("TomeText")
        end
        if v48 then
            v48.Color = v41.color
        end
    end
end
return {
    ["MAGE_ELEMENT_CYCLE_INDEX"] = "MageElementIndex",
    ["MAGE_MAX_MANA"] = 100,
    ["MAGE_SPELL_MANA_COST"] = 15,
    ["MAGE_MANA_REGEN_PER_SECOND"] = 6,
    ["MAGE_REGEN_DELAY_AFTER_FIRE_SECONDS"] = 2.5,
    ["MageElement"] = u13,
    ["MageKitUtil"] = u22
}