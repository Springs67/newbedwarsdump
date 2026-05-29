local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u6 = v1.import(script, script.Parent, "wizard-ability-bar-base").WizardAbilityBarBase
return function(p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u5
        [3] = u3
        [4] = u6
        [5] = u2
    --]]
    u4:dispatch({
        ["type"] = "KitWizardSetAbility",
        ["ability"] = u5.LIGHTNING_STRIKE
    })
    local u9 = u3("WizardAbilityBar", u6, {
        ["ChangeAbility"] = function(p8) --[[ Name: ChangeAbility, Line 14 ]]
            --[[
            Upvalues:
                [1] = u4
            --]]
            u4:dispatch({
                ["type"] = "KitWizardSetAbility",
                ["ability"] = p8
            })
        end,
        ["ChangeNextAbility"] = function() --[[ Name: ChangeNextAbility, Line 20 ]]
            return ""
        end,
        ["Abilities"] = { u5.LIGHTNING_STRIKE, u5.LIGHTNING_STORM },
        ["ExtraAbilities"] = { u5.SHOCKWAVE }
    }, {}, {
        ["Parent"] = p7
    })
    return function() --[[ Line: 28 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
        --]]
        u2.unmount(u9)
    end
end