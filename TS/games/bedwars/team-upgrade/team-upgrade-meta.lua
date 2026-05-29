local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitServer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").RunService
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "team-upgrade", "team-upgrade-type").TeamUpgrade
local u11 = {}
local v12 = {
    ["name"] = "Armor Protection",
    ["icon"] = "rbxassetid://96382613779755",
    ["order"] = 2,
    ["tiers"] = {
        {
            ["cost"] = 8,
            ["value"] = 0.2,
            ["description"] = "+20% Armor Bonus"
        },
        {
            ["cost"] = 16,
            ["value"] = 0.4,
            ["description"] = "+40% Armor Bonus"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.6,
            ["description"] = "+60% Armor Bonus"
        }
    }
}
u11[u10.ARMOR] = v12
local v13 = {
    ["name"] = "Sword Sharpness",
    ["icon"] = "rbxassetid://128034114886135",
    ["order"] = 3,
    ["tiers"] = {
        {
            ["cost"] = 10,
            ["value"] = 0.2,
            ["description"] = "+20% Damage"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.35,
            ["description"] = "+35% Damage"
        }
    }
}
u11[u10.DAMAGE] = v13
local v14 = {
    ["name"] = "Break Speed",
    ["icon"] = "rbxassetid://99325324428160",
    ["order"] = 4,
    ["tiers"] = {
        {
            ["cost"] = 10,
            ["value"] = 0.25,
            ["description"] = "+25% Break Damage"
        },
        {
            ["cost"] = 10,
            ["value"] = 0.5,
            ["description"] = "+50% Break Damage"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.75,
            ["description"] = "+75% Break Damage"
        },
        {
            ["cost"] = 30,
            ["value"] = 1,
            ["description"] = "+100% Break Damage"
        }
    }
}
u11[u10.BREAK_SPEED] = v14
local u15 = {}
local v16 = {
    ["name"] = "Team Generator",
    ["icon"] = "rbxassetid://81332069601534",
    ["order"] = 1,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.5,
            ["description"] = "+50% Speed"
        },
        {
            ["cost"] = 8,
            ["value"] = 1,
            ["description"] = "+100% Speed"
        },
        {
            ["cost"] = 12,
            ["value"] = 1.5,
            ["description"] = "Spawn Emeralds"
        }
    }
}
u15[u10.TEAM_GENERATOR] = v16
local v17 = {
    ["name"] = "Armor Protection",
    ["icon"] = "rbxassetid://96382613779755",
    ["order"] = 2,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.2,
            ["description"] = "+20% Armor Bonus"
        },
        {
            ["cost"] = 8,
            ["value"] = 0.4,
            ["description"] = "+40% Armor Bonus"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.6,
            ["description"] = "+60% Armor Bonus"
        }
    }
}
u15[u10.ARMOR] = v17
local v18 = {
    ["name"] = "Sword Sharpness",
    ["icon"] = "rbxassetid://128034114886135",
    ["order"] = 3,
    ["tiers"] = {
        {
            ["cost"] = 6,
            ["value"] = 0.2,
            ["description"] = "+20% Damage"
        },
        {
            ["cost"] = 12,
            ["value"] = 0.35,
            ["description"] = "+35% Damage"
        }
    }
}
u15[u10.DAMAGE] = v18
local v19 = {
    ["name"] = "Break Speed",
    ["icon"] = "rbxassetid://99325324428160",
    ["order"] = 4,
    ["tiers"] = {
        {
            ["cost"] = 3,
            ["value"] = 0.15,
            ["description"] = "+15% Break Damage"
        },
        {
            ["cost"] = 6,
            ["value"] = 0.4,
            ["description"] = "+40% Break Damage"
        }
    }
}
u15[u10.BREAK_SPEED] = v19
local u20 = {}
local v21 = {
    ["name"] = "Team Gen",
    ["icon"] = "rbxassetid://109513164484899",
    ["order"] = 1,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.5,
            ["description"] = "+50% Speed"
        },
        {
            ["cost"] = 8,
            ["value"] = 1,
            ["description"] = "+100% Speed"
        },
        {
            ["cost"] = 16,
            ["value"] = 1.5,
            ["description"] = "Spawn Emeralds"
        }
    }
}
u20[u10.TEAM_GENERATOR] = v21
local v22 = {
    ["name"] = "Diamond Gen",
    ["icon"] = "rbxassetid://87959990622561",
    ["order"] = 2,
    ["tiers"] = {
        {
            ["cost"] = 3,
            ["value"] = 50,
            ["description"] = "Spawn Diamonds"
        },
        {
            ["cost"] = 6,
            ["value"] = 38,
            ["description"] = "+25% Speed"
        },
        {
            ["cost"] = 10,
            ["value"] = 25,
            ["description"] = "+50% Speed"
        }
    }
}
u20[u10.DIAMOND_GENERATOR] = v22
local v23 = {
    ["name"] = "Damage",
    ["icon"] = "rbxassetid://98759196482529",
    ["order"] = 3,
    ["tiers"] = {
        {
            ["cost"] = 5,
            ["value"] = 0.05,
            ["description"] = "+5% Damage"
        },
        {
            ["cost"] = 10,
            ["value"] = 0.1,
            ["description"] = "+10% Damage"
        },
        {
            ["cost"] = 18,
            ["value"] = 0.2,
            ["description"] = "+20% Damage"
        }
    }
}
u20[u10.DAMAGE] = v23
local v24 = {
    ["name"] = "Armor",
    ["icon"] = "rbxassetid://121388634858388",
    ["order"] = 4,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.1,
            ["description"] = "+10% Armor"
        },
        {
            ["cost"] = 8,
            ["value"] = 0.2,
            ["description"] = "+20% Armor"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.3,
            ["description"] = "+30% Armor"
        }
    }
}
u20[u10.ARMOR] = v24
local v25 = {
    ["name"] = "Break Speed",
    ["icon"] = "rbxassetid://99325324428160",
    ["order"] = 5,
    ["tiers"] = {
        {
            ["cost"] = 3,
            ["value"] = 0.25,
            ["description"] = "+25% Break Damage"
        },
        {
            ["cost"] = 6,
            ["value"] = 0.5,
            ["description"] = "+50% Break Damage"
        },
        {
            ["cost"] = 15,
            ["value"] = 0.75,
            ["description"] = "+75% Break Damage"
        }
    }
}
u20[u10.BREAK_SPEED] = v25
local u26 = {}
local v27 = {
    ["name"] = "Diamond Gen",
    ["icon"] = "rbxassetid://87959990622561",
    ["order"] = 2,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 66.66666666666667,
            ["description"] = "Spawn Diamonds"
        },
        {
            ["cost"] = 8,
            ["value"] = 53.33333333333333,
            ["description"] = "+25% Speed"
        },
        {
            ["cost"] = 12,
            ["value"] = 44.44444444444444,
            ["description"] = "+50% Speed"
        },
        {
            ["cost"] = 500,
            ["value"] = 0.6599999999999999,
            ["description"] = "+9999% Speed"
        }
    }
}
u26[u10.DIAMOND_GENERATOR] = v27
local v28 = {
    ["name"] = "Damage",
    ["icon"] = "rbxassetid://98759196482529",
    ["order"] = 3,
    ["tiers"] = {
        {
            ["cost"] = 5,
            ["value"] = 0.05,
            ["description"] = "+5% Damage"
        },
        {
            ["cost"] = 10,
            ["value"] = 0.1,
            ["description"] = "+10% Damage"
        },
        {
            ["cost"] = 18,
            ["value"] = 0.2,
            ["description"] = "+20% Damage"
        },
        {
            ["cost"] = 500,
            ["value"] = 99.99,
            ["description"] = "+9999% Damage"
        }
    }
}
u26[u10.DAMAGE] = v28
local v29 = {
    ["name"] = "Armor",
    ["icon"] = "rbxassetid://121388634858388",
    ["order"] = 4,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.1,
            ["description"] = "+10% Armor"
        },
        {
            ["cost"] = 8,
            ["value"] = 0.2,
            ["description"] = "+20% Armor"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.3,
            ["description"] = "+30% Armor"
        },
        {
            ["cost"] = 500,
            ["value"] = 0.99,
            ["description"] = "+99% Armor"
        }
    }
}
u26[u10.ARMOR] = v29
local v30 = {
    ["name"] = "Break Speed",
    ["icon"] = "rbxassetid://99325324428160",
    ["order"] = 4,
    ["tiers"] = {
        {
            ["cost"] = 3,
            ["value"] = 0.3,
            ["description"] = "+30% Break Damage"
        },
        {
            ["cost"] = 6,
            ["value"] = 0.6,
            ["description"] = "+60% Break Damage"
        },
        {
            ["cost"] = 12,
            ["value"] = 1.2,
            ["description"] = "+120% Break Damage"
        },
        {
            ["cost"] = 500,
            ["value"] = 99.99,
            ["description"] = "+9999% Break Damage"
        }
    }
}
u26[u10.BREAK_SPEED] = v30
local u31 = {}
local v32 = {
    ["name"] = "Damage",
    ["icon"] = "rbxassetid://98759196482529",
    ["order"] = 1,
    ["tiers"] = {
        {
            ["cost"] = 5,
            ["value"] = 0.05,
            ["description"] = "+5% Damage"
        },
        {
            ["cost"] = 10,
            ["value"] = 0.1,
            ["description"] = "+10% Damage"
        },
        {
            ["cost"] = 18,
            ["value"] = 0.2,
            ["description"] = "+20% Damage"
        }
    }
}
u31[u10.DAMAGE] = v32
local v33 = {
    ["name"] = "Armor",
    ["icon"] = "rbxassetid://121388634858388",
    ["order"] = 2,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.1,
            ["description"] = "+10% Armor"
        },
        {
            ["cost"] = 8,
            ["value"] = 0.2,
            ["description"] = "+20% Armor"
        },
        {
            ["cost"] = 20,
            ["value"] = 0.3,
            ["description"] = "+30% Armor"
        }
    }
}
u31[u10.ARMOR] = v33
local v34 = {
    ["name"] = "Bed Upgrade",
    ["icon"] = "rbxassetid://121388634858388",
    ["order"] = 3,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.1,
            ["description"] = "+100 Bed Health"
        },
        {
            ["cost"] = 8,
            ["value"] = 0.2,
            ["description"] = "+200 Bed Health"
        },
        {
            ["cost"] = 16,
            ["value"] = 0.3,
            ["description"] = "+400 Bed Health"
        }
    }
}
u31[u10.SURVIVAL_BED_UPGRADE] = v34
local v35 = {
    ["name"] = "Pillage",
    ["icon"] = "rbxassetid://81332069601534",
    ["order"] = 4,
    ["tiers"] = {
        {
            ["cost"] = 4,
            ["value"] = 0.1,
            ["description"] = "Enemy drops Iron On death, increase luck"
        },
        {
            ["cost"] = 8,
            ["value"] = 0.2,
            ["description"] = "+100% loot, increase luck"
        },
        {
            ["cost"] = 16,
            ["value"] = 0.3,
            ["description"] = "Enemy has a chance to drop emerald, increase luck"
        }
    }
}
u31[u10.SURVIVAL_PLUNDER_UPGRADE] = v35
local u36 = nil
local function v38(p37) --[[ Line: 473 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    return u36()[p37]
end
u36 = function() --[[ Name: getTeamUpgradeMetaForQueue, Line 477 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u7
        [4] = u4
        [5] = u5
        [6] = u8
        [7] = u15
        [8] = u26
        [9] = u9
        [10] = u31
        [11] = u11
    --]]
    if u2.isHoarceKat() then
        return u20
    end
    local v39
    if u7:IsClient() then
        v39 = u4.Controllers.MatchController:getQueueType()
    else
        v39 = u5.Services.MatchService:getQueueType()
    end
    if v39 then
        if u8(v39).ogTeamUpgradeOverride then
            return u15
        end
        if u8(v39).hyperGenGamemode then
            return u26
        end
        if v39 == u9.SURVIVAL then
            return u31
        end
        if v39 == u9.MINE_WARS then
            return u11
        end
    end
    return u20
end
local function u44() --[[ Line: 501 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u36
    --]]
    local v40 = 0
    local v41 = {}
    for v42, v43 in u6.values(u10) do
        local _ = v42 - 1
        if u36()[v43] ~= nil == true then
            v40 = v40 + 1
            v41[v40] = v43
        end
    end
    return v41
end
return {
    ["getTeamUpgradeDefinition"] = v38,
    ["getTeamUpgradeMetaForQueue"] = u36,
    ["getTeamUpgradesForQueue"] = u44,
    ["getSortedTeamUpgrades"] = function() --[[ Name: getSortedTeamUpgrades, Line 519 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u36
        --]]
        local v45 = u44()
        local function v48(p46, p47) --[[ Line: 521 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            return u36()[p46].order > u36()[p47].order
        end
        table.sort(v45, v48)
        return v45
    end,
    ["isAtMaxTeamUpgradeTier"] = function(p49, p50) --[[ Name: isAtMaxTeamUpgradeTier, Line 529 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u6
        --]]
        local v51 = u36()[p50]
        if v51 then
            return p49 + 1 > #u6.values(v51.tiers)
        else
            return false
        end
    end,
    ["MineWarTeamUpgrades"] = u11,
    ["OGTeamUpgrades"] = u15
}