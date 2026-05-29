local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-type").TitleType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-category").RankCategory
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "rank", "rank-tier").RankTier
local v8 = {}
local v9 = v6.RANKED_BETA
local v10 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_BETA_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_BETA_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_BETA_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_BETA_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_BETA_DIAMOND }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_BETA_NIGHTMARE },
        ["emotes"] = { v4.VICTORIOUS_BETA },
        ["kitSkins"] = { v3.BARBARIAN_VICTORIOUS }
    }
}
v8[v9] = v10
local v11 = v6.RANKED_S4
local v12 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S4_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S4_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S4_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S4_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S4_DIAMOND }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S4_NIGHTMARE },
        ["kitSkins"] = { v3.YUZI_VICTORIOUS }
    }
}
v8[v11] = v12
local v13 = v6.RANKED_S5
local v14 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S5_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S5_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S5_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S5_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S5_DIAMOND }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S5_NIGHTMARE },
        ["kitSkins"] = { v3.HANNAH_VICTORIOUS }
    }
}
v8[v13] = v14
local v15 = v6.RANKED_S6
local v16 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S6_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S6_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S6_GOLD },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_SPIRIT_ASSASSIN }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S6_PLATINUM },
        ["kitSkins"] = { v3.PLATINUM_VICTORIOUS_SPIRIT_ASSASSIN, v3.GOLD_VICTORIOUS_SPIRIT_ASSASSIN }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S6_DIAMOND },
        ["kitSkins"] = { v3.DIAMOND_VICTORIOUS_SPIRIT_ASSASSIN, v3.PLATINUM_VICTORIOUS_SPIRIT_ASSASSIN, v3.GOLD_VICTORIOUS_SPIRIT_ASSASSIN }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S6_DIAMOND },
        ["kitSkins"] = { v3.DIAMOND_VICTORIOUS_SPIRIT_ASSASSIN, v3.PLATINUM_VICTORIOUS_SPIRIT_ASSASSIN, v3.GOLD_VICTORIOUS_SPIRIT_ASSASSIN }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S6_NIGHTMARE },
        ["kitSkins"] = {
            v3.NIGHTMARE_VICTORIOUS_SPIRIT_ASSASSIN,
            v3.DIAMOND_VICTORIOUS_SPIRIT_ASSASSIN,
            v3.PLATINUM_VICTORIOUS_SPIRIT_ASSASSIN,
            v3.GOLD_VICTORIOUS_SPIRIT_ASSASSIN
        },
        ["emotes"] = { v4.NIGHTMARE_SEASON_6, v4.VICTORIOUS_CELEBRATION_SEASON_6 }
    }
}
v8[v15] = v16
local v17 = v6.RANKED_S7
local v18 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S7_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S7_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S7_GOLD },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_DAVEY }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S7_PLATINUM },
        ["kitSkins"] = { v3.PLATINUM_VICTORIOUS_DAVEY, v3.GOLD_VICTORIOUS_DAVEY }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S7_DIAMOND },
        ["kitSkins"] = { v3.DIAMOND_VICTORIOUS_DAVEY, v3.PLATINUM_VICTORIOUS_DAVEY, v3.GOLD_VICTORIOUS_DAVEY }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S7_EMERALD },
        ["kitSkins"] = {
            v3.EMERALD_VICTORIOUS_DAVEY,
            v3.DIAMOND_VICTORIOUS_DAVEY,
            v3.PLATINUM_VICTORIOUS_DAVEY,
            v3.GOLD_VICTORIOUS_DAVEY
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S7_NIGHTMARE },
        ["kitSkins"] = {
            v3.NIGHTMARE_VICTORIOUS_DAVEY,
            v3.EMERALD_VICTORIOUS_DAVEY,
            v3.DIAMOND_VICTORIOUS_DAVEY,
            v3.PLATINUM_VICTORIOUS_DAVEY,
            v3.GOLD_VICTORIOUS_DAVEY
        },
        ["emotes"] = { v4.NIGHTMARE_DAVEY_FLEX, v4.NIGHTMARE_DAVEY_THINK }
    }
}
v8[v17] = v18
local v19 = v6.RANKED_S8
local v20 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S8_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S8_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S8_GOLD },
        ["kitSkins"] = { v3.GRIM_REAPER_VICTORIOUS_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S8_PLATINUM },
        ["kitSkins"] = { v3.GRIM_REAPER_VICTORIOUS_PLATINUM, v3.GRIM_REAPER_VICTORIOUS_GOLD }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S8_DIAMOND },
        ["kitSkins"] = { v3.GRIM_REAPER_VICTORIOUS_DIAMOND, v3.GRIM_REAPER_VICTORIOUS_PLATINUM, v3.GRIM_REAPER_VICTORIOUS_GOLD }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S8_EMERALD },
        ["kitSkins"] = {
            v3.GRIM_REAPER_VICTORIOUS_EMERALD,
            v3.GRIM_REAPER_VICTORIOUS_DIAMOND,
            v3.GRIM_REAPER_VICTORIOUS_PLATINUM,
            v3.GRIM_REAPER_VICTORIOUS_GOLD
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S8_NIGHTMARE },
        ["kitSkins"] = {
            v3.GRIM_REAPER_VICTORIOUS_NIGHTMARE,
            v3.GRIM_REAPER_VICTORIOUS_EMERALD,
            v3.GRIM_REAPER_VICTORIOUS_DIAMOND,
            v3.GRIM_REAPER_VICTORIOUS_PLATINUM,
            v3.GRIM_REAPER_VICTORIOUS_GOLD
        },
        ["emotes"] = { v4.NIGHTMARE_GRIM_REAPER }
    }
}
v8[v19] = v20
local v21 = v6.RANKED_S9
local v22 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S9_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S9_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S9_GOLD },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_LYLA }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S9_PLATINUM },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_LYLA, v3.PLATINUM_VICTORIOUS_LYLA }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S9_DIAMOND },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_LYLA, v3.PLATINUM_VICTORIOUS_LYLA, v3.DIAMOND_VICTORIOUS_LYLA }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S9_EMERALD },
        ["kitSkins"] = {
            v3.GOLD_VICTORIOUS_LYLA,
            v3.PLATINUM_VICTORIOUS_LYLA,
            v3.DIAMOND_VICTORIOUS_LYLA,
            v3.EMERALD_VICTORIOUS_LYLA
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S9_NIGHTMARE },
        ["kitSkins"] = {
            v3.GOLD_VICTORIOUS_LYLA,
            v3.PLATINUM_VICTORIOUS_LYLA,
            v3.DIAMOND_VICTORIOUS_LYLA,
            v3.EMERALD_VICTORIOUS_LYLA,
            v3.NIGHTMARE_VICTORIOUS_LYLA
        },
        ["emotes"] = { v4.NIGHTMARE_LYLA }
    }
}
v8[v21] = v22
local v23 = v6.RANKED_S10
local v24 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S10_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S10_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S10_GOLD },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_WIZARD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S10_PLATINUM },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_WIZARD, v3.PLATINUM_VICTORIOUS_WIZARD }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S10_DIAMOND },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_WIZARD, v3.PLATINUM_VICTORIOUS_WIZARD, v3.DIAMOND_VICTORIOUS_WIZARD }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S10_EMERALD },
        ["kitSkins"] = {
            v3.GOLD_VICTORIOUS_WIZARD,
            v3.PLATINUM_VICTORIOUS_WIZARD,
            v3.DIAMOND_VICTORIOUS_WIZARD,
            v3.EMERALD_VICTORIOUS_WIZARD
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S10_NIGHTMARE },
        ["kitSkins"] = {
            v3.GOLD_VICTORIOUS_WIZARD,
            v3.PLATINUM_VICTORIOUS_WIZARD,
            v3.DIAMOND_VICTORIOUS_WIZARD,
            v3.EMERALD_VICTORIOUS_WIZARD,
            v3.NIGHTMARE_VICTORIOUS_WIZARD
        },
        ["emotes"] = { v4.NIGHTMARE_ZENO }
    }
}
v8[v23] = v24
local v25 = v6.RANKED_S11
local v26 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S11_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S11_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S11_GOLD },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_TRITON }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S11_PLATINUM },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_TRITON, v3.PLATINUM_VICTORIOUS_TRITON }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S11_DIAMOND },
        ["kitSkins"] = { v3.GOLD_VICTORIOUS_TRITON, v3.PLATINUM_VICTORIOUS_TRITON, v3.DIAMOND_VICTORIOUS_TRITON }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S11_EMERALD },
        ["kitSkins"] = {
            v3.GOLD_VICTORIOUS_TRITON,
            v3.PLATINUM_VICTORIOUS_TRITON,
            v3.DIAMOND_VICTORIOUS_TRITON,
            v3.EMERALD_VICTORIOUS_TRITON
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S11_NIGHTMARE },
        ["kitSkins"] = {
            v3.GOLD_VICTORIOUS_TRITON,
            v3.PLATINUM_VICTORIOUS_TRITON,
            v3.DIAMOND_VICTORIOUS_TRITON,
            v3.EMERALD_VICTORIOUS_TRITON,
            v3.NIGHTMARE_VICTORIOUS_TRITON
        },
        ["emotes"] = { v4.NIGHTMARE_TRITON }
    }
}
v8[v25] = v26
local v27 = v6.RANKED_S12
local v28 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S12_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S12_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S12_GOLD },
        ["kitSkins"] = { v3.AMY_VICTORIOUS_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S12_PLATINUM },
        ["kitSkins"] = { v3.AMY_VICTORIOUS_GOLD, v3.AMY_VICTORIOUS_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S12_DIAMOND },
        ["kitSkins"] = { v3.AMY_VICTORIOUS_GOLD, v3.AMY_VICTORIOUS_PLATINUM, v3.AMY_VICTORIOUS_DIAMOND }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S12_EMERALD },
        ["kitSkins"] = {
            v3.AMY_VICTORIOUS_GOLD,
            v3.AMY_VICTORIOUS_PLATINUM,
            v3.AMY_VICTORIOUS_DIAMOND,
            v3.AMY_VICTORIOUS_EMERALD
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S12_NIGHTMARE },
        ["kitSkins"] = {
            v3.AMY_VICTORIOUS_GOLD,
            v3.AMY_VICTORIOUS_PLATINUM,
            v3.AMY_VICTORIOUS_DIAMOND,
            v3.AMY_VICTORIOUS_EMERALD,
            v3.AMY_VICTORIOUS_NIGHTMARE
        }
    }
}
v8[v27] = v28
local v29 = v6.RANKED_S13
local v30 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S13_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S13_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S13_GOLD },
        ["kitSkins"] = { v3.ARCHER_VICTORIOUS_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S13_PLATINUM },
        ["kitSkins"] = { v3.ARCHER_VICTORIOUS_GOLD, v3.ARCHER_VICTORIOUS_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S13_DIAMOND },
        ["kitSkins"] = { v3.ARCHER_VICTORIOUS_GOLD, v3.ARCHER_VICTORIOUS_PLATINUM, v3.ARCHER_VICTORIOUS_DIAMOND }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S13_EMERALD },
        ["kitSkins"] = {
            v3.ARCHER_VICTORIOUS_GOLD,
            v3.ARCHER_VICTORIOUS_PLATINUM,
            v3.ARCHER_VICTORIOUS_DIAMOND,
            v3.ARCHER_VICTORIOUS_EMERALD
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S13_NIGHTMARE },
        ["kitSkins"] = {
            v3.ARCHER_VICTORIOUS_GOLD,
            v3.ARCHER_VICTORIOUS_PLATINUM,
            v3.ARCHER_VICTORIOUS_DIAMOND,
            v3.ARCHER_VICTORIOUS_EMERALD,
            v3.ARCHER_VICTORIOUS_NIGHTMARE
        }
    }
}
v8[v29] = v30
local v31 = v6.RANKED_S14
local v32 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S14_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S14_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S14_GOLD },
        ["kitSkins"] = { v3.BIGMAN_VICTORIOUS_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S14_PLATINUM },
        ["kitSkins"] = { v3.BIGMAN_VICTORIOUS_GOLD, v3.BIGMAN_VICTORIOUS_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S14_DIAMOND },
        ["kitSkins"] = { v3.BIGMAN_VICTORIOUS_GOLD, v3.BIGMAN_VICTORIOUS_PLATINUM, v3.BIGMAN_VICTORIOUS_DIAMOND }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S14_EMERALD },
        ["kitSkins"] = {
            v3.BIGMAN_VICTORIOUS_GOLD,
            v3.BIGMAN_VICTORIOUS_PLATINUM,
            v3.BIGMAN_VICTORIOUS_DIAMOND,
            v3.BIGMAN_VICTORIOUS_EMERALD
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S14_NIGHTMARE },
        ["kitSkins"] = {
            v3.BIGMAN_VICTORIOUS_GOLD,
            v3.BIGMAN_VICTORIOUS_PLATINUM,
            v3.BIGMAN_VICTORIOUS_DIAMOND,
            v3.BIGMAN_VICTORIOUS_EMERALD,
            v3.BIGMAN_VICTORIOUS_NIGHTMARE
        }
    }
}
v8[v31] = v32
local v33 = v6.RANKED_S15
local v34 = {
    [v7.BRONZE] = {
        ["rank"] = v7.BRONZE,
        ["titles"] = { v5.RANK_S15_BRONZE }
    },
    [v7.SILVER] = {
        ["rank"] = v7.SILVER,
        ["titles"] = { v5.RANK_S15_SILVER }
    },
    [v7.GOLD] = {
        ["rank"] = v7.GOLD,
        ["titles"] = { v5.RANK_S15_GOLD },
        ["kitSkins"] = { v3.ICE_QUEEN_VICTORIOUS_GOLD }
    },
    [v7.PLATINUM] = {
        ["rank"] = v7.PLATINUM,
        ["titles"] = { v5.RANK_S15_PLATINUM },
        ["kitSkins"] = { v3.ICE_QUEEN_VICTORIOUS_GOLD, v3.ICE_QUEEN_VICTORIOUS_PLATINUM }
    },
    [v7.DIAMOND] = {
        ["rank"] = v7.DIAMOND,
        ["titles"] = { v5.RANK_S15_DIAMOND },
        ["kitSkins"] = { v3.ICE_QUEEN_VICTORIOUS_GOLD, v3.ICE_QUEEN_VICTORIOUS_PLATINUM, v3.ICE_QUEEN_VICTORIOUS_DIAMOND }
    },
    [v7.EMERALD] = {
        ["rank"] = v7.EMERALD,
        ["titles"] = { v5.RANK_S15_EMERALD },
        ["kitSkins"] = {
            v3.ICE_QUEEN_VICTORIOUS_GOLD,
            v3.ICE_QUEEN_VICTORIOUS_PLATINUM,
            v3.ICE_QUEEN_VICTORIOUS_DIAMOND,
            v3.ICE_QUEEN_VICTORIOUS_EMERALD
        }
    },
    [v7.NIGHTMARE] = {
        ["rank"] = v7.NIGHTMARE,
        ["titles"] = { v5.RANK_S15_NIGHTMARE },
        ["kitSkins"] = {
            v3.ICE_QUEEN_VICTORIOUS_GOLD,
            v3.ICE_QUEEN_VICTORIOUS_PLATINUM,
            v3.ICE_QUEEN_VICTORIOUS_DIAMOND,
            v3.ICE_QUEEN_VICTORIOUS_EMERALD,
            v3.ICE_QUEEN_VICTORIOUS_NIGHTMARE
        }
    }
}
v8[v33] = v34
local v35 = v2.values(v8)
local function v42(p36, p37) --[[ Line: 450 ]]
    local v38 = p37.nightmare
    if v38 ~= nil then
        local v39 = v38.kitSkins
        if v39 ~= nil then
            for v40, v41 in v39 do
                local _ = v40 - 1
                table.insert(p36, v41)
                local _ = #p36
            end
        end
    end
    return p36
end
local v43 = {}
for v44 = 1, #v35 do
    v43 = v42(v43, v35[v44], v44 - 1, v35)
end
return {
    ["RankedRewardsMeta"] = v8,
    ["rankSkins"] = v43
}