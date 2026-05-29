local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.DAMAGE = "damage"
v1.damage = "DAMAGE"
v2.HEALING = "healing"
v1.healing = "HEALING"
v2.IRONCOLLECTED = "ironCollected"
v1.ironCollected = "IRONCOLLECTED"
v2.DIAMONDCOLLECTED = "diamondCollected"
v1.diamondCollected = "DIAMONDCOLLECTED"
v2.EMERALDCOLLECTED = "emeraldCollected"
v1.emeraldCollected = "EMERALDCOLLECTED"
v2.BLOCKBREAKS = "blockBreaks"
v1.blockBreaks = "BLOCKBREAKS"
v2.BLOCKSPLACED = "blocksPlaced"
v1.blocksPlaced = "BLOCKSPLACED"
v2.PROJECTILESUSED = "projectilesUsed"
v1.projectilesUsed = "PROJECTILESUSED"
v2.PROJECTILEDAMAGE = "projectileDamage"
v1.projectileDamage = "PROJECTILEDAMAGE"
v2.DAMAGETAKEN = "damageTaken"
v1.damageTaken = "DAMAGETAKEN"
v2.ARROWDAMAGE = "arrowDamage"
v1.arrowDamage = "ARROWDAMAGE"
v2.TELEPEARLBLOCKSTRAVELLED = "telepearlBlocksTravelled"
v1.telepearlBlocksTravelled = "TELEPEARLBLOCKSTRAVELLED"
v2.TELEPEARLSUSED = "telepearlsUsed"
v1.telepearlsUsed = "TELEPEARLSUSED"
v2.KNOCKINTOVOID = "knockIntoVoid"
v1.knockIntoVoid = "KNOCKINTOVOID"
v2.MULTIKILLS = "multiKills"
v1.multiKills = "MULTIKILLS"
v2.HIGHESTMULTIKILLCHAIN = "highestMultiKillChain"
v1.highestMultiKillChain = "HIGHESTMULTIKILLCHAIN"
v2.KILLS = "kills"
v1.kills = "KILLS"
v2.PLAYTIME = "playTime"
v1.playTime = "PLAYTIME"
v2.BEDBREAKS = "bedBreaks"
v1.bedBreaks = "BEDBREAKS"
v2.FINALKILLS = "finalKills"
v1.finalKills = "FINALKILLS"
v2.DIAMONDGUARDIANKILLS = "diamondGuardianKills"
v1.diamondGuardianKills = "DIAMONDGUARDIANKILLS"
v2.TITANKILLS = "titanKills"
v1.titanKills = "TITANKILLS"
v2.ENCHANTS = "enchants"
v1.enchants = "ENCHANTS"
v2.HIGHESTKILLSTREAK = "highestKillStreak"
v1.highestKillStreak = "HIGHESTKILLSTREAK"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.NONE = "none"
v3.none = "NONE"
v4.COMBAT = "combat"
v3.combat = "COMBAT"
v4.BLOCKS = "blocks"
v3.blocks = "BLOCKS"
v4.ECONOMY = "economy"
v3.economy = "ECONOMY"
v4.BED = "bed"
v3.bed = "BED"
v4.PROJECTILE = "projectile"
v3.projectile = "PROJECTILE"
v4.TELEPEARL = "telepearl"
v3.telepearl = "TELEPEARL"
v4.ENCHANT = "enchant"
v3.enchant = "ENCHANT"
v4.VOID = "void"
v3.void = "VOID"
v4.TIME = "time"
v3.time = "TIME"
return {
    ["TrackType"] = v2,
    ["TrackTypeCategory"] = v4,
    ["STAT_TO_CATEGORY"] = {
        ["player"] = v4.NONE,
        ["damage"] = v4.COMBAT,
        ["healing"] = v4.COMBAT,
        ["kills"] = v4.COMBAT,
        ["blockBreaks"] = v4.BLOCKS,
        ["bedBreaks"] = v4.BED,
        ["ironCollected"] = v4.ECONOMY,
        ["diamondCollected"] = v4.ECONOMY,
        ["emeraldCollected"] = v4.ECONOMY,
        ["blocksPlaced"] = v4.BLOCKS,
        ["projectilesUsed"] = v4.PROJECTILE,
        ["projectileDamage"] = v4.PROJECTILE,
        ["diamondGuardianKills"] = v4.COMBAT,
        ["titanKills"] = v4.COMBAT,
        ["damageTaken"] = v4.COMBAT,
        ["arrowDamage"] = v4.PROJECTILE,
        ["telepearlBlocksTravelled"] = v4.TELEPEARL,
        ["telepearlsUsed"] = v4.TELEPEARL,
        ["enchants"] = v4.ENCHANT,
        ["knockIntoVoid"] = v4.VOID,
        ["playTime"] = v4.TIME,
        ["finalKills"] = v4.COMBAT,
        ["multiKills"] = v4.COMBAT,
        ["highestKillStreak"] = v4.COMBAT,
        ["highestMultiKillChain"] = v4.COMBAT
    },
    ["CATEGORY_TO_ICON"] = {
        [v4.COMBAT] = "rbxassetid://7133000785",
        [v4.BLOCKS] = "rbxassetid://75782885207200",
        [v4.BED] = "rbxassetid://7133000927",
        [v4.VOID] = "rbxassetid://9328610738",
        [v4.TELEPEARL] = "rbxassetid://105213807515170",
        [v4.ECONOMY] = "rbxassetid://107215564980540",
        [v4.PROJECTILE] = "rbxassetid://17286025019",
        [v4.NONE] = "rbxassetid://9328610738",
        [v4.ENCHANT] = "rbxassetid://79936057914418",
        [v4.TIME] = "rbxassetid://11445645720"
    },
    ["STAT_TO_DESCRIPTION"] = {
        ["player"] = "OMIT",
        ["damage"] = "Damage Dealt",
        ["healing"] = "Healing Done",
        ["kills"] = "Players Killed",
        ["blockBreaks"] = "Blocks Broken",
        ["bedBreaks"] = "Beds Broken",
        ["ironCollected"] = "Iron Collected",
        ["diamondCollected"] = "Diamonds Collected",
        ["emeraldCollected"] = "Emerald Collected",
        ["blocksPlaced"] = "Blocks Placed",
        ["projectilesUsed"] = "Projectiles Launched",
        ["projectileDamage"] = "Projectile Damage",
        ["diamondGuardianKills"] = "Diamond Guardian Kills",
        ["titanKills"] = "Titan Kills",
        ["damageTaken"] = "Damage Taken",
        ["arrowDamage"] = "Arrow Damage",
        ["telepearlBlocksTravelled"] = "Blocks Travelled w/ Telepearls",
        ["telepearlsUsed"] = "Telepearls Used",
        ["enchants"] = "Times Enchanted",
        ["knockIntoVoid"] = "Knock Into Void Kills",
        ["playTime"] = "Play Time",
        ["finalKills"] = "Final Kills",
        ["multiKills"] = "# Of Multikills",
        ["highestKillStreak"] = "Highest Kill Streak",
        ["highestMultiKillChain"] = "Highest Multikill Chain"
    },
    ["TYPE_PRIORITY"] = {
        v2.PLAYTIME,
        v2.DAMAGE,
        v2.DAMAGETAKEN,
        v2.ARROWDAMAGE,
        v2.KILLS,
        v2.FINALKILLS,
        v2.MULTIKILLS,
        v2.HIGHESTKILLSTREAK,
        v2.HIGHESTMULTIKILLCHAIN,
        v2.KNOCKINTOVOID,
        v2.BEDBREAKS,
        v2.HEALING,
        v2.PROJECTILESUSED,
        v2.PROJECTILEDAMAGE,
        v2.BLOCKBREAKS,
        v2.BLOCKSPLACED,
        v2.IRONCOLLECTED,
        v2.DIAMONDCOLLECTED,
        v2.EMERALDCOLLECTED,
        v2.DIAMONDGUARDIANKILLS,
        v2.TITANKILLS,
        v2.TELEPEARLBLOCKSTRAVELLED,
        v2.TELEPEARLSUSED,
        v2.ENCHANTS
    }
}