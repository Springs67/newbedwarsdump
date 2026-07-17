-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local OfflinePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").OfflinePlayerUtil;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local StoreProvider = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src");
local BedwarsReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "bedwars-reducer").BedwarsReducer;
local GameReducer = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer;
local PvPArenaAugmentType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-type").PvPArenaAugmentType;
local PvPArenaIntermissionUI = RuntimeLib.import(script, script.Parent, "pvp-arena-intermission-ui").PvPArenaIntermissionUI;
local PvPArenaRoundUI = RuntimeLib.import(script, script.Parent, "pvp-arena-round-ui").PvPArenaRoundUI;

return function(p3) -- Line: 12
    -- upvalues: u2 (copy), BedwarsReducer (copy), GameReducer (copy), OfflinePlayerUtil (copy), PvPArenaAugmentType (copy), u1 (copy), StoreProvider (copy), PvPArenaRoundUI (copy), PvPArenaIntermissionUI (copy)
    local v4 = u2.Store.new(u2.combineReducers({
        Bedwars = BedwarsReducer,
        Game = GameReducer
    }), {
        Bedwars = {
            pvpArena = {
                userIdAugmentMap = {
                    [OfflinePlayerUtil.Dummy.Bryan3838.userId] = {
                        PvPArenaAugmentType.AERY,
                        PvPArenaAugmentType.GOLIATH,
                        PvPArenaAugmentType.GOLDEN_APPLE,
                        PvPArenaAugmentType.BULK_UP,
                        PvPArenaAugmentType.BAKERS_DELIGHT,
                        PvPArenaAugmentType.MELODY_GUITAR
                    }
                }
            }
        },
        Game = {
            pvpArenaTeamHealth = {
                {
                    health = 100,
                    team = {
                        id = "1",
                        name = "Blue",
                        color = Color3.fromHex("#49b4f2"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 100,
                    team = {
                        id = "2",
                        name = "Orange",
                        color = Color3.fromHex("#f28e29"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 90,
                    team = {
                        id = "3",
                        name = "Pink",
                        color = Color3.fromHex("#ff55ff"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 90,
                    team = {
                        id = "4",
                        name = "Yellow",
                        color = Color3.fromHex("#ffff55"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 80,
                    team = {
                        id = "5",
                        name = "Brown",
                        color = Color3.fromHex("#9a6324"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 80,
                    team = {
                        id = "6",
                        name = "White",
                        color = Color3.fromHex("#f3feff"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 70,
                    team = {
                        id = "7",
                        name = "Cyan",
                        color = Color3.fromHex("#55ffff"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                },
                {
                    health = 70,
                    team = {
                        id = "8",
                        name = "Purple",
                        color = Color3.fromHex("#aa00aa"),
                        members = { {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            }, {
                                displayName = "test",
                                name = "bryan3838",
                                userId = 20663325
                            } }
                    }
                }
            }
        }
    });
    local u5 = u1.mount(u1.createElement(StoreProvider, {
        store = v4
    }, { u1.createElement("ScreenGui", {}, { u1.createElement(PvPArenaRoundUI, {
                AppId = "PvPArenaRoundUI"
            }), u1.createElement(PvPArenaIntermissionUI, {
                AppId = "PvPArenaIntermissionUI"
            }) }) }), p3);

    return function() -- Line: 192
        -- upvalues: u1 (ref), u5 (copy)
        u1.unmount(u5);
    end;
end;