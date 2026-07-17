-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CreateRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local WizardAbilityBarBase = RuntimeLib.import(script, script.Parent, "wizard-ability-bar-base").WizardAbilityBarBase;

return function(p2) -- Line: 8
    -- upvalues: ClientStore (copy), AbilityId (copy), CreateRoduxApp (copy), WizardAbilityBarBase (copy), u1 (copy)
    ClientStore:dispatch({
        type = "KitWizardSetAbility",
        ability = AbilityId.LIGHTNING_STRIKE
    });
    local u4 = CreateRoduxApp("WizardAbilityBar", WizardAbilityBarBase, {
        ChangeAbility = function(p3) -- Line: 14, Name: ChangeAbility
            -- upvalues: ClientStore (ref)
            ClientStore:dispatch({
                type = "KitWizardSetAbility",
                ability = p3
            });
        end,

        ChangeNextAbility = function() -- Line: 20, Name: ChangeNextAbility
            return "";
        end,

        Abilities = { AbilityId.LIGHTNING_STRIKE, AbilityId.LIGHTNING_STORM },
        ExtraAbilities = { AbilityId.SHOCKWAVE }
    }, {}, {
        Parent = p2
    });

    return function() -- Line: 28
        -- upvalues: u1 (ref), u4 (copy)
        u1.unmount(u4);
    end;
end;