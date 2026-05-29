local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "TS", "event", "events", "egg-hunt-types", "egg-rarity-type").EasterEggRarity
local v2 = {}
local v3 = setmetatable({}, {
    ["__index"] = v2
})
v3.TEAM_WORK_EGG = "team_work_egg"
v2.team_work_egg = "TEAM_WORK_EGG"
v3.SWORD_EGG = "sword_egg"
v2.sword_egg = "SWORD_EGG"
v3.DANCE_PARTY_EGG = "dance_party_egg"
v2.dance_party_egg = "DANCE_PARTY_EGG"
v3.ENCHANT_EGG = "enchant_egg"
v2.enchant_egg = "ENCHANT_EGG"
v3.FRIENDSHIP_EGG = "friendship_egg"
v2.friendship_egg = "FRIENDSHIP_EGG"
v3.DEVIL_EGG = "devil_egg"
v2.devil_egg = "DEVIL_EGG"
v3.CRACKED_EGG = "cracked_egg"
v2.cracked_egg = "CRACKED_EGG"
v3.TITAN_EGG = "titan_egg"
v2.titan_egg = "TITAN_EGG"
v3.SKY_EGG = "sky_egg"
v2.sky_egg = "SKY_EGG"
v3.FALL_EGG = "fall_egg"
v2.fall_egg = "FALL_EGG"
v3.BURNT_EGG = "burnt_egg"
v2.burnt_egg = "BURNT_EGG"
v3.SHEER_EGG = "sheer_egg"
v2.sheer_egg = "SHEER_EGG"
v3.LOBBY_EGG = "lobby_egg"
v2.lobby_egg = "LOBBY_EGG"
v3.VOID_TRIBUTE_EGG = "void_tribute_egg"
v2.void_tribute_egg = "VOID_TRIBUTE_EGG"
v3.VOID_EYE_EGG = "void_eye_egg"
v2.void_eye_egg = "VOID_EYE_EGG"
v3.DOZEN_EGG = "dozen_egg"
v2.dozen_egg = "DOZEN_EGG"
v3.TITAN_DANCE_EGG = "titan_dance_egg"
v2.titan_dance_egg = "TITAN_DANCE_EGG"
v3.ROTTEN_EGG = "rotten_egg"
v2.rotten_egg = "ROTTEN_EGG"
local v4 = {
    [v3.TEAM_WORK_EGG] = {
        ["name"] = "Team Work Egg",
        ["image"] = "rbxassetid://118689013179858",
        ["order"] = 0,
        ["rarity"] = v1.EASY
    },
    [v3.SWORD_EGG] = {
        ["name"] = "Sword Egg",
        ["image"] = "rbxassetid://13031413351",
        ["order"] = 1,
        ["rarity"] = v1.EASY
    },
    [v3.DANCE_PARTY_EGG] = {
        ["name"] = "Dance Party Egg",
        ["image"] = "rbxassetid://113595987967943",
        ["order"] = 2,
        ["rarity"] = v1.EASY
    },
    [v3.ENCHANT_EGG] = {
        ["name"] = "Enchant Egg",
        ["image"] = "rbxassetid://13031415263",
        ["order"] = 3,
        ["rarity"] = v1.EASY
    },
    [v3.FRIENDSHIP_EGG] = {
        ["name"] = "Friendship Egg",
        ["image"] = "rbxassetid://87022084939570",
        ["order"] = 4,
        ["rarity"] = v1.MEDIUM
    },
    [v3.DEVIL_EGG] = {
        ["name"] = "Deviled Egg",
        ["image"] = "rbxassetid://72998703388883",
        ["order"] = 5,
        ["rarity"] = v1.MEDIUM
    },
    [v3.CRACKED_EGG] = {
        ["name"] = "Cracked Egg",
        ["image"] = "rbxassetid://79632031890920",
        ["order"] = 6,
        ["rarity"] = v1.HARD
    },
    [v3.LOBBY_EGG] = {
        ["name"] = "Lobby Egg",
        ["image"] = "rbxassetid://101466459940041",
        ["order"] = 7,
        ["rarity"] = v1.HARD
    },
    [v3.TITAN_EGG] = {
        ["name"] = "Titan Egg",
        ["image"] = "rbxassetid://13031412799",
        ["order"] = 8,
        ["rarity"] = v1.HARD
    },
    [v3.SKY_EGG] = {
        ["name"] = "Sky Egg",
        ["image"] = "rbxassetid://13031413739",
        ["order"] = 9,
        ["rarity"] = v1.HARD
    },
    [v3.FALL_EGG] = {
        ["name"] = "Fragile Egg",
        ["image"] = "rbxassetid://96997213289210",
        ["order"] = 10,
        ["rarity"] = v1.EASY_MYSTERY
    },
    [v3.BURNT_EGG] = {
        ["name"] = "Burnt Egg",
        ["image"] = "rbxassetid://105287412954917",
        ["order"] = 11,
        ["rarity"] = v1.EASY_MYSTERY
    },
    [v3.ROTTEN_EGG] = {
        ["name"] = "Rotten Egg",
        ["image"] = "rbxassetid://132865410531961",
        ["order"] = 12,
        ["rarity"] = v1.EASY_MYSTERY
    },
    [v3.SHEER_EGG] = {
        ["name"] = "Shear Egg",
        ["image"] = "rbxassetid://76928354248092",
        ["order"] = 13,
        ["rarity"] = v1.EASY_MYSTERY
    },
    [v3.VOID_EYE_EGG] = {
        ["name"] = "Void\'s Eye Egg",
        ["image"] = "rbxassetid://111546800939168",
        ["order"] = 14,
        ["rarity"] = v1.HARD_MYSTERY
    },
    [v3.VOID_TRIBUTE_EGG] = {
        ["name"] = "Void\'s Reclaim Egg",
        ["image"] = "rbxassetid://85383756367620",
        ["order"] = 15,
        ["rarity"] = v1.HARD_MYSTERY
    },
    [v3.DOZEN_EGG] = {
        ["name"] = "Dozen Egg",
        ["image"] = "rbxassetid://91461238052206",
        ["order"] = 16,
        ["rarity"] = v1.HARD_MYSTERY
    },
    [v3.TITAN_DANCE_EGG] = {
        ["name"] = "Titan Disco Egg",
        ["image"] = "rbxassetid://83412742696041",
        ["order"] = 17,
        ["rarity"] = v1.HARD_MYSTERY
    }
}
return {
    ["EggHunt2026Egg"] = v3,
    ["EggHunt2026EggMeta"] = v4
}