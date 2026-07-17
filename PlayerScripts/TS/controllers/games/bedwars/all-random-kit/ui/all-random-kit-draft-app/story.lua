-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local OfflinePlayerUtil = v1.OfflinePlayerUtil;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local Workspace = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace;
local ARKDraftReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "all-random-kit-draft-reducer").ARKDraftReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local AllRandomKitDraftApp = RuntimeLib.import(script, script.Parent, "all-random-kit-draft-app").AllRandomKitDraftApp;

return function(p5) -- Line: 18
    -- upvalues: OfflinePlayerUtil (copy), ColorUtil (copy), TeamColorHex (copy), u2 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), u4 (copy), GameReducer (copy), BedwarsReducer (copy), ARKDraftReducer (copy), Workspace (copy), u3 (copy), StoreProvider (copy), AllRandomKitDraftApp (copy)
    local v6 = {
        {
            id = "1",
            name = "Orange",
            members = {
                [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                [OfflinePlayerUtil.Dummy.Rascal.userId] = OfflinePlayerUtil.Dummy.Rascal,
                [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen
            },
            color = ColorUtil.hexColor(TeamColorHex.orange)
        },
        {
            id = "2",
            name = "Pink",
            members = {
                [OfflinePlayerUtil.Dummy.LongNameMan.userId] = OfflinePlayerUtil.Dummy.LongNameMan,
                [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
            },
            color = ColorUtil.hexColor(TeamColorHex.pink)
        }
    };

    local function v10() -- Line: 39
        -- upvalues: u2 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
        local v7 = u2.values(BedwarsKit);

        local function _(p8) -- Line: 41
            -- upvalues: BedwarsKitSkin (ref)
            return { p8, BedwarsKitSkin.DEFAULT };
        end;

        local v9 = table.create(#v7);

        for i, v in v7 do
            local _ = i - 1;
            v9[i] = { v, BedwarsKitSkin.DEFAULT };
        end;

        return u2.fromEntries(v9);
    end;

    local v11 = u4.Store.new(u4.combineReducers({
        Game = GameReducer,
        Bedwars = BedwarsReducer,
        ARKDraft = ARKDraftReducer
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
            equippedKitSkins = v10()
        },
        Game = {
            myTeam = v6[1],
            teams = v6,
            startTime = Workspace:GetServerTimeNow() + 15
        },
        ARKDraft = {
            kitSelection = {
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = BedwarsKit.FROSTY_HAMMER
            },
            kitPool = {
                {
                    kit = BedwarsKit.AERY,
                    othersCooldownExpireTime = Workspace:GetServerTimeNow(),
                    prevSelectionUserCooldownExpireTime = Workspace:GetServerTimeNow(),
                    prevSelectionUser = OfflinePlayerUtil.Dummy.Bryan3838.userId
                }
            },
            playerRerolls = {
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = 2
            }
        }
    });
    local u12 = u3.mount(u3.createElement(StoreProvider, {
        store = v11
    }, { u3.createElement(AllRandomKitDraftApp, {
            AppId = "AllRandomKitDraftApp"
        }) }), p5);

    return function() -- Line: 97
        -- upvalues: u3 (ref), u12 (copy)
        return u3.unmount(u12);
    end;
end;