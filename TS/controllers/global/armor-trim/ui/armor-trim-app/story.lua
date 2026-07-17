-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local ArmorTrimReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "armor-trim-reducer").ArmorTrimReducer;
local LobbyReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "lobby-reducer").LobbyReducer;
local ArmorTrimType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimType;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local ArmorTrimApp = RuntimeLib.import(script, script.Parent, "armor-trim-app").ArmorTrimApp;

return function(p3) -- Line: 11
    -- upvalues: u2 (copy), LobbyReducer (copy), ArmorTrimReducer (copy), BedwarsKit (copy), ArmorTrimType (copy), u1 (copy), StoreProvider (copy), ArmorTrimApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Lobby = LobbyReducer,
        ArmorTrim = ArmorTrimReducer
    }), {
        ArmorTrim = {
            allKitProgress = {
                [BedwarsKit.BARBARIAN] = {
                    {
                        xpEarned = 400,
                        trim = ArmorTrimType.TRIM_5
                    }
                },
                [BedwarsKit.AERY] = {
                    {
                        xpEarned = 1000,
                        trim = ArmorTrimType.TRIM_1
                    }
                }
            },
            effectUnlocks = {},
            allKitXpPotential = {
                [BedwarsKit.BARBARIAN] = 20
            },
            selectedArmorTrimConfigs = {
                [BedwarsKit.BARBARIAN] = {
                    type = ArmorTrimType.TRIM_5,
                    color = {
                        r = 100,
                        g = 100,
                        b = 255
                    }
                }
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(ArmorTrimApp, {
            AppId = "ArmorTrimSelectionApp",
            SelectedKit = BedwarsKit.BARBARIAN
        }) }), p3);

    return function() -- Line: 51
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;