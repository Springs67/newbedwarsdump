-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local KitReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "kit-reducer").KitReducer;
local BloodUpgrade = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "blood-assassin", "blood-upgrade").BloodUpgrade;
local ContractSelectApp = RuntimeLib.import(script, script.Parent, "contract-select-app").ContractSelectApp;

return function(p3) -- Line: 10
    -- upvalues: u2 (copy), KitReducer (copy), BloodUpgrade (copy), Workspace (copy), u1 (copy), StoreProvider (copy), ContractSelectApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Kit = KitReducer
    }), {
        Kit = {
            bloodUpgrades = {
                [BloodUpgrade.DAMAGE] = 3,
                [BloodUpgrade.ARMOR_PEN] = 15,
                [BloodUpgrade.THRILL_OF_THE_HUNT] = 1
            },
            availableContracts = {},
            activeContract = {
                rewardValue = 1,
                id = 0.5,
                rewardUpgrade = BloodUpgrade.ASSASSIN_INSTINCT,
                rewardExplanation = {
                    assassin = true
                },
                activationTime = Workspace:GetServerTimeNow() - 35
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(ContractSelectApp, {
            AppId = "ContractSelect"
        }) }), p3);

    return function() -- Line: 51
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;