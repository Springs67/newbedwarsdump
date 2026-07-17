-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local CustomMatchReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "custom-match-reducer").CustomMatchReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local BedPlatingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil;
local TopBarApp = RuntimeLib.import(script, script.Parent, "top-bar-app").TopBarApp;

return function(p3) -- Line: 12
    -- upvalues: u2 (copy), GameReducer (copy), BedwarsReducer (copy), CustomMatchReducer (copy), QueueType (copy), BedPlatingUtil (copy), u1 (copy), StoreProvider (copy), TopBarApp (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Game = GameReducer,
        Bedwars = BedwarsReducer,
        CustomMatch = CustomMatchReducer
    }), {
        Game = {
            queueType = QueueType.BEDWARS_TO2
        },
        Bedwars = {
            kills = { 3 },
            finalDeaths = { false },
            bedHealth = {
                ["1"] = {
                    maxHealth = 24,
                    health = 12
                }
            },
            bedPlatingHealth = {
                ["1"] = {
                    maxHealth = 24,
                    health = 24
                }
            },
            teamBedStatus = {
                ["1"] = BedPlatingUtil.BedStatus.BED_PLATING_ACTIVE
            }
        },
        CustomMatch = {
            mapSaveData = nil
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(TopBarApp, {
            AppId = "1",
            LocalPlayerId = 1,
            ForceGameApp = true
        }) }), p3);

    return function() -- Line: 57
        -- upvalues: u1 (ref), u5 (copy)
        return u1.unmount(u5);
    end;
end;