-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local KitReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "kit-reducer").KitReducer;
local CardUpgradeType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "card", "card-util").CardUpgradeType;
local CardUpgradesApp = RuntimeLib.import(script, script.Parent, "card-upgrades").CardUpgradesApp;

return function(p3) -- Line: 9
    -- upvalues: u2 (copy), KitReducer (copy), CardUpgradeType (copy), u1 (copy), StoreProvider (copy), CardUpgradesApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Kit = KitReducer
    }), {
        Kit = {
            cardUpgrades = {
                CardUpgradeType.CARD_COUNT_INCREASE_II,
                CardUpgradeType.FIRE,
                CardUpgradeType.KNOCKBACK,
                CardUpgradeType.MINISIZED,
                CardUpgradeType.LIFE_STEAL
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(CardUpgradesApp, {
            AppId = "CardUpgradesApp"
        }) }), p3);

    return function() -- Line: 24
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;