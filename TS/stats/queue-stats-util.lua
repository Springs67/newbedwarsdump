return {
    ["QueueStatsUtil"] = {
        ["makeStarterBedwarsQueueStats"] = function() --[[ Name: makeStarterBedwarsQueueStats, Line 5 ]]
            local v1 = {
                ["firstPlayTime"] = 0,
                ["lastPlayTime"] = 0,
                ["wins"] = 0,
                ["losses"] = 0,
                ["ties"] = 0,
                ["earlyLeaves"] = 0,
                ["matches"] = 0,
                ["kills"] = 0,
                ["deaths"] = 0,
                ["currentWinStreak"] = 0,
                ["highestWinStreak"] = 0,
                ["totalPlayTime"] = 0,
                ["damage"] = 0,
                ["damageTaken"] = 0,
                ["healing"] = 0,
                ["finalKills"] = 0,
                ["knockIntoVoid"] = 0,
                ["blockBreaks"] = 0,
                ["blocksPlaced"] = 0,
                ["bedBreaks"] = 0,
                ["projectilesUsed"] = 0,
                ["projectileDamage"] = 0,
                ["arrowDamage"] = 0,
                ["ironCollected"] = 0,
                ["diamondCollected"] = 0,
                ["emeraldCollected"] = 0,
                ["diamondGuardianKills"] = 0,
                ["titanKills"] = 0,
                ["telepearlsUsed"] = 0,
                ["telepearlBlocksTravelled"] = 0,
                ["enchants"] = 0,
                ["multiKills"] = 0,
                ["highestMultiKillChain"] = 0,
                ["highestKillStreak"] = 0,
                ["extra"] = {
                    ["blockHunt"] = {
                        ["currency"] = 0,
                        ["accumulatedCurrency"] = 0
                    },
                    ["skywars"] = {
                        ["chestsOpened"] = 0
                    },
                    ["pvpArena"] = {
                        ["goldEarned"] = 0
                    },
                    ["allRandomKit"] = {
                        ["rerolls"] = 0
                    },
                    ["gunGame"] = {
                        ["topPlacement"] = -1
                    },
                    ["survival"] = {
                        ["maxWaveReached"] = 0
                    },
                    ["halloween"] = {
                        ["bestCompletionTime"] = 9999,
                        ["minPlayersCompleted"] = 9999
                    }
                },
                ["finalKillsRecord"] = 0,
                ["totalRangedDamageDealtRecord"] = 0,
                ["totalDamageDealtRecord"] = 0,
                ["ironSpentRecord"] = 0,
                ["diamondsSpentRecord"] = 0,
                ["emeraldsSpentRecord"] = 0,
                ["playerKillsRecord"] = 0
            }
            return v1
        end
    }
}