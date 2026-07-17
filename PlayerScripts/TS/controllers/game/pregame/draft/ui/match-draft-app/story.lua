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
local ClansReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "clan-reducer").ClansReducer;
local ConsumableReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "consumable-reducer").ConsumableReducer;
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local DraftReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "draft-reducer").DraftReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types");
local Consumable = v5.Consumable;
local ConsumableStatus = v5.ConsumableStatus;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local TeamColorHex = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local MatchDraftMode = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-mode").MatchDraftMode;
local MatchDraftPhase = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-phase").MatchDraftPhase;
local MatchDraftSelectorOption = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "draft", "match-draft-selector-options").MatchDraftSelectorOption;
local MatchDraftApp = RuntimeLib.import(script, script.Parent, "match-draft-app").MatchDraftApp;

return function(p6) -- Line: 27
    -- upvalues: OfflinePlayerUtil (copy), ColorUtil (copy), TeamColorHex (copy), u2 (copy), BedwarsKit (copy), BedwarsKitSkin (copy), u4 (copy), GameReducer (copy), BedwarsReducer (copy), ClansReducer (copy), ConsumableReducer (copy), DraftReducer (copy), QueueType (copy), ConsumableStatus (copy), Consumable (copy), MatchDraftMode (copy), MatchDraftPhase (copy), Workspace (copy), MatchDraftSelectorOption (copy), u3 (copy), StoreProvider (copy), MatchDraftApp (copy)
    local v7 = {
        {
            id = "1",
            name = "Blue",
            members = {
                [OfflinePlayerUtil.Dummy.Chase.userId] = OfflinePlayerUtil.Dummy.Chase,
                [OfflinePlayerUtil.Dummy.oiogy.userId] = OfflinePlayerUtil.Dummy.oiogy,
                [OfflinePlayerUtil.Dummy.Bryan3838.userId] = OfflinePlayerUtil.Dummy.Bryan3838,
                [OfflinePlayerUtil.Dummy.Asen.userId] = OfflinePlayerUtil.Dummy.Asen
            },
            color = ColorUtil.hexColor(TeamColorHex.lightBlue)
        },
        {
            id = "2",
            name = "Orange",
            members = {
                [OfflinePlayerUtil.Dummy.LongNameMan.userId] = OfflinePlayerUtil.Dummy.LongNameMan,
                [OfflinePlayerUtil.Dummy.DVwastaken.userId] = OfflinePlayerUtil.Dummy.DVwastaken
            },
            color = ColorUtil.hexColor(TeamColorHex.orange)
        }
    };

    local function v11() -- Line: 47
        -- upvalues: u2 (ref), BedwarsKit (ref), BedwarsKitSkin (ref)
        local v8 = u2.values(BedwarsKit);

        local function _(p9) -- Line: 49
            -- upvalues: BedwarsKitSkin (ref)
            return { p9, BedwarsKitSkin.DEFAULT };
        end;

        local v10 = table.create(#v8);

        for i, v in v8 do
            local _ = i - 1;
            v10[i] = { v, BedwarsKitSkin.DEFAULT };
        end;

        return u2.fromEntries(v10);
    end;

    local v12 = u4.Store.new(u4.combineReducers({
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
            equippedKitSkins = v11()
        },
        Game = {
            myTeam = v7[1],
            teams = v7,
            queueType = QueueType.BEDWARS_RANKED_S16
        },
        Clans = {},
        Consumable = {
            record = {
                ["1"] = {
                    id = "1",
                    matchUsesLeft = 3,
                    status = ConsumableStatus.ACTIVE,
                    consumable = Consumable.BATTLE_PASS_2X
                },
                ["2"] = {
                    id = "2",
                    status = ConsumableStatus.ACTIVE,
                    consumable = Consumable.BATTLE_PASS_3X,
                    endTime = os.clock() + 86400
                }
            }
        },
        Draft = {
            draftMode = MatchDraftMode.MULTI_TEAM,
            sharedData = {
                draftEnded = false,
                completedPhases = {},
                matchDraftPhase = MatchDraftPhase.LOADING,
                matchDraftPhaseEndTime = Workspace:GetServerTimeNow() + 5,
                kitBans = {
                    ["1"] = { BedwarsKit.CYBER },
                    ["2"] = { BedwarsKit.AERY }
                }
            },
            teamData = {
                votedKitBans = {
                    [OfflinePlayerUtil.Dummy.oiogy.userId] = {
                        kit = BedwarsKit.BIGMAN,
                        selectorOption = MatchDraftSelectorOption.HOVER
                    },
                    [OfflinePlayerUtil.Dummy.Bryan3838.userId] = {
                        kit = BedwarsKit.AGNI,
                        selectorOption = MatchDraftSelectorOption.HOVER
                    },
                    [OfflinePlayerUtil.Dummy.Chase.userId] = {
                        kit = BedwarsKit.SLIME_TAMER,
                        selectorOption = MatchDraftSelectorOption.SELECT
                    },
                    [OfflinePlayerUtil.Dummy.Asen.userId] = {
                        kit = BedwarsKit.AIRBENDER,
                        selectorOption = MatchDraftSelectorOption.HOVER
                    }
                },
                kitSelection = {
                    [OfflinePlayerUtil.Dummy.oiogy.userId] = {
                        kit = BedwarsKit.METAL_DETECTOR,
                        selectorOption = MatchDraftSelectorOption.HOVER
                    },
                    [OfflinePlayerUtil.Dummy.Bryan3838.userId] = {
                        kit = BedwarsKit.SEAHORSE,
                        selectorOption = MatchDraftSelectorOption.HOVER
                    },
                    [OfflinePlayerUtil.Dummy.Chase.userId] = {
                        kit = BedwarsKit.VOID_KNIGHT,
                        selectorOption = MatchDraftSelectorOption.SELECT
                    },
                    [OfflinePlayerUtil.Dummy.Asen.userId] = {
                        kit = BedwarsKit.BLOCK_KICKER,
                        selectorOption = MatchDraftSelectorOption.HOVER
                    }
                }
            },
            enemyTeamData = {
                ["2"] = {
                    playersVoted = {
                        [OfflinePlayerUtil.Dummy.DVwastaken.userId] = true
                    }
                }
            }
        }
    });
    local u13 = u3.mount(u3.createElement(StoreProvider, {
        store = v12
    }, { u3.createElement(MatchDraftApp, {
            AppId = "MatchDraftApp",
            MapId = "to4_Blossom"
        }) }), p6);

    return function() -- Line: 169
        -- upvalues: u3 (ref), u13 (copy)
        return u3.unmount(u13);
    end;
end;