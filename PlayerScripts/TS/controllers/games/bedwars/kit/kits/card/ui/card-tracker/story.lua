-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local CardUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgradeType;
local CardKit = RuntimeLib.import(script, script.Parent, "card-tracker").CardKit;

return function(p2) -- Line: 6
    -- upvalues: u1 (copy), CardKit (copy), CardUpgradeType (copy)
    local u3 = u1.mount(u1.createElement(CardKit, {
        cardProgress = 450,
        cardUpgrades = { CardUpgradeType.FIRE, CardUpgradeType.CARD_COUNT_INCREASE_I, CardUpgradeType.LIFE_STEAL }
    }), p2);

    return function() -- Line: 11
        -- upvalues: u1 (ref), u3 (copy)
        return u1.unmount(u3);
    end;
end;