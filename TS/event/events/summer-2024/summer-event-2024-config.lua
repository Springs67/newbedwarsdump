local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamKey
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "pet", "pet-type").PetType
local v5 = {}
local v6 = {
    [v2.SUMMER_2024_CRAB] = {
        ["pet"] = v4.CRAB,
        ["lobbyGadget"] = v3.SUMMER_2024_CRAB
    },
    [v2.SUMMER_2024_TURTLE] = {
        ["pet"] = v4.TURTLE,
        ["lobbyGadget"] = v3.SUMMER_2024_TURTLE
    }
}
v5.teamToPet = v6
return {
    ["Summer2024EventConfig"] = v5
}