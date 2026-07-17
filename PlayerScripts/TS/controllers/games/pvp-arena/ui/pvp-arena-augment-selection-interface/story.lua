-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local AppReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "app-reducer").AppReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local PvPArenaAugmentSelectionInterface = RuntimeLib.import(script, script.Parent, "pvp-arena-augment-selection-interface").PvPArenaAugmentSelectionInterface;

return function(p3) -- Line: 11
    -- upvalues: u2 (copy), BedwarsReducer (copy), GameReducer (copy), AppReducer (copy), u1 (copy), StoreProvider (copy), PvPArenaAugmentSelectionInterface (copy), PvPArenaAugmentType (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Bedwars = BedwarsReducer,
        Game = GameReducer,
        App = AppReducer
    }), {
        Bedwars = {}
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement(PvPArenaAugmentSelectionInterface, {
            AppId = "PvPArenaAugmentVotingInterface",
            Rerolls = 2,
            SelectionEndTime = os.time() + 1000,
            Augments = { PvPArenaAugmentType.INVISIBILITY_JUTSU, PvPArenaAugmentType.DECAYING_SHIELD, PvPArenaAugmentType.PROJECTILE_DAMAGE }
        }) }), p3);

    return function() -- Line: 30
        -- upvalues: u1 (ref), u5 (copy)
        u1.unmount(u5);
    end;
end;