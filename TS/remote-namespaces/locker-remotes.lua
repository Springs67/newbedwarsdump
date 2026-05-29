local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "net", "out")
return v1.Definitions.Namespace({
    ["SetKillEffect"] = v1.Definitions.ServerFunction(),
    ["SetSpray"] = v1.Definitions.ServerFunction(),
    ["SetEmote"] = v1.Definitions.ServerFunction(),
    ["SetTitle"] = v1.Definitions.ServerFunction(),
    ["SetLobbyGadget"] = v1.Definitions.ServerFunction(),
    ["SetWinEffect"] = v1.Definitions.ServerFunction(),
    ["SetBreakBedEffect"] = v1.Definitions.ServerFunction(),
    ["SetFeaturedBadge"] = v1.Definitions.ServerFunction(),
    ["SetBedSkin"] = v1.Definitions.ServerFunction(),
    ["SetItemSkin"] = v1.Definitions.ServerFunction(),
    ["GiveLobbyGadget"] = v1.Definitions.ServerFunction(),
    ["RefillLobbyGadgetItem"] = v1.Definitions.ServerFunction(),
    ["GetLocker"] = v1.Definitions.ServerFunction(),
    ["CheckOwnsLockerItem"] = v1.Definitions.ServerFunction(),
    ["GetLockerCategoryItems"] = v1.Definitions.ServerFunction(),
    ["GetEquippedLockerItem"] = v1.Definitions.ServerFunction(),
    ["FullLockerUpdate"] = v1.Definitions.ServerToClientEvent(),
    ["NewLockerItems"] = v1.Definitions.ServerToClientEvent()
})