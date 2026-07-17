-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local QueueGroupType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local QueuePlaylistId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-playlist", "playlist").QueuePlaylistId;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local PlayMenuCardTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "play-menu", "play-menu-tags").PlayMenuCardTag;
local RankUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local v2 = {};
local u3 = setmetatable({}, {
    __index = v2
});
u3.WELCOME = "WELCOME";
v2.WELCOME = "WELCOME";
u3.GAME_SELECT = "GAME_SELECT";
v2.GAME_SELECT = "GAME_SELECT";
u3.CLASSIC_QUEUE_SELECT = "CLASSIC_QUEUE_SELECT";
v2.CLASSIC_QUEUE_SELECT = "CLASSIC_QUEUE_SELECT";
u3.LUCKY_BLOCK_QUEUE_SELECT = "LUCKY_BLOCK_QUEUE_SELECT";
v2.LUCKY_BLOCK_QUEUE_SELECT = "LUCKY_BLOCK_QUEUE_SELECT";
u3.ARCADE_QUEUE_SELECT = "ARCADE_QUEUE_SELECT";
v2.ARCADE_QUEUE_SELECT = "ARCADE_QUEUE_SELECT";
local v4 = {};
local v5 = setmetatable({}, {
    __index = v4
});
v5.QUEUE_GROUP_TYPE = "queueGroupType";
v4.queueGroupType = "QUEUE_GROUP_TYPE";
v5.QUEUE_TYPE = "QUEUE_TYPE";
v4.QUEUE_TYPE = "QUEUE_TYPE";
v5.QUEUE_PLAYLIST = "QUEUE_PLAYLIST";
v4.QUEUE_PLAYLIST = "QUEUE_PLAYLIST";
v5.CARD = "CARD";
v4.CARD = "CARD";
local u10 = {
    [u3.GAME_SELECT] = {
        title = "SELECT A GAME",
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        queueCardVariants = {
            {
                queueVariantType = v5.QUEUE_GROUP_TYPE,
                queueGroupType = QueueGroupType.BEDWARS_CLASSIC,
                DisplayGroupingData = {
                    Index = 0
                },
                Tag = PlayMenuCardTag.RECOMMENDED
            },
            {
                queueVariantType = v5.QUEUE_GROUP_TYPE,
                queueGroupType = QueueGroupType.BEDWARS_LUCKY_BLOCK,
                DisplayGroupingData = {
                    Index = 1
                },
                Tag = PlayMenuCardTag.FUN
            },
            {
                queueVariantType = v5.QUEUE_GROUP_TYPE,
                queueGroupType = QueueGroupType.ARCADE,
                DisplayGroupingData = {
                    Index = 2
                },
                Tag = PlayMenuCardTag.FAST
            },
            {
                queueVariantType = v5.QUEUE_TYPE,
                queueType = QueueType.HALLOWEEN_2025_EVENT_PVE,
                DisplayGroupingData = {
                    Index = 3
                },
                Tag = PlayMenuCardTag.NEW
            },
            {
                queueVariantType = v5.QUEUE_TYPE,
                queueType = QueueType.HALLOWEEN_EVENT,
                DisplayGroupingData = {
                    Index = 4,
                    GroupToIndex = 3
                },
                Tag = PlayMenuCardTag.NEW
            },
            {
                queueVariantType = v5.QUEUE_TYPE,
                queueType = QueueType.WINTER_EVENT,
                DisplayGroupingData = {
                    Index = 5,
                    GroupToIndex = 3
                },
                Tag = PlayMenuCardTag.NEW,
                cardProps = {
                    CardData = {
                        subtitle = "EVENT"
                    }
                }
            },
            {
                queueVariantType = v5.QUEUE_TYPE,
                queueType = QueueType.SUMMER_WARS,
                DisplayGroupingData = {
                    Index = 6,
                    GroupToIndex = 3
                },
                Tag = PlayMenuCardTag.NEW,
                cardProps = {
                    CardData = {
                        subtitle = "EVENT"
                    }
                }
            },
            {
                queueVariantType = v5.CARD,
                cardProps = {
                    CardData = {
                        title = "CUSTOMS",
                        subtitle = "JOIN, HOST, OR BROWSE",
                        description = "Create or join games with your own rules. Invite friends, choose maps, and build whatever you want for a unique BedWars experience.",
                        backgroundImages = { "rbxassetid://134564602318116" }
                    },

                    OnClick = function() -- Line: 120, Name: OnClick
                        -- upvalues: KnitClient (copy)
                        KnitClient.Controllers.LobbyCustomMatchesController:openCustomMatchApp();
                    end
                },
                DisplayGroupingData = {
                    Index = 7
                }
            },
            {
                queueVariantType = v5.QUEUE_TYPE,
                queueType = QueueType.TRAINING_ROOM,
                DisplayGroupingData = {
                    Index = 8,
                    GroupToIndex = 7
                },
                cardProps = {
                    CardData = {
                        title = "PRACTICE"
                    },

                    OnClick = function(p6, p7) -- Line: 138, Name: OnClick
                        -- upvalues: KnitClient (copy)
                        KnitClient.Controllers.TrainingRoomLobbyController:clickQueue();
                    end
                }
            },
            {
                queueVariantType = v5.QUEUE_TYPE,
                queueType = QueueType.BEGINNER_TUTORIAL,
                DisplayGroupingData = {
                    Index = 9,
                    GroupToIndex = 7
                },
                cardProps = {
                    CardData = {
                        title = "TUTORIAL"
                    },

                    OnClick = function(p8, p9) -- Line: 153, Name: OnClick
                        -- upvalues: default (copy)
                        default.Client:Get("RespondedToTutorialPrompt"):CallServer(true);
                    end
                }
            }
        }
    }
};
local CLASSIC_QUEUE_SELECT = u3.CLASSIC_QUEUE_SELECT;
local v11 = {
    title = "SELECT A QUEUE",
    parentPage = u3.GAME_SELECT,
    subtitle = {
        Text = "CLASSIC",
        Color3 = Color3.fromRGB(135, 145, 255)
    },
    HorizontalAlignment = Enum.HorizontalAlignment.Left
};
local v12 = {
    queueVariantType = v5.QUEUE_TYPE,
    queueType = QueueType.BEDWARS_TO4,
    DisplayGroupingData = {
        Index = 0
    },
    cardProps = {
        CardData = {
            title = "SQUADS"
        }
    },
    Tag = PlayMenuCardTag.RECOMMENDED
};
local v13 = {
    queueVariantType = v5.QUEUE_TYPE,
    queueType = QueueType.BEDWARS_TO2,
    DisplayGroupingData = {
        Index = 1,
        MaxGroupSize = 2
    },
    cardProps = {
        CardData = {
            title = "DOUBLES"
        }
    }
};
local v14 = {
    queueVariantType = v5.QUEUE_TYPE,
    queueType = QueueType.BEDWARS_TO1,
    DisplayGroupingData = {
        Index = 2,
        GroupToIndex = 1
    },
    cardProps = {
        CardData = {
            title = "SOLOS"
        }
    }
};
local v15 = {
    queueVariantType = v5.QUEUE_TYPE,
    queueType = RankUtil.activeRankMeta.queueType,
    DisplayGroupingData = {
        Index = 3
    }
};
local v16 = {};
local v17 = {};
local v18 = getQueueMeta(RankUtil.activeRankMeta.queueType);

if v18 ~= nil then
    local function _(p19, p20) -- Line: 225
        return p20 ~= 1;
    end;

    local v21 = 0;
    local v22 = {};

    for i, v in string.split(v18.title, " ") do
        if i - 1 ~= 1 == true then
            v21 = v21 + 1;
            v22[v21] = v;
        end;
    end;

    v18 = table.concat(v22, " ");
end;

v17.title = v18 == nil and "Ranked" or v18;
local v23 = getQueueMeta(RankUtil.activeRankMeta.queueType);

if v23 ~= nil then
    v23 = v23.eventText;
end;

v17.subtitle = v23;
v16.CardData = v17;
v15.cardProps = v16;
v11.queueCardVariants = {
    v12,
    v13,
    v14,
    v15,
    {
        queueVariantType = v5.QUEUE_TYPE,
        queueType = QueueType.BEDWARS_5v5,
        DisplayGroupingData = {
            Index = 4,
            MaxGroupSize = 2
        },
        cardProps = {
            CardData = {
                title = "5v5"
            }
        }
    },
    {
        queueVariantType = v5.QUEUE_TYPE,
        queueType = QueueType.BEDWARS_20v20,
        DisplayGroupingData = {
            Index = 5,
            GroupToIndex = 4
        },
        cardProps = {
            CardData = {
                title = "30v30"
            }
        },
        Tag = PlayMenuCardTag.FUN
    },
    {
        queueVariantType = v5.QUEUE_TYPE,
        queueType = QueueType.BEDWARS_16v16,
        DisplayGroupingData = {
            Index = 5,
            GroupToIndex = 4
        },
        cardProps = {
            CardData = {
                title = "16v16"
            }
        },
        Tag = PlayMenuCardTag.FUN
    },
    {
        queueVariantType = v5.QUEUE_TYPE,
        queueType = QueueType.BEDWARS_VOICE_CHAT,
        DisplayGroupingData = {
            Index = 6
        },
        cardProps = {
            CardData = {
                title = "VOICE CHAT",
                subtitle = "SQUADS"
            }
        }
    }
};
u10[CLASSIC_QUEUE_SELECT] = v11;
u10[u3.LUCKY_BLOCK_QUEUE_SELECT] = {
    title = "SELECT A QUEUE",
    parentPage = u3.GAME_SELECT,
    subtitle = {
        Text = "LUCKY BLOCK",
        Color3 = Color3.fromRGB(255, 235, 102)
    },
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    queueCardVariants = {
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEDWARS_LUCKY_BLOCK,
            DisplayGroupingData = {
                Index = 0
            },
            cardProps = {
                CardData = {
                    title = "SQUADS"
                }
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEDWARS_LUCKY_BLOCK_TO2,
            DisplayGroupingData = {
                Index = 1
            },
            cardProps = {
                CardData = {
                    title = "DOUBLES"
                }
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.LB_ONEBLOCK,
            DisplayGroupingData = {
                Index = 2,
                MaxGroupSize = 2
            },
            cardProps = {
                CardData = {
                    title = "SOLOS"
                }
            },
            Tag = PlayMenuCardTag.FUN
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.LB_ONEBLOCK_TO2,
            DisplayGroupingData = {
                Index = 3,
                GroupToIndex = 2
            },
            cardProps = {
                CardData = {
                    title = "DOUBLES"
                }
            },
            Tag = PlayMenuCardTag.FUN
        }
    }
};
u10[u3.ARCADE_QUEUE_SELECT] = {
    title = "SELECT A QUEUE",
    parentPage = u3.GAME_SELECT,
    subtitle = {
        Text = "ARCADE",
        Color3 = Color3.fromRGB(255, 135, 135)
    },
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    queueCardVariants = {
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.SKYWARS_TO2,
            DisplayGroupingData = {
                Index = 0
            },
            cardProps = {
                CardData = {
                    title = "SKYWARS",
                    subtitle = "DOUBLES"
                }
            }
        },
        {
            queueVariantType = v5.QUEUE_PLAYLIST,
            queuePlaylistId = QueuePlaylistId.ARCADE,
            DisplayGroupingData = {
                Index = 1,
                MaxGroupSize = 2
            }
        },
        {
            queueVariantType = v5.QUEUE_PLAYLIST,
            queuePlaylistId = QueuePlaylistId.PVP,
            DisplayGroupingData = {
                Index = 2,
                GroupToIndex = 1
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BLOCK_HUNT,
            DisplayGroupingData = {
                Index = 3,
                MaxGroupSize = 2
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.ROYALE,
            DisplayGroupingData = {
                Index = 4,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BATTLE_ROYALE,
            DisplayGroupingData = {
                Index = 5,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.GUN_GAME,
            DisplayGroupingData = {
                Index = 6,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.INFECTED,
            DisplayGroupingData = {
                Index = 7,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEDWARS_NB4,
            DisplayGroupingData = {
                Index = 8,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEDWARS_OG_TO4,
            DisplayGroupingData = {
                Index = 9,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.SKULL_DROP,
            DisplayGroupingData = {
                Index = 10,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.HYPER_GEN_TO4,
            DisplayGroupingData = {
                Index = 11,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.COMBINED_KIT_TO4,
            DisplayGroupingData = {
                Index = 12,
                GroupToIndex = 3
            },
            Tag = PlayMenuCardTag.FUN
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.ALL_RANDOM_KIT_TO4,
            DisplayGroupingData = {
                Index = 13,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.MINE_WARS,
            DisplayGroupingData = {
                Index = 14,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.OVERPOWERED,
            DisplayGroupingData = {
                Index = 15,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.SURVIVAL,
            DisplayGroupingData = {
                Index = 16
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BRIDGE_DUEL,
            DisplayGroupingData = {
                Index = 17,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BRIDGE_DUEL_TO2,
            DisplayGroupingData = {
                Index = 18,
                GroupToIndex = 3
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEDWARS_DUELS,
            DisplayGroupingData = {
                Index = 19,
                MaxGroupSize = 2
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.WINSTREAK_1v1,
            DisplayGroupingData = {
                Index = 20,
                GroupToIndex = 19
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.CUSTOM_KIT,
            DisplayGroupingData = {
                Index = 21,
                MaxGroupSize = 2
            }
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.CUSTOM_KIT_CREATION,
            DisplayGroupingData = {
                Index = 22,
                GroupToIndex = 21
            }
        }
    }
};
u10[u3.WELCOME] = {
    title = "WELCOME",
    HorizontalAlignment = Enum.HorizontalAlignment.Center,
    queueCardVariants = {
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEGINNER_TUTORIAL,
            DisplayGroupingData = {
                Index = 0
            },
            cardProps = {
                CardData = {
                    title = "TUTORIAL"
                },

                OnClick = function(p24, p25) -- Line: 552, Name: OnClick
                    -- upvalues: default (copy)
                    default.Client:Get("RespondedToTutorialPrompt"):CallServer(true);
                end
            },
            Tag = PlayMenuCardTag.RECOMMENDED
        },
        {
            queueVariantType = v5.QUEUE_TYPE,
            queueType = QueueType.BEDWARS_TO4,
            DisplayGroupingData = {
                Index = 1
            },
            cardProps = {
                CardData = {
                    title = "QUICKPLAY",
                    subtitle = "CLASSIC SQUADS"
                },

                OnClick = function(p26, p27) -- Line: 568, Name: OnClick
                    -- upvalues: default (copy), KnitClient (copy)
                    default.Client:Get("RespondedToTutorialPrompt"):CallServer(false);
                    KnitClient.Controllers.QueueController:joinQueue(p26.queueType);
                end
            }
        }
    }
};

return {
    getLobbyPlayMenuPageMeta = function(p28) -- Line: 576, Name: getLobbyPlayMenuPageMeta
        -- upvalues: u10 (copy)
        return u10[p28];
    end,

    getLobbyPlayMenuPage = function(p29) -- Line: 579, Name: getLobbyPlayMenuPage
        -- upvalues: QueueGroupType (copy), u3 (ref)
        if p29 == QueueGroupType.BEDWARS_CLASSIC then
            return u3.CLASSIC_QUEUE_SELECT;
        end;

        if p29 == QueueGroupType.BEDWARS_LUCKY_BLOCK then
            return u3.LUCKY_BLOCK_QUEUE_SELECT;
        end;

        if p29 == QueueGroupType.ARCADE then
            return u3.ARCADE_QUEUE_SELECT;
        end;

        error(error("No LobbyPlayMenuPage for: " .. p29));
    end,

    getFilteredQueueVariant = function(p30) -- Line: 593, Name: getFilteredQueueVariant
        -- upvalues: getQueueMeta (copy)
        local queueType = p30.queueType;

        if not queueType then
            if p30.queuePlaylistId then
                return p30;
            end;

            return p30;
        end;

        local v31 = getQueueMeta(queueType);

        if v31 and not (v31.disabled or v31.queueFromPlaylistOnly) then
            return p30;
        end;

        return nil;
    end,

    mapQueueVariants = function(u32) -- Line: 607, Name: mapQueueVariants
        -- upvalues: getQueueMeta (copy), u1 (copy)
        local v33 = {};

        local function _(p34) -- Line: 611
            -- upvalues: getQueueMeta (ref)
            local queueType = p34.queueType;

            if not queueType then
                if p34.queuePlaylistId then
                    return p34;
                end;

                return p34;
            end;

            local v35 = getQueueMeta(queueType);

            if v35 and not (v35.disabled or v35.queueFromPlaylistOnly) then
                return p34;
            end;

            return nil;
        end;

        local v36 = 0;
        local v37 = {};

        for i, v in u32 do
            local _ = i - 1;
            local queueType = v.queueType;

            if queueType then
                local v38 = getQueueMeta(queueType);

                if not v38 or (v38.disabled or v38.queueFromPlaylistOnly) then
                    local v = nil;
                end;
            else
                local _ = v.queuePlaylistId;
            end;

            if v ~= nil then
                v36 = v36 + 1;
                v37[v36] = v;
            end;
        end;

        table.move(v37, 1, #v37, #v33 + 1, v33);
        table.sort(v33, function(p39, p40) -- Line: 626
            return p39.DisplayGroupingData.Index < p40.DisplayGroupingData.Index;
        end);
        local u41 = {};
        local v42;

        if #v33 > 0 then
            local v43 = math;

            local function _(p44) -- Line: 635
                return p44.DisplayGroupingData.Index;
            end;

            local v45 = table.create(#v33);

            for i, v in v33 do
                local _ = i - 1;
                v45[i] = v.DisplayGroupingData.Index;
            end;

            v42 = v43.max(unpack(v45));
        else
            v42 = -1;
        end;

        local u46 = v42 + 1;
        local u47 = {};

        local function _(p48) -- Line: 651
            -- upvalues: u47 (copy)
            if p48.DisplayGroupingData.MaxGroupSize ~= nil then
                u47[p48.DisplayGroupingData.Index] = true;
            end;

            if p48.DisplayGroupingData.GroupToIndex ~= nil then
                u47[p48.DisplayGroupingData.GroupToIndex] = true;
            end;
        end;

        for i, v in v33 do
            local _ = i - 1;

            if v.DisplayGroupingData.MaxGroupSize ~= nil then
                u47[v.DisplayGroupingData.Index] = true;
            end;

            if v.DisplayGroupingData.GroupToIndex ~= nil then
                u47[v.DisplayGroupingData.GroupToIndex] = true;
            end;
        end;

        local function v55(u49) -- Line: 664
            -- upvalues: u47 (copy), u41 (copy), u32 (copy), u46 (ref)
            if u47[u49.DisplayGroupingData.Index] ~= nil and u41[u49.DisplayGroupingData.Index] == nil then
                u41[u49.DisplayGroupingData.Index] = { u49 };
            end;

            if u49.DisplayGroupingData.GroupToIndex ~= nil then
                local function _(p50) -- Line: 676
                    -- upvalues: u49 (copy)
                    return p50.DisplayGroupingData.Index == u49.DisplayGroupingData.GroupToIndex;
                end;

                local v51 = nil;

                for i, v in u32 do
                    local _ = i - 1;

                    if v.DisplayGroupingData.Index == u49.DisplayGroupingData.GroupToIndex == true then
                        v51 = v;
                        break;
                    end;
                end;

                if v51 ~= nil then
                    v51 = v51.DisplayGroupingData.MaxGroupSize;
                end;

                local v52 = v51 == nil and (1 / 0) or v51;
                local v53 = false;

                for _, v in u41 do
                    local v54;

                    if v[1].DisplayGroupingData.GroupToIndex == u49.DisplayGroupingData.GroupToIndex then
                        v54 = v[1].DisplayGroupingData.GroupToIndex ~= nil;
                    else
                        v54 = false;
                    end;

                    if (v[1].DisplayGroupingData.Index == u49.DisplayGroupingData.GroupToIndex or v54) and (v52 == (1 / 0) or #v < v52) then
                        table.insert(v, u49);
                        v53 = true;
                        break;
                    end;
                end;

                if not v53 then
                    while u41[u46] ~= nil do
                        u46 = u46 + 1;
                    end;

                    u41[u46] = { u49 };
                    u46 = u46 + 1;
                end;
            end;
        end;

        for i, v in v33 do
            v55(v, i - 1, v33);
        end;

        local function v58(p56) -- Line: 729
            -- upvalues: u47 (copy), u41 (copy)
            local v57;

            if p56.DisplayGroupingData.GroupToIndex == nil then
                v57 = p56.DisplayGroupingData.MaxGroupSize == nil;
            else
                v57 = false;
            end;

            if v57 then
                v57 = not (u47[p56.DisplayGroupingData.Index] ~= nil);
            end;

            if v57 and u41[p56.DisplayGroupingData.Index] == nil then
                u41[p56.DisplayGroupingData.Index] = { p56 };
            end;
        end;

        for i, v in v33 do
            v58(v, i - 1, v33);
        end;

        local v59 = {};
        local v60 = u1.keys(u41);
        table.move(v60, 1, #v60, #v59 + 1, v59);
        table.sort(v59, function(p61, p62) -- Line: 753
            -- upvalues: u41 (copy)
            local v63 = u41[tonumber(p61)];
            local v64 = u41[tonumber(p62)];
            local v65 = math;

            local function _(p66) -- Line: 759
                return p66.DisplayGroupingData.Index;
            end;

            local v67 = table.create(#v63);

            for i, v in v63 do
                local _ = i - 1;
                v67[i] = v.DisplayGroupingData.Index;
            end;

            local v68 = v65.min(unpack(v67));
            local v69 = math;

            local function _(p70) -- Line: 770
                return p70.DisplayGroupingData.Index;
            end;

            local v71 = table.create(#v64);

            for i, v in v64 do
                local _ = i - 1;
                v71[i] = v.DisplayGroupingData.Index;
            end;

            return v68 < v69.min(unpack(v71));
        end);
        local v72 = {};
        local u73 = {};

        for _, v in v59 do
            local v74 = u41[tonumber(v)];

            if v74 then
                table.insert(v72, v74);

                local function _(p75) -- Line: 789
                    -- upvalues: u73 (copy)
                    u73[p75.DisplayGroupingData.Index] = true;

                    return u73;
                end;

                for i, v3 in v74 do
                    local _ = i - 1;
                    u73[v3.DisplayGroupingData.Index] = true;
                end;
            end;
        end;

        return v72;
    end,

    LobbyPlayMenuPage = u3,
    QueueVariantType = v5,
    LobbyPlayMenuPageMeta = u10
};