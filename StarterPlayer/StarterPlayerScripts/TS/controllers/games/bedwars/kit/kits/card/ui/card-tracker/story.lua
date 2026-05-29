local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgradeType
local u4 = v1.import(script, script.Parent, "card-tracker").CardKit
return function(p5) --[[ Line: 6 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
    --]]
    local u6 = u2.mount(u2.createElement(u4, {
        ["cardProgress"] = 450,
        ["cardUpgrades"] = { u3.FIRE, u3.CARD_COUNT_INCREASE_I, u3.LIFE_STEAL }
    }), p5)
    return function() --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        return u2.unmount(u6)
    end
end