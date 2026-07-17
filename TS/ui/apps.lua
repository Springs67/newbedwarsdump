-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameCoreDefaultAppConfiguration = v1.GameCoreDefaultAppConfiguration;
local UILayers = v1.UILayers;
local LobbyDefaultAppConfiguration = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "lobby", "out").LobbyDefaultAppConfiguration;
local CreativeGadgetMenu = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "creative-gadget", "ui", "creative-gadget-menu").CreativeGadgetMenu;
local EnchantApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "enchant-table", "ui", "enchant-app").EnchantApp;
local FrostyHammerUpgradeApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "items", "frosty-hammer", "ui", "frosty-hammer-app").FrostyHammerUpgradeApp;
local RankedProgressBarApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "match-end", "screens", "ranked", "ui", "ranked-progress-bar-app").RankedProgressBarApp;
local ScriptEditorApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "script-editor", "ui", "script-editor-app").ScriptEditorApp;
local ProvisionalProgressBarApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "match-end", "screens", "ranked", "ui", "provisional-progress-bar-app").ProvisionalProgressBarApp;
local MatchDraftApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "pregame", "draft", "ui", "match-draft-app").MatchDraftApp;
local PregameVotingApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "pregame", "ui", "pregame-voting-app").PregameVotingApp;
local WorldGuardMenu = RuntimeLib.import(script, script.Parent.Parent, "controllers", "game", "world-guard", "world-guard-menu").WorldGuardMenu;
local AllRandomKitDraftApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "all-random-kit", "ui", "all-random-kit-draft-app").AllRandomKitDraftApp;
local FlamethrowerUpgradeApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "kit", "kits", "pyro", "ui", "flamethrower-app").FlamethrowerUpgradeApp;
local TeamUpgradeApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "games", "bedwars", "team-upgrade", "ui", "team-upgrade-app").TeamUpgradeApp;
local CombinedKitDraftApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "games", "combined-kit", "ui", "combined-kit-draft-app").CombinedKitDraftApp;
local LassoWarsTutorialApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "games", "lasso-wars", "ui", "lasso-wars-tutorial-app").LassoWarsTutorialApp;
local LassoWarsUpgradeShopApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "games", "lasso-wars", "ui", "lasso-wars-upgrade-shop-app").LassoWarsUpgradeShopApp;
local AchievementsApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "achievements", "ui", "achievements-app").AchievementsApp;
local ArmorTrimApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "armor-trim", "ui", "armor-trim-app").ArmorTrimApp;
local BattlePassApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "battle-pass", "ui", "battle-pass-app").BattlePassApp;
local BossBarApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "combat", "boss-bar", "ui", "boss-bar").BossBarApp;
local CustomMatchHostPanelApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "creative", "custom-match", "host-panel", "custom-match-host-panel-app").CustomMatchHostPanelApp;
local FriendsList = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "friends-list", "ui", "friends-list").FriendsList;
local GiftedApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "gift", "ui", "gifted", "gifted-app").GiftedApp;
local GiftingApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "gift", "ui", "gifting", "gifting-app").GiftingApp;
local WeaponSelectionApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "hotbar", "ui", "weapon-selection", "weapon-selection-app").WeaponSelectionApp;
local InventoryApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "inventory", "character", "ui", "inventory-app").InventoryApp;
local ChestInventoryApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "inventory", "chest", "ui", "chest-inventory-app").ChestInventoryApp;
local KitContractApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "kit-contract", "ui", "kit-contract-app").KitContractApp;
local KitDetailsApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "kit-details", "kit-details-app").KitDetailsApp;
local KitShopApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "lobby-kit-shop", "kit-shop-app").KitShopApp;
local PurchaseOptionsScreenApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "kit-shop", "ui", "purchase-options-screen", "purchase-options-screen-app").PurchaseOptionsScreenApp;
local LoreApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "lore", "ui", "lore", "lore-app").LoreApp;
local MilestonesApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "milestones", "ui", "milestones-app").MilestonesApp;
local BedwarsItemShopApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "shop", "ui", "bedwars-item-shop-app").BedwarsItemShopApp;
local SnakeShrineApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "snake-shrine", "ui", "snake-shrine-app").SnakeShrineApp;
local SocialApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "social", "ui", "social-app").SocialApp;
local StoreMenuApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "store", "ui", "store-menu-app").StoreMenuApp;
local TournamentApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "tournament", "ui", "tournament-app").TournamentApp;
local TrainingRoomCommandsList = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "training-room", "ui", "training-room-commands-list").TrainingRoomCommandsList;
local TrainingRoomKitSelectionApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "training-room", "ui", "training-room-kit-selection", "training-room-kit-selection-app").TrainingRoomKitSelectionApp;
local GameUpdatesApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "global", "update", "ui", "game-updates-app").GameUpdatesApp;
local AfkShopApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "afk-lobby", "afk-shop", "afk-shop-app").AfkShopApp;
local ClanMenuApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "clan-menu", "clan-menu-base").ClanMenuApp;
local ClanProfileApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "clan-profile-base").ClanProfileApp;
local ConfirmationModalApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "confirmation-modal", "confirmation-modal-base").ConfirmationModalApp;
local ClanHqSelectorApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "management-tab", "clan-hq", "clan-hq-selector-app").ClanHqSelectorApp;
local ClanLobbySelectorApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "clan", "ui", "profile", "management-tab", "clan-lobby", "clan-lobby-selector-app").ClanLobbySelectorApp;
local CustomMatchesApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "custom-matches", "ui", "custom-matches-app").CustomMatchesApp;
local EventApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "game-event", "event-app").EventApp;
local LobbyPlayMenuApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "lobby-hud", "lobby-play-menu", "lobby-play-menu-app").LobbyPlayMenuApp;
local LockerApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "locker", "ui", "locker-app").LockerApp;
local MissionsApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "missions", "ui", "missions-app").MissionsApp;
local NewsApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "news", "ui", "news-app").NewsApp;
local QueueSelectionApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "queue-selection", "ui", "queue-selection-app").QueueSelectionApp;
local SocialConnectionsApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "social-connections", "ui", "social-connections-app").SocialConnectionsApp;
local RankDecayNotificationApp = RuntimeLib.import(script, script.Parent.Parent, "controllers", "lobby", "rank-decay", "ui", "rank-decay-notification-app").RankDecayNotificationApp;
local AutoCompleteDropdown = RuntimeLib.import(script, script.Parent, "components", "auto-complete-dropdown", "auto-complete-dropdown").AutoCompleteDropdown;
local ColorPickerApp = RuntimeLib.import(script, script.Parent, "components", "color-picker", "color-picker-app").ColorPickerApp;
local BedwarsAppIds = RuntimeLib.import(script, script.Parent, "types", "app-config").BedwarsAppIds;
local u2 = {
    INVENTORY = {
        app = InventoryApp,
        appId = BedwarsAppIds.INVENTORY,
        layer = UILayers.MAIN
    },
    TEAM_UPGRADE = {
        app = TeamUpgradeApp,
        appId = BedwarsAppIds.TEAM_UPGRADE,
        layer = UILayers.MAIN
    },
    BEDWARS_ITEM_SHOP = {
        app = BedwarsItemShopApp,
        appId = BedwarsAppIds.BEDWARS_ITEM_SHOP,
        layer = UILayers.MAIN
    },
    KIT_SHOP_APP = {
        app = KitShopApp,
        appId = BedwarsAppIds.KIT_SHOP_APP,
        layer = UILayers.MAIN
    },
    WEAPON_SELECTION_APP = {
        app = WeaponSelectionApp,
        appId = BedwarsAppIds.WEAPON_SELECTION_APP,
        layer = UILayers.MAIN
    },
    KIT_DETAILS_APP = {
        app = KitDetailsApp,
        appId = BedwarsAppIds.KIT_DETAILS_APP,
        layer = UILayers.MAIN
    },
    LOCKER = {
        app = LockerApp,
        appId = BedwarsAppIds.LOCKER,
        layer = UILayers.MAIN
    },
    MISSIONS = {
        app = MissionsApp,
        appId = BedwarsAppIds.MISSIONS,
        layer = UILayers.MAIN
    },
    BATTLEPASS = {
        app = BattlePassApp,
        appId = BedwarsAppIds.BATTLEPASS,
        layer = UILayers.MAIN
    },
    CUSTOM_MATCHES = {
        app = CustomMatchesApp,
        appId = BedwarsAppIds.CUSTOM_MATCHES,
        layer = UILayers.MAIN
    },
    FLAMETHROWER_UPGRADES = {
        app = FlamethrowerUpgradeApp,
        appId = BedwarsAppIds.FLAMETHROWER_UPGRADES,
        layer = UILayers.MAIN
    },
    FROSTY_HAMMER_UPGRADES = {
        app = FrostyHammerUpgradeApp,
        appId = BedwarsAppIds.FROSTY_HAMMER_UPGRADES,
        layer = UILayers.MAIN
    },
    GIFTING = {
        app = GiftingApp,
        appId = BedwarsAppIds.GIFTING,
        layer = UILayers.MAIN
    },
    GIFTED = {
        app = GiftedApp,
        appId = BedwarsAppIds.GIFTED,
        layer = UILayers.MAIN
    },
    SOCIAL_CONNECTIONS = {
        app = SocialConnectionsApp,
        appId = BedwarsAppIds.SOCIAL_CONNECTIONS,
        layer = UILayers.MAIN
    },
    GAME_UPDATES = {
        app = GameUpdatesApp,
        appId = BedwarsAppIds.GAME_UPDATES,
        layer = UILayers.MAIN
    },
    RANKED_PROGRESS_BAR = {
        app = RankedProgressBarApp,
        appId = BedwarsAppIds.RANKED_PROGRESS_BAR
    },
    RANKED_PROVISIONAL_PROGRESS_BAR = {
        app = ProvisionalProgressBarApp,
        appId = BedwarsAppIds.RANKED_PROVISIONAL_PROGRESS_BAR
    },
    CHEST_INVENTORY = {
        app = ChestInventoryApp,
        appId = BedwarsAppIds.CHEST_INVENTORY,
        layer = UILayers.MAIN
    },
    ENCHANT_TABLE = {
        app = EnchantApp,
        appId = BedwarsAppIds.ENCHANT_TABLE,
        layer = UILayers.MAIN
    },
    QUEUE_SELECTION = {
        app = QueueSelectionApp,
        appId = BedwarsAppIds.QUEUE_SELECTION,
        layer = UILayers.MAIN
    },
    CUSTOM_MATCH_HOST_PANEL = {
        app = CustomMatchHostPanelApp,
        appId = BedwarsAppIds.CUSTOM_MATCH_HOST_PANEL,
        layer = UILayers.MAIN
    },
    CLAN_MENU = {
        app = ClanMenuApp,
        appId = BedwarsAppIds.CLAN_MENU,
        layer = UILayers.MAIN
    },
    CLAN_PROFILE = {
        app = ClanProfileApp,
        appId = BedwarsAppIds.CLAN_PROFILE,
        layer = UILayers.MAIN
    },
    CONFIRMATION_MODAL = {
        app = ConfirmationModalApp,
        appId = BedwarsAppIds.CONFIRMATION_MODAL,
        layer = UILayers.OVERLAY
    },
    EVENT_APP = {
        app = EventApp,
        appId = BedwarsAppIds.EVENT_APP,
        layer = UILayers.MAIN
    },
    BOSS_BAR = {
        app = BossBarApp,
        appId = BedwarsAppIds.BOSS_BAR,
        layer = UILayers.HUD
    },
    FRIENDS_LIST = {
        app = FriendsList,
        appId = BedwarsAppIds.FRIENDS_LIST,
        layer = UILayers.MAIN
    },
    MILESTONES = {
        app = MilestonesApp,
        appId = BedwarsAppIds.MILESTONES,
        layer = UILayers.MAIN
    },
    SCRIPT_EDITOR = {
        app = ScriptEditorApp,
        appId = BedwarsAppIds.SCRIPT_EDITOR,
        layer = UILayers.MAIN
    },
    NEWS = {
        app = NewsApp,
        appId = BedwarsAppIds.NEWS,
        layer = UILayers.MAIN
    },
    LORE = {
        app = LoreApp,
        appId = BedwarsAppIds.LORE,
        layer = UILayers.MAIN
    },
    AUTO_COMPLETE_DROPDOWN = {
        app = AutoCompleteDropdown,
        appId = BedwarsAppIds.AUTO_COMPLETE_DROPDOWN,
        layer = UILayers.OVERLAY
    },
    KIT_CONTRACT_APP = {
        app = KitContractApp,
        appId = BedwarsAppIds.KIT_CONTRACT_APP,
        layer = UILayers.MAIN
    },
    RANK_DECAY_NOTIFICATION_APP = {
        app = RankDecayNotificationApp,
        appId = BedwarsAppIds.RANK_DECAY_NOTIFICATION_APP,
        layer = UILayers.OVERLAY
    },
    CREATIVE_GADGET_MENU = {
        app = CreativeGadgetMenu,
        appId = BedwarsAppIds.CREATIVE_GADGET_MENU,
        layer = UILayers.MAIN
    },
    WORLD_GUARD_MENU = {
        app = WorldGuardMenu,
        appId = BedwarsAppIds.WORLD_GUARD_MENU,
        layer = UILayers.MAIN
    },
    AFK_APP = {
        app = AfkShopApp,
        appId = BedwarsAppIds.AFK_APP,
        layer = UILayers.MAIN
    },
    TRAINING_ROOM_COMMANDS_APP = {
        app = TrainingRoomCommandsList,
        appId = BedwarsAppIds.TRAINING_ROOM_COMMANDS_APP,
        layer = UILayers.MAIN
    },
    TRAINING_ROOM_KIT_SELECTION_APP = {
        app = TrainingRoomKitSelectionApp,
        appId = BedwarsAppIds.TRAINING_ROOM_KIT_SELECTION_APP,
        layer = UILayers.MAIN
    },
    LASSO_WARS_UPGRADE_SHOP_APP = {
        app = LassoWarsUpgradeShopApp,
        appId = BedwarsAppIds.LASSO_WARS_UPGRADE_SHOP_APP,
        layer = UILayers.MAIN
    },
    LASSO_WARS_TUTORIAL_APP = {
        app = LassoWarsTutorialApp,
        appId = BedwarsAppIds.LASSO_WARS_TUTORIAL_APP,
        layer = UILayers.MAIN
    },
    ARMOR_TRIM_APP = {
        app = ArmorTrimApp,
        appId = BedwarsAppIds.ARMOR_TRIM_APP,
        layer = UILayers.MAIN
    },
    TOURNAMENT_APP = {
        app = TournamentApp,
        appId = BedwarsAppIds.TOURNAMENT_APP,
        layer = UILayers.HUD
    },
    SOCIAL_APP = {
        app = SocialApp,
        appId = BedwarsAppIds.SOCIAL_APP,
        layer = UILayers.HUD
    },
    SNAKE_SHRINE = {
        app = SnakeShrineApp,
        appId = BedwarsAppIds.SNAKE_SHRINE,
        layer = UILayers.HUD
    },
    MATCH_DRAFT_APP = {
        app = MatchDraftApp,
        appId = BedwarsAppIds.MATCH_DRAFT_APP,
        layer = UILayers.OVERLAY
    },
    COMBINED_KIT_DRAFT_APP = {
        app = CombinedKitDraftApp,
        appId = BedwarsAppIds.COMBINED_KIT_DRAFT_APP,
        layer = UILayers.OVERLAY
    },
    STORE_MENU_APP = {
        app = StoreMenuApp,
        appId = BedwarsAppIds.STORE_MENU_APP,
        layer = UILayers.MAIN
    },
    LOBBY_PLAY_MENU_APP = {
        app = LobbyPlayMenuApp,
        appId = BedwarsAppIds.LOBBY_PLAY_MENU_APP,
        layer = UILayers.MAIN
    },
    ALL_RANDOM_KIT_DRAFT_APP = {
        app = AllRandomKitDraftApp,
        appId = BedwarsAppIds.ALL_RANDOM_KIT_DRAFT_APP,
        layer = UILayers.MAIN
    },
    CLAN_HQ_SELECTOR_APP = {
        app = ClanHqSelectorApp,
        appId = BedwarsAppIds.CLAN_HQ_SELECTOR_APP,
        layer = UILayers.MAIN
    },
    CLAN_LOBBY_SELECTOR_APP = {
        app = ClanLobbySelectorApp,
        appId = BedwarsAppIds.CLAN_LOBBY_SELECTOR_APP,
        layer = UILayers.MAIN
    },
    ACHIEVEMENTS = {
        app = AchievementsApp,
        appId = BedwarsAppIds.ACHIEVEMENTS
    },
    PURCHASE_OPTIONS_SCREEN_APP = {
        app = PurchaseOptionsScreenApp,
        appId = BedwarsAppIds.PURCHASE_OPTIONS_SCREEN_APP,
        layer = UILayers.MAIN
    },
    PREGAME_VOTING = {
        app = PregameVotingApp,
        appId = BedwarsAppIds.PREGAME_VOTING
    },
    COLOR_PICKER_APP = {
        app = ColorPickerApp,
        appId = BedwarsAppIds.COLOR_PICKER_APP,
        layer = UILayers.OVERLAY
    }
};

for i, v in LobbyDefaultAppConfiguration do
    u2[i] = v;
end;

for i, v in GameCoreDefaultAppConfiguration do
    u2[i] = v;
end;

return {
    AppConfiguration = u2,

    getAppConfiguration = function(p3) -- Line: 355
        -- upvalues: u2 (copy)
        return u2[p3];
    end
};