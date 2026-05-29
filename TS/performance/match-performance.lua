local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "performance", "match-outcome").MatchOutcome
return {
    ["makeStarterMatchPerformance"] = function(p2) --[[ Name: makeStarterMatchPerformance, Line 4 ]]
        --[[
        Upvalues:
            [1] = u1
        --]]
        local v3 = {
            ["observer"] = false,
            ["connected"] = true,
            ["ready"] = false,
            ["matchStartTime"] = -1,
            ["matchDuration"] = -1,
            ["matchConfig"] = nil,
            ["teamId"] = "",
            ["afked"] = false,
            ["partyId"] = 12345678,
            ["finalized"] = false,
            ["playerInfo"] = p2,
            ["generic"] = {
                ["multikills"] = 0,
                ["highestMultikillChain"] = 0,
                ["deaths"] = 0,
                ["voidKills"] = 0,
                ["voidDeaths"] = 0,
                ["damageDealt"] = 0,
                ["damageTaken"] = 0,
                ["healing"] = 0,
                ["projectilesUsed"] = 0,
                ["projectileDamage"] = 0,
                ["arrowDamage"] = 0,
                ["telepearlsUsed"] = 0,
                ["telepearlBlocksTraveled"] = 0,
                ["blockBreaks"] = 0,
                ["blocksPlaced"] = 0,
                ["playTime"] = 0,
                ["earlyLeave"] = nil,
                ["eliminated"] = false,
                ["placement"] = -1,
                ["kills"] = {
                    ["playerKills"] = 0,
                    ["total"] = 0
                },
                ["matchOutcome"] = u1.LOSS
            }
        }
        local v4 = {
            ["kit"] = nil,
            ["finalKills"] = 0,
            ["diamondGuardianKills"] = 0,
            ["titanKills"] = 0,
            ["bedBreaks"] = 0,
            ["teamBedBreaks"] = 0,
            ["emeraldsCollected"] = 0,
            ["diamondsCollected"] = 0,
            ["ironCollected"] = 0,
            ["emeraldsSpent"] = 0,
            ["diamondsSpent"] = 0,
            ["ironSpent"] = 0,
            ["fortuneCashOut"] = 0,
            ["enchantCount"] = 0,
            ["pointsCaptured"] = 0,
            ["voidWorld"] = {
                ["visited"] = false,
                ["kills"] = {
                    ["player"] = 0,
                    ["crab"] = 0
                },
                ["deaths"] = {
                    ["player"] = 0,
                    ["crab"] = 0,
                    ["void"] = 0
                },
                ["purchases"] = {
                    ["voidArmor"] = false,
                    ["voidSword"] = false
                }
            },
            ["currencySpent"] = {},
            ["enchants"] = {},
            ["bridgeDuel"] = {
                ["touchdowns"] = 0
            },
            ["blockHunt"] = {
                ["currencyEarned"] = 0
            }
        }
        v3.bedwars = v4
        v3.kitStats = {}
        v3.domination = {
            ["objective"] = 0
        }
        v3.skywars = {
            ["chestsOpened"] = 0
        }
        v3.penguinSurvival = {
            ["waveReached"] = 0
        }
        v3.halloween = {
            ["stageReached"] = 0
        }
        v3.pvpArena = {
            ["goldEarned"] = 0
        }
        v3.allRandomKit = {
            ["rerolls"] = 0
        }
        v3.clanWar = {
            ["teamPlayerCounts"] = 0
        }
        v3.gunGame = {
            ["topPlacement"] = -1
        }
        return v3
    end
}