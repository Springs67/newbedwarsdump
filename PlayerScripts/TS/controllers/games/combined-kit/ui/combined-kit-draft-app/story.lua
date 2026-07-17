-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local ClansReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer;
local ConsumableReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local DraftReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "draft-reducer").DraftReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local CombinedKitDraftApp = RuntimeLib.import(script, script.Parent, "combined-kit-draft-app").CombinedKitDraftApp;

return function(p4) -- Line: 15
    -- upvalues: u1 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), u3 (copy), GameReducer (copy), BedwarsReducer (copy), ClansReducer (copy), ConsumableReducer (copy), DraftReducer (copy), u2 (copy), StoreProvider (copy), CombinedKitDraftApp (copy)
    local function v8() -- Line: 16
        -- upvalues: u1 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
        local v5 = u1.values(BedwarsKit);

        local function _(p6) -- Line: 18
            -- upvalues: BedwarsKitSkin (ref)
            return { p6, BedwarsKitSkin.DEFAULT };
        end;

        local v7 = table.create(#v5);

        for i, v in v5 do
            local _ = i - 1;
            v7[i] = { v, BedwarsKitSkin.DEFAULT };
        end;

        return u1.fromEntries(v7);
    end;

    local v9 = u3.Store.new(u3.combineReducers({
        Game = GameReducer,
        Bedwars = BedwarsReducer,
        Clans = ClansReducer,
        Consumable = ConsumableReducer,
        Draft = DraftReducer
    }), {
        Bedwars = {
            playerLevel = 20,
            freeKitLevel = 20,
            favoriteKits = {
                [BedwarsKit.CYBER] = true,
                [BedwarsKit.NAZAR] = true,
                [BedwarsKit.FROSTY_HAMMER] = true
            },
            ownedKits = { BedwarsKit.FROSTY_HAMMER },
            equippedKitSkins = v8()
        },
        Clans = {}
    });
    local u10 = u2.mount(u2.createElement(StoreProvider, {
        store = v9
    }, { u2.createElement(CombinedKitDraftApp, {
            AppId = "CombinedKitDraftApp"
        }) }), p4);

    return function() -- Line: 58
        -- upvalues: u2 (ref), u10 (copy)
        return u2.unmount(u10);
    end;
end;