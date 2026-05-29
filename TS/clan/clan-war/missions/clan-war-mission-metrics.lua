return {
    ["CLAN_WAR_MISSION_METRICS"] = {
        "BedBreaks",
        "FinalKills",
        "EntityKills",
        "DamageDealt",
        "LuckyBlockWins",
        "SkyWarsWins",
        "SquadsWins",
        "DoublesWins",
        "StandardWins"
    },
    ["DESCRIPTIONS_BY_METRIC"] = {
        ["BedBreaks"] = function(p1) --[[ Name: BedBreaks, Line 10 ]]
            return "Break " .. tostring(p1) .. " beds."
        end,
        ["FinalKills"] = function(p2) --[[ Name: FinalKills, Line 13 ]]
            return "Get " .. tostring(p2) .. " final kills."
        end,
        ["EntityKills"] = function(p3) --[[ Name: EntityKills, Line 16 ]]
            return "Get " .. tostring(p3) .. " entity kills."
        end,
        ["DamageDealt"] = function(p4) --[[ Name: DamageDealt, Line 19 ]]
            return "Deal " .. tostring(p4) .. " damage."
        end,
        ["LuckyBlockWins"] = function(p5) --[[ Name: LuckyBlockWins, Line 22 ]]
            return "Win " .. tostring(p5) .. " Lucky Block matches."
        end,
        ["SkyWarsWins"] = function(p6) --[[ Name: SkyWarsWins, Line 25 ]]
            return "Win " .. tostring(p6) .. " SkyWars matches."
        end,
        ["SquadsWins"] = function(p7) --[[ Name: SquadsWins, Line 28 ]]
            return "Win " .. tostring(p7) .. " BedWars Squads matches."
        end,
        ["DoublesWins"] = function(p8) --[[ Name: DoublesWins, Line 31 ]]
            return "Win " .. tostring(p8) .. " BedWars Doubles matches."
        end,
        ["StandardWins"] = function(p9) --[[ Name: StandardWins, Line 34 ]]
            return "Win " .. tostring(p9) .. " matches."
        end
    }
}