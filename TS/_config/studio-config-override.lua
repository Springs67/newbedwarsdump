local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").LogLevel
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "lobby-gadget", "lobby-gadget-type").LobbyGadgetType
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "_config", "config-type").ConfigType
local v12 = v3.BEDWARS_TO4
local v13 = {
    [v5.IRON] = 1000,
    [v5.DIAMOND] = 1000,
    [v5.EMERALD] = 1000,
    [v5.HEAL_BANNER] = 1000
}
local v14 = {
    [v11.ForceLobbyServer] = false,
    [v11.ForceGameServer] = false,
    [v11.ForceAfkServer] = false,
    [v11.Kit] = v4.WARRIOR,
    [v11.KitSkin] = nil,
    [v11.UseKitSkinCharModel] = true,
    [v11.StudioKitOverrides] = nil,
    [v11.EmoteType] = {
        v7.CRAB_DANCE,
        v7.FUNKY_DANCE,
        v7.DISCO,
        v7.MILO_HELLO,
        v7.FUNKY_DANCE,
        v7.THIRSTY,
        v7.EGG_HUNT_DANCE_EMOTE
    },
    [v11.KillEffectType] = v8.BEE_STING,
    [v11.WinEffectType] = v10.NONE,
    [v11.BreakBedEffect] = v6.POP,
    [v11.LobbyGadgetType] = v9.CHICKEN,
    [v11.ArmorTrimType] = nil,
    [v11.ArmorTrimColor] = nil,
    [v11.ArmorTrimLevel] = nil,
    [v11.ArmorTrimEffect] = nil,
    [v11.ForceCustomMatch] = false,
    [v11.DisablePlacementLimits] = false,
    [v11.LoadMap] = "",
    [v11.LoadCustomMapSaveCode] = "",
    [v11.DisablePermissions] = false,
    [v11.DisableOwningAllKits] = false,
    [v11.DisablePregameVoting] = true,
    [v11.DisableBattlePassTimeCheck] = false,
    [v11.SimulateLateJoin] = false,
    [v11.SimulateFinalKill] = false,
    [v11.DisablePlayerProfileSaving] = false,
    [v11.SimulateRankPromotion] = false,
    [v11.DisableBackgroundMusic] = true,
    [v11.DisableClanWars] = false,
    [v11.SimulateDummyClan] = false,
    [v11.DisableBedPlating] = false,
    [v11.LogLevel] = v2.Debugging
}
return {
    ["StudioQueueType"] = v12,
    ["StudioStarterItems"] = v13,
    ["StudioConfig"] = v14
}