-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local BloodAssassinUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-assassin-util").BloodAssassinUtil;
local DefenderScannerMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "defender", "defender-kit-balance").DefenderScannerMode;
local FrostyGunMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "frosty-gun", "frosty-gun-util").FrostyGunMode;
local NecromancerSummonType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "necromancer", "necromancer-kit-util").NecromancerSummonType;
local u1 = {
    barbarianRage = 0,
    iceQueenProgress = 0,
    canUseYetiAbilityNext = (1 / 0),
    lumenProgress = 0,
    emberProgress = 0,
    hannahCombo = 0,
    voidDragonProgress = 0,
    activeContract = nil,
    wizardAbility = AbilityId.LIGHTNING_STRIKE,
    defenderScannerMode = DefenderScannerMode.PLACE,
    pigsyResources = {
        coin = 0
    },
    bloodUpgrades = BloodAssassinUtil:getDefaultAssassinUpgradeInfo(),
    availableContracts = {},
    cardAvailableUpgrades = {},
    cardUpgrades = {},
    frostyGunMode = FrostyGunMode.MIST,
    necromancerSummonType = NecromancerSummonType.MELEE
};

return {
    KitReducer = function(p2, p3) -- Line: 29, Name: KitReducer
        -- upvalues: u1 (copy)
        if p2 == nil then
            p2 = u1;
        end;

        local type = p3.type;

        if type == "KitBarbarianSetRage" then
            local v4 = {};

            for i, v in p2 do
                v4[i] = v;
            end;

            v4.barbarianRage = p3.rage;

            return v4;
        end;

        if type == "KitWizardSetAbility" then
            local v5 = {};

            for i, v in p2 do
                v5[i] = v;
            end;

            v5.wizardAbility = p3.ability;

            return v5;
        end;

        if type == "KitDefenderScannerSetMode" then
            local v6 = {};

            for i, v in p2 do
                v6[i] = v;
            end;

            v6.defenderScannerMode = p3.mode;

            return v6;
        end;

        if type == "KitBountyHunterSetTarget" then
            local v7 = {};

            for i, v in p2 do
                v7[i] = v;
            end;

            v7.bountyHunterTarget = p3.bountyHunterTarget;

            return v7;
        end;

        if type == "KitAngelIncrementProgress" then
            local v8 = {};

            for i, v in p2 do
                v8[i] = v;
            end;

            v8.angelProgress = p3.progress;

            return v8;
        end;

        if type == "KitIceQueenSetProgress" then
            local v9 = {};

            for i, v in p2 do
                v9[i] = v;
            end;

            v9.iceQueenProgress = p3.progress;

            return v9;
        end;

        if type == "KitYetiSetWhenCanUseAbility" then
            local v10 = {};

            for i, v in p2 do
                v10[i] = v;
            end;

            v10.canUseYetiAbilityNext = p3.when;

            return v10;
        end;

        if type == "KitLumenIncrementProgress" then
            local v11 = {};

            for i, v in p2 do
                v11[i] = v;
            end;

            local lumenProgress = p2.lumenProgress;
            v11.lumenProgress = (lumenProgress == nil and 0 or lumenProgress) + p3.progress;

            return v11;
        end;

        if type == "KitEmberIncrementProgress" then
            local v12 = {};

            for i, v in p2 do
                v12[i] = v;
            end;

            local emberProgress = p2.emberProgress;
            v12.emberProgress = (emberProgress == nil and 0 or emberProgress) + p3.progress;

            return v12;
        end;

        if type == "KitPigsyIncrementResource" then
            local v13 = {};

            for i, v in p2 do
                v13[i] = v;
            end;

            v13.pigsyResources = p3.progress;

            return v13;
        end;

        if type == "KitHannahSetCombo" then
            local v14 = {};

            for i, v in p2 do
                v14[i] = v;
            end;

            v14.hannahCombo = p3.combo;

            return v14;
        end;

        if type == "KitVoidDragonIncrementProgress" then
            local voidDragonProgress = p2.voidDragonProgress;
            local v15 = math.min(1, (voidDragonProgress == nil and 0 or voidDragonProgress) + p3.progress);
            local v16 = math.max(0, v15);
            local v17 = {};

            for i, v in p2 do
                v17[i] = v;
            end;

            v17.voidDragonProgress = v16;

            return v17;
        end;

        if type == "SetBloodUpgrades" then
            local v18 = {};

            for i, v in p2 do
                v18[i] = v;
            end;

            v18.bloodUpgrades = p3.upgrades;

            return v18;
        end;

        if type == "SetAvailableContracts" then
            local v19 = {};

            for i, v in p2 do
                v19[i] = v;
            end;

            v19.availableContracts = p3.contracts;

            return v19;
        end;

        if type == "SetActiveContract" then
            local v20 = {};

            for i, v in p2 do
                v20[i] = v;
            end;

            v20.activeContract = p3.activeContract;

            return v20;
        end;

        if type == "KitCardSetAvailableUpgrades" then
            local v21 = {};

            for i, v in p2 do
                v21[i] = v;
            end;

            v21.cardAvailableUpgrades = p3.availableUpgrades;

            return v21;
        end;

        if type == "KitCardSetUpgrades" then
            local v22 = {};

            for i, v in p2 do
                v22[i] = v;
            end;

            v22.cardUpgrades = p3.upgrades;

            return v22;
        end;

        if type == "FrostyGunSetMode" then
            local v23 = {};

            for i, v in p2 do
                v23[i] = v;
            end;

            v23.frostyGunMode = p3.frostyGunMode;

            return v23;
        end;

        if type ~= "NecromancerSetMode" then
            return p2;
        end;

        local v24 = {};

        for i, v in p2 do
            v24[i] = v;
        end;

        v24.necromancerSummonType = p3.necromancerSummonMode;

        return v24;
    end
};