local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u5 = {
    {
        ["manaRegenRate"] = 0.3,
        ["castRange"] = 50,
        ["itemType"] = v4.WIZARD_STAFF,
        ["manaId"] = v2.WIZARD_MANA,
        ["abilities"] = { v2.LIGHTNING_STRIKE }
    },
    {
        ["manaRegenRate"] = 0.45,
        ["castRange"] = 55,
        ["itemType"] = v4.WIZARD_STAFF_2,
        ["manaId"] = v2.WIZARD_MANA_2,
        ["abilities"] = { v2.LIGHTNING_STRIKE },
        ["extraAbilities"] = { v2.SHOCKWAVE }
    },
    {
        ["manaRegenRate"] = 0.55,
        ["castRange"] = 60,
        ["itemType"] = v4.WIZARD_STAFF_3,
        ["manaId"] = v2.WIZARD_MANA_3,
        ["abilities"] = { v2.LIGHTNING_STRIKE, v2.LIGHTNING_STORM },
        ["extraAbilities"] = { v2.SHOCKWAVE }
    }
}
local u6 = {
    {
        ["manaCost"] = 1,
        ["abilityType"] = v2.LIGHTNING_STRIKE,
        ["imageId"] = v3.WIZARD_LIGHTNING_STRIKE
    },
    {
        ["manaCost"] = 1,
        ["abilityType"] = v2.SHOCKWAVE,
        ["imageId"] = v3.WIZARD_SHOCKWAVE
    },
    {
        ["manaCost"] = 4,
        ["abilityType"] = v2.LIGHTNING_STORM,
        ["imageId"] = v3.WIZARD_THUNDERSTORM
    }
}
local u7 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "WizardUtil"
    end
})
u7.__index = u7
function u7.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    local v8 = u7
    local v9 = setmetatable({}, v8)
    return v9:constructor(...) or v9
end
function u7.constructor(_) --[[ Line: 52 ]] end
function u7.isWizardStaff(_, p10) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v11 = nil
    for v12, v13 in u5 do
        local _ = v12 - 1
        if v13.itemType == p10 == true then
            v11 = v13
            break
        end
    end
    return v11 and true or false
end
function u7.getStaffs(_) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v14 = {}
    for v15, v16 in u5 do
        local _ = v15 - 1
        local v17 = v16.itemType
        table.insert(v14, v17)
    end
    return v14
end
function u7.getStaffAbilities(_, p18) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v19 = nil
    for v20, v21 in u5 do
        local _ = v20 - 1
        if v21.itemType == p18 == true then
            v19 = v21
            break
        end
    end
    if v19 ~= nil then
        v19 = v19.abilities
    end
    return v19
end
function u7.getStaffExtraAbilities(_, p22) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v23 = nil
    for v24, v25 in u5 do
        local _ = v24 - 1
        if v25.itemType == p22 == true then
            v23 = v25
            break
        end
    end
    if v23 ~= nil then
        v23 = v23.extraAbilities
    end
    return v23
end
function u7.getManaId(_, p26) --[[ Line: 121 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v27 = nil
    for v28, v29 in u5 do
        local _ = v28 - 1
        if v29.itemType == p26 == true then
            v27 = v29
            break
        end
    end
    if v27 ~= nil then
        v27 = v27.manaId
    end
    return v27
end
function u7.getManaRegenRate(_, p30) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v31 = nil
    for v32, v33 in u5 do
        local _ = v32 - 1
        if v33.itemType == p30 == true then
            v31 = v33
            break
        end
    end
    if v31 ~= nil then
        v31 = v31.manaRegenRate
    end
    return v31 == nil and 0.2 or v31
end
function u7.getManaIds(_) --[[ Line: 165 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v34 = {}
    for v35, v36 in u5 do
        local _ = v35 - 1
        local v37 = v36.manaId
        table.insert(v34, v37)
    end
    return v34
end
function u7.getAbilityImage(_, p38) --[[ Line: 177 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v39 = nil
    for v40, v41 in u6 do
        local _ = v40 - 1
        if v41.abilityType == p38 == true then
            v39 = v41
            break
        end
    end
    if v39 ~= nil then
        v39 = v39.imageId
    end
    return v39
end
function u7.getAbilityCost(_, p42) --[[ Line: 196 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v43 = nil
    for v44, v45 in u6 do
        local _ = v44 - 1
        if v45.abilityType == p42 == true then
            v43 = v45
            break
        end
    end
    if v43 ~= nil then
        v43 = v43.manaCost
    end
    return v43
end
function u7.hasAbility(_, p46, p47) --[[ Line: 215 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v48 = nil
    for v49, v50 in u5 do
        local _ = v49 - 1
        if v50.itemType == p46 == true then
            v48 = v50
            break
        end
    end
    local v51
    if v48 == nil then
        v51 = v48
    else
        local v52 = v48.abilities
        v51 = table.find(v52, p47) ~= nil
    end
    if v51 then
        v48 = v51
    elseif v48 ~= nil then
        v48 = v48.extraAbilities
        if v48 ~= nil then
            v48 = table.find(v48, p47) ~= nil
        end
    end
    return v48 and true or false
end
function u7.getCastRange(_, p53) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v54 = nil
    for v55, v56 in u5 do
        local _ = v55 - 1
        if v56.itemType == p53 == true then
            v54 = v56
            break
        end
    end
    if v54 ~= nil then
        v54 = v54.castRange
    end
    return v54 == nil and 0 or v54
end
return {
    ["WizardStaffs"] = u5,
    ["WizardAbilities"] = u6,
    ["WizardUtil"] = u7
}