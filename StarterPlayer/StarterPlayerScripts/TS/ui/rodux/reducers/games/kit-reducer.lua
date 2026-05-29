local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-assassin-util").BloodAssassinUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyGunMode
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "necromancer", "necromancer-kit-util").NecromancerSummonType
local u6 = {
    ["barbarianRage"] = 0,
    ["iceQueenProgress"] = 0,
    ["canUseYetiAbilityNext"] = (1 / 0),
    ["lumenProgress"] = 0,
    ["emberProgress"] = 0,
    ["hannahCombo"] = 0,
    ["voidDragonProgress"] = 0,
    ["activeContract"] = nil,
    ["wizardAbility"] = v2.LIGHTNING_STRIKE,
    ["pigsyResources"] = {
        ["coin"] = 0
    },
    ["bloodUpgrades"] = v3:getDefaultAssassinUpgradeInfo(),
    ["availableContracts"] = {},
    ["cardAvailableUpgrades"] = {},
    ["cardUpgrades"] = {},
    ["frostyGunMode"] = v4.MIST,
    ["necromancerSummonType"] = v5.MELEE
}
return {
    ["KitReducer"] = function(p7, p8) --[[ Name: KitReducer, Line 27 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        if p7 == nil then
            p7 = u6
        end
        local v9 = p8.type
        if v9 == "KitBarbarianSetRage" then
            local v10 = {}
            for v11, v12 in p7 do
                v10[v11] = v12
            end
            v10.barbarianRage = p8.rage
            return v10
        end
        if v9 == "KitWizardSetAbility" then
            local v13 = {}
            for v14, v15 in p7 do
                v13[v14] = v15
            end
            v13.wizardAbility = p8.ability
            return v13
        end
        if v9 == "KitBountyHunterSetTarget" then
            local v16 = {}
            for v17, v18 in p7 do
                v16[v17] = v18
            end
            v16.bountyHunterTarget = p8.bountyHunterTarget
            return v16
        end
        if v9 == "KitAngelIncrementProgress" then
            local v19 = {}
            for v20, v21 in p7 do
                v19[v20] = v21
            end
            v19.angelProgress = p8.progress
            return v19
        end
        if v9 == "KitIceQueenSetProgress" then
            local v22 = {}
            for v23, v24 in p7 do
                v22[v23] = v24
            end
            v22.iceQueenProgress = p8.progress
            return v22
        end
        if v9 == "KitYetiSetWhenCanUseAbility" then
            local v25 = {}
            for v26, v27 in p7 do
                v25[v26] = v27
            end
            v25.canUseYetiAbilityNext = p8.when
            return v25
        end
        if v9 == "KitLumenIncrementProgress" then
            local v28 = {}
            for v29, v30 in p7 do
                v28[v29] = v30
            end
            local v31 = p7.lumenProgress
            v28.lumenProgress = (v31 == nil and 0 or v31) + p8.progress
            return v28
        end
        if v9 == "KitEmberIncrementProgress" then
            local v32 = {}
            for v33, v34 in p7 do
                v32[v33] = v34
            end
            local v35 = p7.emberProgress
            v32.emberProgress = (v35 == nil and 0 or v35) + p8.progress
            return v32
        end
        if v9 == "KitPigsyIncrementResource" then
            local v36 = {}
            for v37, v38 in p7 do
                v36[v37] = v38
            end
            v36.pigsyResources = p8.progress
            return v36
        end
        if v9 == "KitHannahSetCombo" then
            local v39 = {}
            for v40, v41 in p7 do
                v39[v40] = v41
            end
            v39.hannahCombo = p8.combo
            return v39
        end
        if v9 == "KitVoidDragonIncrementProgress" then
            local v42 = p7.voidDragonProgress
            local v43 = (v42 == nil and 0 or v42) + p8.progress
            local v44 = math.min(1, v43)
            local v45 = math.max(0, v44)
            local v46 = {}
            for v47, v48 in p7 do
                v46[v47] = v48
            end
            v46.voidDragonProgress = v45
            return v46
        end
        if v9 == "SetBloodUpgrades" then
            local v49 = {}
            for v50, v51 in p7 do
                v49[v50] = v51
            end
            v49.bloodUpgrades = p8.upgrades
            return v49
        end
        if v9 == "SetAvailableContracts" then
            local v52 = {}
            for v53, v54 in p7 do
                v52[v53] = v54
            end
            v52.availableContracts = p8.contracts
            return v52
        end
        if v9 == "SetActiveContract" then
            local v55 = {}
            for v56, v57 in p7 do
                v55[v56] = v57
            end
            v55.activeContract = p8.activeContract
            return v55
        end
        if v9 == "KitCardSetAvailableUpgrades" then
            local v58 = {}
            for v59, v60 in p7 do
                v58[v59] = v60
            end
            v58.cardAvailableUpgrades = p8.availableUpgrades
            return v58
        end
        if v9 == "KitCardSetUpgrades" then
            local v61 = {}
            for v62, v63 in p7 do
                v61[v62] = v63
            end
            v61.cardUpgrades = p8.upgrades
            return v61
        end
        if v9 == "FrostyGunSetMode" then
            local v64 = {}
            for v65, v66 in p7 do
                v64[v65] = v66
            end
            v64.frostyGunMode = p8.frostyGunMode
            return v64
        end
        if v9 ~= "NecromancerSetMode" then
            return p7
        end
        local v67 = {}
        for v68, v69 in p7 do
            v67[v68] = v69
        end
        v67.necromancerSummonType = p8.necromancerSummonMode
        return v67
    end
}