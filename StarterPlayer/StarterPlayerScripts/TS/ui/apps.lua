local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local v3 = v2.GameCoreDefaultAppConfiguration
local v4 = v2.UILayers
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyDefaultAppConfiguration
local v6 = v1.import(script, script.Parent.Parent, "controllers", "game", "creative-gadget", "ui", "creative-gadget-menu").CreativeGadgetMenu
local v7 = v1.import(script, script.Parent.Parent, "controllers", "game", "enchant-table", "ui", "enchant-app").EnchantApp
local v8 = v1.import(script, script.Parent.Parent, "controllers", "game", "items", "frosty-hammer", "ui", "frosty-hammer-app").FrostyHammerUpgradeApp
local v9 = v1.import(script, script.Parent.Parent, "controllers", "game", "match-end", "screens", "ranked", "ui", "ranked-progress-bar-app").RankedProgressBarApp
local v10 = v1.import(script, script.Parent.Parent, "controllers", "game", "script-editor", "ui", "script-editor-app").ScriptEditorApp
local v11 = v1.import(script, script.Parent.Parent, "controllers", "game", "match-end", "screens", "ranked", "ui", "provisional-progress-bar-app").ProvisionalProgressBarApp
local v12 = v1.import(script, script.Parent.Parent, "controllers", "game", "pregame", "draft", "ui", "match-draft-app").MatchDraftApp
local v13 = v1.import(script, script.Parent.Parent, "controllers", "game", "pregame", "ui", "pregame-voting-app").PregameVotingApp
local v14 = v1.import(script, script.Parent.Parent, "controllers", "game", "world-guard", "world-guard-menu").WorldGuardMenu
local v15 = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "all-random-kit", "ui", "all-random-kit-draft-app").AllRandomKitDraftApp
local v16 = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "kit", "kits", "pyro", "ui", "flamethrower-app").FlamethrowerUpgradeApp
local v17 = v1.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "team-upgrade", "ui", "team-upgrade-app").TeamUpgradeApp
local v18 = v1.import(script, script.Parent.Parent, "controllers", "games", "combined-kit", "ui", "combined-kit-draft-app").CombinedKitDraftApp
local v19 = v1.import(script, script.Parent.Parent, "controllers", "games", "lasso-wars", "ui", "lasso-wars-tutorial-app").LassoWarsTutorialApp
local v20 = v1.import(script, script.Parent.Parent, "controllers", "games", "lasso-wars", "ui", "lasso-wars-upgrade-shop-app").LassoWarsUpgradeShopApp
local v21 = v1.import(script, script.Parent.Parent, "controllers", "global", "achievements", "ui", "achievements-app").AchievementsApp
local v22 = v1.import(script, script.Parent.Parent, "controllers", "global", "armor-trim", "ui", "armor-trim-app").ArmorTrimApp
local v23 = v1.import(script, script.Parent.Parent, "controllers", "global", "battle-pass", "ui", "battle-pass-app").BattlePassApp
local v24 = v1.import(script, script.Parent.Parent, "controllers", "global", "combat", "boss-bar", "ui", "boss-bar").BossBarApp
local v25 = v1.import(script, script.Parent.Parent, "controllers", "global", "creative", "custom-match", "host-panel", "custom-match-host-panel-app").CustomMatchHostPanelApp
local v26 = v1.import(script, script.Parent.Parent, "controllers", "global", "friends-list", "ui", "friends-list").FriendsList
local v27 = v1.import(script, script.Parent.Parent, "controllers", "global", "gift", "ui", "gifted", "gifted-app").GiftedApp
local v28 = v1.import(script, script.Parent.Parent, "controllers", "global", "gift", "ui", "gifting", "gifting-app").GiftingApp
local v29 = v1.import(script, script.Parent.Parent, "controllers", "global", "hotbar", "ui", "weapon-selection", "weapon-selection-app").WeaponSelectionApp
local v30 = v1.import(script, script.Parent.Parent, "controllers", "global", "inventory", "character", "ui", "inventory-app").InventoryApp
local v31 = v1.import(script, script.Parent.Parent, "controllers", "global", "inventory", "chest", "ui", "chest-inventory-app").ChestInventoryApp
local v32 = v1.import(script, script.Parent.Parent, "controllers", "global", "kit-contract", "ui", "kit-contract-app").KitContractApp
local v33 = v1.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "kit-details", "kit-details-app").KitDetailsApp
local v34 = v1.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-app").KitShopApp
local v35 = v1.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "purchase-options-screen", "purchase-options-screen-app").PurchaseOptionsScreenApp
local v36 = v1.import(script, script.Parent.Parent, "controllers", "global", "lore", "ui", "lore", "lore-app").LoreApp
local v37 = v1.import(script, script.Parent.Parent, "controllers", "global", "milestones", "ui", "milestones-app").MilestonesApp
local v38 = v1.import(script, script.Parent.Parent, "controllers", "global", "shop", "ui", "bedwars-item-shop-app").BedwarsItemShopApp
local v39 = v1.import(script, script.Parent.Parent, "controllers", "global", "snake-shrine", "ui", "snake-shrine-app").SnakeShrineApp
local v40 = v1.import(script, script.Parent.Parent, "controllers", "global", "social", "ui", "social-app").SocialApp
local v41 = v1.import(script, script.Parent.Parent, "controllers", "global", "store", "ui", "store-menu-app").StoreMenuApp
local v42 = v1.import(script, script.Parent.Parent, "controllers", "global", "tournament", "ui", "tournament-app").TournamentApp
local v43 = v1.import(script, script.Parent.Parent, "controllers", "global", "training-room", "ui", "training-room-commands-list").TrainingRoomCommandsList
local v44 = v1.import(script, script.Parent.Parent, "controllers", "global", "training-room", "ui", "training-room-kit-selection", "training-room-kit-selection-app").TrainingRoomKitSelectionApp
local v45 = v1.import(script, script.Parent.Parent, "controllers", "global", "update", "ui", "game-updates-app").GameUpdatesApp
local v46 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "afk-lobby", "afk-shop", "afk-shop-app").AfkShopApp
local v47 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "clan-menu", "clan-menu-base").ClanMenuApp
local v48 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "clan-profile-base").ClanProfileApp
local v49 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "confirmation-modal", "confirmation-modal-base").ConfirmationModalApp
local v50 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "management-tab", "clan-hq", "clan-hq-selector-app").ClanHqSelectorApp
local v51 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "management-tab", "clan-lobby", "clan-lobby-selector-app").ClanLobbySelectorApp
local v52 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "custom-matches", "ui", "custom-matches-app").CustomMatchesApp
local v53 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "game-event", "event-app").EventApp
local v54 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "lobby-hud", "lobby-play-menu", "lobby-play-menu-app").LobbyPlayMenuApp
local v55 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "locker", "ui", "locker-app").LockerApp
local v56 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "missions", "ui", "missions-app").MissionsApp
local v57 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "news", "ui", "news-app").NewsApp
local v58 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "queue-selection", "ui", "queue-selection-app").QueueSelectionApp
local v59 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "social-connections", "ui", "social-connections-app").SocialConnectionsApp
local v60 = v1.import(script, script.Parent.Parent, "controllers", "lobby", "rank-decay", "ui", "rank-decay-notification-app").RankDecayNotificationApp
local v61 = v1.import(script, script.Parent, "components", "auto-complete-dropdown", "auto-complete-dropdown").AutoCompleteDropdown
local v62 = v1.import(script, script.Parent, "components", "color-picker", "color-picker-app").ColorPickerApp
local v63 = v1.import(script, script.Parent, "types", "app-config").BedwarsAppIds
local u64 = {
    ["INVENTORY"] = {
        ["app"] = v30,
        ["appId"] = v63.INVENTORY,
        ["layer"] = v4.MAIN
    },
    ["TEAM_UPGRADE"] = {
        ["app"] = v17,
        ["appId"] = v63.TEAM_UPGRADE,
        ["layer"] = v4.MAIN
    },
    ["BEDWARS_ITEM_SHOP"] = {
        ["app"] = v38,
        ["appId"] = v63.BEDWARS_ITEM_SHOP,
        ["layer"] = v4.MAIN
    },
    ["KIT_SHOP_APP"] = {
        ["app"] = v34,
        ["appId"] = v63.KIT_SHOP_APP,
        ["layer"] = v4.MAIN
    },
    ["WEAPON_SELECTION_APP"] = {
        ["app"] = v29,
        ["appId"] = v63.WEAPON_SELECTION_APP,
        ["layer"] = v4.MAIN
    },
    ["KIT_DETAILS_APP"] = {
        ["app"] = v33,
        ["appId"] = v63.KIT_DETAILS_APP,
        ["layer"] = v4.MAIN
    },
    ["LOCKER"] = {
        ["app"] = v55,
        ["appId"] = v63.LOCKER,
        ["layer"] = v4.MAIN
    },
    ["MISSIONS"] = {
        ["app"] = v56,
        ["appId"] = v63.MISSIONS,
        ["layer"] = v4.MAIN
    },
    ["BATTLEPASS"] = {
        ["app"] = v23,
        ["appId"] = v63.BATTLEPASS,
        ["layer"] = v4.MAIN
    },
    ["CUSTOM_MATCHES"] = {
        ["app"] = v52,
        ["appId"] = v63.CUSTOM_MATCHES,
        ["layer"] = v4.MAIN
    },
    ["FLAMETHROWER_UPGRADES"] = {
        ["app"] = v16,
        ["appId"] = v63.FLAMETHROWER_UPGRADES,
        ["layer"] = v4.MAIN
    },
    ["FROSTY_HAMMER_UPGRADES"] = {
        ["app"] = v8,
        ["appId"] = v63.FROSTY_HAMMER_UPGRADES,
        ["layer"] = v4.MAIN
    },
    ["GIFTING"] = {
        ["app"] = v28,
        ["appId"] = v63.GIFTING,
        ["layer"] = v4.MAIN
    },
    ["GIFTED"] = {
        ["app"] = v27,
        ["appId"] = v63.GIFTED,
        ["layer"] = v4.MAIN
    },
    ["SOCIAL_CONNECTIONS"] = {
        ["app"] = v59,
        ["appId"] = v63.SOCIAL_CONNECTIONS,
        ["layer"] = v4.MAIN
    },
    ["GAME_UPDATES"] = {
        ["app"] = v45,
        ["appId"] = v63.GAME_UPDATES,
        ["layer"] = v4.MAIN
    },
    ["RANKED_PROGRESS_BAR"] = {
        ["app"] = v9,
        ["appId"] = v63.RANKED_PROGRESS_BAR
    },
    ["RANKED_PROVISIONAL_PROGRESS_BAR"] = {
        ["app"] = v11,
        ["appId"] = v63.RANKED_PROVISIONAL_PROGRESS_BAR
    },
    ["CHEST_INVENTORY"] = {
        ["app"] = v31,
        ["appId"] = v63.CHEST_INVENTORY,
        ["layer"] = v4.MAIN
    },
    ["ENCHANT_TABLE"] = {
        ["app"] = v7,
        ["appId"] = v63.ENCHANT_TABLE,
        ["layer"] = v4.MAIN
    },
    ["QUEUE_SELECTION"] = {
        ["app"] = v58,
        ["appId"] = v63.QUEUE_SELECTION,
        ["layer"] = v4.MAIN
    },
    ["CUSTOM_MATCH_HOST_PANEL"] = {
        ["app"] = v25,
        ["appId"] = v63.CUSTOM_MATCH_HOST_PANEL,
        ["layer"] = v4.MAIN
    },
    ["CLAN_MENU"] = {
        ["app"] = v47,
        ["appId"] = v63.CLAN_MENU,
        ["layer"] = v4.MAIN
    },
    ["CLAN_PROFILE"] = {
        ["app"] = v48,
        ["appId"] = v63.CLAN_PROFILE,
        ["layer"] = v4.MAIN
    },
    ["CONFIRMATION_MODAL"] = {
        ["app"] = v49,
        ["appId"] = v63.CONFIRMATION_MODAL,
        ["layer"] = v4.OVERLAY
    },
    ["EVENT_APP"] = {
        ["app"] = v53,
        ["appId"] = v63.EVENT_APP,
        ["layer"] = v4.MAIN
    },
    ["BOSS_BAR"] = {
        ["app"] = v24,
        ["appId"] = v63.BOSS_BAR,
        ["layer"] = v4.HUD
    },
    ["FRIENDS_LIST"] = {
        ["app"] = v26,
        ["appId"] = v63.FRIENDS_LIST,
        ["layer"] = v4.MAIN
    },
    ["MILESTONES"] = {
        ["app"] = v37,
        ["appId"] = v63.MILESTONES,
        ["layer"] = v4.MAIN
    },
    ["SCRIPT_EDITOR"] = {
        ["app"] = v10,
        ["appId"] = v63.SCRIPT_EDITOR,
        ["layer"] = v4.MAIN
    },
    ["NEWS"] = {
        ["app"] = v57,
        ["appId"] = v63.NEWS,
        ["layer"] = v4.MAIN
    },
    ["LORE"] = {
        ["app"] = v36,
        ["appId"] = v63.LORE,
        ["layer"] = v4.MAIN
    },
    ["AUTO_COMPLETE_DROPDOWN"] = {
        ["app"] = v61,
        ["appId"] = v63.AUTO_COMPLETE_DROPDOWN,
        ["layer"] = v4.OVERLAY
    },
    ["KIT_CONTRACT_APP"] = {
        ["app"] = v32,
        ["appId"] = v63.KIT_CONTRACT_APP,
        ["layer"] = v4.MAIN
    },
    ["RANK_DECAY_NOTIFICATION_APP"] = {
        ["app"] = v60,
        ["appId"] = v63.RANK_DECAY_NOTIFICATION_APP,
        ["layer"] = v4.OVERLAY
    },
    ["CREATIVE_GADGET_MENU"] = {
        ["app"] = v6,
        ["appId"] = v63.CREATIVE_GADGET_MENU,
        ["layer"] = v4.MAIN
    },
    ["WORLD_GUARD_MENU"] = {
        ["app"] = v14,
        ["appId"] = v63.WORLD_GUARD_MENU,
        ["layer"] = v4.MAIN
    },
    ["AFK_APP"] = {
        ["app"] = v46,
        ["appId"] = v63.AFK_APP,
        ["layer"] = v4.MAIN
    },
    ["TRAINING_ROOM_COMMANDS_APP"] = {
        ["app"] = v43,
        ["appId"] = v63.TRAINING_ROOM_COMMANDS_APP,
        ["layer"] = v4.MAIN
    },
    ["TRAINING_ROOM_KIT_SELECTION_APP"] = {
        ["app"] = v44,
        ["appId"] = v63.TRAINING_ROOM_KIT_SELECTION_APP,
        ["layer"] = v4.MAIN
    },
    ["LASSO_WARS_UPGRADE_SHOP_APP"] = {
        ["app"] = v20,
        ["appId"] = v63.LASSO_WARS_UPGRADE_SHOP_APP,
        ["layer"] = v4.MAIN
    },
    ["LASSO_WARS_TUTORIAL_APP"] = {
        ["app"] = v19,
        ["appId"] = v63.LASSO_WARS_TUTORIAL_APP,
        ["layer"] = v4.MAIN
    },
    ["ARMOR_TRIM_APP"] = {
        ["app"] = v22,
        ["appId"] = v63.ARMOR_TRIM_APP,
        ["layer"] = v4.MAIN
    },
    ["TOURNAMENT_APP"] = {
        ["app"] = v42,
        ["appId"] = v63.TOURNAMENT_APP,
        ["layer"] = v4.HUD
    },
    ["SOCIAL_APP"] = {
        ["app"] = v40,
        ["appId"] = v63.SOCIAL_APP,
        ["layer"] = v4.HUD
    },
    ["SNAKE_SHRINE"] = {
        ["app"] = v39,
        ["appId"] = v63.SNAKE_SHRINE,
        ["layer"] = v4.HUD
    },
    ["MATCH_DRAFT_APP"] = {
        ["app"] = v12,
        ["appId"] = v63.MATCH_DRAFT_APP,
        ["layer"] = v4.OVERLAY
    },
    ["COMBINED_KIT_DRAFT_APP"] = {
        ["app"] = v18,
        ["appId"] = v63.COMBINED_KIT_DRAFT_APP,
        ["layer"] = v4.OVERLAY
    },
    ["STORE_MENU_APP"] = {
        ["app"] = v41,
        ["appId"] = v63.STORE_MENU_APP,
        ["layer"] = v4.MAIN
    },
    ["LOBBY_PLAY_MENU_APP"] = {
        ["app"] = v54,
        ["appId"] = v63.LOBBY_PLAY_MENU_APP,
        ["layer"] = v4.MAIN
    },
    ["ALL_RANDOM_KIT_DRAFT_APP"] = {
        ["app"] = v15,
        ["appId"] = v63.ALL_RANDOM_KIT_DRAFT_APP,
        ["layer"] = v4.MAIN
    },
    ["CLAN_HQ_SELECTOR_APP"] = {
        ["app"] = v50,
        ["appId"] = v63.CLAN_HQ_SELECTOR_APP,
        ["layer"] = v4.MAIN
    },
    ["CLAN_LOBBY_SELECTOR_APP"] = {
        ["app"] = v51,
        ["appId"] = v63.CLAN_LOBBY_SELECTOR_APP,
        ["layer"] = v4.MAIN
    },
    ["ACHIEVEMENTS"] = {
        ["app"] = v21,
        ["appId"] = v63.ACHIEVEMENTS
    },
    ["PURCHASE_OPTIONS_SCREEN_APP"] = {
        ["app"] = v35,
        ["appId"] = v63.PURCHASE_OPTIONS_SCREEN_APP,
        ["layer"] = v4.MAIN
    },
    ["PREGAME_VOTING"] = {
        ["app"] = v13,
        ["appId"] = v63.PREGAME_VOTING
    },
    ["COLOR_PICKER_APP"] = {
        ["app"] = v62,
        ["appId"] = v63.COLOR_PICKER_APP,
        ["layer"] = v4.OVERLAY
    }
}
for v65, v66 in v5 do
    u64[v65] = v66
end
for v67, v68 in v3 do
    u64[v67] = v68
end
return {
    ["AppConfiguration"] = u64,
    ["getAppConfiguration"] = function(p69) --[[ Line: 355 ]]
        --[[
        Upvalues:
            [1] = u64
        --]]
        return u64[p69]
    end
}