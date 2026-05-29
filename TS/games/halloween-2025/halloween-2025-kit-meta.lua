local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "difficulty", "bedwars-kit-difficulty").BedwarsKitDifficulty
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "halloween-2025", "halloween-2025-kits").HalloweenKit
local u6 = {
    [v5.WHISPER] = {
        ["name"] = "Whisper",
        ["description"] = "Are you sure?",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE,
        ["renderImage"] = v2.OWL_KIT_RENDER,
        ["modelName"] = v3.OWL
    },
    [v5.MELODY] = {
        ["name"] = "Melody",
        ["description"] = "Be nice and play as a support",
        ["renderImage"] = "rbxassetid://9155464915",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE,
        ["modelName"] = v3.MELODY
    },
    [v5.SUMMONER] = {
        ["name"] = "Kaida",
        ["description"] = "Kaida",
        ["renderImage"] = "rbxassetid://18922378956",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE,
        ["modelName"] = v3.SUMMONER
    },
    [v5.NAZAR] = {
        ["name"] = "Nazar",
        ["description"] = "Nazar",
        ["renderImage"] = "rbxassetid://18926951849",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE,
        ["modelName"] = v3.NAZAR
    },
    [v5.REBELLION_LEADER] = {
        ["name"] = "Silas",
        ["description"] = "Silas",
        ["renderImage"] = "rbxassetid://18926409564",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE,
        ["modelName"] = v3.REBELLION_LEADER
    },
    [v5.SORCERER] = {
        ["name"] = "Death Adder",
        ["description"] = "Death Adder",
        ["renderImage"] = "rbxassetid://97940108361528",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE,
        ["modelName"] = v3.SORCERER
    },
    [v5.NONE] = {
        ["name"] = "None",
        ["description"] = "Play with nothing",
        ["renderImage"] = "rbxassetid://9155464915",
        ["kitClass"] = nil,
        ["hiddenInShop"] = true,
        ["disableInLobby"] = true,
        ["disableKitRenting"] = true,
        ["difficulty"] = v4.NONE
    }
}
return {
    ["getHalloweenKitMeta"] = function(p7) --[[ Name: getHalloweenKitMeta, Line 85 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        return u6[p7]
    end,
    ["HalloweenKitMeta"] = u6
}