local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-group-type").QueueGroupType
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-playlist", "playlist").QueuePlaylistId
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "play-menu", "play-menu-tags").PlayMenuCardTag
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-util").RankUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v11 = {}
local u12 = setmetatable({}, {
    ["__index"] = v11
})
u12.WELCOME = "WELCOME"
v11.WELCOME = "WELCOME"
u12.GAME_SELECT = "GAME_SELECT"
v11.GAME_SELECT = "GAME_SELECT"
u12.CLASSIC_QUEUE_SELECT = "CLASSIC_QUEUE_SELECT"
v11.CLASSIC_QUEUE_SELECT = "CLASSIC_QUEUE_SELECT"
u12.LUCKY_BLOCK_QUEUE_SELECT = "LUCKY_BLOCK_QUEUE_SELECT"
v11.LUCKY_BLOCK_QUEUE_SELECT = "LUCKY_BLOCK_QUEUE_SELECT"
u12.ARCADE_QUEUE_SELECT = "ARCADE_QUEUE_SELECT"
v11.ARCADE_QUEUE_SELECT = "ARCADE_QUEUE_SELECT"
local v13 = {}
local v14 = setmetatable({}, {
    ["__index"] = v13
})
v14.QUEUE_GROUP_TYPE = "queueGroupType"
v13.queueGroupType = "QUEUE_GROUP_TYPE"
v14.QUEUE_TYPE = "QUEUE_TYPE"
v13.QUEUE_TYPE = "QUEUE_TYPE"
v14.QUEUE_PLAYLIST = "QUEUE_PLAYLIST"
v13.QUEUE_PLAYLIST = "QUEUE_PLAYLIST"
v14.CARD = "CARD"
v13.CARD = "CARD"
local u15 = {}
local v16 = u12.GAME_SELECT
local v17 = {
    ["title"] = "SELECT A GAME",
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
    ["queueCardVariants"] = {
        {
            ["queueVariantType"] = v14.QUEUE_GROUP_TYPE,
            ["queueGroupType"] = u4.BEDWARS_CLASSIC,
            ["DisplayGroupingData"] = {
                ["Index"] = 0
            },
            ["Tag"] = v8.RECOMMENDED
        },
        {
            ["queueVariantType"] = v14.QUEUE_GROUP_TYPE,
            ["queueGroupType"] = u4.BEDWARS_LUCKY_BLOCK,
            ["DisplayGroupingData"] = {
                ["Index"] = 1
            },
            ["Tag"] = v8.FUN
        },
        {
            ["queueVariantType"] = v14.QUEUE_GROUP_TYPE,
            ["queueGroupType"] = u4.ARCADE,
            ["DisplayGroupingData"] = {
                ["Index"] = 2
            },
            ["Tag"] = v8.FAST
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.HALLOWEEN_2025_EVENT_PVE,
            ["DisplayGroupingData"] = {
                ["Index"] = 3
            },
            ["Tag"] = v8.NEW
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.HALLOWEEN_EVENT,
            ["DisplayGroupingData"] = {
                ["Index"] = 4,
                ["GroupToIndex"] = 3
            },
            ["Tag"] = v8.NEW
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.WINTER_EVENT,
            ["DisplayGroupingData"] = {
                ["Index"] = 5,
                ["GroupToIndex"] = 3
            },
            ["Tag"] = v8.NEW,
            ["cardProps"] = {
                ["CardData"] = {
                    ["subtitle"] = "EVENT"
                }
            }
        },
        {
            ["queueVariantType"] = v14.CARD,
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "CUSTOMS",
                    ["subtitle"] = "JOIN, HOST, OR BROWSE",
                    ["description"] = "Create or join games with your own rules. Invite friends, choose maps, and build whatever you want for a unique BedWars experience.",
                    ["backgroundImages"] = { "rbxassetid://134564602318116" }
                },
                ["OnClick"] = function() --[[ Name: OnClick, Line 107 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                    --]]
                    u2.Controllers.LobbyCustomMatchesController:openCustomMatchApp()
                end
            },
            ["DisplayGroupingData"] = {
                ["Index"] = 6
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.TRAINING_ROOM,
            ["DisplayGroupingData"] = {
                ["Index"] = 7
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "PRACTICE"
                },
                ["OnClick"] = function(_, _) --[[ Name: OnClick, Line 124 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                    --]]
                    u2.Controllers.TrainingRoomLobbyController:clickQueue()
                end
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEGINNER_TUTORIAL,
            ["DisplayGroupingData"] = {
                ["Index"] = 8,
                ["GroupToIndex"] = 7
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "TUTORIAL"
                },
                ["OnClick"] = function(_, _) --[[ Name: OnClick, Line 139 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    u10.Client:Get("RespondedToTutorialPrompt"):CallServer(true)
                end
            }
        }
    }
}
u15[v16] = v17
local v18 = u12.CLASSIC_QUEUE_SELECT
local v19 = {
    ["title"] = "SELECT A QUEUE",
    ["parentPage"] = u12.GAME_SELECT,
    ["subtitle"] = {
        ["Text"] = "CLASSIC",
        ["Color3"] = Color3.fromRGB(135, 145, 255)
    },
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
}
local v20 = {
    ["queueVariantType"] = v14.QUEUE_TYPE,
    ["queueType"] = v7.BEDWARS_TO4,
    ["DisplayGroupingData"] = {
        ["Index"] = 0
    },
    ["cardProps"] = {
        ["CardData"] = {
            ["title"] = "SQUADS"
        }
    },
    ["Tag"] = v8.RECOMMENDED
}
local v21 = {
    ["queueVariantType"] = v14.QUEUE_TYPE,
    ["queueType"] = v7.BEDWARS_TO2,
    ["DisplayGroupingData"] = {
        ["Index"] = 1,
        ["MaxGroupSize"] = 2
    },
    ["cardProps"] = {
        ["CardData"] = {
            ["title"] = "DOUBLES"
        }
    }
}
local v22 = {
    ["queueVariantType"] = v14.QUEUE_TYPE,
    ["queueType"] = v7.BEDWARS_TO1,
    ["DisplayGroupingData"] = {
        ["Index"] = 2,
        ["GroupToIndex"] = 1
    },
    ["cardProps"] = {
        ["CardData"] = {
            ["title"] = "SOLOS"
        }
    }
}
local v23 = {
    ["queueVariantType"] = v14.QUEUE_TYPE,
    ["queueType"] = v9.activeRankMeta.queueType,
    ["DisplayGroupingData"] = {
        ["Index"] = 3
    }
}
local v24 = {}
local v25 = {}
local v26 = u5(v9.activeRankMeta.queueType)
if v26 ~= nil then
    local v27 = 0
    local v28 = {}
    for v29, v30 in string.split(v26.title, " ") do
        if v29 - 1 ~= 1 == true then
            v27 = v27 + 1
            v28[v27] = v30
        end
    end
    v26 = table.concat(v28, " ")
end
v25.title = v26 == nil and "Ranked" or v26
local v31 = u5(v9.activeRankMeta.queueType)
if v31 ~= nil then
    v31 = v31.eventText
end
v25.subtitle = v31
v24.CardData = v25
v23.cardProps = v24
v19.queueCardVariants = {
    v20,
    v21,
    v22,
    v23,
    {
        ["queueVariantType"] = v14.QUEUE_TYPE,
        ["queueType"] = v7.BEDWARS_5v5,
        ["DisplayGroupingData"] = {
            ["Index"] = 4,
            ["MaxGroupSize"] = 2
        },
        ["cardProps"] = {
            ["CardData"] = {
                ["title"] = "5v5"
            }
        }
    },
    {
        ["queueVariantType"] = v14.QUEUE_TYPE,
        ["queueType"] = v7.BEDWARS_20v20,
        ["DisplayGroupingData"] = {
            ["Index"] = 5,
            ["GroupToIndex"] = 4
        },
        ["cardProps"] = {
            ["CardData"] = {
                ["title"] = "30v30"
            }
        },
        ["Tag"] = v8.FUN
    },
    {
        ["queueVariantType"] = v14.QUEUE_TYPE,
        ["queueType"] = v7.BEDWARS_16v16,
        ["DisplayGroupingData"] = {
            ["Index"] = 5,
            ["GroupToIndex"] = 4
        },
        ["cardProps"] = {
            ["CardData"] = {
                ["title"] = "16v16"
            }
        },
        ["Tag"] = v8.FUN
    },
    {
        ["queueVariantType"] = v14.QUEUE_TYPE,
        ["queueType"] = v7.BEDWARS_VOICE_CHAT,
        ["DisplayGroupingData"] = {
            ["Index"] = 6
        },
        ["cardProps"] = {
            ["CardData"] = {
                ["title"] = "VOICE CHAT",
                ["subtitle"] = "SQUADS"
            }
        }
    }
}
u15[v18] = v19
u15[u12.LUCKY_BLOCK_QUEUE_SELECT] = {
    ["title"] = "SELECT A QUEUE",
    ["parentPage"] = u12.GAME_SELECT,
    ["subtitle"] = {
        ["Text"] = "LUCKY BLOCK",
        ["Color3"] = Color3.fromRGB(255, 235, 102)
    },
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
    ["queueCardVariants"] = {
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEDWARS_LUCKY_BLOCK,
            ["DisplayGroupingData"] = {
                ["Index"] = 0
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "SQUADS"
                }
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEDWARS_LUCKY_BLOCK_TO2,
            ["DisplayGroupingData"] = {
                ["Index"] = 1
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "DOUBLES"
                }
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.LB_ONEBLOCK,
            ["DisplayGroupingData"] = {
                ["Index"] = 2,
                ["MaxGroupSize"] = 2
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "SOLOS"
                }
            },
            ["Tag"] = v8.FUN
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.LB_ONEBLOCK_TO2,
            ["DisplayGroupingData"] = {
                ["Index"] = 3,
                ["GroupToIndex"] = 2
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "DOUBLES"
                }
            },
            ["Tag"] = v8.FUN
        }
    }
}
u15[u12.ARCADE_QUEUE_SELECT] = {
    ["title"] = "SELECT A QUEUE",
    ["parentPage"] = u12.GAME_SELECT,
    ["subtitle"] = {
        ["Text"] = "ARCADE",
        ["Color3"] = Color3.fromRGB(255, 135, 135)
    },
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
    ["queueCardVariants"] = {
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.SKYWARS_TO2,
            ["DisplayGroupingData"] = {
                ["Index"] = 0
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "SKYWARS",
                    ["subtitle"] = "DOUBLES"
                }
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_PLAYLIST,
            ["queuePlaylistId"] = v6.ARCADE,
            ["DisplayGroupingData"] = {
                ["Index"] = 1,
                ["MaxGroupSize"] = 2
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_PLAYLIST,
            ["queuePlaylistId"] = v6.PVP,
            ["DisplayGroupingData"] = {
                ["Index"] = 2,
                ["GroupToIndex"] = 1
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BLOCK_HUNT,
            ["DisplayGroupingData"] = {
                ["Index"] = 3,
                ["MaxGroupSize"] = 2
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.ROYALE,
            ["DisplayGroupingData"] = {
                ["Index"] = 4,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BATTLE_ROYALE,
            ["DisplayGroupingData"] = {
                ["Index"] = 5,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.GUN_GAME,
            ["DisplayGroupingData"] = {
                ["Index"] = 6,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.INFECTED,
            ["DisplayGroupingData"] = {
                ["Index"] = 7,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEDWARS_NB4,
            ["DisplayGroupingData"] = {
                ["Index"] = 8,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEDWARS_OG_TO4,
            ["DisplayGroupingData"] = {
                ["Index"] = 9,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.SKULL_DROP,
            ["DisplayGroupingData"] = {
                ["Index"] = 10,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.HYPER_GEN_TO4,
            ["DisplayGroupingData"] = {
                ["Index"] = 11,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.COMBINED_KIT_TO4,
            ["DisplayGroupingData"] = {
                ["Index"] = 12,
                ["GroupToIndex"] = 3
            },
            ["Tag"] = v8.FUN
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.ALL_RANDOM_KIT_TO4,
            ["DisplayGroupingData"] = {
                ["Index"] = 13,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.MINE_WARS,
            ["DisplayGroupingData"] = {
                ["Index"] = 14,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.OVERPOWERED,
            ["DisplayGroupingData"] = {
                ["Index"] = 15,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.SURVIVAL,
            ["DisplayGroupingData"] = {
                ["Index"] = 16
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BRIDGE_DUEL,
            ["DisplayGroupingData"] = {
                ["Index"] = 17,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BRIDGE_DUEL_TO2,
            ["DisplayGroupingData"] = {
                ["Index"] = 18,
                ["GroupToIndex"] = 3
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEDWARS_DUELS,
            ["DisplayGroupingData"] = {
                ["Index"] = 19,
                ["MaxGroupSize"] = 2
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.WINSTREAK_1v1,
            ["DisplayGroupingData"] = {
                ["Index"] = 20,
                ["GroupToIndex"] = 19
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.CUSTOM_KIT,
            ["DisplayGroupingData"] = {
                ["Index"] = 21,
                ["MaxGroupSize"] = 2
            }
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.CUSTOM_KIT_CREATION,
            ["DisplayGroupingData"] = {
                ["Index"] = 22,
                ["GroupToIndex"] = 21
            }
        }
    }
}
u15[u12.WELCOME] = {
    ["title"] = "WELCOME",
    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
    ["queueCardVariants"] = {
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEGINNER_TUTORIAL,
            ["DisplayGroupingData"] = {
                ["Index"] = 0
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "TUTORIAL"
                },
                ["OnClick"] = function(_, _) --[[ Name: OnClick, Line 538 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    u10.Client:Get("RespondedToTutorialPrompt"):CallServer(true)
                end
            },
            ["Tag"] = v8.RECOMMENDED
        },
        {
            ["queueVariantType"] = v14.QUEUE_TYPE,
            ["queueType"] = v7.BEDWARS_TO4,
            ["DisplayGroupingData"] = {
                ["Index"] = 1
            },
            ["cardProps"] = {
                ["CardData"] = {
                    ["title"] = "QUICKPLAY",
                    ["subtitle"] = "CLASSIC SQUADS"
                },
                ["OnClick"] = function(p32, _) --[[ Name: OnClick, Line 554 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u2
                    --]]
                    u10.Client:Get("RespondedToTutorialPrompt"):CallServer(false)
                    u2.Controllers.QueueController:joinQueue(p32.queueType)
                end
            }
        }
    }
}
return {
    ["getLobbyPlayMenuPageMeta"] = function(p33) --[[ Name: getLobbyPlayMenuPageMeta, Line 562 ]]
        --[[
        Upvalues:
            [1] = u15
        --]]
        return u15[p33]
    end,
    ["getLobbyPlayMenuPage"] = function(p34) --[[ Name: getLobbyPlayMenuPage, Line 565 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u12
        --]]
        if p34 == u4.BEDWARS_CLASSIC then
            return u12.CLASSIC_QUEUE_SELECT
        end
        if p34 == u4.BEDWARS_LUCKY_BLOCK then
            return u12.LUCKY_BLOCK_QUEUE_SELECT
        end
        if p34 == u4.ARCADE then
            return u12.ARCADE_QUEUE_SELECT
        end
        error(error("No LobbyPlayMenuPage for: " .. p34))
    end,
    ["getFilteredQueueVariant"] = function(p35) --[[ Name: getFilteredQueueVariant, Line 579 ]]
        --[[
        Upvalues:
            [1] = u5
        --]]
        local v36 = p35.queueType
        if v36 then
            local v37 = u5(v36)
            if v37 and not (v37.disabled or v37.queueFromPlaylistOnly) then
                return p35
            else
                return nil
            end
        elseif p35.queuePlaylistId then
            return p35
        else
            return p35
        end
    end,
    ["mapQueueVariants"] = function(u38) --[[ Name: mapQueueVariants, Line 593 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
        --]]
        local v39 = {}
        local v40 = #v39
        local v41 = 0
        local v42 = {}
        for v43, v47 in u38 do
            local _ = v43 - 1
            local v45 = v47.queueType
            if v45 then
                local v46 = u5(v45)
                if not v46 or (v46.disabled or v46.queueFromPlaylistOnly) then
                    local v47 = nil
                end
            else
                local _ = v47.queuePlaylistId
            end
            if v47 ~= nil then
                v41 = v41 + 1
                v42[v41] = v47
            end
        end
        table.move(v42, 1, #v42, v40 + 1, v39)
        table.sort(v39, function(p48, p49) --[[ Line: 612 ]]
            return p48.DisplayGroupingData.Index < p49.DisplayGroupingData.Index
        end)
        local u50 = {}
        local v51
        if #v39 > 0 then
            local v52 = math
            local v53 = table.create(#v39)
            for v54, v55 in v39 do
                local _ = v54 - 1
                v53[v54] = v55.DisplayGroupingData.Index
            end
            local v56 = unpack
            v51 = v52.max(v56(v53))
        else
            v51 = -1
        end
        local u57 = v51 + 1
        local u58 = {}
        for v59, v60 in v39 do
            local _ = v59 - 1
            if v60.DisplayGroupingData.MaxGroupSize ~= nil then
                u58[v60.DisplayGroupingData.Index] = true
            end
            if v60.DisplayGroupingData.GroupToIndex ~= nil then
                u58[v60.DisplayGroupingData.GroupToIndex] = true
            end
        end
        local function v70(p61) --[[ Line: 650 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u50
                [3] = u38
                [4] = u57
            --]]
            if u58[p61.DisplayGroupingData.Index] ~= nil and u50[p61.DisplayGroupingData.Index] == nil then
                u50[p61.DisplayGroupingData.Index] = { p61 }
            end
            if p61.DisplayGroupingData.GroupToIndex ~= nil then
                local v62 = nil
                for v63, v64 in u38 do
                    local _ = v63 - 1
                    if v64.DisplayGroupingData.Index == p61.DisplayGroupingData.GroupToIndex == true then
                        v62 = v64
                        break
                    end
                end
                if v62 ~= nil then
                    v62 = v62.DisplayGroupingData.MaxGroupSize
                end
                local v65 = v62 == nil and (1 / 0) or v62
                local v66 = false
                for _, v67 in u50 do
                    local v68 = v67[1].DisplayGroupingData.Index == p61.DisplayGroupingData.GroupToIndex
                    local v69
                    if v67[1].DisplayGroupingData.GroupToIndex == p61.DisplayGroupingData.GroupToIndex then
                        v69 = v67[1].DisplayGroupingData.GroupToIndex ~= nil
                    else
                        v69 = false
                    end
                    if (v68 or v69) and (v65 == (1 / 0) or #v67 < v65) then
                        table.insert(v67, p61)
                        v66 = true
                        break
                    end
                end
                if not v66 then
                    while u50[u57] ~= nil do
                        u57 = u57 + 1
                    end
                    u50[u57] = { p61 }
                    u57 = u57 + 1
                end
            end
        end
        for v71, v72 in v39 do
            v70(v72, v71 - 1, v39)
        end
        local function v76(p73) --[[ Line: 715 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u50
            --]]
            local v74
            if p73.DisplayGroupingData.GroupToIndex == nil then
                v74 = p73.DisplayGroupingData.MaxGroupSize == nil
            else
                v74 = false
            end
            if v74 then
                local v75 = u58[p73.DisplayGroupingData.Index] ~= nil
                v74 = not v75
            end
            if v74 and u50[p73.DisplayGroupingData.Index] == nil then
                u50[p73.DisplayGroupingData.Index] = { p73 }
            end
        end
        for v77, v78 in v39 do
            v76(v78, v77 - 1, v39)
        end
        local v79 = {}
        local v80 = #v79
        local v81 = u3.keys(u50)
        table.move(v81, 1, #v81, v80 + 1, v79)
        table.sort(v79, function(p82, p83) --[[ Line: 739 ]]
            --[[
            Upvalues:
                [1] = u50
            --]]
            local v84 = u50[tonumber(p82)]
            local v85 = u50[tonumber(p83)]
            local v86 = math
            local v87 = table.create(#v84)
            for v88, v89 in v84 do
                local _ = v88 - 1
                v87[v88] = v89.DisplayGroupingData.Index
            end
            local v90 = unpack
            local v91 = v86.min(v90(v87))
            local v92 = math
            local v93 = table.create(#v85)
            for v94, v95 in v85 do
                local _ = v94 - 1
                v93[v94] = v95.DisplayGroupingData.Index
            end
            local v96 = unpack
            return v91 < v92.min(v96(v93))
        end)
        local v97 = {}
        local v98 = {}
        for _, v99 in v79 do
            local v100 = u50[tonumber(v99)]
            if v100 then
                table.insert(v97, v100)
                for v101, v102 in v100 do
                    local _ = v101 - 1
                    v98[v102.DisplayGroupingData.Index] = true
                end
            end
        end
        return v97
    end,
    ["LobbyPlayMenuPage"] = u12,
    ["QueueVariantType"] = v14,
    ["LobbyPlayMenuPageMeta"] = u15
}